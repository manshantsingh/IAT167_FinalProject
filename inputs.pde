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
  else if (key=='\n' && state==REPLAYING) replayLevel.nextLevel();
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
  mx=mouseX+(int)camera.x-width/2;
  my=mouseY+(int)camera.y-height/2;
  println("mouse coordinates: "+mx+", "+my);
  if (mouseButton==LEFT) {
    switch(state) {
    case MAIN_MENU:
      if (menuTextStart.mouseCollision()) {
        state=PLAYING;
        currentLevel=1;
        loadLevel();
      }
      else if(menuTextSelectLevel.mouseCollision()) state=SELECT_WHAT_LEVEL;
      break;
    }
  }
}

