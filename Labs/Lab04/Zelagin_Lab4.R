#Lab04 For Loops
#David Zelagin

#step #1: Write a "for loop" that prints the word "hi" to the console 10 times

for (i in seq(1:10)) {
  print("hi")
}


#step #2: Tim's piggy bank balance after every week for 8 weeks

startingMoney <- 10 #Tim starts with $10 in his piggy
weeklyAllowance <- 5 #Tim gets $5 a week from his parents
packsGum <- 2 #Tim buys 2 packs of gum every week
priceGumPerPack <- 1.34 #Each pack of gum costs $1.34
weeks <- seq(1:8) 

eachWeek <- length(weeks)
weeklyBalance <- rep(0,eachWeek)
weeklyBalance[1] <- startingMoney + weeklyAllowance - (packsGum * priceGumPerPack)

#Loop. Starting with WeeklyBalance[2]. This loop takes the remaining balance from the previous week, adds weekly allowance, 
#subtracts gum expenditure, and store THAT value in WeeklyBalance.
for ( i in 2:eachWeek ) {
  weeklyBalance[i] <- weeklyBalance[i-1] + weeklyAllowance - (packsGum * priceGumPerPack)
}
print(weeklyBalance)

#step #3: Conservation biologist population rate problem

populationGrowthRate <- (-.05) # population shrinks by 5% each year
startingPop <- 2000 #starting pop is 2000 individuals
years <- seq(1:7)

eachYear <- length(years)
populationByYear <- rep(0, eachYear)
populationByYear[1] <- startingPop + (startingPop * populationGrowthRate)

#Loop. Prints the expected population size of a population starting with 2000 individuals shrinking 5% each year, for seven years.
for (i in 2:eachYear) {
  populationByYear[i] <- populationByYear[i-1] + (populationByYear[i-1] * populationGrowthRate)
  print(populationByYear[i])
}

#step #4: Discrete-time logistic growth equation

K <- 10000 #carrying capacity
r <- 0.8 #intrinsic growth rate
time <- seq(1:12)

totalTime <- length(time)
abundance <-  rep(0, totalTime)
abundance[1] <- 2500

#Loop. Runs the discrete-time logistic growth equation 11 times, starting with t=2.
for (t in 2:totalTime) {
  abundance[t] = abundance[t-1] + ( r * abundance[t-1] * (K - abundance[t-1])/K )
  print(abundance[t])
}
print("The predicted value of n[12] is:"); print(abundance[12])

#PART #2
#lab step #5: 4 parts

##5a: Repeat "0" 18 times
vec <- rep(0, 18)vec

##5b: Loop, storing 3 times the "ith" value of i in its "ith" spot
for (i in seq(1:18)) {
  vec[i] <- 3 * i
}
print(vec)

##5c: Create new vector, same as 5a, except the first value is "1"
vec2 <- rep(0, 18)
vec2[1] <- 1

##5d: Loop, storing the new value as 1 + twice the value in the previous vector position
for (i in 2:18) {
  vec2[i] <- 1 + (2 * vec2[i-1])
}
print(vec2)

#lab step #6: Fibonacci sequence

Fib <- rep(0,20)
Fib[2] <- 1

#Loop, printing the first 20 numbers of the Fibonacci sequence. starting with 0
for (i in 3:20) {
  Fib[i] <- Fib[i-1] + Fib[i-2]
}
print(Fib)

#lab step #7: NOTE: Data is already stored in vectors from step 4. Below is the plot.
plot(time, abundance)
