//living
PImage imgPlayer, imgSpeedingPlayer, imgFallingPlayer, imgAngel, imgWeakEnemy, imgStrongEnemy, imgNinjaEnemy;

//lifeless
PImage imgSlate, imgThorns, imgBaseTile, imgThickBaseBottom, imgStairTop, imgStairBottom, imgBlocker;

//backgrounds
PImage imgBackgroundFull, imgCoverPage, imgLevelSelector;

//audio
Minim minim;
AudioPlayer musicMenu, musicPlaying;
AudioSample soundFalling, soundDie, soundBounce, soundDamageEnemy, soundKillEnemy, soundNinjaDamage, soundNinjaKill, soundCheckpoint, soundFinish;

void dataInitialize() {
  imgPlayer=loadImage("player.png");
  imgPlayer.resize(60, 60);
  imgSpeedingPlayer=loadImage("speedingPlayer.png");
  imgSpeedingPlayer.resize(60, 60);
  imgFallingPlayer=loadImage("fallingPlayer.png");
  imgFallingPlayer.resize(60, 60);
  imgAngel=loadImage("angel.png");
  imgAngel.resize(83, 77);
  imgWeakEnemy=loadImage("weakEnemy.png");
  imgWeakEnemy.resize(60, 60);
  imgStrongEnemy=loadImage("strongEnemy.png");
  imgStrongEnemy.resize(68, 64);
  imgNinjaEnemy=loadImage("ninjaEnemy.png");
  imgNinjaEnemy.resize(96, 76);

  imgSlate=loadImage("slate.png");
  imgSlate.resize(250, 20);
  imgThorns=loadImage("thorns.png");
  imgThorns.resize(280, 30);
  imgBaseTile=loadImage("baseTile.png");
  imgBaseTile.resize(50, 30);
  imgThickBaseBottom=loadImage("stairBottom.png");
  imgThickBaseBottom.resize(50, 30);
  imgStairTop=loadImage("baseTileExtended.png");
  imgStairTop.resize(80, 80);
  imgStairBottom=loadImage("stairBottomExtended.png");
  imgStairBottom.resize(80, 80);
  imgBlocker=loadImage("blocker.png");
  imgBlocker.resize(30, 100);

  imgBackgroundFull=loadImage("backgroundFull.png");
  imgCoverPage=loadImage("coverPage.png");
  imgLevelSelector=loadImage("levelSelector.png");

  minim=new Minim(this);
  musicMenu=minim.loadFile("mainMenu.wav");
  musicPlaying=minim.loadFile("playing.wav");

  soundFalling=minim.loadSample("falling.wav");
  soundDie=minim.loadSample("die.wav");
  soundBounce=minim.loadSample("bounce.wav");
  soundDamageEnemy=minim.loadSample("damageEnemy.wav");
  soundKillEnemy=minim.loadSample("killEnemy.wav");
  soundNinjaDamage=minim.loadSample("ninjaDamage.wav");
  soundNinjaKill=minim.loadSample("ninjaKill.wav");
  soundCheckpoint=minim.loadSample("checkpoint.wav");
  soundFinish=minim.loadSample("finish.wav");

  musicMenu.loop(60);
}

