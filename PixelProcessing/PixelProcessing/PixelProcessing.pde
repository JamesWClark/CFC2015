PImage foreground;
PImage background;

void setup() {
  foreground = loadImage("spaceship.png");
  background = loadImage("space.png");
  ImageTool.matchWidth(foreground, background);
  GreenScreen gs = new GreenScreen(foreground, background);
  gs.display();
}

