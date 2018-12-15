
HashMap<String, PImage> images = new HashMap<String, PImage>();
Player p;
ArrayList<Projectile> m = new ArrayList<Projectile>();
int currentS;
int previousS = 0;

void setup(){
  images.put("healitem", loadImage("../images/heal-powerup.png"));
  images.put("speeditem", loadImage("../images/speed-powerup.png")); 
  images.put("shielditem", loadImage("../images/shield-powerup.png"));
  images.put("playership", loadImage("../images/spaceship.png"));
  images.put("missile", loadImage("../images/missile.png"));
  
  p = new Player();
  
  size(800, 800);
  
 
}

void draw(){
  clear();
  p.update();
  updateMissiles();
  currentS = second();
  if (p.shoot == false && currentS > previousS){
    p.shoot = true;
  }
  
}

void updateMissiles() {
  for (int i = 0; i < m.size(); i++) {
    m.get(i).update();
  }
}
