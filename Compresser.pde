class Compresser extends DangerLifeless {
  int topBound, bottomBound;
  float startAngle, speed;
  boolean startDown;

  Compresser(float x, int topBound_, int bottomBound_, int dist, boolean startDown_) {
    super(x, topBound_+dist, 150, 30);
    topBound=topBound_;
    bottomBound=bottomBound_;
    startDown=startDown_;
    speed=5;
    if (!startDown) speed*=-1;
  }

  void update() {
    move();
    super.update();
  }

  void reset() {
    super.reset();
    speed=5;
    if (!startDown) speed*=-1;
  }

  void move() {
    pos.y+=speed;
    if ((speed>0 && pos.y>=bottomBound)||(speed<0 && pos.y<=topBound)) speed*=-1;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
    float dist=pos.y-topBound;
    rect(-15, -dist, 30, dist);
    fill(200, 0, 0);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

