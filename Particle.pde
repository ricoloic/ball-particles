color[] COLORS = {#f94144,#f3722c,#f8961e,#f9844a,#f9c74f,#90be6d,#43aa8b,#4d908e,#577590,#277da1};
int MAX_LIFETIME = 100;

public class Particle {
  public PVector pos;
  public PVector drift;
  public int lifetime = 0;
  public color c;
  
  public Particle(PVector pos) {
    this.pos = pos;
    this.drift = new PVector(random(-1, 1), random(-1, 1));
    this.drift.mult(random(1, 5));
    this.c = COLORS[floor(random(COLORS.length))];
  }
  
  void show() {
    fill(this.c);
    stroke(255);
    circle(this.pos.x, this.pos.y, map(lifetime, 0, MAX_LIFETIME, 20, 3));
  }
  
  void update() {
    this.pos.add(drift);
    this.drift.mult(0.99);
    lifetime++;
  }
  
  boolean dead() {
    if (this.lifetime >= MAX_LIFETIME) return true;
    return false;
  }
}
