  color seila = color(122,1414, 412);
color red = color(255, 0, 0);
color yellow = color(255, 204, 0);
final int windowWidth = 800;
final int windowHeight = 800;

//void settings (){
  //size(windowWidth, windowHeight);
//}

//ou entao faco simplesmente void setup com size de 800 por ex.

void setup () {
   size(800, 800);
}

//void draw (){
  //background(black);
  //fill(red);
  //circle(400, 400, 800);//coordenada do x e do y do centro e o tamanho do diametro
//}

//void draw (){
  //background(black);
  //fill(red);
  //circle(windowWidth/2, windowHeight/2, windowWidth);//coordenada do x e do y do centro e o tamanho do diametro
//}

void draw () {
   background (seila);
   fill(yellow);
   rect(200, 200, 400, 400, 100);
}
