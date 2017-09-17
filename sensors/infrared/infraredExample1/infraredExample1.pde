import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

int val1 = 0;
int val2 = 0;
int val3 = 0;


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
	fill(#00fff6);
	noStroke();

	float o =  float(millis()) / 100.0 ;
	float maxSize = 30;

	float s1 = sin( o + 100 ) * (val1 / 5);
	ellipse( width/2-60, height/2, s1, s1 );

	float s2 = sin( o ) * (val2 / 5);
	ellipse( width/2, height/2, s2, s2 );

	float s3 = sin( o - 100 ) * (val3 / 5);
	ellipse( width/2+60, height/2, s3, s3 );



}

void update(){

	//

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

    	val1 = theOscMessage.get(0).intValue();
    	val2 = theOscMessage.get(1).intValue();
    	val3 = theOscMessage.get(2).intValue();

    }

  }


}