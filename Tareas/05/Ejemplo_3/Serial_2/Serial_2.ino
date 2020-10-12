//******************************************************************************
// Ejemplo del uso de Atención a Interrupciones
//
// Interrupciones asociadas recepciones seriales
//
//******************************************************************************
// ---[ BIBLIOTECAS ]---
// De momento no se necesitan
volatile int incomingByte = 0;
void setup() {
  Serial.begin(5700);

}

void loop() {
Serial.write("Hola");
delay(5000);

}
