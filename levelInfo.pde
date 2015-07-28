void initializeLevel(int num, Level l) {
  switch(num) {
  case 1:
    bases.add(new Base(200, height-50, width/3, 30));
    bases.add(new Base(3*width/4+50, height-50, width/2+100, 30));
    bases.add(new Base(3*width/4+50, height-110, 30, 120));
    checkpoints.add(new Checkpoint(100, height-90));
    finishpoint=new Finishpoint(width, height-90);
    texts.add(new Text(" A/D or Left/Right\nfor Movement", 150, 2*height/3, 22, color(0)));
    texts.add(new Text(" W or Up\nfor Jump", 425, 2*height/3, 22, color(0)));
    texts.add(new Text("Finish", width, 2*height/3, 22, color(0)));
    break;
  case 2:
    bases.add(new Base(100, height-50, width/3, 30));
    bases.add(new Base(900, height-50, 800, 30));
    bases.add(new Base(800, height-90, 80, 80));
    bases.add(new Base(880, height-130, 80, 160));
    bases.add(new Base(960, height-170, 80, 240));
    bases.add(new Base(1040, height-210, 80, 320));
    bases.add(new HorizontalSlate(2000, height-55, 1425, 2475));
    checkpoints.add(new Checkpoint(0, height-90));
    checkpoints.add(new Checkpoint(1200, height-90));
    bases.add(new Base(2700, height-50, 200, 30));
    finishpoint=new Finishpoint(2700, height-90);
    texts.add(new Text("Checkpoint", 1200, 2*height/3, 22, color(0)));
    texts.add(new Text("Wait for\nPlatform", 1500, height-200, 22, color(0)));
    break;
  case 3:
    bases.add(new Base(100, height-50, width/3, 30));
    bases.add(new Base(900, height-50, 800, 30));
    bases.add(new Base(900, 300, 800, 30));
    bases.add(new Base(900, -50, 800, 30));
    bases.add(new VerticalSlate(1475, 500, 285, height-40));
    bases.add(new VerticalSlate(325, 200, -65, 335));
    bases.add(new Thorn(900, height-75, 300));
    bases.add(new Thorn(900, 275, 300));
    bases.add(new Thorn(900, -75, 300));
    checkpoints.add(new Checkpoint(0, height-90));
    checkpoints.add(new Checkpoint(1200, 260));
    finishpoint=new Finishpoint(1200, -90);
    texts.add(new Text("Danger", 900, height-200, 22, color(0)));
    break;
  case 4:
    bases.add(new Base(400, height-50, 2200, 30));
    bases.add(new Base(920, height-90, 80, 80));
    bases.add(new Base(1000, height-130, 80, 160));
    bases.add(new Base(1080, height-170, 80, 240));
    bases.add(new Base(1360, height-202, 480, 334));
    bases.add(new FallingSlate(2025, 340));
    bases.add(new Base(2900, 345, 1000, 30));
    bases.add(new Compresser(0, height-330, height-80, 100, true));
    bases.add(new Compresser(200, height-330, height-80, 75, false));
    bases.add(new Compresser(400, height-330, height-80, 100, true));
    texts.add(new Text("?", 2025, 200, 48, color(0)));
    checkpoints.add(new Checkpoint(-600, height-90));
    checkpoints.add(new Checkpoint(1435, 305));
    finishpoint=new Finishpoint(1200, -90);
    break;
  default:
    bases.add(new Base(width/2, height-50, 5000, 100));
    bases.add(new Base(width, height-2*PLAYER_SIZE, PLAYER_SIZE, PLAYER_SIZE));
    bases.add(new Thorn(width*1.5, height-100, 100));
    bases.add(new Compresser(-width/2, height-365, height-115, 100, true));
    bases.add(new Compresser(-width/2+200, height-365, height-115, 75, false));
    bases.add(new Compresser(-width/2+400, height-365, height-115, 100, true));
    enemies.add(new Enemy(width, 50, PLAYER_SIZE, PLAYER_SIZE, PLAYER_MAX_HEALTH, 3, 10, 0, 2500+width/2-PLAYER_SIZE));
    checkpoints.add(new Checkpoint(-1500, height-125));
    checkpoints.add(new Checkpoint(width*2, height-125));
    finishpoint=new Finishpoint(width*2+500, height-125);
    texts.add(new Text("This is just a testing level\nThis is not actually part of the game\nThe game will keep looping in this level", -1500, 2*height/3, 22, color(0)));
    break;
  }
}

void nextLevel() {
  currentLevel++;
  level=new Level(currentLevel);
}

