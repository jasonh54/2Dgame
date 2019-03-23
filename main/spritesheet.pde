class SpriteSheet{
  private String imgsrc;
  private PImage fullimage;
  private int rows, cols, spriteW, spriteH, numberOfSprites;
  private PImage[] spritesheet;
  
  public SpriteSheet(String imgsrc, int rows, int cols){
    this.imgsrc = imgsrc;
    fullimage = loadImage(imgsrc);
    fullimage.loadPixels();
    this.rows = rows;
    this.cols = cols;
    this.spriteW = fullimage.width/this.cols;
    this.spriteH = fullimage.height/this.rows;
    this.numberOfSprites = rows * cols;
    spritesheet = new PImage[this.numberOfSprites];
    parseImage();
  }
  
  private void parseImage(){
    for(int i=0; i<this.numberOfSprites; i++){
      spritesheet[i] = createImage(spriteW, spriteH, RGB);
      spritesheet[i].loadPixels();
      int pixel = 0;
      for(int row=0; row< this.spriteH; row++){
        for(int col=0; col<this.spriteW; col++){
          //this is complicated
          spritesheet[i].pixels[pixel] = fullimage.pixels[col + i*this.spriteW + row*fullimage.width + (floor(i/this.cols)*((this.spriteH-1) * fullimage.width))];
          pixel++;
          
        }
      }
      spritesheet[i].updatePixels();
    }
  }
  
}
