class Circular {
  PVector pos, vel, acc;
  int diameter;

  Circular(float x, float y, int diameter_) {
    pos=new PVector(x, y);
    diameter=diameter_;
  }

  void update() {
    move(GRAVITY);
    vel.add(acc);
    pos.add(vel);
    acc.set(0, 0);

    draw();
  }

  void hit() {
    //should be overriden later
  }
  
  void move(PVector vector){
    acc.add(vector);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(128);
    ellipse(0, 0, diameter, diameter);
    popMatrix();
  }
}

