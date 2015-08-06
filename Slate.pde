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

class InvisibleSlate extends Slate {
  boolean visible;
  float alpha;
  InvisibleSlate(float x, float y) {
    super(x, y);
    visible=isReplay();
    alpha=0;
  }

  void update() {
    if (visible) alpha=lerp(alpha, 255, 0.1);
    super.update();
  }

  boolean isReplay() {
    return state==REPLAYING;
  }

  void reset() {
    visible=isReplay();
    alpha=0;
  }

  boolean hit(Living l) {
    visible=true;
    return super.hit(l);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(188, 51, 164, alpha);
    stroke(0, alpha);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

class VanishSlate extends Slate {
  int timer, goalAlpha;
  float alpha;
  boolean baseAble, initialVisible;

  VanishSlate(float x, float y, boolean visible) {
    super(x, y);
    timer=VANISH_SLATE_TIME;
    initialVisible=visible;
    if (initialVisible) {
      alpha=255;
      goalAlpha=255;
      baseAble=true;
    } else {
      alpha=0;
      goalAlpha=0;
      baseAble=false;
    }
  }

  void update() {
    vanish();
    super.update();
  }

  void reset() {
    super.reset();
    timer=VANISH_SLATE_TIME;
    if (initialVisible) {
      alpha=255;
      goalAlpha=255;
      baseAble=true;
    } else {
      alpha=0;
      goalAlpha=0;
      baseAble=false;
    }
  }

  void vanish() {
    timer--;
    if (timer<=0) {
      goalAlpha=goalAlpha==0?255:0;
      timer=VANISH_SLATE_TIME;
    }
    alpha=lerp(alpha, goalAlpha, 0.1);

    if (baseAble && alpha<128) baseAble=false;
    else if (!baseAble && alpha>=128) baseAble=true;
  }

  boolean hit(Living l) {
    return !baseAble;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(42, 148, 208, alpha);
    stroke(0, alpha);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

class FallingSlate extends Slate {
  boolean isHit;
  PVector vel;
  FallingSlate(float x, float y) {
    super(x, y);
    isHit=false;
    vel=new PVector();
  }

  boolean hit(Living l) {
    isHit=true;
    return false;
  }

  void reset() {
    super.reset();
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

  void reset() {
    super.reset();
    speed=5;
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

  void reset() {
    super.reset();
    speed=5;
  }

  void move() {
    pos.y+=speed;
    if ((pos.y<=topBound && speed<0)||(pos.y>=bottomBound && speed>0)) speed*=-1;
  }
}

