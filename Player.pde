class Player extends Living {
  float angle;

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
    onBase=false;
  }

  void draw() {
    pushMatrix();
    stroke(0);
    strokeWeight(3);
    translate(pos.x, pos.y);
    rotate(angle);
    fill(255, 0, 0);
    ellipse(0, 0, w, h);
    line(-w/2, 0, w/2, 0);
    popMatrix();
  }
  
  void jump(){
    if (onBase) move(upForce);
  }

  void controls() {
    if (left) move(leftForce);
    if (right) move(rightForce);
  }
}
