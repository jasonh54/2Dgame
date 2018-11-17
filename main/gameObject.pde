class GameObject{
  public float x;
  public float y;
  public float w;
  public float h;
  public float r;
  public float speedx = 0;
  public float speedy = 0;
  public PImage img;
  public String shape;
  
  
  public GameObject(){
    print("running gameobject constructor");
    this.x = 0;
    this.y = 0;
    this.w = 0;
    this.h = 0;
    this.r = 0;
    this.shape = "empty";
  }
  
  public GameObject(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.shape = "rect";
  }
  
  public GameObject(float x, float y, float r){
    this.x = x;
    this.y = y;
    this.r = r;
    this.shape = "circle";
  }
  
  public void display(){
    image(img, this.x, this.y);
  }
  
  public void update(){
    
  }
  
  
}
