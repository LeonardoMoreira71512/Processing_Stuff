//Neutral Colors

final color black = color(0, 0, 0);
final color white = color(255, 255, 255);

//Primary Colors

final color red = color(255, 0, 0);
final color green = color(0, 255, 0);
final color blue = color(0, 0, 255);

//Secondary Colors
final color yellow = color(255, 255, 0);
final color magenta = color(255, 0, 255);
final color cyan = color(0, 255, 255);

final int horizontalSide = 640;
final int verticalSide = 480;

void settings () {
  size(horizontalSide, verticalSide);
}

class Circle {
  float x; //coordenada do centro
  float y; //coordenada do centro
  float r; //raio
  float cor; //cor
  
  Circle(float x, float y, float r, float cor){
    this.x = x;
    this.y = y;
    this.r = r;
    this.cor = cor;
    }
   
   void drawCircle() {
     noStroke(); //significa sem sombra
     fill(cor);
     circle(x, y, 2*r);
     }
}

Circle c1 = new Circle(640 *0.25, 480 *0.25, 480/4, red);
Circle c2 = new Circle(horizontalSide *0.75, verticalSide *0.25, verticalSide/4, green);
Circle c3 = new Circle(horizontalSide *0.25, verticalSide *0.75, verticalSide/4, blue);
Circle c4 = new Circle(horizontalSide *0.75, verticalSide *0.75, verticalSide/4, white);

Circle circles[] = {c1, c2, c3, c4};

void circlesDraw(Circle a[], int n){
  for(int i = 0; i< n; i++)
  a[i].drawCircle();
}

void draw () {
  background(black);
  circlesDraw(circles, 4);
}
