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
    horizontalRange=textWidth(text)/2.0;
    VerticalRange=size/2.0;
  }

  void update() {
    currentColor=mouseCollision()?color(255, 0, 0):color(0);
    super.update();
  }

  void changeText(String text_) {
    text=text_;
    horizontalRange=textWidth(text)/2.0;
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
  boolean unlocked, gradeA;
  LevelSelectorText(String text_, float x, float y) {
    super(text_, x, y, 50);
    radius=50;
    diameter=2*radius;
    gradeA=false;
  }

  void update() {
    if (unlocked) currentColor=mouseCollision()?color(120, 238, 220):gradeA?color(255, 215, 0):color(255, 100, 100);
    else currentColor=color(100, 100, 255);
    super.update();
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0);
    strokeWeight(3);
    fill(currentColor);
    ellipse(0, 0, diameter, diameter);
    textSize(size);
    fill(color(0));
    if (unlocked) text(text, 0, 0);
    else text("*", 0, 2);
    popMatrix();
  }

  boolean mouseCollision() {
    return unlocked && dist(pos.x, pos.y, mouseX, mouseY)<=radius;
  }
}

