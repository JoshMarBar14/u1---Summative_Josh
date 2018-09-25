class Snake {
  ArrayList<PVector> segments = new ArrayList<PVector>();
  PVector dir;
  boolean isDead;

  Snake() {
    segments.add(new PVector(0, 0));
  }

  int getX() {
    return (int)segments.get(0).x;
  }

  int getY() {
    return (int)segments.get(0).y;
  }
  // draws the snake
  void draw() {
    fill(255, 255, 255);
    for (PVector p : segments) {
      ellipse(p.x * 20 + 1, p.y * 20 + 1, 18, 18);
    }
  }

  void move() {
    grow();
    segments.remove(segments.size() - 1);
  }
  //adds a block to the snake
  void grow() {
    PVector head = segments.get(0);
    PVector newHead = new PVector(head.x + dir.x, head.y + dir.y);
    segments.add(0, newHead);
  }

  void checkCollisions() {
    for (int i = 1; i < segments.size(); i++) {
      if (segments.get(0).x == segments.get(i).x && segments.get(0).y == segments.get(i).y) {
        isDead = true;
      }
    }
  }
}
