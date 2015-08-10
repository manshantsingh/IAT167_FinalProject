/* The face values
 0: playing
 1: blackout
 2: white back
 */

class Level {
  PVector respawnPos;
  int face, alpha, startMillis, deaths;
  boolean paused;
  float timeEllapsed;

  Level() {
    bases=new ArrayList<Lifeless>();
    enemies=new ArrayList<Enemy>();
    checkpoints=new ArrayList<Checkpoint>();
    texts=new ArrayList<Text>();
    replays=new ArrayList<RePlayer>();
    goalTime=0;
    if (initializeLevel(false)) return;
    Checkpoint c=checkpoints.get(0);
    respawnPos=c.respawnPos.get();
    c.startPoint();
    face=2;
    alpha=255;
    paused=false;
    respawn();
    deaths=0;

    if (!practiceMode) {
      musicPlaying.rewind();
      musicPlaying.loop(20);
      checkpoints=new ArrayList<Checkpoint>();
    }
  }

  void respawn() {
    player=new Player(respawnPos.x, respawnPos.y);
    for (int i=0; i<bases.size (); i++) bases.get(i).reset();
    for (int i=0; i<enemies.size (); i++) enemies.get(i).reset();
    startMillis=millis();
    deaths++;
  }

  void showReplay() {
    if (practiceMode) nextLevel();
    else {
      if (latestAccessableLevel<=currentLevel) latestAccessableLevel++;
      state=REPLAYING;
      boolean beatTheTime=timeEllapsed<=goalTime;
      if (beatTheTime) txtLevels[currentLevel-1].gradeA=true;
      replayLevel=new ReplayLevel(player.replayer.drawState.size()-1, beatTheTime);
    }
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
    if (paused) {
      pauseMenu();
      return;
    }
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

  void pausePressed() {
    paused=!paused;
    if (paused) showPaused();
  }

  void pauseMenu() {
    staticTxtPaused.update();
    txtResume.update();
    txtMainMenu.update();
  }

  void clicked() {
    if (paused) {
      if (txtResume.mouseCollision()) pausePressed();
      else if (txtMainMenu.mouseCollision()) playingToMainMenu();
    }
  }

  void showPaused() {
    fill(255, 200);
    rect(0, 0, width, height);
  }

  void HUD() {
    fill(255);
    stroke(0);
    strokeWeight(3);
    timeEllapsed=(millis()-startMillis)/1000.0;
    rect(0, 0, width, 50);
    textSize(25);
    fill(0);
    text("Level: "+currentLevel, 200, 25);
    text(String.format("%.1f", timeEllapsed)+"/"+goalTime, 500, 25);
    text("Deaths: "+deaths, 800, 25);
  }
}

