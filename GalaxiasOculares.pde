//Para crear una galaxia a partir de una imagen propía colocala en la carpets 'data'
//Y modifica el loadImage(); con el nombre de tu archivo. Ejemplo: loadImage("imagenojo1.jpg");

//PUEDES UTILIZAR, MODIFICAR Y COMPARTIR ESTA CÓDIGO CON TODO GUSTO
//Si tienes alguna duda sobre el desarrollo del código puedes enviar un correo a manuelmenv@gmail.com para consultar tus dudas

int tamX=1024;
int tamY=686;
float n = 0;
float r = 0;
PImage foto;
color [] colores= new color[tamX*tamY];

int radioCumuloCentra =30;
void setup() {
  size(1024,686);
  noLoop();
  foto= loadImage("ojo7.jpg");
  foto.resize(tamX, tamY);
  foto.loadPixels();
  for (int i = 0; i< tamX*tamY; i++) {
    colores[i]=foto.pixels [i];
  }
  foto.updatePixels();
}
void draw() {

  background(0);

  //Fondo Estrellas
  for (int i = 0; i <10000; i++) {
    int x =int(random(width));
    int y=int( random(height));
    stroke (colores[int(posReal(x, y))]);
    point(x, y);
  }

  //Espirales
  for (float i = 0; i < 7; i+= 0.05) {
    for (int k = 0; k<4; k++) {
      for (int j= 0; j <200; j++) {
        float x = int((width/2 + cos(n + (k*PI/2)) * r)+ random(-20, 20));
        float y = int((height/2 + sin(n +(k*PI/2)) * r)+ random(-20, 20));
        if (x<tamX&&y<tamY&&x>0&&y>0) {
          stroke (colores[int(posReal(x, y))]);


          point(x, y);
        }
        n = i;
        r = i*40;
      }
    }
  }

  //Cumulo central
  for (float i = 0; i < 25; i+= 0.05) {
    for (int j= 0; j <12; j++) {
      float x = int((width/2 + cos(n) * r)+ random(radioCumuloCentra*-1, radioCumuloCentra));
      float y = int((height/2 + sin(n) * r)+ random(radioCumuloCentra*-1, radioCumuloCentra));
      stroke (colores[int(posReal(x, y))]);

      point(x, y);
      n = i;
      r = i/2;
    }
  }
  fill(0, 0, 255, 15);
  rect(0, 0, width, height);
  save(random(20000)+".jpg");
}

float posReal(float x, float y) {
  return x + (y* width);
}
