float inc = 0.05;
float scl = 20;
int cols, rows;
float hueOff=0;
float zOff = 0;
Painter[] painters = new Painter[100];
PVector[] flowField;
Brush[] brushes = new Brush[10];

void setup() {
  //size(1500, 1000,P2D);
  fullScreen(P2D);
  frameRate(110);
  noCursor();
  colorMode(HSB,360,100,100);
  for (int i=0; i<brushes.length; i++) {
   brushes[i] = new Brush(50,100); 
  }
  cols = floor(width/scl) + 1;
  rows = floor(height/scl) + 1;
  flowField = new PVector[cols*rows];
  for (int i=0; i<painters.length; i++) {
    painters[i] = new Painter(random(width), random(height),brushes[i%10]);
  }
  background(0);
  generate(false);
}

void draw() {
  //background(255);
 if(frameCount%100==0){
  generate(false); 
  for (int i=0; i<floor(painters.length/4); i++) {
    painters[int(random(painters.length))].reset();
  }
 }
  //fill(0,10);
  //rect(0,0,width,height);
  //generate(false);

  for (int i=0; i<painters.length; i++) {
    painters[i].follow(flowField);
    painters[i].update();
    painters[i].paint();
    painters[i].edges();
  }
}

void generate(boolean show_) {
  boolean showing = show_;
  float yOff = 0;
  for (int y = 0; y<rows; y++) {
    float xOff = 0;
    for (int x=0; x<cols; x++) {
      int index = x + y * cols;
      float angle = noise(xOff, yOff, zOff)*TWO_PI*4;
      PVector v = PVector.fromAngle(angle);
      v.setMag(0.05);
      flowField[index] = v;
      if (showing) {
        stroke(0, 50);
        strokeWeight(1);
        pushMatrix();
        translate(x*scl, y*scl);
        rotate(v.heading());
        line(0, 0, scl, 0);
        popMatrix();
        //rect(x*scl, y*scl, scl, scl);
      }
      xOff+=inc;
    }
    yOff+=inc;
  }
  zOff+=1;
  hueOff+=0.0001;
}

void mousePressed() {
}
