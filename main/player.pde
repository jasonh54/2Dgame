public class Player extends GameObject {
  public int health = 5;
  public boolean shoot = true;
  public boolean fshoot = true;
  public int totalWeaponUps = 0;
  public int damage = 1;
  public boolean fallowed = false;
  public boolean shield = false;
  private int timestamp = 0;
  private int ftimestamp = 0;
  
  private Timer ptimer = new Timer(500);
  private Timer ftimer = new Timer(5000);
  //the timer for speed bonus
  private Timer speedtimer = new Timer(5000);
  
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
    //once score is 2000, allow fireballs
    if (score >= 2000) {
      fallowed = true;
    }
    //change speeds
    this.x += this.speedx;
    this.y += this.speedy;
    //display
    this.display();
    //show a shield if the player has one
    if(shield == true) {
      this.displayShield();
    }
    //missile cooldown
    ui.getPData(this.health, this.timestamp);
    if (ptimer.coolDown()) {
      p.shoot = true;
    }
    //fireball cooldown
    if (ftimer.coolDown()) {
      p.fshoot = true;
    }
    //collisioncheck for the player and a powerup
    GameObject[] power = collisionCheck(this, powerup);
    if (power.length > 1){
      //pickup a heal
     if (power[1].tag == "healing") {
       println("got a healing item / ");
       power[1].destroy = true;
       health = health + 3;
     }
     //pickup a speed
     if (power[1].tag == "speed") {
       println("got a speed item / ");
       power[1].destroy = true;
       speed = 5;
       speedtimer.updateTs();
     }
     //pickup a shield
     if(power[1].tag == "shield") {
       println("got a shield item / ");
       power[1].destroy = true;
       shield = true;
     }
     //pickup a weapon upgrade
     if (power[1].tag == "weapon") {
       println("got a weapon upgrade / ");
       power[1].destroy = true;
       totalWeaponUps++;
       println(totalWeaponUps);
     }
    }
    //speed powerup cooldown
    if ( speedtimer.countDown() ) {
         speed = 0;
    }
    //player-enemy collisioncheck
    GameObject[] en = collisionCheck(this, e);
    if (en.length > 1){
      en[1].destroy = true;
      if (shield == true) {
        shield = false;
      } else {
        this.health = this.health - 1;
      }
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
  //space key pressed
  if (keyCode == 32) {
    if(p.shoot == true){
      m.addObject(new Projectile(p.x, p.y, p.damage));

      
        m.addObject(new Projectile60(p.x, p.y, p.damage, 1 ));
        m.addObject(new Projectile120(p.x, p.y, p.damage, 1));
      

      p.shoot = false;
      p.timestamp = millis();
      p.ptimer.updateTs();
    }
  }
  //Q key pressed
  if (keyCode == 81) {
    if (p.fallowed == true) {
      if (p.fshoot == true) {
        m.addObject(new Fireball(p.x, p.y));
        p.fshoot = false;
        p.ftimestamp = millis();
        p.ftimer.updateTs();
      }
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
