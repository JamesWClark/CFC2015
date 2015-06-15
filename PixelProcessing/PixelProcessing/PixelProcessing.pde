PImage img1;
PImage img2;
PImage img3;
PImage img4;
void setup() {
  img1 = loadImage("ignatius.jpg");
  img2 = loadImage("ignatius.jpg");
  img3 = loadImage("ignatius.jpg");
  img4 = loadImage("ignatius.jpg");
  size(img1.width, img1.height);
  image(img1, 0, 0, width/2,height/2);
  tint(255,0,0);
  image(img2, width/2, 0, width/2, height/2);
  tint(0,255,0);
  image(img3, 0, height/2, width/2, height/2);
  tint(0,0,255);
  image(img4, width/2,height/2,width/2,height/2);
}

