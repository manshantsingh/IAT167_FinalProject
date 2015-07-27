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

