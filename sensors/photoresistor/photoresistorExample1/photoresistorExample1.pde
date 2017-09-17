import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

int lightVal = 0;
float smoothedLightVal = 0;

color c1 = #00d8ff;
color c2 = #ff0084;

float spin = 0;

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
	
	// 3D stuff...

	//lights();

	float dirY = (mouseY / float(height) - 0.5) * 2;
  	float dirX = (mouseX / float(width) - 0.5) * 2;
  	directionalLight(lightVal, lightVal, lightVal, -dirX, -dirY, -1); 

	spin += 0.01;

	fill( #00fff6 );
	pushMatrix();
  	translate(width/2, height/2, 0);
  	rotateX(PI/9);
  	rotateY(PI/5 + spin);
  	box(150);
  	popMatrix();


}

void update(){

	// smooth the data
	smoothedLightVal += (  float(lightVal) - smoothedLightVal ) * 0.8;

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

    	lightVal = theOscMessage.get(0).intValue();

    }

  }


}