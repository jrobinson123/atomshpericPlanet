# atomshpericPlanet

![with color](./atomsphereImages/atomsphereGif.gif)

An atomspheric like effect. This project started when I was interested in deciding the grayscale value of each pixel based its x and y coordinates of each. For example by multiplying x and y together as shown in the snipped below:
```processing 
 loadPixels();
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
         float value = x + y;
         pixels[width * y + x] = color(value);
    }
  }
  updatePixels();
```

The output will look like this:


![initial attempt](./atomsphereImages/atomsphereNoMap.png)


In this case any product above 255 will result in white, even though the max value is 24,9001 (width - 1 * height - 1). This can cause the output to look too bright, too fast, and this problem will only grow worse with faster growing functions. A solution is to map each function result to between 0 and the maximum value of the function.
```processing 
float maxValue = (width - 1) * (height - 1);
```
```processing 
float value = x * y;
float mappedValue = map(value, 0, maxValue, 0, 255);
pixels[width * y + x] = color(mappedValue);
```


Which will result in this:

![with mapping](./atomsphereImages/atomsphereMapped.png)

Next we can divide the max value by a integer divisor, which will cause the pixels to become brigther earlier
```processing
float mappedValue = map(value, 0, maxValue / divisor, 0, 255);
```
We can also modulate this divisor in order to create a pulsating effect. 

![pulsating](./atomsphereImages/atomsphereNoColor.gif)

Finally, we can modify how we set to the pixels in order to make them reminiscient of a particular red, green, blue color scheme. We'll do this by taking the grey scale value and plugging them into 3 new mappings for red, green, and blue. There are 3 new variables, r, g, and b which correspond to the value of each hue. If the greyscale value is fully white, the hue will be fully realized, otherwise it will be proportionally dimmed. 
```processing
pixels[width * y + x] = color(map(mappedValue, 0, 255, 0, r), map(mappedValue, 0, 255, 0, g), map(mappedValue, 0, 255, 0, b));
```
There is also an algorithm in place to randomly change the r, g, b values at different rates. These values can easily be modifed, resulting in colors changing differently. 
```processing
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
```


