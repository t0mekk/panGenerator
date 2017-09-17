import oscP5.*;
import netP5.*;
  
OscP5 oscP5;


int sensorState = 0;

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
	stroke(#00d8ff);

	// draw the circle
	if( sensorState == 0 ){
		fill(#00d8ff);
		ellipse( width/2 - 50, height/2, 20, 20 );
		noFill();
		ellipse( width/2 + 50, height/2, 20, 20 );
	}else{
		noFill();
		ellipse( width/2 - 50, height/2, 20, 20 );
		fill(#00d8ff);
		ellipse( width/2 + 50, height/2, 20, 20 );
	} 

	textAlign(CENTER, CENTER);
	text( ( sensorState == 0 ) ? "ON" : "OFF" , width/2, height/2 + 50);
		

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

    	sensorState = theOscMessage.get(3).intValue();

    }

  }


}