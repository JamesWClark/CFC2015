PImage img;

void setup() {
  img = loadImage("ignatius.jpg");
  size(img.width, img.height);
}

void draw() {
  image(img, 0, 0, width/2,height/2);
  image(img, width/2, 0, width/2, height/2);
  image(img, 0, height/2, width/2, height/2);
  image(img, width/2,height/2,width/2,height/2);
}

