class HostileSprite extends AbstractSprite {
  int team;
  long shotTime = 0;
  long fireDelay = 300; //ms

  HostileSprite(int team, int radius, PShape graphic, PVector position, PVector velocity) {
    super(position, velocity);
    this.team = team;
    create(graphic, radius);
  }

  void fire(PVector projectileVelocity) {
    if (readyToFire()) {
      PShape graphic = factory.getBasicBullet();
      PVector position = new PVector(this.position.x, this.position.y);
      int radius = factory.getBasicBulletRadius();
      ProjectileSprite projectile = new ProjectileSprite(this, radius, graphic, position, projectileVelocity);
      sprites.add(projectile);
      shotTime = millis();
    }
  }
  
  void fire(HostileSprite target) {
    if (readyToFire()) {
      PShape graphic = factory.getBasicBullet();
      PVector position = new PVector(this.position.x, this.position.y);
      PVector velocity = new PVector(0, 5);
      int radius = factory.getBasicBulletRadius();
      ProjectileSprite projectile = new ProjectileSprite(this, radius, graphic, position, velocity);
      sprites.add(projectile);
      shotTime = millis();
    }
  }

  boolean readyToFire() {
    long now = millis(); //ms time since game started
    if (now > shotTime + fireDelay)
      return true;
    else
      return false;
  }
}

