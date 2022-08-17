

class Planet{
  int count;
  int direction;
  float change;
  float altCount;
  String altDir;
  float r;
  float g;
  float b;
  Planet(){
    count = 1;
    direction = 1;
  }
  int count(){
    this.updateCount();
    this.updateColors();
    return count;
  }
  void updateCount(){
    if (direction == 1) {
      if (count == 10) {
        direction = -direction;
      }
    } else {
      if (count == 1) {
        direction = -direction;
      }
    }
    count += direction;
  }
  void updateColors(){
    r += random(0.5,1);
    g += random(1,1.5);
    b += random(1.5,2);
    if (r > 255) {
      r = r % 255;
    }
    if (g > 255) {
      g = g % 255; 
    }
     if (b > 255) {
       b = b % 255;
    }
  }
    
  void drawPlanet(){
    
     loadPixels();
     int divisor = this.count();
     float maxValue = (width - 1) * (height - 1);
     for(int x = 0; x < width; x++){
       for(int y = 0; y < height; y++){
           float result = this.twoDimFunction(x,y);
           float mappedValue =  map(result, 0, maxValue / divisor, 0, 255);
           pixels[width * y + x] = color(map(mappedValue, 0, 255, 0, r), map(mappedValue, 0, 255, 0, g), map(mappedValue, 0, 255, 0, b));
       }
   }
   updatePixels();
  }
  float twoDimFunction(float x, float y){
    float result = x * y;
    return result;
   
}
  
}
