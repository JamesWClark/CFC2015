abstract class AbstractSprite implements Sprite {
  PVector position;
  PVector velocity;
  PShape graphic;
  int radius;

  //constructor
  AbstractSprite(PVector position, PVector velocity) {
    this.position = position;
    this.velocity = velocity;
  }

  //create a sprite
  void create(PShape graphic, int radius) {
    this.graphic = graphic;
    this.radius = radius;
  }

  //remove sprite from game
  void destroy() {
    sprites.remove(this);
    enemies.remove(this);
  }

  //update sprite position
  void update() {
    if (this != player) {
      if (isRightBound(this) || isLeftBound(this))
        velocity = new PVector(-1 * velocity.x, 0);
    }
    position.add(velocity);
  }

  //show sprite
  void display() {
    shape(graphic, position.x, position.y);
  }

  void updateAndDisplay() {
    update();
    display();
  }

  //check sprite collisions
  boolean isColliding(ProjectileSprite projectile, HostileSprite hostile) {
    float dx = projectile.position.x - hostile.position.x;
    float dy = projectile.position.y - hostile.position.y;
    float rr = projectile.radius + hostile.radius;
    if (dx * dx + dy * dy < rr * rr)
      return true;
    else
      return false;
  }
}



























