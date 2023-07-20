class Button{
  //Eigenschaften
  float breite;
  float hoehe;
  float xLoc;
  float yLoc;
  int folgestatus;
  String beschriftung;
  boolean aktiviert=false;
  
  
  //Konstruktor
  Button(float breite, float hoehe, float xLoc, float yLoc, int folgestatus, String beschriftung) {
  this.breite=breite;
  this.hoehe=hoehe;
  this.xLoc=xLoc;
  this.yLoc=yLoc;
  this.beschriftung=beschriftung;  
  this.folgestatus=folgestatus;
  }


  //Funktionen
  void erscheinen() {
    fill(255);
    rect(xLoc,yLoc,breite,hoehe);
    fill(0);
    textSize(hoehe/2);
    text(beschriftung,xLoc+breite/2-textWidth(beschriftung)/2,yLoc+hoehe/2+12);  
    
  }
  
  void druecken() {
  
  if(drueber()&&mousePressed) {
    status=folgestatus;
    wald.stop();
    golfball.Pos.x=227;
    golfball.Pos.y=769;
    strichreset=true;
    fixstaerkeX=0;
    fixstaerkeY=0;
  }
  
  
  }

   boolean drueber() {
   if(mouseX > xLoc && mouseX <xLoc+breite
    && mouseY > yLoc && mouseY <yLoc+hoehe) {
      return true;
    } else {
      return false;
    }
   }












}
