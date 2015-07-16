class Player extends Living {
  float angle;
  boolean onBase;

  Player(float x, float y) {
    super(x, y, PLAYER_SIZE, PLAYER_SIZE, PLAYER_MAX_HEALTH, PLAYER_MASS);
    angle=0;
  }

  void update() {
    move(GRAVITY);
    controls();
    super.update();
    angle+=vel.x*PLAYER_ROTATION_SPEED;
    vel.x*=FRICTION;
    checkBase();
  }

  void draw() {
    pushMatrix();
    strokeWeight(3);
    translate(pos.x, pos.y);
    rotate(angle);
    fill(255, 0, 0);
    ellipse(0, 0, w, h);
    line(-w/2, 0, w/2, 0);
    popMatrix();
  }

  void controls() {
    if (left) move(leftForce);
    if (right) move(rightForce);
    if(up && onBase) move(upForce);
  }

  void checkBase() {
    onBase=false;
    for (int i=0; i<dead.size (); i++) {
      Lifeless d=dead.get(i);
      if (collision(d)) {
        pos.y=d.pos.y-d.h/2-h/2;
        vel.y=0;
        onBase=true;
        return;
      }
    }
  }
}

