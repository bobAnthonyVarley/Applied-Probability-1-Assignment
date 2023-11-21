

void drawbarchart(float[] nums, float highest, float guess_highest) {
  
  
  float yax_width = width*0.02;
  float yax_height = height*0.9;
  
  float xax_width = width*0.9;
  float xax_height = height*0.02;
  
  fill(#000000);
  
  
  //y axis
  rect( (int) yax_width, (int) xax_height, (int) yax_width, (int) yax_height);
  //x axis
  rect( (int) yax_width, (int) yax_height+xax_height, (int) xax_width, (int) xax_height);
  
  //fill(#0000FF);
  //rect( (int) yax_width, (int) 200, (int) xax_width, (int) xax_height);
  
  rect(10, 10, 10, 10);
  
  float barwidth = (xax_width - yax_width) / nums.length;
  
  fill(#0000FF);
  
  for (int i=0; i<nums.length; i++) {
    
    
    if (nums[i]==highest) {
      fill(#FF0000);
      rect( ((int) yax_width*2 ) + barwidth*i, (int) yax_height+xax_height, barwidth, (int) (-(nums[i]/highest)*yax_height) );
      fill(#0000FF);
      
    }
    else if (nums[i]==guess_highest) {
      fill(#AAAA00);
      //println("gh called -----------------------------------------------------------------------------");
      rect( ((int) yax_width*2 ) + barwidth*i, (int) yax_height+xax_height, barwidth, (int) (-(nums[i]/highest)*yax_height) );
      fill(#0000FF);
      
    }
    else {
     rect( ((int) yax_width*2 ) + barwidth*i, (int) yax_height+xax_height, barwidth, (int) (-(nums[i]/highest)*yax_height) );
    }
    
  }
  
  //draw divider, to split graph in half
  fill(#000000);
  rect( (int) yax_width+ (yax_width/2) + (barwidth*(nums.length/2)), 0, (int) yax_width/3, height);
  
  
  
  
}
