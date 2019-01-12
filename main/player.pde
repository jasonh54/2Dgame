public class Player extends GameObject{
  public int health = 5;
  public boolean shoot = true;
  private int timestamp = 0;
  


  public Player(){
    super(400, 600, 50, 50, images.get("playership"));
  }

  
  public void update(){
    this.x += this.speedx;
    this.y += this.speedy;
    this.display();
    ui.getPData(this.health, this.timestamp);
    if (this.timestamp + 1000 < millis()) {
      p.shoot = true;
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
      m.add(new Projectile(p.x, p.y));
      p.shoot = false;
      p.timestamp = millis();
    } p.changeHP();
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
