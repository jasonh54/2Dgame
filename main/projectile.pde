class Projectile extends GameObject{
  
  public Projectile(){
    super();
  }
  
  public Projectile(float x, float y, float w, float h, PImage img){
    super(x, y, w, h, img);
    this.speedy = 1;
  }
  
  public void update(){
    this.y -= this.speedy;
    this.display();
  }
  
}
