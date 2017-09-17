// http://playground.arduino.cc/Learning/PhotoResistor

int photoSensorPin = A2;
int photo = 0;
void setup() {
  Serial.begin(9600);
}

void loop() {
  int photoSensorReading = analogRead(photoSensorPin);
  //Serial.println(photoSensorReading);
  photoSensorReading = map(photoSensorReading, 200, 900, 0, 255);
  if (photoSensorReading != photo) {
    photo = photoSensorReading;
    Serial.println(photo);
  }
  delay(33);
}
