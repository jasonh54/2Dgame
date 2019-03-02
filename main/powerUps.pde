//powerup class
class PowerUps extends GameObject {
  
  //constructor
  public PowerUps(PImage img, String t) {
    super(random(0, 800), 0, 30, 30, img);
    this.tag = t;
  }

}

//heal powerup class
class HealPU extends PowerUps {
  
  //constructor
  public HealPU() {
    super(images.get("healitem"), "healing");
    this.speedy = 1; 
  }
  
  //update
  public void update() {
    this.y = this.y + this.speedy;
    display();
    
    //destroys if no longer on screen
    if (this.y > 800) {
      this.destroy = true;
    }
    
  }
  
  
}

//speed powerup class
class SpeedPU extends PowerUps {
  
  //constructor
  public SpeedPU() {
    super(images.get("speeditem"), "speed");
    this.speedy = 2;
  }
  
  //update
  public void update() {
    this.y = this.y + this.speedy;
    display();
    
    //destroys if no longer on screen
    if (this.y > 800) {
      this.destroy = true;
    }
    
  }
  
}

//shield powerup class
class ShieldPU extends PowerUps {
  
  //constructor
  public ShieldPU() {
    super(images.get("shielditem"), "shield");
    this.speedy = 1;
  }
  
  //update
  public void update() {
    this.y = this.y + this.speedy;
    display();
    
    //destroys if no longer on screen
    if (this.y > 800) {
      this.destroy = true;
    }
    
  }
  
}

//weapon upgrade powerup class
class WeaponPU extends PowerUps {
  
  //constructor
  public WeaponPU() {
    super(images.get("burstupgrade"), "weapon");
    this.speedy = 1;
  }
  
  //update
  public void update() {
    this.y = this.y + this.speedy;
    display();
    
    //destroys if no longer on screen
    if (this.y > 800) {
      this.destroy = true;
    }
    
  }
  
}
