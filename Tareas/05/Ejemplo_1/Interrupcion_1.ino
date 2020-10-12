//******************************************************************************
// Ejemplo del uso de Atención a Interrupciones
//
// Interrupciones asociadas a entradas de señales digitales
//
//******************************************************************************
// ---[ BIBLIOTECAS ]---
// De momento no se necesitan
volatile int pulsaciones=1;//Numero de pulsaciones
void setup() {
  Serial.begin(5700);
 attachInterrupt(digitalPinToInterrupt(2), Mandapulso, RISING);//Interrupcion en el pin 2

}

void loop() {

}
void Mandapulso(){
  Serial.println("Se genero interrupcion:");
Serial.println(pulsaciones);
  pulsaciones=pulsaciones+1;
  
  
  }
