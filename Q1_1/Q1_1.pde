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
//UCRANIA
final color yellow_ucrania = color(255, 215, 0);
final color blue_ucrania = color(0, 87, 184);
//HOLANDA
final color red_holanda = color(174, 28, 40);
final color blue_holanda = color(33, 70, 139);
//ROMENIA
final color blue_romenia = color(0, 43, 127);
final color yellow_romenia = color(252, 209, 22);
final color red_romenia = color(206, 17, 38);
//IRLANDA
final color green_irlanda = color(22, 155, 98);
final color orange_irlanda = color(255, 136, 62);
//OTHERS
final color silver = color(192, 192, 192);
final color purple = color(128, 0, 128);
final color baby_blue = color(0, 255, 255);
final color dark_blue = color(0, 0, 128);

final int horizontalSide = 1000;
final int verticalSide = 1000;

void settings () {
  size(horizontalSide, verticalSide);
}

float a[] = {125, 375, 625, 875};//posicao das bandeiras, distancia de 250

class Flag{
   float side;
   Flag (float side){
     this.side = side;
   }
   void flag_ucrania(float x, float y){
      float height = side/1.5;  //side = 250, height = 166,66 (3:2)
      float quarterh = height/4;
      rectMode(CENTER); //utiliza o centro como medida de dimensao em vez do canto superior esquerdo
      noStroke();
      fill(blue_ucrania);
      rect(x, y, side, height);
      fill(yellow_ucrania);
      rect(x, y+quarterh, side, height/2);
   }
   void flag_holanda(float x, float y){
      float height = side/1.5;
      float thirdh = height/3;
      rectMode(CENTER); //utiliza o centro como medida de dimensao em vez do canto superior esquerdo
      noStroke();
      fill(red_holanda);
      rect(x, y, side, height);
      fill(white);
      rect(x, y-thirdh, side, thirdh);
      fill(blue_holanda);
      rect(x, y+thirdh, side, thirdh);
   }
   void flag_romenia(float x, float y){
      float height = side/1.5;
      float thirdside = side/3;//para fazer a divisao verticalmente
      rectMode(CENTER); //utiliza o centro como medida de dimensao em vez do canto superior esquerdo
      noStroke();
      fill(blue_romenia);
      rect(x, y, side, height);
      fill(yellow_romenia);
      rect(x-thirdside, y, thirdside, height);
      fill(red_romenia);
      rect(x+thirdside, y, thirdside, height);
   }
   void flag_irlanda(float x, float y){
      float height = side/1.5;
      float thirdside = side/3;
      rectMode(CENTER); //utiliza o centro como medida de dimensao em vez do canto superior esquerdo
      noStroke();
      fill(green_irlanda);
      rect(x, y, side, height);
      fill(white);
      rect(x-thirdside, y, thirdside, height);
      fill(orange_irlanda);
      rect(x+thirdside, y, thirdside, height);
   }
}

void draw () {
  if(frameCount%120 == 0){ //frameCount conta o nº vezes que a funcao draw foi chamada
    float pos_a = a[0];
    float pos_b = a[1];
    float pos_c = a[2];
    float pos_d = a[3];
    a[0] = pos_d;
    a[1] = pos_a;
    a[2] = pos_b;
    a[3] = pos_c;
  }
  background(black);
  Flag insert = new Flag(200);
  insert.flag_ucrania(a[0], 500);//a[0] representa a coordenada x e 500 a coordenada y do centro da bandeira 
  insert.flag_holanda(a[1], 500);
  insert.flag_romenia(a[2], 500);
  insert.flag_irlanda(a[3], 500);
}
  
