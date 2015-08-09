class Base extends Lifeless {
  int numTiles;
  Base(float x, float y, int w_) {
    super(x, y, w_, 30);
    numTiles=w/50;
  }

  void draw() {
    pushMatrix();
    translate(pos.x-w/2, pos.y-h/2);
    stroke(0);
    strokeWeight(5);
    noFill();
    rect(0, 0, w, h);
    for (int i=0; i<numTiles; i++) {
      image(imgBaseTile, 0, 0);
      translate(50, 0);
    }
    popMatrix();
  }
}

class StairStep extends Lifeless {
  int numTiles;

  StairStep(float x, float y, int w_, int h_) {
    super(x, y, w_, h_);
    numTiles=h/80;
  }

  void draw() {
    pushMatrix();
    translate(pos.x-w/2, pos.y-h/2);
    stroke(0);
    strokeWeight(5);
    noFill();
    rect(0, 0, w, h);
    image(imgStairTop, 0, 0);
    for (int i=1; i<numTiles; i++) {
      translate(0, 80);
      image(imgStairBottom, 0, 0);
    }
    popMatrix();
  }
}

class ThickBase extends Lifeless {
  int numTiles, numVertical;
  ThickBase(float x, float y, int w_, int h_) {
    super(x, y, w_, h_);
    numTiles=w/50;
    numVertical=h/30;
  }

  void draw() {
    pushMatrix();
    translate(pos.x-w/2, pos.y-h/2);
    stroke(0);
    strokeWeight(5);
    noFill();
    rect(0, 0, w, h);
    for (int i=0; i<numTiles; i++) {
      image(imgBaseTile, 0, 0);
      for (int j=1; j<numVertical; j++) {
        image(imgThickBaseBottom, 0, j*30);
      }
      translate(50, 0);
    }
    popMatrix();
  }
}

class Blocker extends Lifeless {
  int numTiles;
  Blocker(float x, float y, int h_) {
    super(x, y, 30, h_);
    numTiles=h/100;
  }

  void draw() {
    pushMatrix();
    translate(pos.x-15, pos.y-h/2);
    tint(128, 255);
    for (int i=0; i<numTiles; i++) {
      image(imgBlocker, 0, i*100);
    }
    noTint();
    popMatrix();
  }
}

