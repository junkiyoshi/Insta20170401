class Panel
{
  ArrayList<Ball> balls;
 
  PVector location;
  float size;
  float delay;
  color body_color;
  color default_color;
  
  Panel(float x, float y, float z, float s, color c)
  {
    location = new PVector(x, y, z);
    size = s;
    delay = 0;
    body_color = c;
    default_color = body_color;
    
    balls = new ArrayList<Ball>();
  }
  
  void run()
  {
    update();
    display();
  }
  
  void update()
  {
    if(frameCount < 480)
    {
      if(delay < 0)
      {
        if(random(100) > 99.8)
        {
          balls.add(new Ball(location.x, location.y - size / 2, location.z, size, body_color));
          delay = 255;
          body_color = color(random(255), 255, 255);
        }
      }
    }else if(frameCount == 480)
    {
      balls.add(new Ball(location.x, location.y - size / 2, location.z, size, body_color));
      delay = 255;
      body_color = default_color; 
    }
    
    delay -= 1;
  }
  
  void display()
  {
    stroke(0);
    fill(body_color, 255 - delay);
    
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotateX(radians(90));
    rect(0, 0, size, size);
    popMatrix();
    
    Iterator<Ball> it = balls.iterator();
    while(it.hasNext())
    {
      Ball ball = it.next();
      ball.run();
      if(ball.isDead())
      {
        it.remove();
      }
    }
  }
}