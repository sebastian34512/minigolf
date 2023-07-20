import processing.sound.*;

SoundFile wald;
SoundFile schlag;
SoundFile win;
SoundFile fail;

PVector mausaktuell;
PVector letzte;

PImage hintergrund;
PImage maske;
PImage start;
PImage schluss;
PImage gewonnen;
Ball golfball;
Button nochmal;
Button vonvorn;
Button glitch;
boolean stehen = true;
boolean strichreset = false;
float staerkeY;
float staerkeX;
float fixstaerkeY;
float fixstaerkeX;
color vorigefarbe;
int status=1;
int score=0;

void setup () {
  size(533,800);
  hintergrund = loadImage("hintergrund.jpg");
  
  maske = loadImage("hintergrund_maske.gif");
  start = loadImage("startbild.jpg");
  schluss = loadImage("schlussbild.jpg");
  gewonnen = loadImage("gewonnen.jpg");
  
  
  golfball = new Ball(20);
  
  nochmal = new Button(150,50,width/2-75,580,1,"Nochmal!");
  vonvorn = new Button(150,50,width/2-75,580,1,"Nochmal!");
  glitch = new Button (170,50,350,710,1,"Glitch? Reset!");
  
  wald = new SoundFile(this,"hintergrundmusik.mp3");
  wald.amp(0.3); 
  schlag = new SoundFile(this, "golf.mp3");
  win = new SoundFile(this, "win.mp3");
  fail = new SoundFile(this, "fail.mp3");
  
  
  frameRate(120);
  

  letzte = new PVector(227,669);
  
  

  
}

void draw() {
 //---------------------status 1--------------------------  
if(status==1) {
  image(start,0,0,533,800);
  textSize(30);
  fill(0);
  text("Enter um zu Starten",120,680);
  textSize(20);
  text("Bewege die Maus in Richtung Ball bis der",65,720);
  text("schwarze Balken erscheint.",130,740);
  text("Drücke die linke Maustaste um zu schießen",60,780);

   if(keyPressed) {
     if(key==ENTER) {
       status=2;
       wald.loop();
     }
   
   }
  score=0;
  golfball.Pos.x=227;
  golfball.Pos.y=769;
 
  
   
  
}
  
 //---------------------status 2--------------------------  
if(status==2) {
  
  
  
  image(maske,0,0,533,800);  
  golfball.bewegen();  

  vorigefarbe = get(int(golfball.Pos.x), int(golfball.Pos.y));
  
 // image(hintergrund,0,0,533,800);
 
  textSize(30);
  fill(255);
  text("Schläge: "+score,20,40);
  
  
  glitch.erscheinen();
  glitch.druecken();
  
  
  
  // ---- schwarzer Steuerungsstrich ---- 
   
   mausaktuell = new PVector(mouseX,mouseY);
   float abstand = dist(golfball.Pos.x,golfball.Pos.y,mausaktuell.x,mausaktuell.y);
   
   if(stehen) {    
   strokeWeight(10);
   if(strichreset){
   letzte.x=golfball.Pos.x;
   letzte.y=golfball.Pos.y;
   strichreset=false;
   }
   
   
     if(abstand < 100) {
       line(golfball.Pos.x,golfball.Pos.y,mausaktuell.x,mausaktuell.y);
       letzte.x=mouseX;
       letzte.y=mouseY;     
     } else {      
       line(golfball.Pos.x,golfball.Pos.y,letzte.x,letzte.y);
     }
   
   }
  
    golfball.zeichnen();
    println(letzte.x);
  
}  


 //---------------------status 3--------------------------
if(status==3) {
  
  image(schluss,0,0,533,800);
  nochmal.erscheinen();
  nochmal.druecken();
  
  
}

//---------------------status 4--------------------------
if(status==4) {
  
  image(gewonnen,0,0,533,800);
  vonvorn.erscheinen();
  vonvorn.druecken();
  textSize(50);
  fill(0);
  text(score,300,430);
  
}
   
}

void mousePressed() {
  
}


void mouseClicked() {
   if(status==2) {
   score++;
   schlag.play();
   stehen=false;
   fixstaerkeY=map(letzte.y - golfball.Pos.y,-100,100,-7,7);
   fixstaerkeX=map(letzte.x - golfball.Pos.x,-100,100,-7,7);  
   strichreset=true;
   }
    
 
  
  
}  
