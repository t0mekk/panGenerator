// http://bildr.org/2011/04/various-hall-effect-sensors/

int hallSensorPin = A3;
int hall = 0;
boolean state = false;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int hallSensorReading = analogRead(hallSensorPin);
  //Serial.println(hallSensorReading);
  hallSensorReading = map(hallSensorReading, 0, 1023, 0, 255);
  if (hallSensorReading != hall) {
    hall = hallSensorReading;

    if( hall >= 250 ){
      if( !state ) Serial.println("ON");
      state = true;
    }else{
      if( state) Serial.println("OFF");
      state = false;
    }
    
    
  }
  delay(250);
}
