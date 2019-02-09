class Spawner {
  private GameObject object;
  //constructor
  public Spawner(){
  }
  
  public Spawner(GameObject obj){
    this.object = obj;
  }
  
  public GameObject spawn(){
    try {
      return (GameObject)object.clone();
    }
    catch(Exception e)  {
      e.printStackTrace();
      return null;
    }
    
  }
  
  public GameObject spawn(GameObject obj){
    this.object = obj;
    try {
      return (GameObject)object.clone();
    }
    catch(Exception e)  {
      e.printStackTrace();
      return null;
    }
    
  }
 
}
