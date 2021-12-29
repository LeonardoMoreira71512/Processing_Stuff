final color black   = color(0, 0, 0);
final color white   = color(255, 255, 255);

// Primary colors
final color red     = color(255, 0, 0);
final color lime   = color(0, 255, 0); // Note, green is something else. See below.
final color blue    = color(0, 0, 255);

// Secondary colors
final color yellow  = color(255, 255, 0);
final color magenta = color(255, 0, 255);
final color cyan    = color(0, 255, 255);

// Other colors
final color greenPT  = color(0, 102, 0);
final color orange = color(255, 165, 0);
final color pink = color(255, 192, 203);
final color green = color(0, 128, 0);
final color gold = color(255, 215, 0);

final int horizontalSide = 1000;
final int verticalSide = horizontalSide;

void setup()
{
 size(1000,1000);
}

class Rectangle{
  float x, y,cor;
  
  Rectangle(float x, float y, float cor){
    this.x = x;
    this.y = y;
    this.cor = cor;
  }
  void draw_mosaico(){
   noStroke();
   fill(black);
   triangle(x,y,x+horizontalSide/3,y,x,y+verticalSide/3);
  }
}

Rectangle r1 = new Rectangle(0,0,black);
Rectangle r2 = new Rectangle(333.3,0,black);
Rectangle r3 = new Rectangle(666.6,0,black);
Rectangle r4 = new Rectangle(0,333.3,black);
Rectangle r5 = new Rectangle(333.3,333.3,black);
Rectangle r6 = new Rectangle(666.6,333.3,black);
Rectangle r7 = new Rectangle(0,666.6,black);
Rectangle r8 = new Rectangle(333.3,666.6,black);
Rectangle r9 = new Rectangle(666.6,666.6,black);

void draw(){
background(white);
r1.draw_mosaico();
r2.draw_mosaico();
r3.draw_mosaico();
r4.draw_mosaico();
r5.draw_mosaico();
r6.draw_mosaico();
r7.draw_mosaico();
r8.draw_mosaico();
r9.draw_mosaico();
}
