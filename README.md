# atomshpericPlanet


An atomspheric like effect. This project started when I was interested in deciding the grayscale value of each pixel based on the x and y coordinates of each pixel. For example by multiplying x and y together. 
```processing 
 loadPixels();
  int divisor = int(map(mouseX, 0, width - 1, 1, 16));
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
         float value = x + y;
         pixels[width * y + x] = color(value);
    }
  }
  updatePixels();
```

The output will look like this:



In this case any sum avove 255 will result in white, even though the max value is 998 (width - 1 + height - 1). This can cause the output to look too bright, too fast, and this problem will only grow worse with faster growing functions. A solution is to map each sum to between 0 and the maximum value of the function.
```processing 
   float value = x * y;
   float maxValue = (width - 1) * (height - 1);
   pixels[width * y + x] = color(map(value, 0, maxValue, 0, 255));
```


Which will result in something like this. 


We can now change the function to by x * y, and change the max value to (width - 1) * (height - 1)



Next we can divide the max value by a changing divisor, which will cause the pixels to become white earlier. We can also modulate this divisor in order to create a pulsating effect. 


Finally, we can modify how we set to the pixels in order to make them reminiscient of a particular red, green, blue color scheme. 
