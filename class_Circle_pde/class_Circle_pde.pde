final color black = color(0, 0, 0);
final color red = color(255, 0, 0);
final color white = color(255, 255, 255);

final int horizontalSide = 800;
final int verticalSide = horizontalSide;

void settings () {
  size(horizontalSide, verticalSide);
}

class Circle {
  float x; //coordenada do centro
  float y; //coordenada do centro
  float r; //raio
  float c; //cor
  
  Circle(float x, float y, float r, float c){
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    }
   
   void drawCircle() {
     noStroke(); //significa sem sombra
     fill(c);
     circle(x, y, 2*r);
     }
}

Circle c1 = new Circle(100, 100, 50,red);

void draw () {
  background(black);
  c1.drawCircle();
}





 
