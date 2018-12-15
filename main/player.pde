public class Player extends GameObject{
  private int health = 0;
  public boolean shoot = true;
  


  public Player(){
    super(400, 600, 50, 50, images.get("playership"));
    
  }

  
  public void update(){
    this.x += this.speedx;
    this.y += this.speedy;
    this.display();
  }
  
}

void keyPressed() {
  if (keyCode == 87) {
    p.speedy = -5;
  }
  if (keyCode == 83) {
    p.speedy = 5;
  }
  if (keyCode == 68) {
    p.speedx = 5;
  }
  if (keyCode == 65) {
    p.speedx = -5;
  }
  if (keyCode == 32) {
    if(p.shoot == true){
      m.add(new Projectile(p.x, p.y));
      p.shoot = false;
      previousS = currentS;
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
