class Lifeless {
  PVector pos;
  int w, h;

  Lifeless(float x, float y, int w_, int h_) {
    pos=new PVector(x, y);
    w=w_;
    h=h_;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

