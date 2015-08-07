PImage imgPlayer, imgFallingPlayer, imgAngel, imgWeakEnemy, imgStrongEnemy, imgNinjaEnemy;

void dataInitialize() {
  imgPlayer=loadImage("player.png");
  imgPlayer.resize(60, 60);
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
}

