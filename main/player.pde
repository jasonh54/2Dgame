public class Player extends GameObject{
  public int health = 5;
  public boolean shoot = true;
  public boolean shield = false;
  private int timestamp = 0;
<<<<<<< HEAD
  private int timer = 0;
  private float tempspeed = p.speedy * 2;
=======
  
  private Timer ptimer = new Timer(1000);

>>>>>>> 934a9d9a6420321360d7d463947b36863c516f48

  public Player(){
    super(400, 600, 50, 50, images.get("playership"));
  }
  
  public void displayShield() {
    image(images.get("playershield"), this.x - this.w2, this.y - this.h2, this.w, this.h);  
  }

  
  public void update(){
    //cap hp at 5, if the value of hp go pasts 5, set it back to 5
    if(health > 5){
       health = 5; 
    }
    
    this.x += this.speedx;
    this.y += this.speedy;
    this.display();
    if(shield == true) {
      this.displayShield();
    }
    ui.getPData(this.health, this.timestamp);
    if (ptimer.coolDown()) {
      p.shoot = true;
    }
<<<<<<< HEAD
    for (int i = 0; i < sp.size(); i++) {
      if (collisionCheck(this, sp.get(i))) {
        sp.get(i).destroy = true;
        timer = millis();
        while((timer + 10000) >= millis()) {
          this.speedy = 
        }
      }
    }
    
=======
    GameObject[] power = collisionCheck(this, powerup);
    if (power.length > 1){
     if (power[1].tag == "healing") {
       println("GOT A HEALING ITEM!!!");
       power[1].destroy = true;
       health = health + 3;
     }
     if (power[1].tag == "speed") {
       println("got a speed item >:3c");
       power[1].destroy = true;
       speed = 3;
       if (speedtimer.countDown()) {
         speed = 0;
       }
     }
     if(power[1].tag == "shield") {
       println("shield uwu");
       power[1].destroy = true;
       shield = true;
     }
    }
    GameObject[] en = collisionCheck(this, e);
    if (en.length > 1){
      en[1].destroy = true;
      if (shield == true) {
        shield = false;
      } else {
        this.health = this.health - 1;
      }
    }
>>>>>>> 4918d9607413491450484dd5f2a9a871306e8839
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
