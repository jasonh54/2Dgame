
Player p;
Projectile m;

void setup(){
  PImage healitem = loadImage("../images/heal-powerup.png");
  PImage playership = loadImage("../images/spaceship.png");
  PImage missile = loadImage("../images/missile.png");
  p = new Player(400, 600, 50, 50, playership);
  m = new Projectile(400, 600, 25, 25, missile);
  size(800, 800);
 
}

void draw(){
  clear();
  p.update();
  m.update();
}
