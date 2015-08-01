class RePlayer {
  ArrayList<PVector> pos;
  ArrayList<Float> angle;
  ArrayList<Integer> alpha;
  PVector currentPos;
  float currentAngle;
  int currentAlpha;

  RePlayer() {
    pos=new ArrayList<PVector>();
    angle=new ArrayList<Float>();
    alpha=new ArrayList<Integer>();
    replays.add(this);
  }

  void addFrame(PVector pos_, float angle_, int alpha_) {
    pos.add(pos_.get());
    angle.add(angle_);
    alpha.add(alpha_);
  }

  void drawFrame(int index) {
    if (index>=pos.size()) return;

    currentPos=pos.get(index);
    currentAngle=angle.get(index);
    currentAlpha=alpha.get(index);

    pushMatrix();
    strokeWeight(3);
    stroke(0);
    translate(currentPos.x, currentPos.y);
    rotate(currentAngle);
    fill(255, 0, 0, currentAlpha);
    ellipse(0, 0, PLAYER_SIZE, PLAYER_SIZE);
    line(-PLAYER_SIZE/2, 0, PLAYER_SIZE/2, 0);
    popMatrix();
  }
}

