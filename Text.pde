class Text {
  PVector pos;
  int size;
  String text;

  Text(String text_, float x, float y, int size_) {
    text=text_;
    pos=new PVector(x, y);
    size=size_;
  }

  void update() {
    draw();
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    textSize(size);
    fill(color(0));
    text(text, 0, 0);
    popMatrix();
  }
}

class ColliderText extends Text {
  float horizontalRange, VerticalRange;
  color currentColor;

  ColliderText(String text_, float x, float y, int size_) {
    super(text_, x, y, size_);
    horizontalRange=textWidth(text)*2;
    VerticalRange=size/2.0;
  }

  void update() {
    currentColor=mouseCollision()?color(255, 0, 0):color(0);
    super.update();
  }

  void changeText(String text_) {
    text=text_;
    horizontalRange=textWidth(text)*2;
  }

  boolean mouseCollision() {
    return abs(mouseX-pos.x)<horizontalRange && abs(mouseY-pos.y)<VerticalRange;
  }
  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    textSize(size);
    fill(currentColor);
    text(text, 0, 0);
    popMatrix();
  }
}

class LevelSelectorText extends Text {
  int radius, diameter;
  color currentColor;
  LevelSelectorText(String text_, float x, float y) {
    super(text_, x, y, 50);
    radius=50;
    diameter=2*radius;
  }

  void update() {
    currentColor=mouseCollision()?color(255, 166, 60):color(255, 100, 100);
    super.update();
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(currentColor);
    stroke(0);
    strokeWeight(3);
    ellipse(0, 0, diameter, diameter);
    textSize(size);
    fill(color(0));
    text(text, 0, -2);
    popMatrix();
  }

  boolean mouseCollision() {
    return dist(pos.x, pos.y, mouseX, mouseY)<=radius;
  }
}

