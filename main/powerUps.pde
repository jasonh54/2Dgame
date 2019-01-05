class PowerUps extends GameObject{
  
  
  public PowerUps(PImage img){
    super(random(0, 800), 0, 30, 30, img);
    
    
  }

  public void update(){
    this.y += this.speedy;
  }
}

class HealPU extends PowerUps{
  public HealPU(){
    super(images.get("healitem"));
    this.speedy = 10; 
  }
}

class SpeedPU extends PowerUps{
  public SpeedPU(){
    super(images.get("speeditem"));
    this.speedy = 10;
  }
}

class ShieldPU extends PowerUps{
  public ShieldPU(){
    super(images.get("shielditem"));
    this.speedy = 10;
  }
}
