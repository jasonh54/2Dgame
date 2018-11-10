public class BasicEnemy extends Enemy {
  
  public void BasicEnemy(){
    super.Enemy();
  }
  
  public void BasicEnemy(float x, float y, float w, float h){
    super.Enemy(x, y, w, h);
    speedy = 1;
  }
  
}
