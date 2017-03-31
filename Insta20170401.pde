import java.util.*;

ArrayList<Panel> panels;

void setup()
{
  size(1024, 1024, P3D);
  frameRate(30);
  //hint(DISABLE_DEPTH_TEST);
  colorMode(HSB);
  //blendMode(ADD);
  rectMode(CENTER);
  
  float len = 32;
  float size = width / len;
  
  panels = new ArrayList<Panel>();
  for(int x = -width / 2; x < width / 2; x += size)
  {
    for(int z = -width / 2; z < width / 2; z += size)
    {
      panels.add(new Panel(x, 0, z, size, color(random(255), 255, 255)));
    }
  }
}

void draw()
{
  background(0);
  translate(width / 2, height, 0);
  
  float angle = 45;
  float camera_x = 700 * cos(radians(angle));
  float camera_z = 700 * sin(radians(angle));   
  camera(camera_x, -height / 3 * 2, camera_z, 
         0, 0, 0, 
         0, 1, 0);  
  
  for(Panel panel : panels)
  {
    panel.run();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 900)
  {
     exit();
  }
  */
}