public class Player extends GameObject{
  private int health = 0;
  


  public Player(){
    super();
  }
  public Player (float x, float y, float w, float h, PImage img){
    super(x, y, w, h, img);
  }
  public Player (float x, float y, float r){
    super(x, y, r);
  }
  
  public void update(){
    this.x += this.speedx;
    this.y += this.speedy;
    this.display();
  }
  
}

void keyPressed() {
  if (keyCode == 87) {
    p.speedy = -5;
  }
  if (keyCode == 83) {
    p.speedy = 5;
  }
  if (keyCode == 68) {
    p.speedx = 5;
  }
  if (keyCode == 65) {
    p.speedx = -5;
  }
}

void keyReleased() {
  if (keyCode == 87) {
    p.speedy = 0;
  }
  if (keyCode == 83) {
    p.speedy = 0;
  }
  if (keyCode == 68) {
    p.speedx = 0;
  }
  if (keyCode == 65) {
    p.speedx = 0;
  }
}
