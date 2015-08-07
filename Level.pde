/* The face values
 0: playing
 1: blackout
 2: white back
 */

class Level {
  PVector respawnPos;
  int face, alpha;
  boolean paused;

  Level() {
    bases=new ArrayList<Lifeless>();
    enemies=new ArrayList<Enemy>();
    checkpoints=new ArrayList<Checkpoint>();
    texts=new ArrayList<Text>();
    replays=new ArrayList<RePlayer>();
    initializeLevel(false);
    respawnPos=checkpoints.get(0).respawnPos.get();
    face=2;
    alpha=255;
    paused=false;
    respawn();

    //temporarily clear checkpoints
    checkpoints=new ArrayList<Checkpoint>();
  }

  void respawn() {
    player=new Player(respawnPos.x, respawnPos.y);
    for (int i=0; i<bases.size (); i++) bases.get(i).reset();
    for (int i=0; i<enemies.size (); i++) enemies.get(i).reset();
  }

  void faceManager() {
    switch(face) {
    case 1:
      alpha+=TRANSITION_RATE;
      if (alpha>=255) {
        face=2;
        alpha=255;
        respawn();
      }
      fill(0, alpha);
      noStroke();
      rect(0, 0, width, height);
      break;
    case 2:
      alpha-=TRANSITION_RATE;
      if (alpha<=0) {
        face=0;
        alpha=0;
      }
      fill(0, alpha);
      noStroke();
      rect(0, 0, width, height);
      break;
    default:
      break;
    }
  }

  void run() {
    if (paused) return;

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
    faceManager();
    HUD();
  }

  void HUD() {
    //gotta work on it
  }

  void pausePressed() {
    paused=!paused;
    if (paused) showPaused();
  }

  void showPaused() {
    fill(255, 128);
    rect(0, 0, width, height);
    fill(0);
    textSize(50);
    text("Paused", width/2, height/2);
  }
}

