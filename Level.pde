class Level {
  int num;
  PVector respawnPos;

  Level(int num) {
    bases=new ArrayList<Lifeless>();
    dangers=new ArrayList<Lifeless>();
    enemies=new ArrayList<Enemy>();
    checkpoints=new ArrayList<Checkpoint>();
    initializeLevel(num, this);
    respawn();
  }

  void respawn() {
    player=new Player(respawnPos.x, respawnPos.y);
  }

  void run() {
    background(255);
    camera();
    for (int i=0; i<bases.size (); i++) {
      bases.get(i).update();
    }
    for (int i=0; i<dangers.size (); i++) {
      dangers.get(i).update();
    }
    for (int i=0; i<checkpoints.size (); i++) {
      checkpoints.get(i).update();
    }
    finishpoint.update();
    for (int i=0; i<enemies.size (); i++) {
      enemies.get(i).update();
    }
    player.update();
  }

  void camera() {
    camera.set(lerp(camera.x, camTarget.x, CAMERA_SPEED), lerp(camera.y, camTarget.y, CAMERA_SPEED));
    translate(width/2, height/2);
    translate(-camera.x, -camera.y);
  }
}

