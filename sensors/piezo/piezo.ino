// https://www.arduino.cc/en/Tutorial/Knock
int piezoSensorPin = A4;
int piezo = 0;
void setup() {
  Serial.begin(9600);
}

void loop() {
  int piezoSensorReading = analogRead(piezoSensorPin);
  //Serial.println(piezoSensorReading);
  piezoSensorReading = map(piezoSensorReading, 0, 400, 0, 255);
  if (piezoSensorReading != piezo) {
    piezo = piezoSensorReading;
    if( piezo > 0 ){
      Serial.println(piezo);
    }
  }
  delay(10);
}
