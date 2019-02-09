class Group{
  
  private ArrayList<GameObject> Go = new ArrayList<GameObject>();
  
  public Group(){
    
  }
  
  public void update(){
    for(int i = 0; i < Go.size(); i++){
      Go.get(i).update();
    }

    Go = cleanGroup();
  }
  
  public void addObject(GameObject m){
    Go.add(m);
    
  }
  
  public ArrayList<GameObject> cleanGroup() {
    ArrayList<GameObject> temp = new ArrayList<GameObject>();
    for (int i = 0; i < Go.size(); i++) {
      if (Go.get(i).destroy == false){
        temp.add(Go.get(i));
      }
    }
    return temp;
    
  }
 
  
  
  
 
}
