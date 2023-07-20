class Ball {
  
  //Eigenschaften:
  PVector Pos;
  float ySpeed=15;
  float xSpeed=15;
  float durchmesser;
  color farbwertoben;
  color farbwertunten;
  color farbwertrechts;
  color farbwertlinks;
  color farbwert;
 
  
  //Konstruktor:
  Ball(float durchmesser) {
    this.durchmesser = durchmesser;
    Pos= new PVector(227,769);
  }
  
  //Funktionene:
  void zeichnen() {
    fill(255);
    strokeWeight(1);
    circle(Pos.x, Pos.y, durchmesser);
    
    
  }
  
  
  void bewegen() {
    
    // ---- Stärkenerkennung ----
    
   fixstaerkeY*=0.98;
   Pos.y+=fixstaerkeY;
  
   fixstaerkeX*=0.98;
   Pos.x+=fixstaerkeX;

        
    if((fixstaerkeX<0.1 && fixstaerkeX>-0.1) && (fixstaerkeY<0.1 && fixstaerkeY>-0.1) ) {

    stehen=true;
    
    } 
    
     
    // ---- Farberkennung ----
    
    farbwert = get(int(Pos.x), int(Pos.y));
      
      // --- rudimentäre Bandenerkennung ---
   /*  if(vorigefarbe==#FFFFFF && farbwert == #000000) {
       if(abs(fixstaerkeY)>abs(fixstaerkeX)) {
       fixstaerkeX*=-1;
       } else {
       fixstaerkeY*=-1;
       }
      } */
      
      
      
     if(vorigefarbe==#FFFFFF && farbwert == #FF0000) {
       status=3;
       fail.play();
       fail.amp(0.2);
       
       wald.stop();
      } 
      
      if(farbwert == #00FF00) {
        win.play();
        win.amp(0.2);
       status=4;
       
       wald.stop();
      } 
      
      
    //  ---- Bandenerkennung wenn Ball nicht zu schnell wäre----
    
    farbwertoben = get(int(Pos.x), int(Pos.y-durchmesser/2));
    farbwertunten = get(int(Pos.x), int(Pos.y+durchmesser/2));
    farbwertrechts = get(int(Pos.x+durchmesser/2), int(Pos.y));
    farbwertlinks = get(int(Pos.x-durchmesser/2), int(Pos.y));
    
    if(vorigefarbe==#FFFFFF && farbwertoben == #000000 || vorigefarbe==#FFFFFF && farbwertunten == #000000) {
         fixstaerkeX*=-1;
    }
       
    if(vorigefarbe==#FFFFFF && farbwertrechts == #000000 || vorigefarbe==#FFFFFF && farbwertlinks == #000000) {
         fixstaerkeY*=-1;
       }
       
    /*
    
    
    
    
    
    
    
    
    
    
    
    
    ---- Da hab ich versucht, dass der Ball quasi nie ins Schwarze eintaucht sondern immer zurück ins Weiße kommt... hat nicht funktioniert
    
    /*
   if(farbwert==#000000){ 
    
    if(fixstaerkeY < 0 && abs(fixstaerkeY) > abs(fixstaerkeX)) {    //Ball fliegt nach oben
   /*   while(vorigefarbe==#000000) {
        Pos.y++;
        vorigefarbe = get(int(golfball.Pos.x), int(golfball.Pos.y));
      } 
      fixstaerkeY*=-1;
      
    //  println("oben");
    }
    
    if(fixstaerkeY > 0 && abs(fixstaerkeY) > abs(fixstaerkeX)) {    //Ball fliegt nach unten
   /*   while(vorigefarbe==#000000) {
        Pos.y--;
        vorigefarbe = get(int(golfball.Pos.x), int(golfball.Pos.y));
      } 
      
      fixstaerkeY*=-1;
   //   println("unten");
    }
    
    if(fixstaerkeX < 0 && abs(fixstaerkeX) > abs(fixstaerkeY)) {    //Ball fliegt nach links
  /*    while(vorigefarbe==#000000) {
        Pos.x++;
        vorigefarbe = get(int(golfball.Pos.x), int(golfball.Pos.y));
      } 
      fixstaerkeX*=-1;
    //  println("links");
    }
    
    if(fixstaerkeX > 0 && abs(fixstaerkeX) > abs(fixstaerkeY)) {    //Ball fliegt nach rechts
   /*   while(vorigefarbe==#000000) {
        Pos.x--;
        vorigefarbe = get(int(golfball.Pos.x), int(golfball.Pos.y));
      } 
      fixstaerkeX*=-1;
   //   println("rechts");
    }
    */
   }
    
  
  
  

    
    /*Grün: -16711935
      Weiß: -1
      Schwarz: -14869221
      Rot: -131072
      */
      
      
    


}
