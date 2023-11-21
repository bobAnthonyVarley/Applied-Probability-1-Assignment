DiscreteRandomVariable RV;

class DiscreteRandomVariable {
  
  public int n;
  
  public long[] random_numbers;
  public double[] probabilties;
  
  public DiscreteRandomVariable() { }
  
  public DiscreteRandomVariable(int size) {
    n = size;
    random_numbers = new long[size];
    probabilties   = new double[size];
    
    for ( int i = 0; i<size; i++) {
      random_numbers[i] = 0;
      probabilties[i] = 0;
    }
  }
  
  public DiscreteRandomVariable(int size, long[] l, double[] d) {
    n = size;
    random_numbers = l;
    probabilties   = d;
  }
  
  
  //gets in sorted array from lowest to highest

  
  DiscreteRandomVariable makeDiscreteRV(long[] arr) {
  
  int listLength = arr.length;
  int total_sample_size = arr.length;
  long [] dupe = new long[arr.length];
  
  //make duplicate of array
  for ( int i = 0; i<arr.length; i++) {
    dupe[i] = arr[i];
  }

  //find range of random variable
  for ( int i = 0; i<arr.length; i++) { //1
        for ( int j= i + 1; j<arr.length; j++) {  //2
          if ( dupe[i]==arr[j] && dupe[i]!=0) {  //3.1
          
            listLength--;
            dupe[j] = 0;
          } //3.1
        } //2
    } //1

    DiscreteRandomVariable drv = new DiscreteRandomVariable(listLength);
    int index=0;
    
    //plot range into the random variable
    for ( int i = 0; i<dupe.length; i++) {
      if (dupe[i]!=0) {
        drv.random_numbers[index] = dupe[i];
        index++;
      }
    }
 
   //find the probabilties of each value in the random varaible
    for ( int i = 0; i<arr.length; i++) { //1
          if (arr[i]!=0) {  //3.1
            changeProbability(drv, arr[i], 1);
          } //3.1
        }
    
    //total number of outcomes, ie, if we have roll two die
    //the total number of outcomes will be 36, and the range of different values (random_numbers.length)
    //will be 6
      drv.n = total_sample_size;
      return drv;
    } //0
    
 
 
 
    
    
    void printer() {
      println();
      for (int i =0; i<probabilties.length; i++) {
        println("X    = " + random_numbers[i]);
        println("p(x) = " + probabilties[i] + "/" + n + " == " + (probabilties[i] / n) );
      }
      
    }
    
    boolean isValid() {
      double count = 0;
      
      for (int i =0; i<probabilties.length; i++) {
        count += probabilties[i] / n;
      }
      
      return (count==1);
      
    }
  
  public double expectedValue() {
    double ev = 0;
    int len = random_numbers.length;
    
    for ( int i = 0; i<len; i++) {
      ev += (random_numbers[i] * (toProb(probabilties[i])) );
    }
    //println("Expected value: "+ ev);
    
    return ev;
  }
  
  public double variance() {

    double ev_of_x_squared = 0;
    int len = random_numbers.length;
    
    for ( int i = 0; i<len; i++) {
      ev_of_x_squared += ( (random_numbers[i]*random_numbers[i]) * (toProb(probabilties[i])) );
    }
    
    double square_of_ev = expectedValue();
    square_of_ev *= square_of_ev;
    
    return ev_of_x_squared - square_of_ev;
  }
  
  double toProb(double x) {
    return x / n;
  }
  
  
  
  
  
}

public void changeProbability(DiscreteRandomVariable drv, long number, double prob) { 
      //println("drv X= " + (pos+1) + ", px before = " + drv.probabilties[pos]);
      for ( int i = 0; i<drv.random_numbers.length; i++) {
        if (drv.random_numbers[i] == number) {
          drv.probabilties[i] = drv.probabilties[i] + prob;
        }
      }
      //println("drv X= " + pos + ", px after = " + drv.probabilties[pos] );
    }
