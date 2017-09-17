import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

int valX = 0;
int valY = 0;
int valZ = 0;
float smoothedXVal = 0;
float smoothedYVal = 0;
float smoothedZVal = 0;
float smoothFactor = 0.2;

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
	noFill();
	stroke(#00fff6);

	// draw curve - note that catmull-rom spline needs min. 4 controll points
	beginShape();
	curveVertex(10, height/2);
	curveVertex(10, height/2);
	curveVertex(width/2, height/2 + smoothedYVal);
	curveVertex(width-10, height/2);
	curveVertex(width-10, height/2);
	endShape();

	stroke(#fff000);
	beginShape();
	curveVertex(width/2, 10);
	curveVertex(width/2, 10);
	curveVertex(width/2 + smoothedXVal, height/2 );
	curveVertex(width/2, height-10);
	curveVertex(width/2, height-10);
	endShape();

	// draw the circle
	stroke(#ff31b9);
	ellipse( width/2, height/2, smoothedZVal, smoothedZVal );

}

void update(){

	// smooth the data
	smoothedXVal += (  float(valX) - smoothedXVal ) * smoothFactor;
	smoothedYVal += (  float(valY) - smoothedYVal ) * smoothFactor;
	smoothedZVal += (  float(valZ) - smoothedZVal ) * smoothFactor;

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

    	valX = theOscMessage.get(0).intValue();
    	valY = theOscMessage.get(1).intValue();
    	valZ = theOscMessage.get(2).intValue();

    }

  }


}