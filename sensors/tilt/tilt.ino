// https://www.arduino.cc/en/Tutorial/TiltSensor

int tiltSensorPin = 7;
int state = 0;
void setup() {
  pinMode(tiltSensorPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  int tiltReading = digitalRead(tiltSensorPin);

  if (tiltReading == HIGH && state == 0) {
    Serial.println("ON");
    state = 1;
  } else if (tiltReading == LOW && state == 1){
    Serial.println("OFF");
    state = 0;
  }
  delay(250);
}
