//gameobject class
import java.util.Random;
class GameObject {
  //x and y coordinates
  public float x;
  public float y;
  //height and width, half height and half width
  public float w;
  public float h;
  public float w2;
  public float h2;
  //speed for left/right, speed for up/down
  public float speedx = 0;
  public float speedy = 0;
  //variable for a gameobject's image
  public PImage img;
  //variable for destroying a gameobject
  public boolean destroy = false;
  //variable to help differentiate between different child classes of one parent class
  public String tag = "";
  //health variable
  public float health = 0;
  public Random rand = new Random();
  
  public float r = 0;
  
  //default constructor
  public GameObject() {
    //getters
    this.x = 0;
    this.y = 0;
    this.w = 0;
    this.h = 0;
    this.w2 = 0;
    this.h2 = 0;
  }
  
  //constructor
  public GameObject(float x, float y, float w, float h, PImage img) {
    //setters
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.w2 = w/2;
    this.h2 = h/2;
    this.img = img;
  }

  
  //function that displays the gameobject's image
  public void display() {
    image(this.img, this.x - this.w2, this.y - this.h2, this.w, this.h);
  }
  
  //update
  public void update() {
    
  }
  
  
}
