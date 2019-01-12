class Enemy extends GameObject{
  public int health = 0;
  private int timestamp = 0;
  
  public Enemy(int w,int h, PImage img){
    super(random(0, 800), 0, w, h, img);
  }
  
}


class BasicEnemy extends Enemy{
  public BasicEnemy() {
    super(40, 40, images.get("basicenemy"));
    this.speedy = 3;
  }
  public void update(){
    this.y = this.y + this.speedy;
    display();
    
  }
}

class StrongEnemy extends Enemy{
  public StrongEnemy() {
    super(75, 75, images.get("strongenemy"));
  }
}

class BossEnemy extends Enemy{
  public BossEnemy() {
    super(100, 100, images.get("bossenemy"));
  }
}
