class Lifeless {
  PVector pos, initialPos;
  int w, h;

  Lifeless(float x, float y, int w_, int h_) {
    pos=new PVector(x, y);
    initialPos=pos.get();
    w=w_;
    h=h_;
  }

  void update() {
    draw();
  }

  boolean hit(Living l) {
    return false;
  }
  void reset() {
    pos=initialPos.get();
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
    stroke(0);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

class DangerLifeless extends Lifeless {
  DangerLifeless(float x, float y, int w_, int h_) {
    super(x, y, w_, h_);
  }

  boolean hit(Living l) {
    if (l.alive) l.decreaseHealth(DEATH);
    return true;
  }
}

