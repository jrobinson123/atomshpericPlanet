# atomshpericPlanet


An atomspheric like effect. This project started when I was interested in deciding the grayscale value of each pixel based on the x and y coordinates of each pixel. For example by adding together x and y together. The output will look like this:



In this case any sum avove 255 will result in white, even though the max value is 998 (width - 1 + height - 1) 
A solution is to map each sum to between 0 and the maximum value. Which will result in something like this. 


We can now change the function to by x * y, and change the max value to (width - 1) * (height - 1)
