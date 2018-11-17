class PowerUps extends GameObject{
  public void PowerUps(){
    super.GameObject();
  }
  
  public void PowerUps(float x, float y, float w, float h){
    super.GameObject(x, y, w, h);
  }
  public void PowerUps(float x, float y, float r){
    super.GameObject(x, y, r);
  }
  
}

class Health extends PowerUps{
  public void Health(){
    super.PowerUps();
  }
  
}
