// http://bildr.org/2012/11/flex-sensor-arduino/

int flexSensorPin = A0;
int flex = 0;
void setup() {
  Serial.begin(9600);
}

void loop() {
  int flexSensorReading = analogRead(flexSensorPin);
  //Serial.println(flexSensorReading);
  flexSensorReading = map(flexSensorReading, 250, 525, -255, 255);
  flexSensorReading = constrain( flexSensorReading, -255, 255 );
  if (flexSensorReading != flex) {
    flex = flexSensorReading;
    Serial.println(flex);
  }
  delay(33);
}
