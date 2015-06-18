static class ImageTool {
  
  static void matchWidth(PImage first, PImage second) {
    int w;
    if (first.width > second.width) {
      w = second.width;
      first.resize(w, 0);
    } else {
      w = first.width;
      second.resize(w, 0);
    }
  }

  static void matchHeight(PImage first, PImage second) {
    int h;
    if (first.height > second.height) {
      h = second.height;
      first.resize(0, h);
    } else {
      h = first.height;
      second.resize(0, h);
    }
  }
}

