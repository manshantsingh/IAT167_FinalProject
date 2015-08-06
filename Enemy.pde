class Enemy extends Living {
  Player target;
  float angle, rotationValue, positionOffset, initialSpeed;
  int  leftBound, rightBound, maxHealth, invincibility;
  PVector initialPos;

  Enemy(float x, float y, int w_, int h_, int health_, float speed, int leftBound_, int rightBound_) {
    super(x, y, w_, h_, health_);
    maxHealth=health;
    initialPos=pos.get();
    initialSpeed=speed;
    vel.x=initialSpeed;
    angle=0;
    rotationValue=PI/(4*w);
    positionOffset=sin(PI/4)*w-w/2;
    leftBound=leftBound_;
    rightBound=rightBound_;
    invincibility=0;
  }
  void update() {
    if (!alive) return;
    super.update();
    angle+=vel.x*rotationValue;
    checkBound();
    hitPlayer();
    draw();
  }

  void reset() {
    pos=initialPos.get();
    vel.set(initialSpeed, 0);
    acc.set(0, 0);
    health=maxHealth;
    alive=true;
    angle=0;
  }

  void checkBound() {
    if ((vel.x<0 && pos.x<leftBound)||(vel.x>0 && pos.x>rightBound)) vel.x*=-1;
  }

  void decreaseHealth(int damage) {
    super.decreaseHealth(damage);
    invincibility=ENEMY_INVINCIBILITY_TIME;
  }

  void hitPlayer() {
    if (invincibility>0) invincibility--;
    else if (player.alive && collision(player)) {
      if (pos.y-player.pos.y>h/2 && vel.y<player.vel.y) {
        decreaseHealth(1);
        vel.y=player.vel.y;
        player.vel.y*=-1;
      } else {
        player.decreaseHealth(1);
        player.pos.x-=pos.x-player.pos.x;
        player.vel.mult(-1);
      }
    }
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    float val=map(abs(sin(2*angle)), 0, 1, 0, positionOffset);
    translate(0, -val);
    rotate(angle);
    fill(128);
    stroke(0);
    rect(-w/2, -h/2, w, h);
    popMatrix();
  }
}

class WeakEnemy extends Enemy {
  WeakEnemy(float x, float y, int leftBound_, int rightBound_) {
    super(x, y, PLAYER_SIZE, PLAYER_SIZE, 1, 3, leftBound_, rightBound_);
  }
}

class StrongEnemy extends Enemy {
  StrongEnemy(float x, float y, int leftBound_, int rightBound_) {
    super(x, y, PLAYER_SIZE, PLAYER_SIZE, 2, 7, leftBound_, rightBound_);
  }
}

class NinjaEnemy extends Enemy {
  int timer;

  NinjaEnemy(float x, float y, int leftBound_, int rightBound_) {
    super(x, y, PLAYER_SIZE, PLAYER_SIZE, 2, 5, leftBound_, rightBound_);
    timer=NINJA_JUMP_INTERVAL;
  }

  void update() {
    checkTime();
    super.update();
  }

  void reset() {
    super.reset();
    timer=NINJA_JUMP_INTERVAL;
  }

  void checkTime() {
    timer--;
    if (timer<=0 && onBase) {
      move(upForce);
      timer=NINJA_JUMP_INTERVAL;
    }
  }
}

