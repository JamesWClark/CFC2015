PImage img;

void setup() {
  img = loadImage("ignatius.jpg");
  size(img.width, img.height);
}

void draw() {
  loadPixels(); 
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      if (x % 5 == 0 && y % 20 == 0) {
        pixels[loc] = color(255, 255, 0, 0);
      } else {
        pixels[loc] = color(r, g, b);
      }
    }
  }
  updatePixels();
}

