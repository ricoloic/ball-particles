public class Ball {
  public color c = color(200, 130, 100);
  public int d;
  public PVector pos = new PVector(0, 0);
  public ArrayList<Particle> particles = new ArrayList<>();
  
  public Ball(color c, int d) {
    this.c = c;
    this.d = d;
  }
  
  void show() {
    for (Particle p : this.particles) p.show();
    noStroke();
    fill(this.c);
    circle(this.pos.x, this.pos.y, this.d);
  }
  
  void update(PVector pos) {
    this.pos.set(pos.x, pos.y);

    for (int i = this.particles.size() - 1; i >= 0; i--) {
      if (this.particles.get(i).dead()) {
        this.particles.remove(i);
      }
    } 

    for (Particle p : this.particles) {
      p.update();
    }

    int particleAmount = floor(random(5, 15));
    for (int i = 0; i < particleAmount; i++) {
      this.particles.add(new Particle(this.pos.copy()));
    }
  }
}
