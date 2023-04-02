float zoom =2;
int cobcount =-157;
float k = 100;

// shows the behavior of stable attracting fixed point and a repeling fixed point of a quadric
// it is also in the same form as the logistic equation
// around k 125 you can see some period doubling 
// around k 140you can see the period double again
void setup() {
  size(900, 900);
  background(0);
  translate(width/2, height/2);
  plotaxis();
  plotfun(color(255, 255, 0));
  cobweb2(-13);
  //frameRate(20);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  fill(255);
  textSize(20);
  text(k,-width/2+100,-height/2+100);
  plotaxis();
  plotfun(color(255, 255, 0));
  cobweb2(cobcount);
  if (cobcount>187){
    cobcount = -157;
    k+=5;
    if (k==250){
      k=100;
    }
  }
  cobcount+=1;
}


float f1(float x) {
  //return 1 *sq(0.1*x)+k;  //let eq1 = "x-0.3*x**2+30"
 return (.01*x)*(1-x)+k;
}


void plotaxis() {
  //axis
  stroke(80);
  line(0, -height / 2, 0, height); //vert
  line(-width / 2, 0, width, 0); //horizontal
  stroke(255);
  line(-width/2, height/2, width/2, -height/2);
}


void plotfun(color clr) {
  //stroke(random(255),random(255),random(255));
  stroke(clr);
  strokeWeight(2);
  noFill();
  beginShape();
  //let myeq = eval(eq)
  for (int x = -width / 2; x < width / 2; x += 1) {
    float fy = f1(x); //so it gets the values from the function
    float cy = fy * -1; // cy is corrected for plotting like cartesian not computer
    vertex(x * zoom, cy * zoom);
    //ellipse(x * zoom, cy * zoom, 5, 5); // calculated points plotted on vertex
  }
  endShape();
}



void cobweb2(float strt) {
  //print("hello cobweb2");
  // a much better way to get the points by iterating the seed through the function i
  // instead of looking them up in the array as I did in the last version.
  float x = strt;
  float y = strt;
  float nexty, nextx;
  strokeWeight(2);
  //print(y);
  stroke(255,0,0);//(random(100, 255), random(255), random(100, 255));
  //ellipse(tx * zoom, -ty * zoom, 30, 30);
  // get that positionin the array
  for (int i = 0; i < 50; i++) {
    nextx = x;
    nexty = f1(nextx);  // getting the values by iteration of function
    line(x * zoom, -y * zoom, nextx * zoom, -nexty * zoom);
    x = nexty;
    y = nexty;
    //print(x, y);
    line(nextx * zoom, -nexty * zoom, x * zoom, -y * zoom);
    // get next xy point
  }
}
