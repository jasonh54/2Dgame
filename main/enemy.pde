//utilizing collision check function to check if 1 enemy is colliding with the group of missiles
    //GameObject[] proj = collisionCheck(this, m);
    // //if the returned array is greater than 1 that means it collided with something
     
    //  if(proj.length >1){
    //    this.health -= 1;
    //    proj[1].destroy = true;
    //  }
    //collision with missile moved to missile class
    
class Enemy extends GameObject{
  //public int health = 0;
  private int timestamp = 0;
  
  public Enemy(int y,int w,int h, PImage img){
    super(random(0, 800), y, w, h, img);
  }
  
  //if points increased 1000, increase hp by the original hp amount
  public int scalehp(){
    return (score/1000);
  }
  
}


class BasicEnemy extends Enemy{
  public BasicEnemy() {
    super(-100,40, 40, images.get("basicenemy"));
    this.speedy = 3;
    this.health = 1 + scalehp();
  }
  public void update(){
    this.y = this.y + this.speedy;
    scalehp();
    if (health <= 0) {
      this.destroy = true;
      score += 100;
    }
    if(y > 850){
      this.destroy = true;
    }
    
    display();
    
  }
}

class StrongEnemy extends Enemy{
  private Timer eprojtimer = new Timer(2000);
  public StrongEnemy() {
    super(-100,75, 75, images.get("strongenemy"));
    this.speedy = 1;
    this.health = 2 + scalehp();
    
  }
  
  public void update(){
    this.y = this.y + this.speedy;
    if (health <= 0) {
      this.destroy = true;
      score += 200;
    }
    if(y > 850){
      this.destroy = true;
    }
    
    display();
    if(this.eprojtimer.countDown()){
    e.addObject(new EnemyProjectile(this.x, this.y));
    }
  }
}

class StrongerEnemy extends Enemy{
  
  public StrongerEnemy() {
    
    super(-100,100, 100, images.get("strongerenemy"));
    this.speedx = 2;
    this.speedy = 2;
    this.health = 3 + scalehp();
  }
  
  public void update(){
    
    //if(this.x  == 0){
    //  this.speedx = 2;
    //} else if(this.x == 700){
    //  this.speedx = -2;
    //}
    
    //this.x += this.speedx;
    
 
    this.y = this.y + this.speedy;
    

    
    
     if(this.health <= 0){
        this.destroy = true;
        score += 300;
      }
      
     if(y > 850){
      this.destroy = true;
    }
    
    display();
    
  }
}


class BossEnemy extends Enemy{
  private Timer bprojtimer = new Timer(200);
  private int[] randarr = new int[3];
  
  public BossEnemy() {
    super(-300,200, 200, images.get("bossenemy"));
    this.speedx = 2;
    this.speedy = 1;
    this.health = 5 + scalehp();
    randarr[0] = -80;
    randarr[1] = 0;
    randarr[2] = 80;
  }
  
  public void update(){
    
    if(this.x > p.x){
      this.speedx -= 0.1;
    } else if(this.x < p.x){
      this.speedx += 0.1;
    }
    
    this.x += this.speedx;
    
    if(this.x > p.x-10 && this.x < p.x+10){
      this.speedx = 0;
    }
    
    if (this.x < 0 || this.x > 800){
      this.speedx *= -1;
    }
    
    this.y = this.y + this.speedy;
    
    if (this.y > 200){
      this.y = 200;
    }
    
    if(this.health <= 0){
        this.destroy = true;
        score += 300;
    }
      
    if(this.bprojtimer.countDown()){
      int temprand = rand.nextInt(3);
      if(temprand == 1){
        e.addObject(new BossProjectile(this.x+randarr[temprand], this.y + 40));
      } else {
        e.addObject(new BossProjectile(this.x+randarr[temprand], this.y));
      }
    }
    
    display();
    
  }
}
