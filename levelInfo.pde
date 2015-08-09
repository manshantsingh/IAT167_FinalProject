boolean initializeLevel(boolean isReplay) {
  switch(currentLevel) {
  case 1:
    bases.add(new Base(200, height-50, 300));
    bases.add(new Base(3*width/4+50, height-50, 600));
    bases.add(new Blocker(3*width/4+50, height-117, 100));
    checkpoints.add(new Checkpoint(100, height-90));
    finishpoint=new Finishpoint(width, height-90);
    if (isReplay) return false;
    texts.add(new Text("A/D or Left/Right\nfor Movement", 150, 2*height/3, 22));
    texts.add(new Text("W or Up\nfor Jump", 425, 2*height/3, 22));
    texts.add(new Text("Finish", width, 2*height/3, 22));
    break;
  case 2:
    bases.add(new Base(100, height-50, 300));
    bases.add(new Base(900, height-50, 800));
    bases.add(new StairStep(800, height-107, 80, 80));
    bases.add(new StairStep(880, height-147, 80, 160));
    bases.add(new StairStep(960, height-187, 80, 240));
    bases.add(new StairStep(1040, height-227, 80, 320));
    bases.add(new HorizontalSlate(2000, height-55, 1425, 2475));
    checkpoints.add(new Checkpoint(0, height-90));
    checkpoints.add(new Checkpoint(1200, height-90));
    bases.add(new Base(2700, height-50, 200));
    finishpoint=new Finishpoint(2700, height-90);
    if (isReplay) return false;
    texts.add(new Text("Press P to pause\nif needed", 100, 2*height/3, 22));
    texts.add(new Text("Hold W or Up for\nAutomatic Jumping", 735, 400, 22));
    texts.add(new Text("Wait for\nPlatform", 1500, height-200, 22));
    break;
  case 3:
    bases.add(new Base(130, height-50, 300));
    bases.add(new Base(900, height-50, 800));
    bases.add(new Base(900, 300, 800));
    bases.add(new Base(900, -50, 800));
    bases.add(new VerticalSlate(1475, 500, 285, height-40));
    bases.add(new VerticalSlate(325, 200, -65, 335));
    bases.add(new Thorn(900, height-75));
    bases.add(new Thorn(900, 275));
    bases.add(new Thorn(900, -75));
    checkpoints.add(new Checkpoint(30, height-90));
    checkpoints.add(new Checkpoint(1200, 260));
    finishpoint=new Finishpoint(1200, -90);
    if (isReplay) return false;
    texts.add(new Text("Danger", 900, height-200, 22));
    break;
  case 4:
    bases.add(new Base(473, height-50, 2200));
    bases.add(new StairStep(920, height-107, 80, 80));
    bases.add(new StairStep(1000, height-147, 80, 160));
    bases.add(new StairStep(1080, height-187, 80, 240));
    bases.add(new ThickBase(1348, height-216, 450, 300));
    bases.add(new FallingSlate(2025, 340));
    bases.add(new Base(2900, 345, 1000));
    bases.add(new Base(4300, 345, 1000));
    bases.add(new Base(5300, 345, 300));
    bases.add(new Compresser(0, height-330, height-80, 125, true));
    bases.add(new Compresser(200, height-330, height-80, 125, false));
    bases.add(new Compresser(400, height-330, height-80, 125, true));
    enemies.add(new WeakEnemy(3000, 250, 2450, 3300));
    enemies.add(new StrongEnemy(4000, 250, 3850, 4750));
    checkpoints.add(new Checkpoint(-530, height-90));
    checkpoints.add(new Checkpoint(1435, 305));
    finishpoint=new Finishpoint(5300, 305);
    if (isReplay) return false;
    texts.add(new Text("?", 2000, 250, 32));
    texts.add(new Text("Bad Box", 2400, 200, 22));
    break;
  case 5:
    bases.add(new Base(0, height-50, 500));
    bases.add(new Blocker(0, height-210, 300));
    bases.add(new InvisibleSlate(-600, 550));
    bases.add(new InvisibleSlate(-1100, 450));
    bases.add(new InvisibleSlate(-650, 350));
    bases.add(new InvisibleSlate(-200, 250));
    bases.add(new InvisibleSlate(600, 550));
    bases.add(new InvisibleSlate(1100, 450));
    bases.add(new InvisibleSlate(1600, 350));
    bases.add(new Base(2475, 255, 1000));
    bases.add(new Base(3475, 255, 300));
    enemies.add(new NinjaEnemy(2500, 150, 2025, 2925));
    checkpoints.add(new Checkpoint(-150, height-90));
    checkpoints.add(new Checkpoint(150, height-90));
    finishpoint=new Finishpoint(3475, 215);
    if (isReplay) return false;
    texts.add(new Text("hint: jump left", -150, 2*height/3, 22));
    texts.add(new Text("Naughty Ninja", 1770, 200, 22));
    break;
  case 6:
    bases.add(new Base(0, height-50, 500));
    bases.add(new VanishSlate(-400, 550, true));
    bases.add(new VanishSlate(0, 450, false));
    bases.add(new VanishSlate(400, 350, true));
    bases.add(new VanishSlate(0, 250, false));
    bases.add(new VanishSlate(-400, 150, true));
    bases.add(new Slate(0, 60));
    bases.add(new VanishSlate(0, -50, true));
    bases.add(new VanishSlate(0, -150, false));
    bases.add(new VanishSlate(0, -250, true));
    bases.add(new Base(-1250, -300, 1950));
    bases.add(new VanishSlate(-2400, -400, true));
    bases.add(new Slate(-2800, -500));
    bases.add(new FallingSlate(-3400, -500));
    bases.add(new FallingSlate(-4000, -500));
    bases.add(new FallingSlate(-4600, -500));
    bases.add(new Slate(-5200, -500));
    bases.add(new Base(-6300, -500, 1250));
    bases.add(new Base(-7400, -500, 300));
    enemies.add(new StrongEnemy(-1900, -500, -2200, -300));
    enemies.add(new NinjaEnemy(-6000, -700, -6900, -5690));
    checkpoints.add(new Checkpoint(0, height-90));
    checkpoints.add(new Checkpoint(-2000, -340));
    checkpoints.add(new Checkpoint(-5200, -540));
    finishpoint=new Finishpoint(-7400, -540);
    break;
  default:
    playingToMainMenu();
    return true;
  }
  return false;
}

void loadLevel() {
  state=PLAYING;
  if (currentLevel>latestAccessableLevel) latestAccessableLevel=currentLevel;
  if (currentLevel>=BEAT_ALL_LEVELS) {
    playingToMainMenu();
    return;
  }
  musicMenu.pause();
  level=new Level();
}

void nextLevel() {
  currentLevel++;
  loadLevel();
}

void camera() {
  camera.set(lerp(camera.x, camTarget.x, CAMERA_SPEED), lerp(camera.y, camTarget.y, CAMERA_SPEED));
  int x=floor(camera.x*0.1)+950;
  int y=floor(camera.y*0.1)+300;
  background(BACKGROUND_COLOR);
  image(imgBackgroundFull.get(x, y, width, height), 0, 0);
  translate(500, 400);
  translate(-camera.x, -camera.y);
}

