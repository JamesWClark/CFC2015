PImage img;
void setup() {
  img = loadImage("leaves.jpg");
  size(img.width,img.height);
}
void draw() {
  image(img,0,0);
  //filter(INVERT);
  filter(POSTERIZE, 8);
}
void keyPressed() {
  if(key == 'p' || key == 'P') {
    saveFrame("data/" + System.currentTimeMillis() + ".jpg");
  }
}

