void setup() {
  PImage sky = loadImage("bluemoon.jpg");
  PImage jet = loadImage("cockpit.jpg");

  size(sky.width, sky.height);
  image(sky, 0, 0);
  loadPixels();
  
  removeGreen(jet);
  printGreenStripped(jet);
  
  updatePixels();
  
  saveFrame("skyjet.jpg");
}

// remove green pixels, leaving rgb = (255,0,255) only in the green places
void removeGreen(PImage img) {
  for (int i = 0; i < img.pixels.length; i++) {
    float r = red(img.pixels[i]);
    float g = green(img.pixels[i]);
    float b = blue(img.pixels[i]);

    if (g>=b+55 && g>=r+15) {
      img.pixels[i]=color(255, 0, 255, 0);
    }
  }
}

//void print the green stripped image
void printGreenStripped(PImage img) {
  for(int x = 0; x < img.width; x++) {
    for(int y = 0; y < img.height; y++) {
      int location = x + y * img.width;
      float r = red(img.pixels[location]);
      float g = green(img.pixels[location]);
      float b = blue(img.pixels[location]);
      if((r == 255 && g == 0 && b == 255) == false) {
        pixels[x + y * img.width] = img.pixels[location];
      }
    }
  }
}

