#' R Basics
#' @author Geoffrey Kee, modified by Nadav Rindler

#' Intro to R Programming
  
#' R is a software environment for data analysis, statistical computing, and graphics.
#' It is also a programming language.
#' Like Python, R is free and open-source.
#' Compared to Python, R's syntax is more natural to use and allows you to complete data analyses in fewer lines of code.
#' It comes with base package and the rest should be installed
#' More than 10,000 packages are available in CRAN

#### Basics ####

# Get Working Directory -- which folder are you working from? 
getwd()

# Set Working Directory -- which folder do you want to work from 
setwd('Your/FilePath/Here')
  # Note that for Windows users, you MUST use backslashes ('/') in all file paths

# Install packages
#install.packages("PackageNameCaseSensitive")

# Activate package at the beginning of each session 
#library(PackageNameCaseSensitive)

# To assign values to an object
num1 <- 5  #Using a carrot "<-"
name = 'John' #Using a single equals sign "="
x = 1:20

# To return the values of R objects, just type the object name
num1
name
x

# NOTE: R is case sensitive
NUM1

# NOTE: A single equals sign "=" is for variable assignment.
    # A double equals sign "==" tests for equivalence!
num1 == 4

# Your turn: Create an object called "z" and set it equal to a sequence of integers from 5 to 15


# Concatenate two or more strings
greeting = paste('Hello', name, '!!', sep=" ")
greeting
  # What does the "sep=" argument do?

# List all defined objects
ls()

# Remove an object
rm(num2)

#### Data Types ####

#' Elements of R objects can be one of 5 data types:
  #' character: "a", "swc"
  #' numeric: 2, 15.5
  #' integer: 2L (the L tells R to store this as an integer)
  #' logical: TRUE, FALSE
  #' complex: 1+4i (complex numbers with real and imaginary parts)

#### Data Structures ####

# All data in R is stored as an object

# Objects can be various data structures, such as:
  # vector
  # list
  # matrix
  # data frame
  # factors

# Base data structures can be organized by their dimensionality 
# and whether they are homogeneous or heterogeneous
  # Homogenous: all elements must be of the same type
  # Heterogenous: the elements can be of di???erent type

#### Vector ####

# A vector is a series of elements, stored together as a single object.
# Vectors can be created in R using the c() function, which stands for combine.
# Vectors are ordered, so you can select elements from a vector by their position.
# Note: All elements of a vector should be of the same data-type.

# Create  a vector
weights = c(4, 2, 0, 8.65, 93, 4, 9, 3)
weights

countries = c("Malaysia", "Japan", "Iran", "Singapore", "Germany")
countries

# Select the 3rd element from the countries vector
countries[3]

# Select the 2nd, 3rd, and 4th elements from the countries vector
countries[2:4]
countries[4:2]

# To show 1st and 4th elements of the weights vector
weights[c(1, 4)]

#To show all elements of the countries vector EXCEPT the 1st and 4th
countries[-c(1, 4)]

# What Data Type?
class(weights)
class(countries)


# How many elements
length(countries)
In [ ]:
# To name elements of a vector
names(weights) = c("Apple", "Orange", "Kivi", "Watermelon", "Strawberry", "Blueberry", "Banana", "Durian")

weights
weights["Watermelon"]
In [ ]:
animals = c(Lion = 3, Horse = 12, Fish = 53, Eagle = 6)
is.vector(animals)
animals
In [ ]:
animals[!animals < 10]
# What does the "!" mean?
In [ ]:
# Your turn: Change the names of the animals vector -- pick 4 new animal names
In [ ]:
# Computations on vectors are performed element-wise
a = seq(20, 30)
b = seq(1, 6, by = 0.5)
c = seq(1, 10, by = 2)

a
b
c

# Computations on vectors are performed element-wise - Continue
a - b
a + c
d = c * 3

c
d

sum(c)
sum(d)

# Add elements to a vector
  #To add additional elements to a vector, use the c() function to combine the elements.
e  <- c(a,b,1)
e

# Your turn: Select the 4th and 6th elements of vector 'e'



#### List ####

# A list can be considered a vector where its elements can be of any data type, including lists.
# Lists can be defined by list() function.
# Lists sometimes called "recursive" vectors, because lists can contain other lists.
# List elements often have names.
# [[ and $ to subset and extend lists

mylist = list(attr1 = 3, attr2 = TRUE, attr3 = NA, attr4 = "Kuala Lumpur")

names(mylist)

#Select list elements
mylist$attr1
mylist[[1]]
mylist[1]

# A list can contain another list
mylist2 = list(attr1 = 3, attr2 = TRUE, attr3 = NA, attr4 = "Kuala Lumpur", 
               city=list(city1="KL", city2="PJ", city3="JB"))
mylist2

# Select element from nested list 
mylist2$city$city2

#### Matrix ####

# A matrix is a collection of data elements of the <font color=red>same data type</font> arranged in a two-dimensional rectangular layout.
# In mathematics, a matrix is shown by its name followed by Nrows * Ncols (e.g. A2 ** 3).
# R can hold a matrix using matrix() function.

#Explore R's documentation / help page for the matrix() function
?matrix

# How to create a matrix?
m = matrix(c(4, 7, 12, -5, 6, 0, 5, 7, 1, 103, 21, -9), 
           nrow = 3, 
           ncol = 4)
m

# Your turn: Copy the code from the cell above and add a fourth argument "byrow=TRUE". 
  # What does the "byrow" argument do?

# To name dimensions (rows and columns)
dimnames(m) = list(
  c('r1', 'r2', 'r3'),
  c('col1', 'col2', 'col3', 'col4'))
m

# Select elements by their row and column indexes: matrix_name[row_number, col_number]
m[2, 3]

# Select all elements in 2nd row
m[2,]

# Select all elements in 3rd column
m[, 3]

# Select multiple rows and columns from matrix
m[c(2, 3), c(1, 4)]

# Transpose matrix
t(m)

# Matrix multiplication
m %*% t(m)

#### Factors ####

# Factors are used to represent categorical variables.
# Factors are integer vectors. 
# R sorts levels alphabetically 
# factor() function is being used in R to make a factor.

# How to make a vector in accordance to a vector of strings?
day <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun') 
day_factor = factor(day) 
day_factor
str(day_factor)

# To make the vector values sorted as we want
day <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun') 
day_factor = factor(day, levels = day) 
day_factor
str(day_factor)

#### Data Frame ####

# To hold observations (entities) data, stronger data structure is needed.
# A DataFrame is used for storing data tables.
# It is a list of vectors of equal length. 
    # In fact, we can create a DataFrame by combining vectors.
# DataFrames are suitable to work with DataSets.

# In DataFrames:
    # every row represents an obsservation (entity)
    # every column represents value of an attribute of an observation (e.g. name, age, Gender, etc)
    # Can contain elements of di???erent types but elements in the same column must have the same type

# To make a DataFrame
# 1. Combine multiple vectors using data.frame() function
Name = c("Amin", "Nur", "John", "Sara")
Age = c(35, 18, 53, 28)
Graduated = c(TRUE, FALSE, FALSE, TRUE)
students = data.frame(Name, Age, Graduated)# Strings will be stored as factors
students

# View structure of data frame
str(students)
    # What are the data types of each column in the data frame?


# You can choose whether to store character variables as data type character or factor
students2 = data.frame(Name, Age, Graduated,  stringsAsFactors = FALSE) # Strings will NOT be stored as factors
str(students2)

# Select specific rows and columns from the data frame: df_name[row_number, col_number]
students[2, 1]
students[2, c(1,3)]

# There are many ways to select columns from a data frame 
students[,1]
students[,'Name']
students$Name
students[1]
students[[1]]
students['Name']
students[['Name']]

# Select multiple data frame columns by *combining* them c()
students[,c('Name','age')]

# Select data frame rows where condition is TRUE
students[students$age>30,]

# Change values in a row of a data frame
students2[1,] = list(Name = "Amin_2", Age = 36, Graduated = TRUE) 
students2

# Change values in a column of a data frame. Remember, columns are just vectors!
students2[, 2] = c(37, 29, 67, 19)
students2

# Add column to a data frame using assignment
height = c(177, 162, 168, 170)
students$Height = height
students

# Add column to a data frame using cbind()
Weight = c(83, 60, 75, 80)
students = cbind(students, Weight)
students

# Add row to a data frame using rbind()
tmp1 = data.frame(Name = "Ali" , Age = 21, Graduated = FALSE, Height = 169, Weight = 68)
students = rbind(students, tmp1)
students

# Number of rows?
nrow(students)

# Number of columns?
ncol(students)

# Dimensions?
dim(students)

# How to sort a DataFrame based on one of its columns? 
    # order() function helps

rank = order(students$Age) # order students by their age
rank
students[rank,]
  # Are the students ranked by age ascending (low>>high), or age descending (high>>low)? 


#To sort descending, add the "decreasing=TRUE" argument
students[order(students$Age, decreasing = TRUE),]


#### More Data Frame Operations ####

# Read data from file (e.g. CSV file)
?read.csv()

#R comes with some built-in data frames helping us to enhance our analysis skills. 
#Try looking into the following data frames:
    # women
    # mtcars
    # USArrests
    # chickwts
    # airquality

head(mtcars, 5) # Print first 5 rows of mtcars

tail(USArrests, 4) # Print last 4 rows of USArrests

colnames(USArrests) # column names

rownames(tail(mtcars, 7)) # row names

#### Missing values ####
# Missing values in R are denoted by either NA or NaN.
# NaN is used for undefined mathematical operations.
    # is.nan() can be used to check for it.
# NA is usually used for everything else
    # is.na() can be used to check for it.
# NaN value is also NA, but the converse is not true.

testvals = c(4, 0 , -7, NaN, 23, NA, -60)
testvals

is.nan(testvals)
is.na(testvals)

# How to remove NA values?

# using is.na() function:
bads = is.na(testvals)
bads
!bads
testvals[!bads]

# using complete.cases() function:
goods = complete.cases(testvals)
goods
testvals[goods]

#### Quiz ####
# Write code to show following results:
# 1. Using USArrests dataset, those 3 states having highest Murder rate.
# 2. Using mtcars dataset, the strongest car that has 3 gears.
# 3. Using mtcars dataset, average of horse power (hp) of those cars having 4 gears and 6 cylindars (cyl).

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

