
/**
 * GLOBAL VARIABLES
 */
final int playersTeam = 1;
final int enemiesTeam = 2;
int playerSpeedLimit = 8;
int enemySpeedLimit = 4;
int stage = 0;
boolean lockedControls = true;
boolean[] keys = new boolean[3];
ArrayList<Sprite> sprites = new ArrayList<Sprite>();
ArrayList<Sprite> enemies = new ArrayList<Sprite>();
ArrayList<Level> levels = new ArrayList<Level>();

Level currentLevel;
ShapeFactory factory;
HostileSprite player;
float playerControllerLine;


/**
 * SETUP - INITIALIZE, RUNS ONCE
 */
void setup() {
  size(displayWidth, displayHeight, P2D);
  noCursor();
  
  factory = new ShapeFactory();
  playerControllerLine = 0.85 * height;
  player = spawnPlayer();
  sprites.add(player);
  enemies.add(player);
  
  levels.add(new LevelOne());
  levels.add(new LevelOne());
  for(Level level : levels) {
    level.levelSetup();
  }
  currentLevel = levels.get(0);
}

/**
 * DRAW - THE MAIN DRAWING LOOP REPEATS EVERY FRAME
 */
void draw() {
  frame.setTitle((int)frameRate + " fps");
  background(0);
  
  currentLevel.levelDraw();
  
  if(!lockedControls) {
    controlPlayer();
  }

  //update all sprite positions on screen
  for (int i = 0; i < sprites.size (); i++) {
    sprites.get(i).updateAndDisplay();
  }
}

/**
 * FULL SCREEN MODE
 */
boolean sketchFullScreen() {
  return true;
}

/**
 * SPAWN A NEW PLAYER
 */
HostileSprite spawnPlayer() {
  PVector startingPosition = new PVector(0.5 * width, 0.85 * height);
  PVector initialVelocity = new PVector(0, 0);
  PShape graphic = factory.getBasicPlayer();
  int radius = factory.getBasicPlayerRadius();
  return new HostileSprite(playersTeam, radius, graphic, startingPosition, initialVelocity);
}

/**
 * CONTROLS PLAYER MOVEMENT
 */
void controlPlayer() {
  if (keys[0]) { //LEFT
    if (isLeftBound(player))
      player.position.x = 2 * player.radius;
    else
      player.position.x -= playerSpeedLimit;
  }
  if (keys[1]) { //RIGHT
    if (isRightBound(player)) {
      player.position.x = width - 2 * player.radius;
    } else {
      player.position.x += playerSpeedLimit;
    }
  }
  if (keys[2]) { //F
    player.fire(new PVector(0, -10));
  }
}

/**
 * KEYS ARE DOWN
 */
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT)
      keys[0] = true;
    if (keyCode == RIGHT)
      keys[1] = true;
    if (keyCode == 61440) //printScreen
      saveFrame("data/" + System.currentTimeMillis() + ".jpg");
  }
  if (key == 'f' || key == 'F')
    keys[2] = true;
}

/**
 * KEYS ARE UP
 */
void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT)
      keys[0] = false;
    if (keyCode == RIGHT)
      keys[1] = false;
  }
  if (key == 'f' || key == 'F')
    keys[2] = false;
}

boolean isLeftBound(AbstractSprite sprite) {
  int leftBoundary = 2 * sprite.radius;
  if (sprite.position.x <= leftBoundary)
    return true;
  else
    return false;
}

boolean isRightBound(AbstractSprite sprite) {
  int rightBoundary = width - 2 * sprite.radius;
  if (sprite.position.x >= rightBoundary)
    return true;
  else
    return false;
}

