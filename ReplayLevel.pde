class ReplayLevel {
  int currentFrame, totalFrames;
  RePlayer lastRePlayer;

  ReplayLevel(int totalFrames_) {
    totalFrames=totalFrames_;
    bases=new ArrayList<Lifeless>();
    enemies=new ArrayList<Enemy>();
    texts=new ArrayList<Text>();
    if (initializeLevel(true)) return;
    currentFrame=0;
    lastRePlayer=replays.get(replays.size()-1);
    texts.add(new Text("Replay", width/2, 100, 50));
    texts.add(new Text("Press ENTER to continue\nOr Press SHIFT to play this level again", width/2, height-100, 26));
    musicPlaying.pause();
  }

  void run() {
    pushMatrix();
    camera();
    for (int i=0; i<bases.size (); i++) bases.get(i).update();
    for (int i=0; i<enemies.size (); i++) enemies.get(i).update();
    finishpoint.draw();
    for (int i=0; i<replays.size (); i++) replays.get(i).drawFrame(currentFrame);
    camTarget=lastRePlayer.currentPos;
    currentFrame++;
    if (currentFrame>=totalFrames) {
      currentFrame=0;
      for (int i=0; i<bases.size (); i++) bases.get(i).reset();
      for (int i=0; i<enemies.size (); i++) enemies.get(i).reset();
    }
    popMatrix();
    for (int i=0; i<texts.size (); i++) texts.get(i).update();
  }
}

