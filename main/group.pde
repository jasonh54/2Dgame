class Group{
  
  private ArrayList<GameObject> Go = new ArrayList<GameObject>();
  private boolean spawn = false;
  private boolean createObject = false;
  private float spawnTimer = 0;
  private float timestamp = 0;
  private GameObject object;
  
  public Group(){
    
  }
  
  public void update(){
    for(int i = 0; i < Go.size(); i++){
      Go.get(i).update();
    }
    if (spawn == true) {
      if (this.timestamp + this.spawnTimer < millis()){
        createObject = true;
      }
    }
    if (createObject == true) {
      try {
        addObject((GameObject)object.clone());
        createObject = false;
        timestamp = millis();
        println(timestamp);
      }
      catch(Exception e)  {
        e.printStackTrace();
      }
    }
  }
  
  public void addObject(GameObject m){
    Go.add(m);
    
  }
  
  
  
  
  
  
  
}
