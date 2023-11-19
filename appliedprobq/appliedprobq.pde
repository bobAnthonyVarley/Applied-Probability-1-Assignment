//applied prob question 3
int N;
boolean[] results;

int losscount=0;
int wincount=0;

import java.io.BufferedWriter;
import java.io.FileWriter;
BufferedWriter bw;

//count all the times that highest number is before n/2
//my workings say that its 0.6
//my intuitionn says that it's 0.5

//the random generator for java is giving 0.2, which is definitely not random



int highest_in_first_half=0;
int highest_position=0;

String method3results = "temp.csv";

void setup() {
  int n =100;
  N = n;
  results = new boolean[n];
  try {
  makeglobalvars();
  }
  catch (IOException e) {
    size(400,400);
  }
  
  
  //size(1000, 1000);
  
}

void draw() {
  
  background(#888888);
  
  
  /*method1(80);
  noLoop();
  //*/
  
  //run 2000 sims
  //callmethods(2000);
  
  
  /*
  //long[] arr = {1, 1, 2, 2, 2, 2, 3,4,4,4,4,5,5,5,5,6,6,6,6,8,8,8,88};
  long[] arr = {1, 2, 3,4,5,6};
  
  
  DiscreteRandomVariable rv = RV.makeDiscreteRV(arr);
  rv.printer();

  //print(rv.isValid());
  println(rv.expectedValue());
  println(rv.variance());
  
  */
  
  method3attempt2(1000);
  try {
  closer();
  }
  catch (IOException e) {
    
  }
  
  noLoop();
  
  
  
}



void makeglobalvars() throws IOException {
  RV = new DiscreteRandomVariable();
  bw = new BufferedWriter(new FileWriter(method3results));
  
}

void closer() throws IOException {
  bw.close();
}
