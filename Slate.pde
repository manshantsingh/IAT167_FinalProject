class Slate extends Lifeless {
  Slate(float x, float y) {
    super(x, y, 250, 20);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(128);
    stroke(0);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

class FallingSlate extends Slate {
  boolean isHit;
  PVector vel, initialPos;
  FallingSlate(float x, float y) {
    super(x, y);
    isHit=false;
    vel=new PVector();
    initialPos=pos.get();
  }

  boolean hit(Living l) {
    isHit=true;
    return false;
  }

  void reset() {
    pos=initialPos.get();
    vel.set(0, 0);
    isHit=false;
  }

  void update() {
    if (isHit) move();
    super.update();
  }

  void move() {
    pos.add(vel);
    vel.add(GRAVITY);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(128, 64, 0);
    stroke(0);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

class HorizontalSlate extends Slate {
  int leftBound, rightBound;
  float speed;

  HorizontalSlate(float x, float y, int leftBound_, int rightBound_) {
    super(x, y);
    leftBound=leftBound_;
    rightBound=rightBound_;
    speed=5;
  }

  void update() {
    super.update();
    move();
  }

  void move() {
    pos.x+=speed;
    if ((pos.x<=leftBound && speed<0)||(pos.x>=rightBound && speed>0))speed*=-1;
  }
}

class VerticalSlate extends Slate {
  int topBound, bottomBound;
  float speed;

  VerticalSlate(float x, float y, int topBound_, int bottomBound_) {
    super(x, y);
    topBound=topBound_;
    bottomBound=bottomBound_;
    speed=5;
  }

  void update() {
    super.update();
    move();
  }

  void move() {
    pos.y+=speed;
    if ((pos.y<=topBound && speed<0)||(pos.y>=bottomBound && speed>0)) speed*=-1;
  }
}

