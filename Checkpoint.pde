class Checkpoint extends Lifeless {
  color currentColor;
  PVector respawnPos;
  boolean checked;

  Checkpoint(float x, float y) {
    super(x, y, 10, 50);
    checked=false;
    currentColor=color(255, 0, 0);
    respawnPos=new PVector(x, y);
  }

  void hit() {
    checked=true;
    currentColor=color(0, 255, 0);
    level.respawnPos=respawnPos;
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

