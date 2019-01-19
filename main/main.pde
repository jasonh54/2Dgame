Player p;
HashMap<String, PImage> images = new HashMap<String, PImage>();

Group m = new Group();
Group e = new Group();

UI ui = new UI();

PFont SeventhS;

void setup(){
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
  
  SeventhS = createFont("7th Service",20);
  
  e.spawn = true;
  e.spawnTimer = 2000;
  e.object = new BasicEnemy();
}

void draw(){
  clear();
  p.update();
  //updateArray(m);
  m.update();
  //updateArray(e);
  e.update();
  //spawnEnemy();
  ui.update();
  
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
