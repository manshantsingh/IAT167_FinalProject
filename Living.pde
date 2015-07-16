class Living {
  PVector pos, vel, acc;
  int w, h, health;
  float mass;
  boolean alive;

  Living(float x, float y, int w_, int h_, int health_, float mass_) {
    pos=new PVector(x, y);
    vel=new PVector();
    acc=new PVector();
    w=w_;
    h=h_;
    health=health_;
    mass=mass_;
    alive=true;
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.set(0, 0);
  }
  void move(PVector force) {
    acc.add(force);
  }
  boolean collision(Living other) {
    return abs(pos.x-other.pos.x)<w/2+other.w/2 && abs(pos.y-other.pos.y)<h/2+other.h/2;
  }
  boolean collision(Lifeless other) {
    return abs(pos.x-other.pos.x)<w/2+other.w/2 && abs(pos.y-other.pos.y)<h/2+other.h/2;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0, 200, 0);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

