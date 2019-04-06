Player p;
HashMap<String, PImage> images = new HashMap<String, PImage>();

Group m = new Group();
Group e = new Group();
Group powerup = new Group();

UI ui = new UI();
//spawning timers
//basicenemy timer
Timer etimer = new Timer(1500);
//stronger enemy timer
Timer betimer = new Timer(4000);
//strongenemy timer
Timer setimer = new Timer (5000);
//boss timer
Timer bosstimer = new Timer(25000);
//healitem timer
Timer htimer = new Timer(7000);
//speeditem timer
Timer sptimer = new Timer(10000);
//shielditem timer
Timer shtimer = new Timer(13000);
//weaponitem timer
Timer wtimer = new Timer(23000);

int fireAmmo = 0;
int score = 0;


void setup(){
  /* PImage healitem = loadImage("../images/heal-powerup.png");
  PImage speeditem = loadImage("../images/speed-powerup.png");
  PImage shielditem = loadImage("../images/shield-powerup.png");
  PImage spaceshipitem = loadImage("../images/spaceship.png"); */

  images.put("healitem", loadImage("../images/heal-powerup.png"));
  images.put("speeditem", loadImage("../images/speed-powerup.png")); 
  images.put("shielditem", loadImage("../images/shield-powerup.png"));
  images.put("playership", loadImage("../images/spaceship.png"));
  images.put("playershield", loadImage("../images/players-shield.png"));
  images.put("missile", loadImage("../images/missile.png"));
  images.put("missile60", loadImage("../images/missile60.png"));
  images.put("missile120", loadImage("../images/missile120.png"));
  images.put("basicenemy", loadImage("../images/enemy-ship-2.png"));
  images.put("strongenemy", loadImage("../images/enemy-ship-1.png"));
  images.put("strongerenemy", loadImage("../images/enemy-ship-3.png"));
  images.put("bossenemy", loadImage("../images/bossenemy.png"));
  images.put("emissile", loadImage("../images/alienmissile.png"));
  images.put("fireball", loadImage("../images/fireball.png"));
  images.put("burstupgrade", loadImage("../images/burstupgrade.png"));
  images.put("fireicon", loadImage("../images/firecooldown.png"));
  images.put("plasmaball", loadImage("../images/plasmaball.png"));
  
  
  
  p = new Player();
  
  size(800, 800);
  
  //powerup.spawn = true;
  //powerup.spawnTimer = 1000;
  //powerup.object = new HealPU();
  //e.spawn = true;
  //e.spawnTimer = 2000;
  //e.object = new BasicEnemy();
  
  
}

void draw(){
  clear();

  if(p.health >= 1){
  p.update();
  //update arrays
  m.update();
  e.update();
  powerup.update();
  ui.update();
  //spawn new basic enemy
  if(etimer.countDown()){
    e.addObject(new BasicEnemy());
  }
  //spawn new boss enemy
  if(betimer.countDown()){
    e.addObject(new StrongerEnemy());
  }
  //spawn new strong enemy
  if (setimer.countDown()) {
    e.addObject(new StrongEnemy());
  }
  //spawn new powerups
  if(htimer.countDown()){
    powerup.addObject(new HealPU());
  }
  if(sptimer.countDown()) {
    powerup.addObject(new SpeedPU());
  }
  if(shtimer.countDown()) {
    powerup.addObject(new ShieldPU());
  }
  if(wtimer.countDown()) {
    powerup.addObject(new WeaponPU());
  }
  if(bosstimer.countDown()){
    e.addObject(new BossEnemy());
  }
  } else if(p.health <= 0){
      textSize(128);
      text("you died",200,300);
  }
  
}


/*void updateArray(ArrayList<GameObject> a) {
  for (int i = 0; i < a.size(); i++) {
    a.get(i).update();
  }
}*/

boolean collisionCheck(GameObject a, GameObject b) {
  float xdistance = abs(a.x - b.x) - a.w2 - b.w2;  
  float ydistance = abs(a.y - b.y) - a.h2 - b.h2;
  if (ydistance < 0 && xdistance < 0) {
    return true;
  } else {
    return false;
  }
}

GameObject[] collisionCheck(Group a, GameObject b){
  //loop through the group and check if every item in the group collides with a single game object
  for (int i = 0; i < a.Go.size(); i++) {
    if (collisionCheck(a.Go.get(i), b) == true) {
      GameObject[] collide = new GameObject[2];
      collide[0] = a.Go.get(i);
      collide[1] = b;
      return collide;
    }
  }
  GameObject[] sadnothing = new GameObject[0];
  return sadnothing;
}

GameObject[] collisionCheck(GameObject b, Group a){
  //loop through the group and check if every item in the group collides with a single game object
  for (int i = 0; i < a.Go.size(); i++) {
    if (collisionCheck(a.Go.get(i), b) == true) {
      GameObject[] collide = new GameObject[2];
      collide[0] = b;
      collide[1] = a.Go.get(i);
      return collide;
    }
  }
  GameObject[] sadnothing = new GameObject[0];
  return sadnothing;
}

GameObject[] collisionCheck(Group a, Group b){
  GameObject[] collide = new GameObject[2];
  GameObject[] mywilltolive = new GameObject[0];
  
  //loop time
  for(int k = 0; k < a.Go.size(); k++){
    for(int i = 0; i < b.Go.size(); i++){
      if(collisionCheck(a.Go.get(k), b.Go.get(i))){
         collide[0] = a.Go.get(k);
        collide[1] = b.Go.get(i);
        return collide;
      } 
     }
  }
    
  return mywilltolive;
}

boolean circularCollision(GameObject a, GameObject b){
  float xdistance = abs(a.x - b.x);
  float ydistance = abs(a.y - b.y);
  float hypothenus = sqrt(xdistance * xdistance + ydistance * ydistance);
  float averagesizeA = (a.w2 + a.h2)/2;
  float averagesizeB = (b.w2 + b.h2)/2;
  if(averagesizeA + averagesizeB  > hypothenus){
    return true;
  }
  return false;
}

GameObject[] circularCollision(GameObject a, Group b){
  //loop through the group and check if every item in the group collides with a single game object
  for (int i = 0; i < b.Go.size(); i++) {
    if (circularCollision(b.Go.get(i), a) == true) {
      GameObject[] collide = new GameObject[2];
      collide[0] = a;
      collide[1] = b.Go.get(i);
      return collide;
    }
  }
  GameObject[] sadnothing = new GameObject[0];
  return sadnothing;
  
}



//boolean spawn = true;

//void spawnEnemy() {
  
//  if ((second() % 2) == 0 ){
//    if(spawn == true){
//      e.addObject(new BasicEnemy());
//      spawn = false;
//    }
//  } else {
//    spawn = true;
//  }
//}
