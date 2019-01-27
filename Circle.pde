class Circle {
  float x, y, r;
  float hue;

  Circle(float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;
    hue = random(200,360);
  }

  boolean edges(int mainR) {
    float d = dist(width/2, height/2, x, y);
    return (d+r > mainR || d - r < 0 || d+r > mainR || d-r < 0);
  }

  void display() {
    noStroke();
    hue = (hue + hueOff)%360;
    fill(hue, 80, 80,10);
    ellipse(x, y, r*2, r*2);
  }
}
