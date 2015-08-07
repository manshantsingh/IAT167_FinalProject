void initializeLevel(boolean isReplay) {
  switch(currentLevel) {
  case 1:
    bases.add(new Base(200, height-50, width/3, 30));
    bases.add(new Base(3*width/4+50, height-50, width/2+100, 30));
    bases.add(new Base(3*width/4+50, height-110, 30, 120));
    checkpoints.add(new Checkpoint(100, height-90));
    finishpoint=new Finishpoint(width, height-90);
    if (isReplay) return;
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
    if (isReplay) return;
    texts.add(new Text("Press P to pause\nif needed", 100, 2*height/3, 22, color(0)));
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
    if (isReplay) return;
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
    bases.add(new Base(4300, 345, 1000, 30));
    bases.add(new Base(5300, 345, 300, 30));
    bases.add(new Compresser(0, height-330, height-80, 125, true));
    bases.add(new Compresser(200, height-330, height-80, 125, false));
    bases.add(new Compresser(400, height-330, height-80, 125, true));
    enemies.add(new WeakEnemy(3000, 250, 2450, 3300));
    enemies.add(new StrongEnemy(4000, 250, 3850, 4750));
    checkpoints.add(new Checkpoint(-600, height-90));
    checkpoints.add(new Checkpoint(1435, 305));
    finishpoint=new Finishpoint(5300, 305);
    if (isReplay) return;
    texts.add(new Text("?", 2000, 250, 32, color(0)));
    texts.add(new Text("Bad Box", 2400, 200, 22, color(0)));
    break;
  case 5:
    bases.add(new Base(0, height-50, 500, 30));
    bases.add(new Base(0, height-235, 30, 350));
    bases.add(new InvisibleSlate(-600, 550));
    bases.add(new InvisibleSlate(-1100, 450));
    bases.add(new InvisibleSlate(-650, 350));
    bases.add(new InvisibleSlate(-200, 250));
    bases.add(new InvisibleSlate(600, 550));
    bases.add(new InvisibleSlate(1100, 450));
    bases.add(new InvisibleSlate(1600, 350));
    bases.add(new Base(2475, 255, 1000, 30));
    bases.add(new Base(3475, 255, 300, 30));
    enemies.add(new NinjaEnemy(2500, 150, 2025, 2925));
    checkpoints.add(new Checkpoint(-150, height-90));
    checkpoints.add(new Checkpoint(150, height-90));
    finishpoint=new Finishpoint(3475, 215);
    if (isReplay) return;
    texts.add(new Text("Naughty Ninja", 1770, 200, 22, color(0)));
    break;
  case 6:
    bases.add(new Base(0, height-50, 500, 30));
    bases.add(new VanishSlate(-400, 550, true));
    bases.add(new VanishSlate(0, 450, false));
    bases.add(new VanishSlate(400, 350, true));
    bases.add(new VanishSlate(0, 250, false));
    bases.add(new VanishSlate(-400, 150, true));
    bases.add(new Base(0, 50, 350, 20)); //keep this slate
    bases.add(new VanishSlate(0, -50, true));
    bases.add(new VanishSlate(0, -150, false));
    bases.add(new VanishSlate(0, -250, true));
    bases.add(new Base(-1250, -300, 1950, 30));
    bases.add(new VanishSlate(-2400, -400, true));
    bases.add(new Slate(-2800, -500));
    bases.add(new FallingSlate(-3400, -500));
    bases.add(new FallingSlate(-4000, -500));
    bases.add(new FallingSlate(-4600, -500));
    bases.add(new Slate(-5200, -500));
    bases.add(new Base(-6300, -500, 1250, 30));
    bases.add(new Base(-7400, -500, 300, 30));
    enemies.add(new StrongEnemy(-1900, -500, -2200, -300));
    enemies.add(new NinjaEnemy(-6000, -700, -6900, -5690));
    checkpoints.add(new Checkpoint(0, height-90));
    checkpoints.add(new Checkpoint(-2000, -340));
    checkpoints.add(new Checkpoint(-5200, -540));
    finishpoint=new Finishpoint(-7400, -540);
    break;
  default:
    bases.add(new Base(width/2, height-50, 5000, 100));
    bases.add(new Base(width, height-2*60, 60, 60));
    bases.add(new VanishSlate(width+200, height-250, true));
    bases.add(new InvisibleSlate(width+600, height-350));
    bases.add(new Thorn(width-300, height-100, 100));
    bases.add(new Compresser(-width/2, height-365, height-115, 125, true));
    bases.add(new Compresser(-width/2+200, height-365, height-115, 125, false));
    bases.add(new Compresser(-width/2+400, height-365, height-115, 125, true));
    enemies.add(new NinjaEnemy(width, 50, 0, 2500+width/2-60));
    checkpoints.add(new Checkpoint(-1500, height-125));
    checkpoints.add(new Checkpoint(width*2, height-125));
    finishpoint=new Finishpoint(width*2+500, height-125);
    if (isReplay) return;
    texts.add(new Text("This is just a testing level\nThis is not actually part of the game\nThe game will keep looping in this level", -1500, 2*height/3, 22, color(0)));
    break;
  }
}

void loadLevel() {
  state=PLAYING;
  if (currentLevel>latestAccessableLevel) latestAccessableLevel=currentLevel;
  if (currentLevel>=BEAT_ALL_LEVELS) {
    playingToMainMenu();
    return;
  }
  level=new Level();
}

void camera() {
  camera.set(lerp(camera.x, camTarget.x, CAMERA_SPEED), lerp(camera.y, camTarget.y, CAMERA_SPEED));
  translate(500, 400);
  translate(-camera.x, -camera.y);
}

