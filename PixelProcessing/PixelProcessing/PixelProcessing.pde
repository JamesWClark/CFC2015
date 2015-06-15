PImage img;
int scalex;
int scaley;
void setup() {
  img = loadImage("ignatius.jpg");
  scalex = img.width * 2;
  scaley = img.height * 2;
  size(scalex,scaley);
  image(img,0,0,scalex, scaley);
  textSize(40);
  textAlign(CENTER);
  fill(255,3,3);
  text("some text here", width/2, height-100);
}
void draw() {
}
void keyPressed() {
  if(key == 'p') {
    saveFrame("data/" + System.currentTimeMillis() + ".jpg");
  }
}
