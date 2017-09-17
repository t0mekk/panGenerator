import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

int potVal = 0;
float smoothedPotVal = 0;

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
	fill( lerpColor(c1, c2, float(potVal) / 255.0) );

	// draw the circle
	//ellipse( width/2, height/2, smoothedPotVal, smoothedPotVal );
	//ellipseMode(CENTER); 
	float angle = (smoothedPotVal / 255.0) *  TWO_PI;
	arc(width/2, height/2, 200, 200, 0, angle ); //(smoothedPotVal / 255.0) * 

	stroke(255);
	float px = width/2 + sin( angle ) * width;
	float py = height/2 + cos( angle ) * width;
	line( width/2, height/2, px, py );

}

void update(){

	// smooth the data
	smoothedPotVal += (  float(potVal) - smoothedPotVal ) * 0.05;

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

    	potVal = theOscMessage.get(0).intValue();

    }

  }


}