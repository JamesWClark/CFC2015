
/**
 * GLOBAL VARIABLES
 */
final int screenWidth = 800;
final int screenHeight = 600;
final int playersTeam = 1;
final int enemiesTeam = 2;
int playerSpeedLimit = 8;
boolean[] keys = new boolean[3];
ArrayList<Sprite> sprites = new ArrayList<Sprite>();
ArrayList<Sprite> enemies = new ArrayList<Sprite>();
ShapeFactory factory;
HostileSprite player;

/**
 * INITIAL SETUP - RUNS ONCE
 */
void setup() {
  size(screenWidth, screenHeight, P2D);
  factory = new ShapeFactory();
  spawnEnemies();
  player = spawnPlayer();
  sprites.add(player);
  enemies.add(player);
}

/**
 * THE MAIN DRAWING LOOP - REPEATS EVERY FRAME
 */
void draw() {
  frame.setTitle((int)frameRate + " fps");
  background(0);
  controlPlayer();
  if (enemies.size() > 1 && enemies.contains(player)) {
    automateEnemies();
  } else {
    noLoop();
    print("game over");
  }

  //update all sprite positions on screen
  for (int i = 0; i < sprites.size (); i++) {
    sprites.get(i).updateAndDisplay();
  }
}

/**
 * SPAWN ENEMIES
 */
void spawnEnemies() {
  int enemyRows = 3;
  int enemyCols = 8;
  for (int i = 0; i < enemyRows; i++) {
    for (int j = 0; j < enemyCols; j++) {
      PVector position = new PVector(50+j*100, 50+i*100);
      PVector velocity = new PVector(0, 0);
      PShape graphic = factory.getEnemyTwo();
      int radius = factory.getBasicEnemyRadius();
      HostileSprite enemy = new HostileSprite(enemiesTeam, radius, graphic, position, velocity);
      sprites.add(enemy);
      enemies.add(enemy);
    }
  }
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
 * AUTOMATE THE ENEMIES
 */
long timeSinceLastEnemyShot = 0;
long enemyShotDelay = 400; //ms
void automateEnemies() {
  long now = millis();
  int i = (int)random(0, enemies.size());
  HostileSprite enemy = (HostileSprite)enemies.get(i);
  if (now > timeSinceLastEnemyShot + enemyShotDelay && enemy != player) {
    enemy.fire(player);
    timeSinceLastEnemyShot = now;
  }
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

boolean isLeftBound(HostileSprite sprite) {
  int leftBoundary = 2 * sprite.radius;
  if (sprite.position.x <= leftBoundary)
    return true;
  else
    return false;
}

boolean isRightBound(HostileSprite sprite) {
  int rightBoundary = width - 2 * sprite.radius;
  if (sprite.position.x >= rightBoundary)
    return true;
  else
    return false;
}

