class UI{
  
  private int phealth;
  private int ptimestamp;
  private int hpx;
  
  private int[] colorArr = new int[]{255,0,0};
  
  public UI(){
    /*for(int i = 0; i < 200; i++){
      System.out.println(font.list()[i]);
    }*/
  }
  
  public void update(){
    drawCooldown();
    HPoverlay();
    drawHP();
  }
  
  public void printScore(){
    
  }
  
  public void drawCooldown(){
    noStroke();
    noFill();
    if(ptimestamp + 1000 > millis()){
      fill(229,0,0);
      rect(525,700,(millis()-ptimestamp)/4,50);
    } else {
      fill(255);
      text("READY",525,690);
      fill(0,128,0);
      rect(525.5,700,250,50);
    }
  }
  
  public void HPoverlay(){
    noFill();
    if(phealth == 2 || phealth == 1){
      fill(255,0,0);
      text("LOW HP",25,700);
      
    }/* else if(phealth == 1){
      
      if(millis()%12 == 0){
        colorArr[0] = 255;
        colorArr[1] = 255;
        colorArr[2] = 255;
        
      } else if(millis()%14 == 0){
        colorArr[0] = 255;
        colorArr[1] = 0;
        colorArr[2] = 0;
      }
      
      fill(colorArr[0],colorArr[1],colorArr[2]);
      text("LOW HP", 25, 700);
      
    }*/
    
    stroke(255,0,0);
    noFill();
    hpx = -25;
    for(int i = 0; i < 5; i++){
       hpx += 50;
       rect(hpx,712.5,25,25);
     }
  }
  
  public void drawHP(){
    
    noStroke();
    if(phealth<1){
      noFill();
    } else {
     hpx = -25;
     noFill();
     for(int i = 0; i < phealth; i++){
       fill(255,0,0);
       hpx += 50;
       rect(hpx,712.5,25,25);
     }
    }
    
    
  }
  
  public void getPData(int health, int timestamp){
    phealth = health;
    ptimestamp = timestamp;
    //System.out.println(phealth + " " + ptimestamp);
  }
  
}
