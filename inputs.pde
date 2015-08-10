boolean up, left, right;
PVector leftForce=new PVector(-PLAYER_SPEED, 0);
PVector rightForce=new PVector(PLAYER_SPEED, 0);
PVector upForce=new PVector(0, PLAYER_JUMP_FORCE);

void keyPressed() {
  if (key==CODED) {
    if (keyCode==UP) up=true;
    else if (keyCode==LEFT) left=true;
    else if (keyCode==RIGHT) right=true;
    else if (keyCode==SHIFT && state==REPLAYING) loadLevel();
  } else if (key=='w'||key=='W') up=true;
  else if (key=='a'||key=='A') left=true;
  else if (key=='d'||key=='D') right=true;
  else if (key=='\n' && state==REPLAYING) nextLevel();
  else if ((key=='p'||key=='P') && state==PLAYING) level.pausePressed();
}

void keyReleased() {
  if (key==CODED) {
    if (keyCode==UP) up=false;
    else if (keyCode==LEFT) left=false;
    else if (keyCode==RIGHT) right=false;
  } else if (key=='w'||key=='W') up=false;
  else if (key=='a'||key=='A') left=false;
  else if (key=='d'||key=='D') right=false;
}

int mx, my;
void mousePressed() {
  if (mouseButton==LEFT) {
    switch(state) {
    case MAIN_MENU:
      if (menuTextStart.mouseCollision()) {
        state=PLAYING;
        currentLevel=1;
        loadLevel();
        musicPlaying.rewind();
        musicPlaying.play();
      } else if (menuTextSelectLevel.mouseCollision()) {
        state=SELECT_WHAT_LEVEL;
        for (int i=0; i<txtLevels.length; i++) txtLevels[i].unlocked=i<latestAccessableLevel;
      } else if (menuTextPracticeMode.mouseCollision()) {
        practiceMode=!practiceMode;
        menuTextPracticeMode.changeText("Practice Mode: "+(practiceMode?"ON":"OFF"));
      }
      break;
    case SELECT_WHAT_LEVEL:
      if (txtBackToMenu.mouseCollision()) state=MAIN_MENU;
      else if (txtResetStats.mouseCollision()) resetStats();
      else for (int i=0; i<txtLevels.length; i++) {
        if (txtLevels[i].mouseCollision()) {
          state=PLAYING;
          currentLevel=i+1;
          loadLevel();
          musicPlaying.rewind();
          musicPlaying.play();
        }
      }
      break;
    case PLAYING:
      mx=mouseX+(int)camera.x-width/2;
      my=mouseY+(int)camera.y-height/2;
      println("mouse coordinates: "+mx+", "+my);
      level.clicked();
      break;
    }
  }
}

void playingToMainMenu() {
  musicPlaying.pause();
  musicMenu.rewind();
  musicMenu.loop(60);
  state=MAIN_MENU;
}

