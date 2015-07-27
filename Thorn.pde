class Thorn extends Lifeless {
  Thorn(float x, float y, int w_) {
    super(x, y, w_, 20);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(128, 0, 0);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

