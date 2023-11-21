
boolean method2(int n) {
  long[] nums = mcg(n, 16807, (0x80000000 -1), gener.nextLong(1, 5763) );
  
  int pos = gener.nextInt(1, n-1);
  
  long highest = findHighest(nums);
  long choice = nums[pos];
 
   //boolean res = (highest==choice);
 
   return (highest==choice); 
  
}

void many_method_2(int no_of_sims, int n) {
  
  
  int wins = 0;
  int losses = 0;
  
  for (int i =1; i<no_of_sims; i++) {
    if (method2(n) ) {
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
  
  //println("Number of wins: " +  wins + " == " + ( (float) wins/ (float) no_of_sims ) );
  //println("Average position of highest number in array: " + ( (float) average_pos_of_highest / ( (float) (number_of_simulations) ) ) );
  println( ( (float) wins/ (float) no_of_sims ) );
  //println("Number of losses: " +  losses + " == " + ( (float) losses / (float) number_of_simulations ) );
  
  
  

  
}


void many_method_3(int no_of_sims, int n, int POD_num, int POD_denom) {
  
  
  int wins = 0;
  int losses = 0;
  
  //132840659, 134217720
  for (int i =1; i<no_of_sims; i++) {
    if (method3(n, 132840659, 134217720, POD_num, POD_denom) ) {
      wins++;
    }
    else {
      losses++;
    }
  }
  
  
  println("Number of wins: " +  wins + " == " + ( (float) wins/ (float) no_of_sims ) );
  
  
  
  
  
  
}
