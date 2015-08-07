class Text {
  PVector pos;
  int size;
  color textColor;
  String text;

  Text(String text_, float x, float y, int size_, color textColor_) {
    text=text_;
    pos=new PVector(x, y);
    size=size_;
    textColor=textColor_;
  }

  void update() {
    draw();
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    textSize(size);
    fill(textColor);
    text(text, 0, 0);
    popMatrix();
  }
}

class ColliderText extends Text {
  float horizontalRange, VerticalRange;
  color regularColor, hoverColor;

  ColliderText(String text_, float x, float y, int size_, color regularColor_, color hoverColor_) {
    super(text_, x, y, size_, regularColor_);
    regularColor=regularColor_;
    hoverColor=hoverColor_;
    horizontalRange=textWidth(text)*2;
    VerticalRange=size/2.0;
  }

  void update() {
    textColor=mouseCollision()?hoverColor:regularColor;
    super.update();
  }

  boolean mouseCollision() {
    return abs(mouseX-pos.x)<horizontalRange && abs(mouseY-pos.y)<VerticalRange;
  }
}

