final int windowWidth = 800;
final int windowHeigth = windowWidth;

int diameter(int x) {
  int result = x % (windowWidth*2);
  if(result > windowWidth)
  result = windowWidth*2 - result;
  return result;
}  
void setup () {
  size(800, 800);
}

void draw () {
  background (0);
  stroke(255, 0, 0); //serve para o contorno
  fill(0, 245, 232); 
  int d = diameter(frameCount);
  circle(400, 400, d);
}
