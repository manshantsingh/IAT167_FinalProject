class Level {
  int num;
  PVector respawnPos;

  Level(int num) {
    bases=new ArrayList<Lifeless>();
    enemies=new ArrayList<Enemy>();
    checkpoints=new ArrayList<Checkpoint>();
    texts=new ArrayList<Text>();
    initializeLevel(num, this);
    respawnPos=checkpoints.get(0).respawnPos.get();
    instructions();
    respawn();
  }

  void respawn() {
    player=new Player(respawnPos.x, respawnPos.y);
    for (int i=0; i<bases.size (); i++) {
      bases.get(i).reset();
    }
  }

  void instructions() {
    fill(0, 150, 0);
    textSize(48);
    text("Press R to respawn", width/2, 200);
  }

  void run() {
    background(255);
    pushMatrix();
    camera();
    for (int i=0; i<texts.size (); i++) texts.get(i).update();
    for (int i=0; i<bases.size (); i++) bases.get(i).update();
    for (int i=0; i<enemies.size (); i++) enemies.get(i).update();
    for (int i=0; i<checkpoints.size (); i++) checkpoints.get(i).update();
    finishpoint.update();
    player.update();
    popMatrix();
    if (!player.alive) instructions();
  }

  void camera() {
    camera.set(lerp(camera.x, camTarget.x, CAMERA_SPEED), lerp(camera.y, camTarget.y, CAMERA_SPEED));
    translate(width/2, height/2);
    translate(-camera.x, -camera.y);
  }
}

