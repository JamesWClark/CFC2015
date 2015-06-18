ImageTool tool;
File dir; 
File [] files;
ArrayList<PImage> images = new ArrayList<PImage>();

void setup() {
  tool = new ImageTool();
  dir= new File(dataPath(""));
  files= dir.listFiles();
  
  for (int i = 0; i < files.length; i++) {
    tool.isImage(files[i]);
  }
}


