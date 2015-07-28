class Player extends Living {
  float angle;
  int alpha;

  Player(float x, float y) {
    super(x, y, PLAYER_SIZE, PLAYER_SIZE, PLAYER_MAX_HEALTH);
    angle=0;
    camTarget=pos;
    camera=camTarget.get();
    alpha=255;
    bounceBack=-0.1;
  }

  void update() {
    if (alive) controls();
    super.update();
    angle+=vel.x*PLAYER_ROTATION_SPEED;
    vel.x*=FRICTION;
    if (alive) {
      checkBounds();
      checkCheckpoints();
    }
    draw();
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
    camTarget=pos.get();
    alpha=0;
    alive=false;
  }

  void controls() {
    if (left) move(leftForce);
    if (right) move(rightForce);
    if (up && onBase) {
      move(upForce);
    }
  }
}

