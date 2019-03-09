class Projectile extends GameObject{
  public int damage;
  
  public Projectile(float x, float y, int damage){
    super(x, y, 25, 25, images.get("missile"));
    this.damage = damage;
    
  }
  
  public void update(){
    this.speedy += 0.1;
    this.y -= this.speedy;
    
    GameObject [] proj = collisionCheck(this, e);
    if (proj.length > 1) {
      proj[0].destroy = true;
      proj[1].health = proj[1].health - this.damage;
    }
    
    if (this.y > 800) {
      this.destroy = true;
    }
    this.display();
  }
  
}

class Projectile60 extends Projectile{
  
  public Projectile60(float x, float y, int damage, float angle){
    super(x,y,damage);
    this.speedx = angle/4;
  }
  
  public void update(){
    this.speedy += 0.1;
    this.y -= this.speedy;
    //this.speedx -= this.angle/100;
    this.x += this.speedx;
    
    GameObject [] proj = collisionCheck(this, e);
    if (proj.length > 1) {
      proj[0].destroy = true;
      proj[1].health = proj[1].health - this.damage;
    }
    if (this.y > 800) {
      this.destroy = true;
    }
    
    this.display();
  }
}

class Projectile120 extends Projectile{
  
  public Projectile120(float x, float y, int damage, float angle){
    super(x, y, damage);
    this.speedx = angle/4;
  }
  
  public void update(){
    this.speedy += 0.1;
    this.y -= this.speedy;
    //this.speedx -= this.angle/100;
    this.x -= this.speedx;
    
    GameObject [] proj = collisionCheck(this, e);
    if (proj.length > 1) {
      proj[0].destroy = true;
      proj[1].health = proj[1].health - this.damage;
    }
    if (this.y > 800) {
      this.destroy = true;
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
      proj[0].destroy = true;
      proj[1].health = proj[1].health - 3;
    }
    
    if (this.y > 800) {
      this.destroy = true;
    }
    this.display();
  }

}

class EnemyProjectile extends GameObject{
  public EnemyProjectile(float x, float y){
    super(x, y, 25, 25, images.get("emissile"));
    this.speedy = 2;
    this.health = 1;
  }
  public void update(){
    this.speedy += 0.1;
    this.y += this.speedy;
    
    GameObject[] proj = collisionCheck(this, m);
    
     if(proj.length >1){
      score+=20;
      proj[0].destroy = true;
      proj[1].destroy = true;
    }
    
    if(this.health < 0){
      this.destroy = true;
    }
    if (this.y > 800) {
      this.destroy = true;
    }
    this.display();
  }
}
