class Player extends Living {
  float angle;
  int timer;
  RePlayer replayer;
  boolean transitionTime, isFalling;

  Player(float x, float y) {
    super(x, y, 60, 60);
    angle=0;
    camTarget=pos;
    camera=camTarget.get();
    transitionTime=false;
    isFalling=false;
    bounceBack=-0.1;
    replayer=new RePlayer();
    timer=SCREEN_OUT_TIME;
  }

  void update() {
    if (transitionTime) transitionTimer();
    else controls();
    if (isFalling) super.update();
    else if (alive) {
      super.update();
      angle+=vel.x*PLAYER_ROTATION_SPEED;
      vel.x*=FRICTION;
      checkBounds();
      checkCheckpoints();
    } else {
      pos.y-=ANGEL_RISE_SPEED;
    }
    replayer.addFrame(pos, angle, isFalling?1:alive?0:2);
    draw();
  }

  void transitionTimer() {
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
    if (pos.y>height) fellDown();
  }

  void die() {
    super.die();
    transitionTime=true;
    camTarget=pos.get();
    soundDie.trigger();
  }

  void fellDown() {
    isFalling=true;
    transitionTime=true;
    camTarget=pos.get();
    soundFalling.trigger();
  }

  void controls() {
    if (left) move(leftForce);
    if (right) move(rightForce);
    if (up && onBase) {
      move(upForce);
      soundBounce.trigger();
    }
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    if (isFalling) image(imgFallingPlayer, -30, -30);
    else if (alive) {
      rotate(angle);
      image(imgPlayer, -30, -30);
    } else image(imgAngel, -41, -47);
    popMatrix();
  }
}

