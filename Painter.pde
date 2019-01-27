class Painter {
  PVector pos, vel, acc;
  Brush b;

  Painter(float x, float y, Brush b_) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    b = b_;
  }

  void update() {
    vel.add(acc);
    vel.limit(1);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector f) {
    acc.add(f);
  }

  void edges() {
    //if(pos.x > width) pos.x=0;
    //if(pos.x < 0) pos.x = width;
    //if(pos.y > height) pos.y = 0;
    //if(pos.y < 0) pos.y = height;
    if (pos.x > width) pos.x=random(width);
    if (pos.x < 0) pos.x=random(width);
    if (pos.y > height) pos.y=random(height);
    if (pos.y < 0) pos.y=random(height);
  }

  void reset() {
    pos.x=random(width);
    pos.y=random(height);
  }

  void paint() {
    stroke(0, 5);

    b.paint(pos.x, pos.y);
  }

  void follow(PVector[] flow) {
    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);
    int index = x + y * cols;
    //index = constrain(index,0,624);
    //println("pos.x= " + pos.x + " x= " + x + " pos.y= " + pos.y + " y= " + y + " index= " + index);
    PVector force = flow[index];
    this.applyForce(force);
  }
}
