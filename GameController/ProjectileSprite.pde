class ProjectileSprite extends AbstractSprite {

  HostileSprite shooter;

  //constructor
  ProjectileSprite(HostileSprite shooter, int radius, PShape graphic, PVector position, PVector velocity) {
    super(position, velocity);
    this.shooter = shooter;
    this.create(graphic, radius);
  }

  //override the AbstractSprite.update - to check for collisions
  @Override
    void update() {
    position.add(velocity);
    checkCollisions();
    if (this.position.y < -this.radius) {
      sprites.remove(this);
    }
  }

  //check collision against every sprite in display
  void checkCollisions() {
    for (int i = 0; i < enemies.size (); i++) {
      HostileSprite enemy = (HostileSprite)enemies.get(i);
      if (this.shooter.team != enemy.team && isColliding(this, enemy)) {
        if (enemy == player) {
          playerLives--;
          this.destroy();
        } else {
          this.destroy();
          enemy.destroy();
        }
      }
    }
  }
}






















