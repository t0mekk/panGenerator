import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

int pressVal = 0;
float smoothedPressVal = 0;

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
	fill( lerpColor(c1, c2, float(pressVal) / 255.0) );

	// draw the circle
	ellipse( width/2, height/2, smoothedPressVal, smoothedPressVal );

}

void update(){

	// smooth the data
	smoothedPressVal += (  float(pressVal) - smoothedPressVal ) * 0.2;

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

    	pressVal = theOscMessage.get(0).intValue();

    }

  }


}