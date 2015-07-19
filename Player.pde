class Player extends Living {
  float angle;

  Player(float x, float y) {
    super(x, y, PLAYER_SIZE, PLAYER_SIZE, PLAYER_MAX_HEALTH);
    angle=0;
    camera=pos;
  }

  void update() {
    controls();
    super.update();
    angle+=vel.x*PLAYER_ROTATION_SPEED;
    vel.x*=FRICTION;
    if(alive) checkBounds();
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
  
  void checkBounds(){
    if(pos.y>height) die();
  }
  
  void die(){
    camera=pos.get();
    alive=false;
  }

  void controls() {
    if (left) move(leftForce);
    if (right) move(rightForce);
    if(up && onBase) move(upForce);
  }

  
}

