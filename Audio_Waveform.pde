import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
//AudioPlayer player;
AudioInput in;

void setup() {
  size(480, 320);
  smooth();
  
  minim = new Minim(this);
  
  in = minim.getLineIn(Minim.STEREO, 1024);
  
  strokeWeight(2);
}

void draw()
{
  background(0);
  
  translate(0, height/2);
  
  stroke(220,20,60);
  for(int i = 0; i < in.bufferSize(); i++)
  {
    float y = abs(in.mix.get(i))*220;
    point(i, y);
  }
  
  stroke(0, 255, 127);
  for(int i = 0; i < in.bufferSize(); i++)
  {
    float y = abs(in.mix.get(i))*220;
    point(i, y);
  }
}

void stop()
{
  in.close();
  minim.stop();
  super.stop();
}

