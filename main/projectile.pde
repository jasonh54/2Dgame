class Projectile extends GameObject{
  
  public Projectile(float x, float y){
    super(x, y, 25, 25, images.get("missile"));
    this.speedy = 1;
  }
  
  
  public void update(){
    this.y -= this.speedy;
    this.display();
  }
  
}
