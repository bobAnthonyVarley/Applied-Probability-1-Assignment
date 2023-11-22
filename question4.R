
set.seed(500)  
number_of_simulations <- 10000  
hits <- numeric(number_of_simulations)
for (i in 1:number_of_simulations) {
 cards <- sample(1:100, 100)  
 hits[i] <- sum(cards == 1:100)  
}
expected_value <- mean(hits)
variance <- var(hits)
print(expected_value)
print(variance)
