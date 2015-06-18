PImage foreground;
PImage background;

void setup() {
  foreground = loadImage("spaceship.png");
  background = loadImage("space.png");
  GreenScreen gs = new GreenScreen(foreground, background);
  ImageTool.matchWidth(foreground, background);
  gs.display();
}

void draw() { } //required for keyPressed event to fire
void keyPressed() {
  if(key == 'p' || key == 'P') {
    saveFrame("data/" + System.currentTimeMillis() + ".jpg");
  }
}
