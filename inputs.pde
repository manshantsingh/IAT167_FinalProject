boolean up, left, right;
PVector leftForce=new PVector(-PLAYER_SPEED, 0);
PVector rightForce=new PVector(PLAYER_SPEED, 0);
PVector upForce=new PVector(0, JUMP_FORCE);

void keyPressed() {
  if (key==CODED) {
    if (keyCode==UP) up=true;
    else if (keyCode==LEFT) left=true;
    else if (keyCode==RIGHT) right=true;
  } else if (key=='w') up=true;
  else if (key=='a') left=true;
  else if (key=='d') right=true;
  else if (key=='r' && !player.alive) respawn();
}

void keyReleased() {
  if (key==CODED) {
    if (keyCode==UP) up=false;
    else if (keyCode==LEFT) left=false;
    else if (keyCode==RIGHT) right=false;
  } else if (key=='w') up=false;
  else if (key=='a') left=false;
  else if (key=='d') right=false;
}

int mx, my;
void mousePressed() {
  mx=mouseX+(int)camera.x-width/2;
  my=mouseY+(int)camera.y-height/2;
  println("mouse coordinates: "+mx+", "+my);
}

