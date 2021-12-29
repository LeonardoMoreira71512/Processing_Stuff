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

//int horizontalSide = 1900;
//int verticalSide = 1000;
PImage tree;
PImage background;
PImage fisga;

Bird[] birds = new Bird[5];

void settings() {
  fullScreen();
  //size(horizontalSide, verticalSide);
  tree = loadImage("tree.png");
  background = loadImage("windowsxp.png");
  fisga = loadImage("slingshot_angryBirds.png");
  //for(int i = 0;i<n;i++)
  //birds[i] = new Bird(1800, 500, 2, 4);
}

class Bird{
  float x, y, speed, gravity;
  
  Bird(float x, float y, float speed, float gravity){
  this.x = x;
  this.y = y;
  this.speed = speed;
  this.gravity = gravity;
  }
  void gravity(){
   gravity+= 1.2;
  }
  void draw_Bird(){
  
  }
  
}

//class Pedra{
//   float x;
//   float y:
//   float velocity;
   
//}

//void KeyPressed(){
//  if(keyCode == 
//}

void draw(){
  image(background,0,0);
  image(tree,1200,80);
  image(fisga, 300,500);
}
