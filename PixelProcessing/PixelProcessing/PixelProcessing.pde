PImage img;
PFont font;
void setup() {
  background(0);
  img = loadImage("zombie.png");
  size(img.width, img.height);
  tint(255,0,0);
  image(img, 0, 0);
  font = loadFont("Chiller-Regular-48.vlw");
  textFont(font, 100);
  textAlign(CENTER);
  text("Game Over", width/2, height-100);
}

