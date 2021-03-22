import peasy.*;
PShape table; PShape bulb; PShape bookshelves; PShape chair1; PShape chair2; PShape window;
boolean [] keysPressed = new boolean[5];
boolean pantallaControl;

void setup()
{
  size(800, 800, P3D);
  noStroke();
  createTable();
  createBulb();
  createBookshelves();
  createChairs();
  createWindow();
  keysPressed[4] = true;
  pantallaControl = true;
}

void draw ()
{ 
  if(pantallaControl){
    pantallaControl();
  }else{
    ambientLight(95, 210, 126);
    lightSpecular(255, 255, 255);
    spotLight(102, 153, 204, mouseX, mouseY, 600, 0, 0, -1, PI/2, 800);
    if(keysPressed[0]){ //UP
      camera(0, 0, 800, width/2.0, height/2.0, 0, 0.0, 1.0, 0.0);
    }
    if(keysPressed[1]){ //DOWN
      camera(width, height, 800, width/2.0, height/2.0, 0, 0.0, 1.0, 0.0);
    }
    if(keysPressed[2]){ //RIGHT
      camera(-(width/2), -(height/2), 400, width/2, height/2, 0, 0.0, 1.0, 0.0);
    }
    if(keysPressed[3]){ //LEFT
      camera(width/2, height/2, 400, width/2, height/2-50, 0, 0.0, 1.0, 0.0);
    }
    if(keysPressed[4]){ 
       camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0); 
    }
  //camera(width, height, 800, width/2.0, height/2.0, 0, 0.0, 1.0, 0.0);  
    background(150);
    // Start in the center of the office
    translate(0, 0, -500);
    showTable();
    showBulb();
    showBookshelves();
    showChairs();
    showWindow();
    showRoom();
  }
}

void showRoom(){
  pushMatrix();
  stroke(0);
  noFill();
  box(2000,1800,2000);
  popMatrix();
}

void createTable(){
  table = loadShape("data/table/10233_Kitchen_Table_v2_max2011_it2.obj");
  table.scale(2);
  table.rotateY(radians(180));
  table.rotateX(radians(270));

}

void showTable(){
  pushMatrix();
  translate(400,900,100);
  shape(table);
  popMatrix();
}

void createBulb(){
  bulb = loadShape("data/light/bulb.obj");
  bulb.scale(2);
  //bulb.rotateY(radians(90));
  bulb.rotateX(radians(90));
}

void showBulb(){
  lights();
  pushMatrix();
  translate(-50,900,200);
  shape(bulb);
  popMatrix();
}

void createBookshelves(){
  bookshelves = loadShape("data/estanteria/estanteria.obj");
  bookshelves.scale(1.5);
}

void showBookshelves(){
  pushMatrix();
  translate(1400,900,-1000);
  shape(bookshelves);
  popMatrix();
  
  pushMatrix();
  translate(1400,900,-1500);
  shape(bookshelves);
  popMatrix();
}

void createChairs(){
  chair1 = loadShape("data/chair/Office_chair.obj");
  chair1.scale(0.3);
  chair1.rotateX(radians(180));
  chair1.rotateY(radians(90));
  
  chair2 = loadShape("data/chair/Office_chair.obj");
  chair2.scale(0.3);
  chair2.rotateX(radians(180));
  chair2.rotateY(radians(270));
}

void showChairs(){
  pushMatrix();
  translate(650,900,100);
  shape(chair1);
  popMatrix();
  
  pushMatrix();
  translate(150,900,100);
  shape(chair2);
  popMatrix();
}

void createWindow(){
  window = loadShape("data/window/window.obj");
  window.scale(20);
  window.rotateY(radians(180));
  window.rotateX(radians(180));
}

void showWindow(){
  pushMatrix();
  translate(400,300,-700);
  shape(window);
  popMatrix();
}

void keyPressed(){
  if(key == 'r' || key == 'R'){
    keysPressed[0] = false;
    keysPressed[1] = false;
    keysPressed[2] = false;
    keysPressed[3] = false;
    keysPressed[4] = true;
    
  }
  if(key == 'c' || key == 'C'){
    pantallaControl = !pantallaControl;
  }
  switch(keyCode){
    case UP:
      keysPressed[0] = true;
      keysPressed[1] = false;
      keysPressed[2] = false;
      keysPressed[3] = false;
      keysPressed[4] = false;
      break;
    case DOWN:
      keysPressed[1] = true;
      keysPressed[0] = false;
      keysPressed[2] = false;
      keysPressed[3] = false;
      keysPressed[4] = false;
      break;
    case RIGHT:
      keysPressed[2] = true;
      keysPressed[1] = false;
      keysPressed[0] = false;
      keysPressed[3] = false;
      keysPressed[4] = false;
      break;
    case LEFT:
      keysPressed[3] = true;
      keysPressed[2] = false;
      keysPressed[1] = false;
      keysPressed[0] = false;
      keysPressed[4] = false;
      break;
  }
}

void pantallaControl(){
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0); 
  background (0) ;
  textSize(50);
  textAlign(CENTER,CENTER);
  fill(255);
  text("Estructura 3D: Despacho", width/2,100);
  textSize(25);
  textAlign(CENTER);
  text("Para visualizar el entorno pulse la tecla C", width/2, 290);
  textAlign(CENTER);
  text("*Tecla UP: Modo vista desde el techo\n*Tecla DOWN: Modo vista desde el suelo\n*Tecla RIGHT: Modo vista desde la esquina\n*Tecla LEFT: Modo vista desde la mesa\n*Tecla R: Resetear la vista desde el modo por defecto", width/2, 330);
  textSize(20);
  text("© Eduardo Maldonado Fernández",width-400,height-10);

}
