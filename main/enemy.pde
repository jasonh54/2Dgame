class Enemy extends GameObject{
  //public int health = 0;
  private int timestamp = 0;
  
  public Enemy(int w,int h, PImage img){
    super(random(0, 800), 0, w, h, img);
  }
  
}


class BasicEnemy extends Enemy{
  public BasicEnemy() {
    super(40, 40, images.get("basicenemy"));
    this.speedy = 3;
    this.health = 1;
  }
  public void update(){
    this.y = this.y + this.speedy;
    //utilizing collision check function to check if 1 enemy is colliding with the group of missiles
    GameObject[] proj = collisionCheck(this, m);
    if (proj.length > 1){
      println("Collided with missile");
      score+=100;
      this.health = this.health - 1;
      proj[1].destroy = true;
    }
    if (health <= 0) {
      this.destroy = true;
      score += 100;
    }
    display();
    
  }
}

class StrongEnemy extends Enemy{
  private Timer eprojtimer = new Timer(2000);
  public StrongEnemy() {
    super(75, 75, images.get("strongenemy"));
    this.speedy = 1;
    this.health = 2;
    
  }
  
  public void update(){
    this.y = this.y + this.speedy;
    //utilizing collision check function to check if 1 enemy is colliding with the group of missiles
    GameObject[] proj = collisionCheck(this, m);
    //if the returned array is greater than 1 that means it collided with something
    if (proj.length > 1){
      this.health = this.health - 1;
      proj[1].destroy = true;
    }
    if (health <= 0) {
      this.destroy = true;
      score += 200;
    }
    display();
    if(this.eprojtimer.countDown()){
    e.addObject(new EnemyProjectile(this.x, this.y));
    }
  }
}

class BossEnemy extends Enemy{
  
  public BossEnemy() {
    
    super(100, 100, images.get("bossenemy"));
    this.speedx = 2;
    this.speedy = 1;
    this.health = 3;
  }
  
  public void update(){
    //this.x += speedx;
    //if(this.x == 0){
    //  speedx = 2;
    //} else if(this. x== 700){
    //  speedx = -2;
    //}
    
    this.y = this.y + this.speedy;
    //utilizing collision check function to check if 1 enemy is colliding with the group of missiles
    GameObject[] proj = collisionCheck(this, m);
     //if the returned array is greater than 1 that means it collided with something
     
      if(proj.length >1){
        this.health -= 1;
        proj[1].destroy = true;
      }
      
      if(this.health <= 0){
        this.destroy = true;
        score += 300;
      }
    
    display();
    
  }
}
