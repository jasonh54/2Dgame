
HashMap<String, PImage> images = new HashMap<String, PImage>();
Player p;
ArrayList<GameObject> m = new ArrayList<GameObject>();
ArrayList<GameObject> e = new ArrayList<GameObject>();


void setup(){
  PImage healitem = loadImage("../images/heal-powerup.png");
  PImage speeditem = loadImage("../images/speed-powerup.png");
  PImage shielditem = loadImage("../images/shield-powerup.png");
  PImage spaceshipitem = loadImage("../images/spaceship.png");

  images.put("healitem", loadImage("../images/heal-powerup.png"));
  images.put("speeditem", loadImage("../images/speed-powerup.png")); 
  images.put("shielditem", loadImage("../images/shield-powerup.png"));
  images.put("playership", loadImage("../images/spaceship.png"));
  images.put("missile", loadImage("../images/missile.png"));
  images.put("basicenemy", loadImage("../images/enemy-ship-2.png"));
  images.put("strongenemy", loadImage("../images/enemy-ship-1.png"));
  images.put("bossenemy", loadImage("../images/enemy-ship-3.png"));
  
  p = new Player();
  
  size(800, 800);
  
 
}

void draw(){
  clear();
  p.update();
  updateArray(m);
  updateArray(e);
  spawnEnemy();

  
}

void updateArray(ArrayList<GameObject> a) {
  for (int i = 0; i < a.size(); i++) {
    a.get(i).update();
  }
}

void boolean collisionCheck(GameObject a, GameObject b) {
  float xdistance = abs(a.x - b.x) - a.w2 - b.w2;  
  float ydistance = abs(a.y - b.y) - a.h2 - b.h2;
  if (ydistance < 0 && xdistance < 0) {
    return true;
  } else {
    return false;
  }
}

boolean spawn = true;
void spawnEnemy() {
  
  if ((second() % 2) == 0 ){
    if(spawn == true){
      e.add(new BasicEnemy());
      spawn = false;
    }
  } else {
    spawn = true;
  }
}
