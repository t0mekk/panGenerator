import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

int bendVal = 0;
float smoothedBlendVal = 0;

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
	curveVertex(width/2, height/2 + smoothedBlendVal);
	curveVertex(width-10, height/2);
	curveVertex(width-10, height/2);
	endShape();

	// draw the circle
	stroke(#fff000);
	ellipse( width/2, (height/2 + smoothedBlendVal/2)-2, smoothedBlendVal, smoothedBlendVal );

}

void update(){

	// smooth the data
	smoothedBlendVal += (  float(bendVal) - smoothedBlendVal ) * 0.2;

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

    	bendVal = theOscMessage.get(0).intValue();

    }

  }


}