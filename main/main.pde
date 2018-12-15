

HealPU heal;


void setup(){
  PImage healitem = loadImage("../images/heal-powerup.png");
  PImage speeditem = loadImage("../images/speed-powerup.png");
  PImage shielditem = loadImage("../images/shield-powerup.png");
  PImage spaceshipitem = loadImage("../images/spaceship.png");
  
  
  size(800, 800);
  heal = new HealPU();
  print("completed making the object");
}

void draw(){
  heal.display();
  
}
