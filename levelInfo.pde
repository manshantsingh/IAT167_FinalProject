void initializeLevel(int num, Level l) {
  switch(num) {
  case 1:
    bases.add(new Base(200, height-50, width/3, 30));
    bases.add(new Base(3*width/4+50, height-50, width/2+100, 30));
    bases.add(new Base(3*width/4+50, height-110, 30, 120));
    checkpoints.add(new Checkpoint(100, height-90));
    finishpoint=new Finishpoint(width, height-90);
    break;
  case 2:
    bases.add(new Base(100, height-50, width/3, 30));
    bases.add(new Base(900, height-50, 800, 30));
    bases.add(new Base(800, height-90, 80, 80));
    bases.add(new Base(880, height-130, 80, 160));
    bases.add(new Base(960, height-170, 80, 240));
    bases.add(new Base(1040, height-210, 80, 320));
    bases.add(new HorizontalSlate(2000, height-55, 1400, 2500));
    checkpoints.add(new Checkpoint(0, height-90));
    checkpoints.add(new Checkpoint(1200, height-90));
    bases.add(new Base(2700, height-50, 200, 30));
    finishpoint=new Finishpoint(2700, height-90);
    break;
  case 3:
    bases.add(new Base(100, height-50, width/3, 30));
    bases.add(new Base(900, height-50, 800, 30));
    bases.add(new Base(900, 300, 800, 30));
    bases.add(new Base(900, -50, 800, 30));
    bases.add(new VerticalSlate(1450, 500, 285, height-40));
    bases.add(new VerticalSlate(350, 200, -65, 335));
    dangers.add(new Thorn(900, height-75, 300));
    dangers.add(new Thorn(900, 275, 300));
    dangers.add(new Thorn(900, -75, 300));
    checkpoints.add(new Checkpoint(0, height-90));
    checkpoints.add(new Checkpoint(1200, 260));
    finishpoint=new Finishpoint(1200, -90);
    break;
  default:
    bases.add(new Base(width/2, height-50, 5000, 100));
    bases.add(new Base(width, height-2*PLAYER_SIZE, PLAYER_SIZE, PLAYER_SIZE));
    dangers.add(new Thorn(width*1.5, height-100, 100));
    enemies.add(new Enemy(width, 50, PLAYER_SIZE, PLAYER_SIZE, PLAYER_MAX_HEALTH, 3, 10, 0, 2500+width/2-PLAYER_SIZE));
    checkpoints.add(new Checkpoint(-1500, height-125));
    checkpoints.add(new Checkpoint(width*2, height-125));
    finishpoint=new Finishpoint(width*2+500, height-125);
    break;
  }
}

void nextLevel() {
  currentLevel++;
  level=new Level(currentLevel);
}

