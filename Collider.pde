color colliderColor1=color(100, 255, 100), colliderColor2=color(100, 100, 255);
int colliderWeight=5;

class Collider {
  PVector pos;
  int len;
  color c;

  Collider(int x, int y, int len_) {
    pos=new PVector(x, y);
    len=len_;
  }

  void collision(Living p) {
    println("this needs to be overriden");
  }
  void draw() {
    println("this needs to be overriden");
  }
}

class Horizontal extends Collider {
  boolean isTop;
  int middle;
  Horizontal(int x, int y, int len_, boolean isTop_) {
    super(x, y, len_);
    isTop=isTop_;
    middle=x+len/2;
    c=isTop ? colliderColor1 : colliderColor2;
  }
  void collision(Living p) {
    if (abs(middle-p.pos.x)<len/2+p.w/2 && abs(pos.y-p.pos.y)<p.h/2) {
      if (isTop && pos.y>=p.pos.y) {
        p.pos.y=pos.y-p.h/2;
        p.vel.y=0;
        p.onBase=true;
      } else if (!isTop && pos.y<=p.pos.y) {
        p.pos.y=pos.y+p.h/2;
        p.vel.y*=DEFLECT;
      }
    }
  }
  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(c);
    strokeWeight(colliderWeight);
    line(0, 0, len, 0);
    popMatrix();
  }
}

class Vertical extends Collider {
  boolean isRight;
  int middle;
  Vertical(int x, int y, int len_, boolean isRight_) {
    super(x, y, len_);
    isRight=isRight_;
    middle=y+len/2;
    c=isRight ? colliderColor1 : colliderColor2;
  }
  void collision(Living p) {
    if (abs(middle-p.pos.y)<len/2+p.h/2 && abs(pos.x-p.pos.x)<p.w/2) {
      if (isRight && pos.x<=p.pos.x) {
        p.pos.x=pos.x+p.w/2;
        p.vel.x*=DEFLECT;
      } else if (!isRight && pos.x>=p.pos.x) {
        p.pos.x=pos.x-p.w/2;
        p.vel.x*=DEFLECT;
      }
    }
  }
  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(c);
    strokeWeight(colliderWeight);
    line(0, 0, 0, len);
    popMatrix();
  }
}

