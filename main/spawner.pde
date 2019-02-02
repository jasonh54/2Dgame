class Spawner {
  private boolean spawn = false;
  private boolean createObject = false;
  private float spawnTimer = 0;
  private float timestamp = 0;
  private GameObject object;
  //constructor
  public Spawner(GameObject obj, ){
    
    
  }
  
  public void update(){
    if (spawn == true) {
      if (this.timestamp + this.spawnTimer < millis()){
        createObject = true;
      }
    }
  }
  
  public GameObject spawn(){
    try {
      createObject = false;
      timestamp = millis();
      println(timestamp);
      return (GameObject)object.clone();
    }
    catch(Exception e)  {
      e.printStackTrace();
      return null;
    }
    
  }
 
}
