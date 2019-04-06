public class Player extends GameObject {
  public float health = 5;
  public boolean shoot = true;
  public boolean shooting = false;
  public boolean fshoot = true;
  public int totalWeaponUps = 0;
  public float damage = 1;
  public boolean shield = false;
  private int timestamp = 0;
  private int ftimestamp = 0;
  private int scorestamp = 0;
  private int ctimestamp = 0;
  
  private Timer ptimer = new Timer(500);
  private Timer ftimer = new Timer(1000);
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
    //for every 2000 interval of score, increase the fireball ammo by 1
    if (score >= 2000) {
      if (score >= scorestamp + 2000) {
        fireAmmo = fireAmmo + 1;
        println("fireammo: " + fireAmmo);
        scorestamp = score;
      }
      
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
       if(totalWeaponUps < 2){
         totalWeaponUps++;
       } else {
         damage++;
       }
       println(totalWeaponUps);
     }
    }
    //speed powerup cooldown
    if ( speedtimer.countDown() ) {
         speed = 0;
    }
    //player-enemy collisioncheck
    GameObject[] en = collisionCheck(this, e);
      if (ctimestamp + 500 <= millis()) {
        if (en.length > 1){
          en[1].health = en[1].health - 1;
          if (shield == true) {
            shield = false;
          } else {
            this.health = this.health - 2;
            println(health);
            ctimestamp = millis();
          }
        }
      }

    }
    
    if(shoot == true && shooting == true){
      m.addObject(new Projectile(p.x, p.y, p.damage));

      //repeate creation of side missles depending on how many power ups the player gathers
      for(int i=1; i< totalWeaponUps+1; i++){
        m.addObject(new Projectile60(p.x, p.y, p.damage, i ));
        m.addObject(new Projectile120(p.x, p.y, p.damage, i));
      }

      shoot = false;
      timestamp = millis();
      ptimer.updateTs();
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
    p.shooting = true;
  }
  //Q key pressed
   if (keyCode == 81) {
      if (p.fshoot == true) {
        if (fireAmmo > 0) {
          m.addObject(new Fireball(p.x, p.y));
          p.fshoot = false;
          p.ftimestamp = millis();
          p.ftimer.updateTs();
          fireAmmo = fireAmmo - 1;
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
  if (keyCode == 32) {
    p.shooting = false;
  }
}
