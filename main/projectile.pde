class Projectile extends GameObject{
  
  public Projectile(float x, float y){
    super(x, y, 25, 25, images.get("missile"));
    
  }
  
  
  public void update(){
    this.speedy += 0.1;
    this.y -= this.speedy;
    
    GameObject [] proj = collisionCheck(this, e);
    if (proj.length > 1) {
      print("missile hit enemy");
      proj[0].destroy = true;
      proj[1].health = proj[1].health - 1;
    }
    
    
    this.display();
  }
  
}



class Fireball extends GameObject {

  public Fireball(float x, float y) {
    super(x, y, 30, 60, images.get("fireball"));
  }
  
  public void update() {
    this.speedy += 0.2;
    this.y -= this.speedy;
    GameObject [] proj = collisionCheck(this, e);
    if (proj.length > 1) {
      print("missile hit enemy");
      proj[0].destroy = true;
      proj[1].health = proj[1].health - 3;
    }
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
    
    GameObject[] proj = collisionCheck(this, m);
    
     if(proj.length >1){
      println("missile hit missle");
      score+=20;
      proj[0].destroy = true;
      proj[1].destroy = true;
    }
    
    if(this.health<0){
      this.destroy = true;
    }
    
    this.display();
  }
}
