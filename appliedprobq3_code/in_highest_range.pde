import java.util.Arrays;

long[] highest_numbers;
float average_pos_of_highest = 0;

int inhrange=0;

void find_range_of_highest_numbers (int input_size , int sims) {
  int n = input_size;
  
  
  //7fff ffff ffff ffffL
  long lowest_highest = 2147483638 ;
  long highest_highest = 0;
  
  //Random gen = new Random();
  //range starting at 1 because the seed cannot be 0
  long seed =  gener.nextLong(1, 100000);
  long a = 16807;
 
  //int temp = 0x80000000 -1;
  //2^31 -1
  
  long  m =  (0x80000000 -1);
  
  //run x simulations
  
  highest_numbers = new long[sims];
  
  for (int i=0; i<sims; i++) {
    
    //println(seed);
    //println(i);
    
    long[] new_distribution = random_number_distribution(n);
    seed= gener.nextLong(1, 100000);
    
    long temp_highest = findHighest(new_distribution);
    highest_numbers[i] = temp_highest;
    
    
    new_distribution = null;
    
    if (temp_highest>highest_highest) {
      highest_highest = temp_highest;
    }
    else if(temp_highest<lowest_highest) {
      lowest_highest = temp_highest;
    }
  }
  
  //Arrays.sort(highest_numbers);
  DiscreteRandomVariable rv = RV.makeDiscreteRV(highest_numbers);

  //
  long ev = (long) rv.expectedValue();
  long v = (long)  rv.variance();
  
  //println(lowest_highest+ " " +   highest_highest);
  //println("Highest_ceiling: " +  highest_highest);
  
  //println("sorted first entry: " +   highest_numbers[0]);
  //println("sorted last entry: " +  highest_numbers[x-1]);
  
 /*
  println("Sample size of each uniform distribution: " + input_size);
  println("Number of simulations: " + sims+"\n");
  println("Highest range: ");
  
  
  println("Expected value of highest numbers: " +  ev);
  println("Variance of highest numbers: " +  v);
  //*/
  
  String results = Integer.toString(input_size) +" " + Integer.toString(sims) +" "+Long.toString(lowest_highest) +" "+Long.toString(highest_highest) + 
                  " "+Long.toString(ev) +" "+Long.toString(v);
                  
  println(results);
  try {
  bw.write(results);
  }
  catch (Exception e) {
    
  }
  
  //*/
}
  
  
  
  


long findHighest(long[] nums) {
  
  long highest=0;
  int pos = 0;
  
  for (int i=0; i<nums.length; i++) {
    if (nums[i]>highest) {
      highest=nums[i];
      pos = i;
    }
  }
  //println("Position of highest along array: " + (float) pos / (float) nums.length);
  average_pos_of_highest += ((float) pos / nums.length);
  
  return highest;
}







long [] mcg (int n, long a, long m, long seed) {
  
  long [] mcg = new long[n];
  mcg[0] = seed;
  
  
  for (int i =1; i< n; i++) {
    mcg[i] = ((a* mcg[i-1]) % m);
  }
  
  
  return mcg;
  
  
}



boolean is_desirable_outcome(long current_number, long highest_ceiling, long highest_range, int steps_taken, double c) {
  
  
  double step_length = ( (double) highest_range ) * c  ;
  
  long steps_distance = ((long) step_length) * ( (long) steps_taken );
  
  //have calced (highest_range * c * k)
  //println("Percentage distance: " + (double) steps_distance / highest_range);
  
  long new_floor = highest_ceiling - steps_distance;
  
  //println("Current number: " + current_number);
  //println("Range: [" + new_floor +", "+highest_ceiling+"]");
  boolean desirable = current_number >= new_floor;
  //println("in range: " + desirable+"\n");
  
  return desirable;
}




boolean method3( int input_size, long highest_floor, long highest_ceiling, int POD_numerator, int POD_denominator ) {
  gener = new Random();
  
  long[] nums = random_number_distribution(input_size);
  
  double c = invertPOD(input_size, POD_numerator, POD_denominator);
  int POD = findPOD(input_size, POD_numerator, POD_denominator);
  
  long highest_range = highest_ceiling - highest_floor;
  long selected = 0;
  
  //POD works fine

  for (int k=0; k<POD; k++) {//1
    
    //println("if ("+nums[k]+" >= "+highest_floor+")" );
    //println(nums[k]);//" );
    //if (nums[k] >= highest_floor) {//2
      
      if (is_desirable_outcome( nums[k], highest_ceiling, highest_range, k, c) ) {//3
      //println("desirable");
        if (selected==0) {//4
         selected= nums[k];
          
        }//4
      }//3
    //}//2
  }//1
  
  //println(POD);
  
  for (int k=POD; k<input_size; k++) {//1
    
    if (nums[k] >= highest_floor) {//2
      
        if (selected==0) {//4
         selected= nums[k];
          
        }//4
     
    }//2
  }//1
  
  long highest = findHighest(nums);
  
  //println("highest  :" + highest);
  //println("selected :" + selected);
  
  //if (selected>0) {
    //inhrange++;
  //}
  return highest==selected;

}



long[] random_number_distribution(int n) {
  return mcg(n, 16807, (0x8000000 -1), gener.nextLong(1, 100000) );
}



double invertPOD( int input_size, int POD_numerator, int POD_denominator ) {
  
  int new_denom = input_size * POD_numerator;
  int new_numer = POD_denominator;
  
  double c = ( (double) new_numer ) / ( (double) new_denom);
  //println(POD_denominator + " / (" + input_size + " * "+POD_numerator+") == " + c);
  
  return c;
  
}

int findPOD( int input_size, int POD_numerator, int POD_denominator) {
  return ( (input_size*POD_numerator) / POD_denominator );
}





/*
void many_method_1(int number_of_simulations, int n, int POD_numerator, int POD_denominator) {
  
  
  int POD = (POD_numerator*n) / POD_denominator;
  
  int wins = 0;
  int losses = 0;
  
  for (int i =1; i<number_of_simulations; i++) {
    if (method1(n, POD) ) {
      wins++;
    }
    else {
      losses++;
    }
  }
  
  
  //println("\nSample size of each uniform distribution: " + n);
  //println("Number of simulations: " + number_of_simulations);
  //println("Highest range: ");
  //println("Highest_floor: " +   lowest_highest);
  //println("Highest_ceiling: " +  highest_highest);
  
  //println("Number of wins: " +  wins + " == " + ( (float) wins/ (float) number_of_simulations ) );
  //println("Average position of highest number in array: " + ( (float) average_pos_of_highest / ( (float) (number_of_simulations) ) ) );
  println( ( (float) wins/ (float) number_of_simulations ) );
  //println("Number of losses: " +  losses + " == " + ( (float) losses / (float) number_of_simulations ) );
  
  
  
}

*/
