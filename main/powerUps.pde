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
<<<<<<< HEAD
    super(images.get("speeditem"));
    this.speedy = 1;
=======
    super(images.get("speeditem"), "speed");
    this.speedy = 2;
>>>>>>> 4918d9607413491450484dd5f2a9a871306e8839
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
