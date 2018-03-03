#' Introduction to R Programming - Fundamentals
  #' ASM - Introduction to Data Science Workshop
  #' Session 02
  #' March 24, 2018
#' 
#' Attribution
  #' @author Geoffrey Kee for DataViz My / HELP University
  #' Created for Data Science Personalized Learning On-Ramp Course, Sept 2017
  #' Materials used under Creative Commons Attribution 4.0 International License
  #' Modified by Nadav Rindler @nrindler



#### Control Structures #### 

# A control structure is a block of programming that analyzes variables 
# and chooses a direction in which to go based on given parameters.

# Control Structures can be divided into two main categories:
# Conditional statements
# Repeat Loops


#### Conditional statements ####

# In R, as the other programing languages, if-else statement is used to evaluate
# a condition (simple or complex) to determine which parts of code should be executed.

# if (condition) {
#   statement1
# } else {
#   statement2 }

if(students[1,]$Age > 40 | students[1,]$Graduated == FALSE){
  print ("Is not eligible!!")
}else{
  print ("Is eligible!!")
}

# Nested if
x = -5
y = 0
z = -3

if(x > 0){
  if(y == 10){
    print ("M1_1")
  }else{
    print ("M1_2")
  }
}else if(x == 0){
  if(y <= 0){
    print ("M2_1")
  }
  else{
    print ("M2_2")
  }
}else{
  print("M3")
}
In [ ]:
  
  # ifelse
  ifelse(x == 5, 1, -1)
ifelse(x != 5, 1, -1)

#### Loops ####
# Loops repeats given statements for specified or unspecified number of repetition.

# FOR loop
# implements a loop with specified number of repetitions.

# for (variable in sequence){
#   statements
# }

for(i in 1:5){
  print (paste(i, ") Hello World !"))
}

for(name in names(students)){
  print (paste("Column ", name, ": "))
  print (students[[name]])
}

# WHILE loop
# It repeats statement(s) while the given condition is true.

# while(condition){
#   statements
# }

cnt = 1
while(students[cnt,]$Graduated == TRUE){
  print (students[cnt,])
  cnt = cnt + 1
}

cnt = 1
while(students[cnt,]$Graduated == TRUE | students[cnt,]$Age < 20){
  print (students[cnt,])
  cnt = cnt + 1
}

#### Functions ####

# Two kinds of functions are being used in R:
# Built-in function (e.g. c(), data.frame(), print() )
# User-defined functions

#   myfunction <- function(arg1, arg2, ... ){
#     statements
#     return (object)
#   }

# A simple function to multiply a vector of numbers
multiply <- function (x){
  if(length(x) == 0 | is.vector(x) == FALSE){
    NULL
  }
  else{
    m = 1
    for ( num in x){
      m = m * num
    }
    return(m)
  }
}

numbers = c(2, 4, 6, 10)
multiply(numbers)

#### Quiz ####
# 1. Write a function to return x^y (x powered by y).
In [ ]:
  powerxy <- function(){
    if(base == 0){
      0
    }else if(pow == 0){
      1
    }else{
      res = 1
      for(i in 1:pow){
        res = res * base
      }
      return (res)
    }
  }

powerxy(2, 5)
powerxy(5, 2)
powerxy(pow=5, base=2)
powerxy(pow=10)
powerxy(base=10)

#### Statistics ####

# Generate random numbers
# R can generating random numbers with particular distributions.

# BINOMIAL Distribution
# rbinom(n, size, prob)
# n: number of observations
# size: number of trials (zero or more)
# prob: probability of success on each trial

rbinom(10, 4, 0.5)
rbinom(10, 4, 0.5)
rbinom(10, 4, 0.5)

# Geometric Distribution
# rgeom(n, prob)
# n: number of observations
# prob: probability of success on each trial

rgeom(10, 0.5)
rgeom(10, 0.5)
rgeom(10, 0.5)

# Poisson Distribution
# rpois(n, lambda)
# n: number of observations
# lambda: vector of (non-negative) means

rpois(10, 0.5)
rpois(10, 0.5)
rpois(10, c(0.75, 0.5, 0.25))

# Exponential Distribution
# rexp(n, rate)
# n: number of observations
# rate: vector of rates

rexp(10, rate = 1)
rexp(10, rate = 5)
round(rexp(10, rate = c(1, 3, 2)), 3)

# Normal Distribution
# rnorm(n, mean, sd)
# n: number of observations
# mean: vector of means
# sd: vector of Standard Deviations

rnorm(10, mean = 0, sd = 1)
rnorm(10, 5, 2)
rnorm(10, 5, 0.2)

# Uniform Distribution
# runif(n, min, max)
# n: number of observations
# min: lower limit of the distribution. Must be finite.
# max: upper limit of the distribution. Must be finite.

runif(10, min = 0, max = 1)
runif(10, min = 0, max = 5)
round(runif(10, min = 4, max = 6), 4)

# Exercise: Make a list of 3 sets of 25 random values following normal, uniform and poisson distribution respectively.

#### Statistical Tests ####

# Suppose that there are two sets of data. Using Statistical Tests it is possible for us to know whether those sets are significantly different or not.
# Statistical tests give a p-value.
# If p-value < 0.05, the given sets are significantly different.

# T-Test 
# t.test performs one and two sample t-tests(student test) on vector(s) of Normal distributed data.
x = rnorm(1000, 10, 2)
y = rnorm(1000, 10, 3)

t.test(x, y, paired=TRUE)
ttest.res = t.test(x, y, paired=TRUE)
names(ttest.res)

ttest.res$p.value
round(ttest.res$p.value, 4)

if(ttest.res$p.value < 0.05){
  print ("Two sets are significantly different.")
}else{
  print ("Two sets are NOT significantly different.")
}

#### Graphing ####

# Data Visualization plays an important role in making data and data analysis results more understandable.
# R provides strong packages providing various types of graphs for different purposes. 

#We favor ggplot2 package. Here's why:
# More elegent & compact code
# More aesthetically pleasing
# More powerful and flexible</font> 

#In ggplot2, the focus is not on drawing lines and points, but on creating data visualisations, and it shines in rapid data exploration. In fact, it has become the go-to tool for flexible and professional plots in R. 

# A basic ggplot2 plot consists of:
# - data: Must be a data.frame
# - aesthetics: In ggplit jargon, aesthetics means "something you can see", and it's used to describe visual
# - characteristics that represent data, such as: color, size, shape, and position of x, y.
# - geometry: Geometries of plotted objects (points, lines, polygones, etc.)</font> 

# qplot is a simplified ggplot for quick charting

library('ggplot2')

x = seq(1, 100, 0.5)
y= x^3

qplot(x, y, colour=x, main="Main Title", xlab="Horisontal Axis", ylab="Vertical Axis")

qplot(mpg, wt, data = mtcars, geom = "auto")

qplot(factor(cyl), hp, data = mtcars, geom = "boxplot")

# For more advanced plots, use ggplot

ggplot(data=mtcars) +
  geom_point(aes(x=mpg, y=wt, color=cyl)) +
  labs(title="Car Data",
       subtitle="MPG vs. Weight",
       x="MPG", y="Weight")


#### Other Built-In R Functions #### 

# Constants
letters
month.name
month.abb
pi

# Built-in functions
sqrt(64)
round(3.141593, digits=2)
strsplit("dengue", "")
toupper("hello world")
paste("Today is", date())

# User input
my.name <- readline(prompt="Enter your name: ")

