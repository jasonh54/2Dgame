Player p;
HashMap<String, PImage> images = new HashMap<String, PImage>();

Group m = new Group();
Group e = new Group();
Group powerup = new Group();

UI ui = new UI();
//spawning timers
Timer etimer = new Timer(2000);
Timer ptimer = new Timer(2000);
Timer sptimer = new Timer(2000);
Timer shtimer = new Timer(2000);
//the timer for speed bonus
Timer speedtimer = new Timer(5000);

void setup(){
  images.put("healitem", loadImage("../images/heal-powerup.png"));
  images.put("speeditem", loadImage("../images/speed-powerup.png")); 
  images.put("shielditem", loadImage("../images/shield-powerup.png"));
  images.put("playership", loadImage("../images/spaceship.png"));
  images.put("playershield", loadImage("../images/players-shield.png"));
  images.put("missile", loadImage("../images/missile.png"));
  images.put("basicenemy", loadImage("../images/enemy-ship-2.png"));
  images.put("strongenemy", loadImage("../images/enemy-ship-1.png"));
  images.put("bossenemy", loadImage("../images/enemy-ship-3.png"));
  
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
  //spawn new powerups
  if(ptimer.countDown()){
    powerup.addObject(new HealPU());
  }
  if(sptimer.countDown()) {
    powerup.addObject(new SpeedPU());
  }
  if(shtimer.countDown()) {
    powerup.addObject(new ShieldPU());
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
