class ImageTool {
  String[] validExtensions = {"png", "jpg", "jpeg", "gif"};
  ImageTool(PImage... imgs) {
  }
  /**
   * match size, and trim to fit
   * one image will shrink to fit inside the other
   * the other will crop to match the inside
   */
  void autoBox(PImage parent, PImage child) {
    int w = parent.width;
    child.resize(0, w);
    size(w, parent.height);
    image(parent, 0, 0);
    image(child, 0, 0);
  }
  void matchResize(PImage parent, PImage child) {
  }
  
  // checks if image is PNG, JPEG, JPG, GIF
  boolean isImage(File file) {    
    int i = file.getName().lastIndexOf('.');
    if(i > -1) { //has a period in the name
      for(String extension : validExtensions) {
        if(file.getName().substring(i).toLowerCase().equals(extension)) {
          return true;
        } else {
          print(extension);
          println(file.getName().substring(i + 1).toLowerCase());
        }
      }
    }
    return false;
  }
  
  
  //handles the case where name = "file" for example
  //answers: http://stackoverflow.com/questions/3571223/how-do-i-get-the-file-extension-of-a-file-in-java
  Boolean hasExtension(File file) {
    if(file.getName().lastIndexOf('.') != -1)
      return true;
    else
      return false;
  }
}

