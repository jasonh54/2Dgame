//make it so shield can take a hit: thats all thats left to do for the shield powerup :D

class PowerUps extends GameObject{
  
  public PowerUps(PImage img, String t){
    super(random(0, 800), 0, 30, 30, img);
    this.tag = t;
    
  }

  
}

class HealPU extends PowerUps{
  public HealPU(){
    super(images.get("healitem"), "healing");
    this.speedy = 1; 
  }
  public void update(){
    this.y = this.y + this.speedy;
    display();
  }
  
  
}

class SpeedPU extends PowerUps{
  public SpeedPU(){
    super(images.get("speeditem"), "speed");
    this.speedy = 2;
  }
  public void update() {
    this.y = this.y + this.speedy;
    display();
  }
}

class ShieldPU extends PowerUps{
  public ShieldPU(){
    super(images.get("shielditem"), "shield");
    this.speedy = 1;
  }
  public void update() {
    this.y = this.y + this.speedy;
    display();
  }
}

class WeaponPU extends PowerUps {
  public WeaponPU() {
    super(images.get("shielditem"), "weapon");
    this.speedy = 1;
  }
  public void update() {
    this.y = this.y + this.speedy;
    display();
  }
}
