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
    this.speedy = 10;
  }
}

class ShieldPU extends PowerUps{
  public ShieldPU(){
    super(images.get("shielditem"), "shield");
    this.speedy = 10;
  }
}
