import java.util.Arrays;

long[] highest_numbers;

void method3attempt2 (int input_size) {
  int n = input_size;
  
  
  //7fff ffff ffff ffffL
  long lowest_highest = 0x7FFFFFFFFFFFFFFFL ;
  long highest_highest = 0;
  
  Random gen = new Random();
  //range starting at 1 because the seed cannot be 0
  long seed =  gen.nextInt(1, 5);
  long a = 16807;
 
  //int temp = 0x80000000 -1;
  //2^31 -1
  
  long  m =  (0x80000000 -1);
  
  //run x simulations
  int x = 100000;
  highest_numbers = new long[x];
  
  for (int i=0; i<x; i++) {
    
    println(seed);
    println(i);
    
    long[] new_distribution = mcg(n, a, m, seed);
    seed= gen.nextInt(1, 56879);
    
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
  
  
  DiscreteRandomVariable rv = RV.makeDiscreteRV(highest_numbers);
  
  long ev = (long) rv.expectedValue();
  long v = (long) rv.variance();
  
  
  println("Sample size of each uniform distribution: " + input_size);
  println("Number of simulations: " + x+"\n");
  println("Highest range: ");
  println("Highest_floor: " +   lowest_highest);
  println("Highest_ceiling: " +  highest_highest);
  
  println("Expected value of highest numbers: " +  ev);
  println("Variance of highest numbers: " +  v);
  
  String results = Integer.toString(input_size) +", " + Integer.toString(x) +", "+Long.toString(lowest_highest) +", "+Long.toString(highest_highest) + 
                  ", "+Long.toString(ev) +", "+Long.toString(v);
                  
  println("\nData to write: " + results);
  try {
  bw.write(results);
  }
  catch (Exception e) {
    
  }
  
}

long findHighest(long[] nums) {
  
  long highest=0;
  
  for (int i=0; i<nums.length; i++) {
    if (nums[i]>highest) {
      highest=nums[i];
    }
  }
  
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
