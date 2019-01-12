class UI{
  
  private int HPx = 0;
  
  private int phealth;
  private int ptimestamp;
  
  public UI(){
  }
  
  public void drawCooldown(){
    noStroke();
    if(ptimestamp + 1000 > millis()){
      fill(229,0,0);
      rect(550,700,(millis()-ptimestamp)/5,50);
    } else {
      fill(0,128,0);
      rect(550,700,200,50);
    }
  }
  
  public void drawHP(){
    
  }
  
  public void getPData(int health, int timestamp){
    phealth = health;
    ptimestamp = timestamp;
    System.out.println(phealth + " " + ptimestamp);
  }
}
