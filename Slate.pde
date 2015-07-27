class Slate extends Lifeless {
  Slate(float x, float y) {
    super(x, y, 200, 20);
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

