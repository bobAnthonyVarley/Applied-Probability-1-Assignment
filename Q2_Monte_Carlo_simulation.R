MonteCarloSim <- function(n, reruns){
  rerun = vector("integer", reruns) #law of large numbers
  #n = 10
  #repeat for the length of rerun (how many replicates we want. by the law of large numbers the more replicates we do the more accurate we will be)
  for (i in 1:length(rerun)) {
    
    randnums <- runif(n, min = 0, max = 1)
    #assume that all RN are in Range
    allInRange <- TRUE 
    for(j in randnums){ 
      #check if any are out of Range
      if(j < (1/n) || j > (1 - (1/n))){
        allInRange <- FALSE
      }
    }
    rerun[i] <- ifelse(allInRange, 1, 0)
  }
  #calculating the Expected value of the experiments, by getting the mean of values in rerun vector
  ExpVal = mean(rerun)
  return(ExpVal)
}

########## Plots
ExpVal10 = replicate(750, MonteCarloSim(10, 10000 ))
ExpVal100 = replicate(750 , MonteCarloSim(100, 10000))
ExpVal1000 = replicate(750 , MonteCarloSim(1000, 10000))

#Showing distributions using histograms, n = 10,100,1000
hist(ExpVal10, main = "n = 10", xlab = "Net-payoff", col = "green", xlim = c(0, 0.2))
abline(v = mean(ExpVal10), col='yellow', lwd = 2)
hist(ExpVal100, main = "n = 100", xlab = "Net-payoff", col = "red", xlim = c(0, 0.2))
abline(v = mean(ExpVal100), col='yellow', lwd = 2)
hist(ExpVal1000, main = "n = 1000", xlab = "Net-payoff", col = "blue", xlim = c(0, 0.2))
abline(v = mean(ExpVal1000), col='yellow', lwd = 2)

plotLawOfLargeNumbers <- function(n, noExperiments) {#noExperiments = number of experiments we plan to run
  relative_frequencies <- numeric(noExperiments)#setting up size of vector to store relative_frequencies
  mean <- 0
  sum <- 0#initialize sum
  for (currentNoExperiment in 1:noExperiments) { #loop through this code for each extra experiment carried out
    result = MonteCarloSim(n, 1)#record the result
    sum = sum + result
    mean = sum/currentNoExperiment#divide the sum of individual_results by the number of experiments carried out so far to get the relative frequency
    relative_frequencies[currentNoExperiment] = mean#update relative frequency vector to hold the new mean value
  }
  plot(1:noExperiments, relative_frequencies, type = "l", lwd = 1, col = "blue", 
       xlab = "Number of Experiments", ylab = "Relative Frequency of success(X = 1)", 
       main = paste("Law of Large Numbers (n = ", n, ") E(x) settles around ", mean))
  abline(h = mean, col='red', lwd = 1)
  text(noExperiments*3/4, mean + 0.025, labels = paste("E(x) =", mean), pos = 4, col = 'black')
  return (mean)
}

# Run the function for different values of n
n10 = plotLawOfLargeNumbers(5, 80000)
n10 = plotLawOfLargeNumbers(10, 80000)
n100 = plotLawOfLargeNumbers(100, 80000)
n1000 = plotLawOfLargeNumbers(1000, 80000)
n10000 = plotLawOfLargeNumbers(10000, 50000)

