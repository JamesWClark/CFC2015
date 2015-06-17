class GreenScreen {
  void removeGreen(PImage input) {
    background(255);
    for (int i = 0; i < input.pixels.length; i++) {
      float r = red(input.pixels[i]);
      float g = green(input.pixels[i]);
      float b = blue(input.pixels[i]);

      if (g > r && g > b) {
        input.pixels[i] = color(0, 0, 0, 0);
      } else {
        input.pixels[i] = color(r, g, b);
      }
    }
  }
}

