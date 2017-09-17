// http://bildr.org/2012/11/force-sensitive-resistor-arduino/

int forceSensorPin = A3;
int force = 0;
void setup() {
  Serial.begin(9600);
}

void loop() {
  int forceSensorReading = analogRead(forceSensorPin);
  //Serial.println(forceSensorReading);
  forceSensorReading = map(forceSensorReading, 0, 1023, 0, 255);
  if (forceSensorReading != force) {
    force = forceSensorReading;
    Serial.println(force);
  }
  delay(250);
}
