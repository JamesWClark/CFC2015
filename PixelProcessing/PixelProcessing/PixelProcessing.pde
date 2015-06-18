PImage img;

void setup() {
  
  img = loadImage("city.jpg");
  size(img.width, img.height);
}

void draw() {
  loadPixels(); 

  img.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      pixels[loc] =  color(r,g,b);          
    }
  }
  updatePixels();
}
