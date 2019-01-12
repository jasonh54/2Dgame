class Group{
  
  private ArrayList<GameObject> Go = new ArrayList<GameObject>();
  
  public Group(){
    
  }
  
  public void update(){
    for(int i = 0; i < Go.size(); i++){
      Go.get(i).update();
    }
  }
  
  public void addObject(GameObject m){
    Go.add(m);
    
  }
  
  
  
  
  
  
}
