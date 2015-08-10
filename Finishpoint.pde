class Finishpoint extends Lifeless {

  Finishpoint(float x, float y) {
    super(x, y, 20, 50);
  }

  boolean hit() {
    soundFinish.trigger();
    level.showReplay();
    return true;
  }



  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(128, 128, 255);
    stroke(0, 0, 255);
    strokeWeight(3);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

