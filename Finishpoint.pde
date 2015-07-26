class Finishpoint extends Lifeless {
  color currentColor;

  Finishpoint(float x, float y) {
    super(x, y, 10, 50);
  }

  void hit() {
    println("level won");
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    stroke(currentColor);
    strokeWeight(3);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

