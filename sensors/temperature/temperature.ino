// https://learn.adafruit.com/tmp36-temperature-sensor

int temperatureSensorPin = A5;
int temp = 0;
void setup() {
  Serial.begin(9600);
}

void loop() {
  int temperatureSensorReading = analogRead(temperatureSensorPin);
  //Serial.println(temperatureSensorReading);
  float voltage = temperatureSensorReading * 5.0;
  voltage /= 1024.0;
  float temperatureC = (voltage - 0.5) * 100 ;
  if (temperatureC != temp) {
    temp = temperatureC;
    Serial.println(round(temp));
  }
  delay(1000);
}
