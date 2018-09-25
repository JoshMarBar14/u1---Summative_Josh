Snake snake = new Snake();
Apple[] apples = new Apple[]{new Apple(), new Apple(), new Apple(), new Apple(), new Apple()};
PVector DOWN = new PVector(0, 1);
PVector UP = new PVector(0, -1);
PVector LEFT = new PVector(-1, 0);
PVector RIGHT = new PVector(1, 0);
int ApplesEaten = 0;

void setup() {
  size(800, 800);
  noStroke();
  snake.dir = RIGHT;
  ApplesEaten = 0;
}

void draw() {
  background(50);
  // score

  textSize(26);
  text("Apples Eaten:" + ApplesEaten, 20, 20); 
  //game over screen
  if (snake.isDead) {
    background(0);
    noLoop();
    textSize(32);
    fill(255, 0, 0);
    text("Game Over", 300, 400);
  }

  if (frameCount % 10 == 0) {
    snake.move();
    snake.checkCollisions();
  }

  for (int i = 0; i < apples.length; i++) {
    Apple a = apples[i];
    if (a.x == snake.getX() + snake.dir.x && a.y == snake.getY() + snake.dir.y) {
      snake.grow();
      snake.checkCollisions();
      apples[i] = new Apple();
      ApplesEaten+=1;
      break;
    }
  }

  for (Apple a : apples) {
    a.draw();
  }
  snake.draw();
}
// controlls
void keyPressed() {
  if (key == 'w' && snake.dir != DOWN) {
    snake.dir = UP;
  } else if (key == 'a' && snake.dir != RIGHT) {
    snake.dir = LEFT;
  } else if (key == 's' && snake.dir != UP) {
    snake.dir = DOWN;
  } else if (key == 'd' && snake.dir != LEFT) {
    snake.dir = RIGHT;
  }
}
