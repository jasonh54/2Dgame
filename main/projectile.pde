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
      m.addObject(new Explosion(this.x, this.y));
      proj[0].destroy = true;
      proj[1].health = proj[1].health - 3;
      
    }
    
    if (this.y > 800) {
      this.destroy = true;
    }
    this.display();
  }

}

class Explosion extends GameObject{
  
  private SpriteSheet explosion = new SpriteSheet("../images/explosion_spritesheet.png", 6, 8);
  private int picnum = 0;
  public Explosion(float x, float y){
    super(x, y, 0, 0, images.get("fireball"));
  }
  
  void display(){
    image(explosion.spritesheet[picnum%24], this.x - this.w2, this.y - this.h2, this.w, this.h);
    picnum++;
  }
  
  public void update(){
    this.w += 5;
    this.h += 5;
    this.w2 = this.w/2;
    this.h2 = this.h/2;
    
    GameObject [] proj = circularCollision(this, e);
    if (proj.length > 1) {
      proj[1].health = proj[1].health - 1;
    }
    
    display();
    
    if(this.h > 400){
      this.destroy = true;
    }
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
    
    //GameObject[] proj = collisionCheck(this, m);
    
    // if(proj.length >1){
    //  score+=20;
    //  proj[0].destroy = true;
    //  proj[1].destroy = true;
    //}
    
    if(this.health <= 0){
      this.destroy = true;
    }
    if (this.y > 800) {
      this.destroy = true;
    }
    this.display();
  }
}

class BossProjectile extends GameObject{
  
  public BossProjectile(float x, float y){
    super(x , y, 25, 25, images.get("plasmaball"));
    this.speedy = 0.1;
    this.speedx = 0.1;
    this.health = 1;
  }
  
  public void update(){
    this.speedy += 0.025;
    this.y += this.speedy;
    if(this.x < p.x ){
      this.speedx += 0.1;
    }
    if(this.x > p.x){
      this.speedx -= 0.1;
    }
    this.x += this.speedx;
    
    if(this.health <= 0){
      this.destroy = true;
    }
    
    if(this.y < -200) {
      this.destroy = true;
    }
    
    if (this.y > 800) {
      this.destroy = true;
    }
    this.display();
  }
  
}
 
    
  
  
  
