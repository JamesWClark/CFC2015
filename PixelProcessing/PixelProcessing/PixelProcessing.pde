PImage img1;
PImage img2;
PImage largest;
PImage smallest;

void setup() {
  img1 = loadImage("flowers.jpg");
  img2 = loadImage("desert.jpg");
  
  int img1Area = img1.width * img1.height;
  int img2Area = img2.width * img2.height;
  
  if(img1Area > img2Area) {
    largest = img1;
    smallest = img2;
  } else {
    largest = img2;
    smallest = img1;
  }

  //scale to largest (regardless of width & height)
  if(largest.width > smallest.width) {
    ImageTool.matchWidth(largest, smallest);
  } else {
    ImageTool.matchWidth(smallest, largest);
  }
  
  size(largest.width, largest.height);
  image(largest, 0, 0);
  image(smallest, 0, 0);
}
void draw() { } //required for keyPressed event to fire
void keyPressed() {
  if(key == 'p' || key == 'P') {
    saveFrame("data/" + System.currentTimeMillis() + ".jpg");
  }
}
