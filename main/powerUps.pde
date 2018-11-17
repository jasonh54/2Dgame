class PowerUps extends GameObject{
  
  
  public PowerUps(){
    super();
    
    
  }
  
  public PowerUps(float x, float y, float w, float h){
    
  }
  public PowerUps(float x, float y, float r){
    
  }
  
  public void update(){
    this.y += this.speedy;
  }
}

class HealPU extends PowerUps{
  public HealPU(){
    super();
    this.speedy = 10;
    
    
  }
  
}
