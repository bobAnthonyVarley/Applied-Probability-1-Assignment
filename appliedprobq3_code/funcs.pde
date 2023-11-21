import java.util.Random;

//countafterhalfwaypoint

boolean method1(int n, int POD) {


  //third arg is 2^31
  long[] nums = mcg(n, 16807, (0x80000000 -1), gener.nextLong(1, 100000) );

  //println("all initialised");
  
  long recorded_highest=0;
  
  for (int i=0; i<POD; i++) {
    
    if (nums[i] >recorded_highest) {
      recorded_highest = nums[i];
    }
  }
  
  //drawbarchart(nums, highest,guess_highest);
  
  boolean guess=false;
  //ie, guess is wrong
  
  
  
  
  //guess_highest starts as the highest number from 0 to n/2
  //guess_highest is the highest number found after starting to select numbers 
  
  //drawbarchart(nums, highest, guess_highest);
  
   
   
   long selected_highest = 0;//findHighest(nums);
   for (int i=POD; i<n; i++) {
    
    if (nums[i] > recorded_highest) {
      selected_highest = nums[i];
      
      //break loop
       i = n + 1;
    }
  }
  
    //println("-----------------");
   //println("Current highest: "+selected_highest);
  // println("guess highest:   "+recorded_highest);
  // println("-----------------");
   
   //selected highest will only be changed if it is higher than the recorded highest
  if (selected_highest==0) {
    return false;
  }
  else {
   return true; 
  }
 
  
  

}




boolean has(float[] nums, float x) {
  
  for (int i=0; i<nums.length; i++) {
    
    if (nums[i]==x) {
      return true;
    }

  }
  
  
  
  return false;
  
  
}






boolean method3(int n) {
  
  float highest=0;
  float second_highest=0;
  
  Random gen = new Random();
  
  float[] nums = new float[n];
  
  //set array to random numbers between 0 and n
  for (int i=0; i<n; i++) {
    
    float rand = gen.nextFloat(0, n);
    while ( has(nums, (float) rand) ) {
      rand = gen.nextInt(1, n+1);
    }
    
    nums[i] = (float) rand;
      
    //println("if ( "+nums[i]+ " > "+ highest + ")");
    
    if (nums[i]>highest) {
      
      if (highest!=0) {
        second_highest = highest;
      }
      
      highest=nums[i];
      highest_position = i;
      
      
    }
    
    println(i);
  }
  
  println("all initialised");
  
  float[] temp = new float[n/4];
  float guess_highest=0;  
  
  
  for (int i=0; i<temp.length; i++) {
    temp[i] = nums[i];
    if (nums[i]>guess_highest) {
      guess_highest=nums[i];
    }
  }
  
  
  
  float guess_mean = mean(temp);
  
  println("guess mean, guess highest, second highest, highest: " + guess_mean + " " + guess_highest  + " " +  second_highest  + " " +  highest);
  
  //now, get the mean from 1 to n/4, get the highest from 1 to n/4, and the TOTAL highest as a percentage
  float how_much_larger_highest_is_than_mean = highest / guess_mean;
  float how_much_larger_highest_is_than_guess_highest = highest / guess_highest;
  
  // do the same with second highest, find out the range between highest and second highest as a percentage of the guess_highest from 1 to n/4
  
  float how_much_larger_second_highest_is_than_mean =          second_highest / guess_mean;
  float how_much_larger_second_highest_is_than_guess_highest = second_highest / guess_highest;
  
  float highest_range = how_much_larger_highest_is_than_guess_highest - how_much_larger_second_highest_is_than_guess_highest;
  float mean_range = how_much_larger_highest_is_than_mean - how_much_larger_second_highest_is_than_mean;
  
  println(" % difference between highest and second highest as a percentage of guess_highest: " + highest_range);
  println(" % difference between highest and second highest as a percentage of mean: " + mean_range);
  
  
  
  
  return true;
}

float mean(float[] nums) {
  
  float count=0;
  
  for (int i=0; i<nums.length; i++) {
    count+=nums[i];
    
  }
  
  count/= nums.length;
  
  return count;
  
}



void callmethods(int m) {
  
  //int m = 10; //number of tests
  for (int i=0; i<m; i++) {
    
    boolean res= true;//method1(N);
    if (res) {
      wincount++;
    }
    else {
      losscount++;
    }
    
  }
  
  float div = (float) m;
  float w = (float) wincount;
  float l = (float) losscount;
  
    println("number of wins: "+ wincount+ "   == " +w/div);
    println("number of losses: "+ losscount + "   == " +l/div);
    println("number of times highest was in first half: " + highest_in_first_half + "   == " +( (float) highest_in_first_half) / div);
  
  
  
  
  noLoop();
  
}
