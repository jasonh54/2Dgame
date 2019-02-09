class Projectile extends GameObject{
  
  public Projectile(float x, float y){
    super(x, y, 25, 25, images.get("missile"));
    
  }
  
  
  public void update(){
    this.speedy += 0.1;
    this.y -= this.speedy;
    
    this.display();
  }
  
}

class EnemyProjectile extends GameObject{
  public EnemyProjectile(float x, float y){
    super(x, y, 25, 25, images.get("emissile"));
    this.speedy = 2;
  }
  public void update(){
    this.speedy += 0.1;
    this.y += this.speedy;
    
    this.display();
  }
}
