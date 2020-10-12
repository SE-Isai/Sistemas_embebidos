//******************************************************************************
// Ejemplo del uso de Atención a Interrupciones
//
// Interrupciones asociadas recepciones seriales
//
//******************************************************************************
// ---[ BIBLIOTECAS ]---
// De momento no se necesitan
volatile char incomingByte;
void setup() {
  Serial.begin(5700);

}

void loop() {

}
void serialEvent(){
  Serial.println("Recibi:");
  char incomingByte= Serial.read();
  Serial.println(incomingByte);
  
  }
