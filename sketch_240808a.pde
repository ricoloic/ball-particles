Ball ball;
ArrayList<PVector> pmouse = new ArrayList<>();

int previousCount = 20;

void setup() {
  fullScreen();
  // size(600, 600);

  ball = new Ball(color(200, 130, 100), 85);
  
  pmouse.add(new PVector(0, 0));
}

void draw() {
  background(33);
  
  PVector avg = new PVector(0, 0);
  
  for (PVector mouse : pmouse) {
    avg.add(mouse);
  }
  avg.div(pmouse.size());

  ball.show();
  ball.update(avg);

  pmouse.add(new PVector(mouseX, mouseY));
  
  if (pmouse.size() > previousCount) pmouse.remove(0);
}
