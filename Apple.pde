class Apple {
  int x;
  int y;
  //this makes the Apples spawn anywhere on the screen
  Apple() {
    x = (int)random(30);
    y = (int)random(30);
  }
  //Apples being drawn on the screen
  void draw() {
    fill(255, 0, 0);
    ellipse(x * 20 + 1, y * 20 + 1, 18, 18);
  }
}
