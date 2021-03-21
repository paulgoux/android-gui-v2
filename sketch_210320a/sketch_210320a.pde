import ketai.camera.*;
import ketai.cv.facedetector.*;
import ketai.data.*;
import ketai.net.*;
import ketai.net.bluetooth.*;
import ketai.net.nfc.*;
import ketai.net.nfc.record.*;
import ketai.net.wifidirect.*;
import ketai.sensors.*;
import ketai.ui.*;


BMScontrols bms;
//Menu m;
//Camera cam;
BMScamera camera;
PShader edges;
void settings(){
  size(1440,720,P2D);
};

void setup(){
  
  PApplet applet = this;
  bms = new BMScontrols(applet,true);
  Boundary w = new Boundary(bms);
  camera = new BMScamera(bms,1440,720);
  camera.edges = loadShader("edges.glsl");
  
  //bms.begin();
  tab t = new tab(250,0,200,200,"Theme",bms);
  String [] s1 = {"red","green","blue"};
  float [] v1 = {52, 235, 225};
  sliderBox sl2 = new sliderBox(50,20,90,90,10,s1,v1,bms);
  sl2.menu.draggable = false;
  sl2.tooltip = null;
  sl2.setPieSquare();
  //t.toggle = true;
  t.setvScroll();
  t.draggable = true;
  t.add(sl2);
  bms.dock.add(t);
  bms.add(t);
  //println("sketch",bms.tabs.size());
  bms.setRadius(5);
  
};

void draw(){
  bms.selfToggle(0,1);
  //if(bms.getToggle(0,1)
  bms.toggle(0,0,bms.tabs.get(1),"toggle");
  bms.toggle(0,1,bms.tabs.get(0),"toggle");
  bms.toggle(0,2,bms.fmenu,"open");
  bms.run();
  
};

void onCameraPreviewEvent(){
  camera.read();
};
