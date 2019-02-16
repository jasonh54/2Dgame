class GameObject implements Cloneable{
  public float x;
  public float y;
  public float w;
  public float h;
  public float w2;
  public float h2;
  public float speedx = 0;
  public float speedy = 0;
  public PImage img;
  public boolean destroy = false;
  public String tag = "";
  public int health = 0;
  
  
  public GameObject(){
    this.x = 0;
    this.y = 0;
    this.w = 0;
    this.h = 0;
    this.w2 = 0;
    this.h2 = 0;


  }
  
  public GameObject(float x, float y, float w, float h, PImage img){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.w2 = w/2;
    this.h2 = h/2;
    this.img = img;
  }
  
  protected Object clone() throws CloneNotSupportedException{
    return super.clone();
  }
  
  public void display(){
    image(this.img, this.x - this.w2, this.y - this.h2, this.w, this.h);
  }
  
  public void update(){
    
  }
  
  
}
