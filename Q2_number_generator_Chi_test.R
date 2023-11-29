#1Using chi squared test to check that Random number generator runif follows a uniform distribution

siglevel <- 0.05 #significance level
intervals <- 10 #intervals
df <- intervals - 1 #degrees of freedom
cV <- qchisq(1 - siglevel,df) #cV = critical value

trueCount <- 0
falseCount <- 0
testCount <- 0

experiment <- function(){
  expectedValue <- 1000/intervals
  sampleRN <- runif(1000, min = 0, max = 1)#create random numbers using runif()
  failToReject <- FALSE #fail to reject the Ho(null hypothesis) that the sample of random numbers "sampleRN" is has a uniform distribution
  intervals <- table(cut(sampleRN, intervals))
  testChi <- 0
  for (val in intervals)
    testChi <- testChi + ((val - expectedValue)^2/expectedValue)
  if (testChi <= cV){
    failToReject <- TRUE
    trueCount <<- trueCount + 1} 
  if (testChi > cV){
    failToReject <- FALSE
    falseCount <<- falseCount + 1}
  testCount <<- testCount +1
}

replicate(10000, experiment())#repeat experiment 10000 times
propNullRejected <- falseCount/testCount
print("Proportion of experiments where we reject the null hypothesis:")
print(propNullRejected)
