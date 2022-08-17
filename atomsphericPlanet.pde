
Planet p;
void setup(){
  /** frame rate can be increased without performance issues */
  frameRate(10);
  size(600,600);
  p = new Planet();
}

void draw(){
  p.drawPlanet();
}
