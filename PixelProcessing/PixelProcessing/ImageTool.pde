class ImageTool {
  
  //class variables
  String[] validExtensions = {"png", "jpg", "jpeg", "gif"};

  //constructors
  ImageTool() {}
  ImageTool(PImage... imgs) {}
  
  //class methods
  void scaleWidth(PImage parent, PImage child) {
    int w = parent.width;
    child.resize(0, w); //zero keeps the original scale intact
  }
  
  void scaleHeight(PImage parent, PImage child) {
    int h = parent.height;
    child.resize(h, 0);
  }
  
  void matchResize(PImage parent, PImage child) {
  }
  
  // checks if image is PNG, JPEG, JPG, GIF
  boolean isImage(File file) {
    //i will always be negative 1 when there is no period found
    int i = file.getName().lastIndexOf('.');
    if(i > -1) {
      for(String extension : validExtensions) {
        if(file.getName().substring(i + 1).toLowerCase().equals(extension)) {
          return true;
        }
      }
    }
    return false;
  }
}

