import processing.serial.*;
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

Serial port;

int historyLength = 50;
int values[][] = new int[3][historyLength];
boolean active = false;

void setup() {
  size(260, 380);
  println(Serial.list());
  String portName = Serial.list()[5]; //change the 0 to a 1 or 2 etc. to match your port
  port = new Serial(this, portName, 9600);
  initValues();
  setupOSC();
}


void setupOSC(){

  oscP5 = new OscP5(this,13000);
  myRemoteLocation = new NetAddress("127.0.0.1",12000);

}


void draw()
{
  background(255);
  noFill();
  if ( port.available() > 0)
  {
    String val = port.readStringUntil('\n');
    if (val!=null) {
      if (val.indexOf(";")!=-1) {
        String[] parts = split(val,';');
        if(parts.length == 3){
          int v = min(int(trim(parts[0])), 255);
          values[0] = shorten(values[0]);
          values[0] = splice(values[0], v, 0);
           
          v = min(int(trim(parts[1])), 255);
          values[1] = shorten(values[1]);
          values[1] = splice(values[1], v, 0);
          
          v = min(int(trim(parts[2])), 255);
          values[2] = shorten(values[2]);
          values[2] = splice(values[2], v, 0);
        }
      } else if (val.indexOf("ON")!=-1) {
        active = true;
      } else if (val.indexOf("OFF")!=-1){
        active = false;
      } else {
        int v = min(int(trim(val)), 255);
        values[0] = shorten(values[0]);
        values[0] = splice(values[0], v, 0);
      }
    }
  }

  drawArray(values[0], 20, 20, 100, 100);
  drawArray(values[1], 20, 140, 100, 100);
  drawArray(values[2], 20, 260, 100, 100);
  drawBool(active, 140, 20, 100, 100);

  sendOSC();

}
void initValues() {
  for (int i=0; i<values.length; i++) {
    for (int j=0; j<values[i].length; j++) {
      values[i][j] = 0;
    }
  }
}
void drawArray(int v[], float x, float y, float w, float h) {
  stroke(#00B0FF);
  noFill();
  rect(x, y, w, h);
  fill(#00B0FF);
  noStroke();
  for (int i=0; i<v.length; i++) {
    rect(x + i * (w/v.length), y+h-(v[i]/255.0)*h, w/v.length, (v[i]/255.0)*h);
  }
}
void drawBool(boolean a, float x, float y, float w, float h) {
  if (a) {
    noStroke();
    fill(#00B0FF);
  } else {
    stroke(#00B0FF);
    noFill();
  }
  rect(x, y, w, h);
}

void sendOSC(){

  OscMessage myMessage = new OscMessage("/data");

  myMessage.add( values[0][0] );
  myMessage.add( values[1][0] );
  myMessage.add( values[2][0] );
  myMessage.add( ( active ) ? 1 : 0 );

  oscP5.send(myMessage, myRemoteLocation);

}

