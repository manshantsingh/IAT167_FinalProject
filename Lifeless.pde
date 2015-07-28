class Lifeless {
  PVector pos;
  int w, h;

  Lifeless(float x, float y, int w_, int h_) {
    pos=new PVector(x, y);
    w=w_;
    h=h_;
  }

  void update() {
    draw();
  }

  boolean hit() {
    return false;
  }
  void reset() {
    //do nothing. it will be overriden later
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

  boolean hit() {
    player.decreaseHealth(PLAYER_MAX_HEALTH);
    return true;
  }
}

