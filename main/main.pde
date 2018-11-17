

HealPU heal;


void setup(){
  PImage healitem = loadImage("../images/heal-powerup.png");
  
  
  size(800, 800);
  heal = new HealPU();
  print("completed making the object");
}

void draw(){
  heal.display();
  
}
