final color black   = color(0, 0, 0);
final color white   = color(255, 255, 255);

// Primary colors
final color red     = color(255, 0, 0);
final color green   = color(0, 255, 0);
final color blue    = color(0, 0, 255);

// Secondary colors
final color yellow  = color(255, 255, 0);
final color magenta = color(255, 0, 255);
final color cyan    = color(0, 255, 255);

final int windowWidth = 800;
final int windowHeight = 800;
final int windowSide = min(windowWidth, windowHeight);

abstract class Function
{
  final float a;
  final float b;
  final float dx;
  
  Function(float a, float b, float dx)
  {
    this.a = a;
    this.b = b;
    this.dx = dx;
  }
  
  abstract float apply(float x);
  
  void draw(float x0, float y0, float w, float h)
  {
    //strokeCap(SQUARE); // Do not use here.
    //strokeJoin(MITER); 
    float x = a;
    float y = apply(x);
    float xm = x0 + x * w;
    float ym = y0 + y * h;
    int i = 0;
    float pxm = xm;
    float pym = ym;
    while (a + (i+1)*dx < b)
    {
      i++;
      x = a + i*dx;
      y = apply(x);
      xm = x0 + x * w;
      ym = y0 + y * h;
      line(pxm, pym, xm, ym);
      pxm = xm;
      pym = ym;
    }
    x = b;
    y = apply(x);
    xm = x0 + x * w;
    ym = y0 + y * h;
    line(pxm, pym, xm, ym);
  }
}

class UpperHalfCircle extends Function
{
  UpperHalfCircle(float a, float b, float dx)
    {
      super(a, b, dx);
    }
  float apply(float x)
    {
      return sqrt(1 - x*x);
    }
}

class LowerHalfCircle extends Function
{
  LowerHalfCircle(float a, float b, float dx)
  {
    super(a, b, dx);
  }
  float apply(float x)
  {
    return -sqrt(1 - x*x);
  }
}

abstract class Curve
{
  final float a;
  final float b;
  final float dt;
  Curve(float a, float b, float dt)
  {
    this.a = a;
    this.b = b;
    this.dt = dt;
  }
  
  abstract float x(float t);
  abstract float y(float t);
  
  void draw(float x0, float y0, float w, float h)
  {
    float x = x(a);
    float y = y(a);
    float xm = x0 + x * w;
    float ym = y0 + y * h;
    int i = 0;
    float pxm = xm;
    float pym = ym;
    while (a + (i+1)*dt < b)
    {
      i++;
      x = x(a + i*dt);
      y = y(a + i*dt);
      xm = x0 + x * w;
      ym = y0 + y * h;
      line(pxm, pym, xm, ym);
      pxm = xm;
      pym = ym;
    }
    x = x(b);
    y = y(b);
    xm = x0 + x * w;
    ym = y0 + y * h;
    line(pxm, pym, xm, ym);
  }
  
  void draw(float x0, float y0, float w, float h, float angle)
  {
    final float cosAngle = cos(angle);
    final float sinAngle = sin(angle);  
    float x = x(a);
    float y = y(a);
    float x1 = x * cosAngle - y * sinAngle;
    float y1 = x * sinAngle + y * cosAngle;  
    x = x1;
    y = y1;
    float xm = x0 + x * w;
    float ym = y0 + y * h;
    int i = 0;
    float pxm = xm;
    float pym = ym;
    while (a + (i+1)*dt < b)
    {
      i++;
      x = x(a + i*dt);
      y = y(a + i*dt);
      x1 = x * cosAngle - y * sinAngle;
      y1 = x * sinAngle + y * cosAngle;  
      x = x1;
      y = y1;
      xm = x0 + x * w;
      ym = y0 + y * h;
      line(pxm, pym, xm, ym);
      pxm = xm;
      pym = ym;
    }
    x = x(b);
    y = y(b);
    x1 = x * cosAngle - y * sinAngle;
    y1 = x * sinAngle + y * cosAngle;  
    x = x1;
    y = y1;
    xm = x0 + x * w;
    ym = y0 + y * h;
    line(pxm, pym, xm, ym);
  }
}

class Circle extends Curve
{
  Circle(float a, float b, float dt){super(a, b, dt);}
  float x(float t){return cos(TWO_PI * t);}
  float y(float t){return sin(TWO_PI * t);}
}

class Spiral extends Curve
{
  Spiral(float a, float b, float dt){super(a, b, dt);}
  float x(float t){return t*cos(TWO_PI * t);}
  float y(float t){return t*sin(TWO_PI * t);}
}

class Sine extends Curve
{
  Sine(float a, float b, float dt){super(a, b, dt);}
  float x(float t){return t;}
  float y(float t){return sin(TWO_PI*t);}
}

class SineVertical extends Curve
{
  SineVertical(float a, float b, float dt){super(a, b, dt);}
  float x(float t){return sin(TWO_PI*t);}
  float y(float t){return t;}
}

void drawAxes(float x0, float y0)
{
  line(x0, 0, x0, height);
  line(0, y0, width, y0);
}

void settings()
{
  size(windowWidth, windowHeight);
}

void threeSines(float t)
{
  strokeWeight(32);
  stroke(blue);  
  new Sine(-3,3,1.0/128).draw(width/2, height/2, 200, -200, t/4);  // one rotation per 4 seconds
  //stroke(red);  
  //new Sine(-3,3,1.0/128).draw(width/2, height/2, 200, -200, t/8);  // one rotation per 8 seconds
  stroke(yellow);  
  new Sine(-3,3,1.0/128).draw(width/2, height/2, 200, -200, t/24); // one rotation per 24 seconds
}

void rotatingSpiral(float t)
{
  strokeWeight(32);
  stroke(blue);  
  new Spiral(0,6,1.0/128).draw(width/2, height/2, 100, -100, t);
}

void drawing1()
{
  strokeWeight(2);
  stroke(100);
  drawAxes(width/2, height/2);
  strokeWeight(4);
  stroke(red);
  new UpperHalfCircle(-1, 1, 1.0/128).draw(width/2, height/2, 200, -200);
  stroke(blue);
  new LowerHalfCircle(-1, 1, 1.0/128).draw(width/2, height/2, 200, -200);
}

void drawing2()
{
  stroke(100);
  strokeWeight(2);
  drawAxes(width/2, height/2);
  strokeWeight(8);
  //stroke(red);
  //new Circle(0, 1, 1.0/256).draw(width/2, height/2, 100, -100);
  stroke(yellow);
  new SineVertical(-2, 2, 1.0/256).draw(width/2, height/2, 200, -200);
  //stroke(blue);
  //new Sine(-2,2, 1.0/256).draw(width/2, height/2, 200, -200);
  //stroke(cyan);
  //new Spiral(0, 4, 1.0/256).draw(width/2, height/2, 100, -100);
}

void drawing3()
{
  stroke(100);
  strokeWeight(2);
  drawAxes(width/2, height/2);
  strokeWeight(8);
  stroke(red);
  new Sine(-3,3, 1.0/256).draw(width/2, height/2, 200, -200);
  stroke(cyan);
  new Sine(-3,3, 1.0/256).draw(width/2, height/2, 200, -200, PI/4);
}



void setup()
{
  surface.setLocation(0, 0);
  background(200);
  //drawing1();
  drawing2();
  //drawing3();
}

void keyPressed()
{
  if (keyCode == ENTER)
    saveFrame("function-####.png");
}

void draw()
{
  background(200);
  //threeSines(frameCount / 60.0 * TWO_PI); // one full rotation per second
  //threeSines(frameCount / 60.0 * TWO_PI * 2); // two full rotation per second
  //threeSines(frameCount / 60.0 * TWO_PI / 2); // one full rotation per two seconds
  //threeSines(frameCount / 10.0);
  rotatingSpiral(frameCount / 60.0 * TWO_PI);
}
