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
//OTHERS
final color silver = color(192, 192, 192);
final color purple = color(128, 0, 128);
final color baby_blue = color(0, 255, 255);
final color dark_blue = color(0, 0, 128);
final color clean_orange = color(255, 115, 7);
final color less_orange = color(250, 162, 24);
final color sand = color(188, 129, 76);
final color red_lingua = color(244, 115, 73);
final color pink_john = color(231, 162, 218);
final color grey_john = color(213, 216, 202);
final color sardinha = color(134, 135, 140);

Sardine[] sardinhas = new Sardine[16];
Bolha[] bubbles = new Bolha[30];

void setup() {
  size(1900, 1000);
  for(int i = 0; i<16; i++)
  sardinhas[i] = new Sardine(random(100, 500),random(480, 650),2.5,0);
  for(int i = 0; i<30;i++)
  bubbles[i] = new Bolha(random(50, 950), random(200, 1000), 2,random(10,40));
  for(int i = 0; i<15;i++)
  bubbles[i] = new Bolha(random(950, 1900), random(200, 1000), 2,random(10,40));
  
}
class Peixe {
     float x,y,velocity,cor;
     
     Peixe(float x, float y, float velocity, float cor){
       this.x = x;
       this.y = y;
       this.velocity = velocity;
       this.cor = cor;
     }
     
     void velocity(float tamanho, float fim){
        x += velocity;
        if(x <= -tamanho)
        x = width;
        else if(x >= width + tamanho)
        x = fim;
     }
     void fish_tobias (){
       noStroke();
       fill(less_orange);
       triangle(x-135, y+50, x-135, y-50, x-80, y);
       fill(less_orange);
       ellipse(x, y, 175, 100);
       fill(black);
       ellipse(x+40, y-15, 15, 15);
       fill(less_orange);
       ellipse(x+41, y-15, 4, 4);
       fill(dark_blue);
       triangle(x+60, y, x+87.7, y+10, x+87.7, y-10);
       fill(less_orange);
       triangle(x+15, y-50, x-70, y-60, x-40, y-42);
       fill(less_orange);
       triangle(x+15,y+50,x-70,y+60,x-40,y+40);
       stroke(black);
       fill(sand);
       rect(0, 900, width, 150);
       velocity(222.7, -87.5);
     }
     void caranguejo_debs(){
       noStroke();
       fill(red);
       ellipse(750, 870, 200, 100);
       fill(red);
       triangle(680,905 ,680,930 ,693,910);
       fill(red);
       triangle(693,910,693,935,706,915);
       fill(red);
       triangle(706,915, 706,940, 719, 916);
       fill(red);
       triangle(781,915, 794, 940, 794,915);
       fill(red);
       triangle(794,915, 807, 940, 807, 910);
       fill(red);
       triangle(807,910, 820, 935, 820, 905);
       fill(black);
       rect(726, 875, 50, 25);
       fill(black);
       triangle(726,875,710,875,726,900);
       fill(black);
       triangle(776,875,792,875,776,900);
       fill(red_lingua);
       ellipse(751,892,22,8);
       stroke(black);
       fill(red);
       ellipse(738,847,8,6);
       fill(red);
       ellipse(766,847,8,6);
       noStroke();
       fill(red);
       rect(720,808,10,25);
       fill(red);
       rect(776,808,10,25);
       stroke(black);
       fill(white);
       ellipse(725, 788, 45, 50);       
       fill(white);
       ellipse(781,788,45,50);
       noStroke();
       fill(black);
       ellipse(772, 781, 23, 25);
       fill(black);
       ellipse(714, 781, 23, 25);
       fill(white);
       ellipse(710,778, 6, 8);
       fill(white);
       ellipse(768, 778, 6, 8);
       fill(red);
       triangle(650,865,641,834,670,858);
       fill(red);
       triangle(650,865,624,834,641,834);
       fill(red);
       triangle(848,859,863,825,830,858); 
       fill(red);
       triangle(848,859,872,834,863,825);
       fill(red);
       triangle(633,843,644,796,610,777);
       fill(red);
       triangle(636,840,597,824,592,793);
       fill(red);
       triangle(867,830,864,795,900,784);
       fill(red);
       triangle(867,830, 898,837,915,800);
      }
      void peixe_john(){
       noStroke();
       fill(pink_john);
       triangle(x+300,y, x+350, y+30, x+350, y-30);
       fill(pink_john);
       triangle(x+300, y, x+150, y-50, x+150, y);
       fill(grey_john);
       triangle(x, y, x+150, y, x+150, y-50);
       fill(pink_john);
       triangle(x,y, x+150, y, x+150, y+50);
       fill(grey_john);
       triangle(x+150,y,x+150,y+50,x+300,y);
       fill(dark_blue);
       triangle(x+50, y, x-15, y+30, x-15, y-30);
       fill(black);
       circle(x+80, y-10, 12);
       fill(pink_john);
       circle(x+80, y-10, 4);
       velocity(350, 0);
      }
      void fish_peter (){
        noStroke();
        fill(red);
        triangle(x-150,y-1, x-150, y+30, x-110, y+15);
        fill(yellow);
        triangle(x-130, y+15, x-90, y-12.5, x-90, y+42.5);
        fill(red);
        triangle(x-90, y-12.5, x-90, y-40, x-50, y-12.5);
        fill(yellow);
        rect(x-90, y-12.5, 40, 55);
        fill(red);
        triangle(x-90, y+42.5, x-90, y+70, x-50, y+42.5);
        fill(yellow);
        triangle(x-50, y-12.5, x-10, y+15, x-50, y+42.5);
        fill(dark_blue);
        triangle(x, y, x, y+30, x-30, y+15);   
        fill(black);
        circle(x-40,y+4, 9);
        fill(red);
        circle(x-40, y+4, 4);
        velocity(150, 0);
      }
}
class Sardine {
  float x;
  float y;
  float velocity;
  float cor;
  
  Sardine(float x, float y, float velocity, float cor){
   this.x = x;
   this.y = y;
   this.velocity = velocity;
   this.cor = cor;
  }
  void velocity(float tamanho, float fim){
        x += velocity;
        if(x <= -tamanho)
        x = width;
        else if(x >= width + tamanho)
        x = fim;
  }
  void draw_Sardine(){
    noStroke();
    fill(sardinha);
    triangle(x-103, y-11, x-83, y, x-103, y+11);
    fill(silver);
    ellipse(x-50, y, 80, 22);
    fill(255);
    circle(x-30, y-2.5, 9);
    fill(0);
    circle(x-30, y-2.5, 4.5);
    velocity(103,0);
  }
}

class Bolha {
   float x;
   float y;
   float velocity;
   float raio;
   
   Bolha(float x, float y, float velocity, float raio){
     this.x = x;
     this.y = y;
     this.velocity = velocity;
     this.raio = raio;
   }
   void velocity(float tamanho, float fim){
        y -= 30/raio;
        if(y <= -tamanho)
        y = 1000;
        else if(y >= 1000 + tamanho)
        y = fim;
  }
   void draw_Bolha(){
     noFill();
     stroke(silver);
     circle(x, y, raio); 
     velocity(20, -10);
   }
}

//como o peixe apresenta varias cores a cor aqui pouco importa pq nao entra
Peixe john = new Peixe(500, 400, -3,black); //coordenadas do x e do y com velocity -3 (sentido lado esquerdo)
Peixe tobias = new Peixe(180, 150, 1.5, black);
Peixe peter = new Peixe(850, 260, 3, black);


void draw () {
  background(dark_blue);
  john.peixe_john();
  tobias.fish_tobias();
  peter.fish_peter();
  Peixe insert = new Peixe(0,0,0,0);
  insert.caranguejo_debs();
  for(int i = 0; i <16;i++)
  sardinhas[i].draw_Sardine();
  for(int i = 0;i<30;i++)
  bubbles[i].draw_Bolha();
}
