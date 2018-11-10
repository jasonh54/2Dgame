class Enemy extends GameObject{
  public int health = 0;
  
  public void Enemy(){
    super.GameObject();
  }
  public void Enemy(float x, float y, float w, float h){
    super.GameObject(x,y,w,h);
  }
  public void Enemy(float x, float y, float r){
    super.GameObject(x,y,r);
  }
  
  
}
