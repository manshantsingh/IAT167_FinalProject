class RePlayer {
  ArrayList<PVector> pos;
  ArrayList<Float> angle;
  ArrayList<Integer> drawState;
  PVector currentPos;
  float currentAngle;
  int currentDrawState;

  RePlayer() {
    pos=new ArrayList<PVector>();
    angle=new ArrayList<Float>();
    drawState=new ArrayList<Integer>();
    replays.add(this);
  }

  void addFrame(PVector pos_, float angle_, int drawState_) {
    pos.add(pos_.get());
    angle.add(angle_);
    drawState.add(drawState_);
  }

  void drawFrame(int index) {
    if (index>=pos.size()) return;

    currentPos=pos.get(index);
    currentAngle=angle.get(index);
    currentDrawState=drawState.get(index);

    pushMatrix();
    translate(currentPos.x, currentPos.y);
    if (currentDrawState==0) {
      rotate(currentAngle);
      image(imgPlayer, -30, -30);
    } else if (currentDrawState==1) image(imgFallingPlayer, -30, -30);
    else image(imgAngel, -41, -47);
    popMatrix();
  }
}

