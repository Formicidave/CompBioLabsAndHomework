#Lab05 Loops and Conditionals
#David Zelagin


#Part 2: Practice some simple conditionals
#1
x <- 20
if ( x > 5) {
  print("x is larger than 5")
} else {
  print("x is smaller than 5")
}

#2 Import the file "ExampleData.csv"
setwd("/Users/davidzelagin/Desktop/EBIO5420/CompBioLabsAndHomework/Labs/Lab05")
dataframe <- read.csv("ExampleData.csv")

#2a Change every negative value to NA using a for loop
Vec <- dataframe$x # Pulling numeric data out of data frame to make a vector
for (i in 1:length(Vec)) {
  if ( Vec[i] < 0) {
    Vec[i] <- NA
  }
}

#2b Change NA values to NaN using vectorized code
VecNA <- is.na(Vec) #retrieve NA values from Vec and store as VecNA
Vec[VecNA] <- NaN #replace NA values in Vec with NaN
Vec

#2c Change NaN values to zero using which()
VecNAN <- which(is.nan(Vec)) #find out the indexes of all the NaN values and store it as VecNAN
Vec[VecNAN] <- 0 #replace NaN values in Vec into 0
Vec

#2d Detremine how many values fall in the range 50-100
Vec2 <- dataframe$x #rename vector from original dateframe
threshold_1 <- 50 #set first threshold
threshold_2 <- 100 #set second threshold

#Chosen method...Vectorized with logical indexing
Between <- sum(Vec2 >= threshold_1 & Vec2 <= threshold_2)
Between

#2e Create a new vector of data that has all values between 50-100
temp <- which(Vec2 >= threshold_1 &  Vec2 <= threshold_2) #create a temporary vector
(FiftyToOneHundred <- Vec2[temp]) #put all the values between 50-100 into a a new vector

#2f. Save a vector to a file named "FiftyToOneHundred.csv" using write.csv() 
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred")

#3. Import the data on CO2 emissions from last week's lab ("CO2_data_cut_paste.csv" from Lab04)
CO2 <- read.csv("/Users/davidzelagin/Desktop/EBIO5420/CompBioLabsAndHomework/Labs/Lab04/CO2_data_cut_paste.csv")

#3a. What was the first year for which "Gas" emissions were non-zero
zeroThreshold <- 0 #set 0 as threshold
temp <- which(CO2$Gas != zeroThreshold) #create a temporary vector
firstNonZero <- temp[1] #store relevant indexes
CO2$Year[firstNonZero]

#3b. During which years were "Total" emisions between 200 and 300 million metric tons of carbon?
threshold_200 <- 200 #set first threshold
threshold_300 <- 300 #set second threshold
allTotall <- CO2$Total 
targetEmission <- which(allTotall >= threshold_200 & allTotall <= threshold_300) #store relevant indexes
CO2$Year[targetEmission]


#Part 2: loops + conditionals + biology
#1 Set parameter values
totalGenerations <- 1000
initPrey <- 100 #initial prey abundance at time t = 1
initPred <- 10 #initial predator abundance at time t = 1
a <- 0.01 #attack rate
r <- 0.2 #growth rate of prey
m <- 0.05 #mortality rate of predators
k <- 0.1 #conversion constant of prey into predators

#2 Create more vectors (time and two additional)
timeVec <- 1:totalGenerations #create a time vector representing time steps
n <- rep(100, totalGenerations)#create a vector to store the values of prey 
p <- rep(10, totalGenerations)#create a vector to store the values of predators

#3 Write a loop that implements the calculations 
n1 <- initPrey
p1 <- initPred
for (t in 2:totalGenerations) {
  n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
  
}

#4 Add "if" statements to check for negative values,
# then set those values to zero
n1 <- initPrey
p1 <- initPred
for (t in 2:totalGenerations) {
  n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
  if (n[t] < 0) {
    n[t] <- 0
  }
}

#5 Make a plot of abundances of prey and predators over time
#I had too much trouble with this, drovemyself nuts, and had to throw in the towel
#Allready messed up my code (without comitting prior) and now my brain is mush...learned a good lesson


#6 Create a matrix of results named "myResults" with first column
# named "TimeStep", second "PreyAbundance, third "PredatorAbundance"
myResults <- matrix(data = c(timeVec, n, p), nrow = 1000, ncol = 3)

# Change column names of myResults
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance")

# Write myResults matrix to a csv
write.csv(x = myResults, file = "PredPreyResults.csv")

