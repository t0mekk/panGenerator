import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

int temperatureVal = 0;
float smoothedTemperatureVal = 0;

color c1 = #00d8ff;
color c2 = #ff0084;

void setup(){
	
	size( 1280, 720, P3D);
	setupOSC();

}

void setupOSC(){

  oscP5 = new OscP5(this,12000);

}


void draw(){
	
	// do stuff with incoming data
	update();

	// clear the scene
	background(100);

	// set drawing options
	noStroke();
	fill( 150 );

	float rw = 20;
	float rh = 300;
	float maxTemp = 40.0;

	rect(width/2-rw/2, height/2-rh/2, rw, rh, 5);


	fill( lerpColor(c1, c2, smoothedTemperatureVal / maxTemp) );

	// draw the circle
	float th = height*smoothedTemperatureVal / rh;
	rect(width/2-rw/2, height/2-rh/2+rh-th, rw, th, 5 );

	fill(255);
	text( temperatureVal + " C", width/2 + rw/2 + 20, height/2-rh/2+rh-th );

}

void update(){

	// smooth the data
	smoothedTemperatureVal += (  float(temperatureVal) - smoothedTemperatureVal ) * 0.2;

}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());

  /* check if theOscMessage has the address pattern we are looking for. */
  if(theOscMessage.checkAddrPattern("/data")==true) {
    /* check if the typetag is the right one. */
    if(theOscMessage.checkTypetag("iiii")) {

    	temperatureVal = theOscMessage.get(0).intValue();

    }

  }


}