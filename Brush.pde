class Brush{


  int outerR; //Radius of brush
  ArrayList<Circle> circles;
  float hue = random(360);
  int density;
  float minThick, maxThick; //bristle thickness


  Brush(int r_, int density_) {  
    outerR = r_;
    density = density_;
    minThick=2;
    maxThick=20;
    circles = new ArrayList<Circle>();
    createBrush();
  }

  void createBrush() {
    while (circles.size()<density) {
      Circle newC = newCircle();
      if(newC != null){
       circles.add(newC); 
      }      
    }
  }

  Circle newCircle() {
    float x = random(-outerR, outerR);
    float y = random(-outerR, outerR);
    float r = random(minThick, maxThick);
    float d = dist(x, y, 0, 0);
    boolean valid;
    if (d>outerR) {
      valid = false;
    } else {
      valid = true;
    }
    for(Circle c : circles){
     float d2 = dist(x,y,c.x,c.y);
     if(r+c.r>d2){
       valid = false;
       break;      
    }
    }
    if(valid){
      return new Circle(x,y,r);
    }else {
      return null;
    }
  }

  void paint(float mX, float mY) {
    pushMatrix();
    translate(mX,mY);
    for(Circle c: circles){
     c.display(); 
    }
    popMatrix();
  }

  void displayOutline() {
  }

  void reset() {
    hue = random(360);
    circles = new ArrayList<Circle>();
    createBrush();
  }
}
