boolean up, left, right;
PVector leftForce=new PVector(-PLAYER_SPEED, 0);
PVector rightForce=new PVector(PLAYER_SPEED, 0);
PVector upForce=new PVector(0, JUMP_FORCE);

void keyPressed() {
  if (key==CODED) {
    if (keyCode==UP) p.jump();
    else if (keyCode==LEFT) left=true;
    else if (keyCode==RIGHT) right=true;
  } else if (key=='w') p.jump();
  else if (key=='a') left=true;
  else if (key=='d') right=true;
}

void keyReleased() {
  if (key==CODED) {
    if (keyCode==LEFT) left=false;
    else if (keyCode==RIGHT) right=false;
  } else if (key=='a') left=false;
  else if (key=='d') right=false;
}
int mx, my;
boolean odd;
void mousePressed() {
  odd=!odd;
  if (!odd) {
    println("distance: "+(mouseX-mx)+", "+(mouseY-my));
  }
  mx=mouseX;
  my=mouseY;
  println("mouse coordinates: "+mx+", "+my);

  colliders.add(new Horizontal(0, height/2+200, width, true));
}

