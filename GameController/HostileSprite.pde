class HostileSprite extends AbstractSprite {
  int team;
  long shotTime = 0;
  long fireDelay = 300; //ms

  //constructor
  HostileSprite(int team, int radius, PShape graphic, PVector position, PVector velocity) {
    super(position, velocity);
    this.team = team;
    create(graphic, radius);
  }

  //fire in a direction
  void fire(PVector projectileVelocity) {
    if (readyToFire()) {
      PShape graphic = factory.getBasicBullet();
      PVector position = new PVector(this.position.x, this.position.y);
      int radius = factory.getBasicBulletRadius();
      ProjectileSprite projectile = 
          new ProjectileSprite(this, radius, graphic, position, projectileVelocity);
      sprites.add(projectile);
      shotTime = millis();
    }
  }
  
  //fire at a specific target
  void fire(HostileSprite target, int speed) {
    speed = 10 * speed;
    if(readyToFire()) {
      double distance;
      float x1 = this.position.x;
      float y1 = this.position.y;
      float x2 = target.position.x;
      float y2 = target.position.y;
      float x3 = x1; //the right angle
      float y3 = y2; //the right angle
      if(x1 == x2) {
        distance = Math.abs(x2 - x1);
        fire(new PVector(0, speed));
      } else if (y1 == y2) {
        distance = Math.abs(y2 - y1);
        fire(new PVector(speed, 0));
      } else {
        distance = Math.sqrt((x2 - x1) + (y2 - y1));
        float side1 = x2 - x1;
        float side2 = y2 - y1;
        float dx = side1 / Math.abs(speed);
        float dy = side2 / Math.abs(speed);
        fire(new PVector(dx, dy));
      }
    }
  }

  //check if sprite can fire
  boolean readyToFire() {
    long now = millis(); //ms time since game started
    if (now > shotTime + fireDelay)
      return true;
    else
      return false;
  }
}





























