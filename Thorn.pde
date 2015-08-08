class Thorn extends DangerLifeless {
  Thorn(float x, float y) {
    super(x, y, 280, 30);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    image(imgThorns, -w/2, -h/2);
    popMatrix();
  }
}

