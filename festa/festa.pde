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

void setup() {
  size(1900, 1000);
}


boolean isPrime(int x)
{
  if (x != 2 && x % 2 == 0)
    return false;
  for (int i = 3; i * i <= x; i += 2)
    if (x % i == 0)
      return false;
  return true;
}

class Triangle {
  float x1, y1;
  float x2, y2;
  float x3, y3;
  color c;
  color cAlt;
  float dx;
  float dy;

  Triangle(float x1, float y1, float x2, float y2, float x3, float y3, color c, color cAlt)
  {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
    this.c = c;
    this.cAlt = cAlt;
    dx = 0;
    dy = 0;
  }

  Triangle(float x1, float y1, float x2, float y2, float x3, float y3)
  {
    this(x1, y1, x2, y2, x3, y3, black, white);
  }
  
  void draw(float strokeWeight)
  {
    push();
    noFill();
    stroke(c);
    strokeWeight(strokeWeight);
    triangle(x1, y1, x2, y2, x3, y3);
    pop();
  }
  
  void switchColor()//troca as cores
  {
    color m = c;
    c = cAlt;
    cAlt = m;
  }

  void paint()
  {
    push();
    fill(c);
    noStroke();
    triangle(x1, y1, x2, y2, x3, y3);
    pop();
  }

  void move()//faz o movimento do triangulo
  {
    x1 += dx;
    y1 += dy;
    x2 += dx;
    y2 += dy;
    x3 += dx;
    y3 += dy;
  }
  
  // Is the triangle a counter clockwise triangle. See Sebenta.
  boolean ccw()
  {
    PVector s1 = new PVector(x2-x1, y2-y1);
    PVector s2 = new PVector(x3-x2, y3-y2);
    return s1.cross(s2).z < 0.0;  // Note: `< 0.0` because y grows downwords!
  }
  
  // Is the point `x` `y` inside this triangle? Assume the triangle is ccw.
  boolean insideCcw(float x, float y)
  {
    assert ccw();
    boolean z1 = new Triangle(x1, y1, x2, y2, x, y).ccw();
    boolean z2 = new Triangle(x2, y2, x3, y3, x, y).ccw();
    boolean z3 = new Triangle(x3, y3, x1, y1, x, y).ccw();
    return z1 && z2 && z3;
  }
  
  // Is the point `x` `y` inside this triangle?
  boolean inside(float x, float y)
  {
    Triangle t = this;
    if (!ccw())
      t = new Triangle(x1, y1, x3, y3, x2, y2);
    assert t.ccw();
    return t.insideCcw(x, y);
  }
  
  PVector center()
  {
    return new PVector((x1+x2+x3)/3, (y1+y2+y3)/3);
  }
  
  void draw_triangle1(){ //x = 400, y = 400
    fill(c);
    triangle(x1, y1-100, x2, y2, x3+100, y3-50);
  }
  void draw_triangle2(){ //x = 400, y = 400
    fill(c);
    triangle(x1+50, y1-50, x2+150, y2+50, x3+80, y3+100);
  }
   void draw_triangle3(){ //x = 400, y = 400
   fill(c);
   triangle(x1+100, y1+50, x2+300, y2, x3+300, y3+100);
  }
}

//void trianglesDraw(Triangle[] a, float strokeWeight)
//{
//  for (Triangle t : a)
//    t.draw(strokeWeight);
//}

//void trianglesPaint(Triangle[] a)
//{
//  for (Triangle t : a)
//    t.paint();
//}

Triangle t1 = new Triangle(400, 300, 400, 400, 500, 350, orange, lime);
Triangle t2 = new Triangle(400, 350, 550, 450, 480, 500,yellow,red);
Triangle t3 = new Triangle(500,450,700,400,700,500,blue,pink);

void mousePressed(){
 if(mouseButton == LEFT && t1.inside(mouseX,mouseY))
 {
  t1.switchColor();
 }
 if(mouseButton == LEFT && t2.inside(mouseX,mouseY))
 {
   t2.switchColor();
 }
 if(mouseButton == LEFT && t3.inside(mouseX,mouseY))
 {
   t3.switchColor();
 }
}

void draw(){
  background(0);
  t1.draw_triangle1();
  t2.draw_triangle2();
  t3.draw_triangle3();
}
