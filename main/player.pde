public class Player extends GameObject{
  public int health = 5;
  public boolean shoot = true;
  public boolean shield = false;
  private int timestamp = 0;
  
  private Timer ptimer = new Timer(1000);


  public Player(){
    super(400, 600, 50, 50, images.get("playership"));
  }

  
  public void update(){
    //cap hp at 5, if the value of hp go pasts 5, set it back to 5
    if(health > 5){
       health = 5; 
    }
    
    this.x += this.speedx;
    this.y += this.speedy;
    this.display();
    ui.getPData(this.health, this.timestamp);
    if (ptimer.coolDown()) {
      p.shoot = true;
    }
    GameObject[] power = collisionCheck(this, powerup);
    if (power.length > 1){
     if (power[1].tag == "healing") {
       println("GOT A HEALING ITEM!!!");
       power[1].destroy = true;
       health = health + 3;
     }
    }
    GameObject[] en = collisionCheck(this, e);
    if (en.length > 1){
      en[1].destroy = true;
      this.health = this.health - 1;
    }
  }
  
  public void changeHP(){
    health--;
  }
  
}
int speed = 0;

void keyPressed() {
  if (keyCode == 87) {
    p.speedy = -5 - speed;
  }
  if (keyCode == 83) {
    p.speedy = 5 + speed;
  }
  if (keyCode == 68) {
    p.speedx = 5 + speed;
  }
  if (keyCode == 65) {
    p.speedx = -5 - speed;
  }
  if (keyCode == 32) {
    if(p.shoot == true){
      m.addObject(new Projectile(p.x, p.y));
      p.shoot = false;
      p.timestamp = millis();
      p.ptimer.updateTs();
    }
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
