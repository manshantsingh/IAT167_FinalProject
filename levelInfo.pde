void initializeLevel(int num, Level l) {
  switch(num) {
  case 1:
    break;
  default:
    bases.add(new Base(width/2, height-50, 5000, 100));
    bases.add(new Base(width, height-2*PLAYER_SIZE, PLAYER_SIZE, PLAYER_SIZE));
    dangers.add(new Thorn(width*1.5, height-115, 100));
    enemies.add(new Enemy(width, 50, PLAYER_SIZE, PLAYER_SIZE, PLAYER_MAX_HEALTH, 3, 10, 0, 2500+width/2-PLAYER_SIZE));
    checkpoints.add(new Checkpoint(width*2, height-125));
    finishpoint=new Finishpoint(2200, height-125);
    l.respawnPos=new PVector(width/2, 50);
    break;
  }
}

