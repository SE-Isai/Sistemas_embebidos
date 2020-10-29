
// Importamos la libreria meter
import meter.*;

// Importamos la libreria visual
import processing.serial.*;

Serial port; // Definimos botones
int x1=50;
int y1=400;
int x2=500;
int y2=400;
int x3=280;
int y3=500;
int w=400;
int h=60;
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;
Meter m, m2;

void setup(){
  // Creamos una ventana vacia
  size(950, 600); // 
  background(#EFF2CD); // Color del background (R,G,B)
  
  // Creamos el puerto serial
  port = new Serial(this, "COM6", 9600); //Se define el puerto donde esta conectado nuestro arduino y la velocidad
  
  // Agregamos indicador de temperatura
  m = new Meter(this, 25, 80);  // aqui 25, 10 son coordenadas X y Y del indicador
  
  m.setTitleFontSize(20);
  m.setTitleFontName("Arial bold");
  m.setTitle("Temperatura (C)");
  
  // Ponemos la escala de temperatura
  String[] scaleLabels = {"0", "10", "20", "30", "40", "50", "60", "70", "80"};
  m.setScaleLabels(scaleLabels);
  m.setScaleFontSize(18);
  m.setScaleFontName("Times new roman bold");
  m.setScaleFontColor(color(200, 30, 70));
  
  // Desplegamos una pantalla adicional para mostrar la temperatura
  m.setDisplayDigitalMeterValue(true);
  
  // Algunas modificaciones graficas del indicador 
  m.setArcColor(color(141, 113, 178));
  m.setArcThickness(15);
  
  m.setMaxScaleValue(80);
  
  m.setMinInputSignal(0);
  m.setMaxInputSignal(80);
  
  m.setNeedleThickness(3);
  
  // Sensor de humedad
 
  int mx = m.getMeterX(); // Coordenada x 
  int my = m.getMeterY(); // Coordenada y 
  int mw = m.getMeterWidth();
  
  m2 = new Meter(this, mx + mw + 20, my);
  
  m2.setTitleFontSize(20);
  m2.setTitleFontName("Arial bold");
  m2.setTitle("Humedad (%)");
  
  // Ponemos escala de valores
  String[] scaleLabels2 = {"0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100"};
  m2.setScaleLabels(scaleLabels2);
  m2.setScaleFontSize(18);
  m2.setScaleFontName("Times new roman bold");
  m2.setScaleFontColor(color(200, 30, 70));
  
  // Desplegamos una pantalla adicional para mostrar la temperatura
  m2.setDisplayDigitalMeterValue(true);
  
  // Algunas modificaciones graficas del indicador
  m2.setArcColor(color(141, 113, 178));
  m2.setArcThickness(15);
  
  m2.setMaxScaleValue(100);
  
  m2.setMinInputSignal(0);
  m2.setMaxInputSignal(100);
  
  m2.setNeedleThickness(3);
}

void draw(){
  // Dibujamos los botones
  fill(#D64747);
  stroke(0);
  rect(x1,y1, w, h);
   fill(#6C5498);
   rect(x2,y2, w, h);
   fill(#FCE5F8);
   rect(x3,y3, w, h);
  textSize(30);
  fill(0); // Color de texto , (r,g,b)
  text("Temperatura y humedad", 250, 40); // ("texto", x, y)
  textSize(30);
  fill(0); 
  text("Encender LED", x1+100, y1+40); 
  textSize(30);
  fill(0); 
  text("Apagar LED", x2+100, y2+40); 
  textSize(30);
  fill(0); 
  text("Parpadear", x3+100, y3+40); 
  textSize(35);
  fill(0); 
  text("Equipo 1", 750, 550);
  if (button1){               //Si algun boton se habilita mandamos informacion al puerto serial
    port.write(65);
    button1 = false;
    }
 if (button2){
    port.write(64);
    button2 = false;
    }
  if (button3){
    port.write(63);
    button3 = false;
    }
 
  if (port.available() > 0){
    String val = port.readString(); // Lee cadenas de datos del puerto serial
    // Tenemos que separar los valores de humedad y temperatura que estan separados por comas
    String[] list = split(val, ','); // dividimos los valores separados por ','
    float temp = float(list[0]); // Guardamos temperatura en esta variable
    float hum = float(list[1]);  // Guardamos humedad en esta variable
    
    m.updateMeter(int(temp)); // Actualizamos el indicador en cada ciclo
    m2.updateMeter(int(hum));
    
    println("Temperatura: " + temp + " C  " + "Humedad: " + hum+ "%");
  }
  
}
                                 
void mousePressed(){                           //Rutina cuando se presiona el boton del mouse
  if ((mouseX > x1) && (mouseX < x1+w) && (mouseY > y1) && (mouseY < y1+h)){  //Ajustamos la posicion de los botones
    if(button1){
  button1 = false;
  } else {
  button1 = true;
  }
  }
  if ((mouseX > x2) && (mouseX < x2+w) && (mouseY > y2) && (mouseY < y2+h)){
    if(button2){
  button2 = false;
  } else {
  button2 = true;
  }
  }
  
  if ((mouseX > x3) && (mouseX < x3+w) && (mouseY > y3) && (mouseY < y3+h)){
    if(button3){
  button3 = false;
  } else {
  button3 = true;
  }
  }
  }
