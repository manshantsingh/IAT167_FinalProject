class Player extends Living {
  float angle;
  int alpha, timer;
  RePlayer replayer;

  Player(float x, float y) {
    super(x, y, PLAYER_SIZE, PLAYER_SIZE, 1);
    angle=0;
    camTarget=pos;
    camera=camTarget.get();
    alpha=255;
    bounceBack=-0.1;
    replayer=new RePlayer();
    timer=SCREEN_OUT_TIME;
  }

  void update() {
    if (alive) controls();
    else isDead();
    super.update();
    angle+=vel.x*PLAYER_ROTATION_SPEED;
    vel.x*=FRICTION;
    if (alive) {
      checkBounds();
      checkCheckpoints();
    }
    draw();
    replayer.addFrame(pos, angle, alpha);
  }

  void draw() {
    pushMatrix();
    strokeWeight(3);
    stroke(0);
    translate(pos.x, pos.y);
    rotate(angle);
    fill(255, 0, 0, alpha);
    ellipse(0, 0, w, h);
    line(-w/2, 0, w/2, 0);
    popMatrix();
  }

  void isDead() {
    timer--;
    if (timer<=0) level.face=1;
  }

  void checkCheckpoints() {
    for (int i=0; i<checkpoints.size (); i++) {
      Checkpoint c=checkpoints.get(i);
      if (collision(c)) {
        c.hit();
      }
    }
    if (collision(finishpoint)) {
      finishpoint.hit();
    }
  }

  void checkBounds() {
    if (pos.y>height) die();
  }

  void die() {
    super.die();
    camTarget=pos.get();
    alpha=0;
  }

  void controls() {
    if (left) move(leftForce);
    if (right) move(rightForce);
    if (up && onBase) {
      move(upForce);
    }
  }
}

