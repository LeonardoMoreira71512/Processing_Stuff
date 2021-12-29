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
final int windowHeight = 480;
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

class Sine extends Function
{
  Sine(float a, float b, float dx){super(a, b, dx);}
  float apply(float x){return sin(x); }
}

class SineCube extends Function 
{
  SineCube(float a, float b, float dx){super(a, b, dx);}
  float apply(float x){float z = sin(x); return z * z * z;}
}

class NicePolynomial extends Function
{
  NicePolynomial(float a, float b, float dx){super(a, b, dx);}
  float apply0(float x){return (x-2)*(x-4)*(x-6);}
  float apply1(float x){return x*x*x-12*x*x+44*x-48;}
  float apply(float x){return 0.25*x*x*x-3*x*x+11*x-12;}
}

class DampedOscillator extends Function
{
  float ampl;  // amplitude
  float gamma; // damping coefficient (related, but not the same as damping ratio!)
  float omega; // angular frequency
  float phi;   // initial phase
  DampedOscillator(float a, float b, float dx,
                   float ampl, float gamma, float omega, float phi)
  {
    super(a, b, dx);
    this.ampl = ampl;
    this.gamma = gamma;
    this.omega = omega;
    this.phi = phi;
  }
  float apply(float x){return ampl * exp(gamma*-x/2) * cos(omega*x+phi);}
}

class SawWave extends Function
{
  SawWave(float a, float b, float dx){super(a, b, dx);}
  float apply(float x)
  {
    int x0 = int(x / 2) * 2;
    return x - x0 <= 1 ? x - x0 : x0 + 2 - x;
  }
}

class InverseExp extends Function
{
  final float ampl;
  final float tau;
  InverseExp(float a, float b, float dx, float ampl, float tau)
  {
    super(a, b, dx);
    this.ampl = ampl;
    this.tau = tau;
  }
  float apply(float x){return ampl * exp(-x/tau);}
}
  
class NegativeInverseExp extends Function
{
  final float ampl;
  final float tau;
  NegativeInverseExp(float a, float b, float dx, float ampl, float tau)
  {
    super(a, b, dx);
    this.ampl = ampl;
    this.tau = tau;
  }
  float apply(float x){return -ampl * exp(-x/tau);}
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


void drawing1()
{
  strokeWeight(3);
  stroke(100);
  drawAxes(20, height/2);
  //noFill();
  //rect(20, height/2, 100, -100);
  strokeWeight(8);
  stroke(red);
  new Sine(0, 7, 1.0/64).draw(20, height/2, 100, -100);
  stroke(green);
  new Sine(0, 7, 1).draw(20, height/2, 100, -100);
  stroke(yellow);
  new NicePolynomial(0, 7, 1.0/64).draw(20, height/2, 100, -100);
  stroke(magenta);
  new DampedOscillator(0, 7, 1.0/256, 2, 1, TWO_PI, 0).draw(20, height/2, 100, -100);
  stroke(white);
  strokeWeight(2);
  new InverseExp(0, 7, 1.0/64, 2, 2).draw(20, height/2, 100, -100);
  new NegativeInverseExp(0, 7, 1.0/64, 2, 2).draw(20, height/2, 100, -100);
  strokeWeight(8);
  stroke(cyan);
  new SawWave(0, 7, 1.0/4).draw(20, height/2, 100, -100);
  stroke(blue);
  new SineCube(0, 7, 1.0/64).draw(20, height/2, 100, -100);
}

void setup()
{
  surface.setLocation(0, 0);
  background(200);
  drawing1();
}

void draw()
{
  // NOT USED
}
