set.seed(500):

This command sets the seed for the random number generator. By fixing the seed at 500, it ensures that the sequence of random numbers generated in subsequent operations remains consistent. 

number_of_simulations <- 10000:

This line defines a variable number_of_simulations and assigns it the value 10,000. It represents the total number of simulations or repetitions to be conducted in the experiment. 

hits <- numeric(number_of_simulations):

This line creates an empty numeric vector named hits with a length equal to number_of_simulations. This vector will later store the count of ‘hits’ (instances of drawing the card numbered 1) in each simulation.

for (i in 1:number_of_simulations) { ... }:

This initiates a 'for' loop that iterates from 1 to the specified number_of_simulations. The subsequent code within the curly braces is executed in each iteration.

cards <- sample(1:100, 100):

In each iteration of the loop, this line generates a random sample of 100 numbers from the range 1 to 100, simulating the process of drawing 100 cards from a deck. The variable ‘cards’ stores this random sample.

hits[i] <- sum(cards == 1:100):

This line calculates the count of ‘hits’ in the current simulation. It sums up the occurrences where the drawn cards match the card numbered 1 to determine how many times the desired card is drawn. The result is stored in the ‘hits’ vector at the corresponding index i.

expected_value <- mean(hits):

This line calculates the expected value by taking the mean of the ‘hits’ vector. It represents the average number of ‘hits’ across all simulations, providing an estimate of the central tendency of the outcomes.

variance <- var(hits):

This simply computes the variance of the ‘hits’ vector, which measures the spread or variability in the number of ‘hits’ when accounting for each  simulation.

print(expected_value):

This line displays the average number of ‘hits’ across all simulations.

print(variance):

This Outputs the measure of variability in the number of ‘hits’ across every simulation.
