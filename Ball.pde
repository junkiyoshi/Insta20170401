class Ball
{
  PVector location;
  float size;
  float life;
  color body_color;
  float speed;
  
  Ball(float x, float y, float z, float s, color c)
  {
    location = new PVector(x, y, z);
    size = s;
    life = 512;
    body_color = c;
    speed = random(1, 3);
  }
  
  void run()
  {
    update();
    display();
  }
  
  void update()
  {
    location.add(0, -speed, 0);
    life -= speed;
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x, location.y, location.z);
    stroke(255);
    fill(body_color, life);
    box(size * 0.8);
    popMatrix();
  }
  
  boolean isDead()
  {
    if(life < 0)
    {
      return true;
    }
    return false;
  }
}