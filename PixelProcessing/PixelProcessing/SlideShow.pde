//uses ImageTool
class SlideShow {

  //initialized variables
  int currentSlide = 0;
  int slideCounter = 0;
  float delay = 2.0; //seconds
  ArrayList<PImage> images = new ArrayList<PImage>();
  ImageTool tool = new ImageTool();
  
  //uninitialized variables
  File dataFolder;
  File[] files;

  //default constructor
  SlideShow() {
    dataFolder = new File(dataPath(""));
    loadImages();
  }

  //overloaded constructor
  SlideShow(String folderName) {
    dataFolder = new File(dataPath(folderName));
    loadImages();
  }

  
  
  void advance() {
    imageMode(CENTER);
    if(slideCounter + millis() > 1000 * delay * slideCounter) {
      currentSlide++;
      slideCounter++;
      if(currentSlide == images.size()) {
        currentSlide = 0;
      }
    }
    image(images.get(currentSlide), width/2, height/2);
  }
  
  void loadImages() {
    //load images
    files = dataFolder.listFiles();
    for(File file : files) {
      if(tool.isImage(file)) {
        images.add(loadImage(file.getName()));
      }
    }
  }
}

