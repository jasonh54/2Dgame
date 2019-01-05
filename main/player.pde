public class Player extends GameObject{
  private int health = 0;
  //public Shield shield;
  public void Player(){
    super.GameObject();
  }
  public void Player (float x, float y, float w, float h){
    super.GameObject(x, y, w, h);
  }
  public void Player (float x, float y, float r){
    super.GameObject(x, y, r);
  }
  
  
}
