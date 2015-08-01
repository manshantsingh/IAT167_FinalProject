class Finishpoint extends Lifeless {

  Finishpoint(float x, float y) {
    super(x, y, 20, 50);
  }

  boolean hit() {
    showReplay();
    return true;
  }

  void showReplay() {
    replayLevel=new ReplayLevel(player.replayer.alpha.size()-1);
    state=REPLAYING;
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

