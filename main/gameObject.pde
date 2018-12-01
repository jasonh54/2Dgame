class GameObject{
  public float x;
  public float y;
  public float w;
  public float h;
  public float w2;
  public float h2;
  public float r;
  public float speedx = 0;
  public float speedy = 0;
  public PImage img;
  public String shape;
  
  
  public GameObject(){
    this.x = 0;
    this.y = 0;
    this.w = 0;
    this.h = 0;
    this.w2 = 0;
    this.h2 = 0;
    this.r = 0;
    this.shape = "empty";
  }
  
  public GameObject(float x, float y, float w, float h, PImage img){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.w2 = w/2;
    this.h2 = h/2;
    this.shape = "rect";
    this.img = img;
  }
  
  public GameObject(float x, float y, float r){
    this.x = x;
    this.y = y;
    this.r = r;
    this.shape = "circle";
  }
  
  public void display(){
    image(this.img, this.x - this.w2, this.y - this.h2, this.w, this.h);
  }
  
  public void update(){
    
  }
  
  
}
