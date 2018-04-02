#' Introduction to R Programming - Fundamentals
  #' ASM - Introduction to Data Science Workshop
  #' Session 01
  #' March 10, 2018
#' 
#' Attribution
  #' @author Geoffrey Kee for DataViz My / HELP University
  #' Created for Data Science Personalized Learning On-Ramp Course, Sept 2017
  #' Materials used under Creative Commons Attribution 4.0 International License
  #' Modified by Nadav Rindler @nrindler



#' Intro to R Programming
  
#' R is a software environment for data analysis, statistical computing, and graphics.
#' It is also a programming language.
#' Like Python, R is free and open-source.
#' Compared to Python, R's syntax is more natural to use and allows you to 
  #' complete data analyses in fewer lines of code.
#' It comes with base packages, additional packages can be installed
#' More than 10,000 packages are available in CRAN


#### 1 - Basics ####

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

# Your turn: Concatenate two strings to read: "Hello World!"


# List all defined objects
ls()

# Remove an object
rm(num2)

#### 2 - Data Types ####

#' Elements of R objects can be one of 5 data types:
  #' character: "a", "swc"
  #' numeric: 2, 15.5
  #' integer: 2L (the L tells R to store this as an integer)
  #' logical: TRUE, FALSE
  #' complex: 1+4i (complex numbers with real and imaginary parts)

#### 3 - Data Structures ####

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

#### 4 - Vector ####

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

# To name elements of a vector
names(weights) = c("Apple", "Orange", "Kivi", "Watermelon", "Strawberry", "Blueberry", "Banana", "Durian")

weights
weights["Watermelon"]

# Create a named animals vector
animals = c(Lion = 3, Horse = 12, Fish = 53, Eagle = 6)
is.vector(animals)
animals

# Return elements of animals vector with name Lion
animals["Lion"]

# Your turn: return elements of animals vector with name Eagle or Fish


# Return elements of the animals vector where values are not less than 10
animals[!animals < 10]
  # What does the "!" mean?

# Your turn: Change the names of the animals vector -- pick 4 new animal names


# Computations on vectors are performed element-wise
a = seq(20, 30)
b = seq(1, 6, by = 0.5)
c = seq(1, 10, by = 2)

a
b
c

# Computations on vectors are performed element-wise
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


# Your turn: Append the values 7, 12 and 14 to the end of vector 'e'



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

# Your turn: Create a 2x2 matrix called 'bday' with the following values: 
  # your birth month; your birth day; your birth year; your age
  # Make sure to fill the matrix values *by row*



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

# Your turn: Make a factor variable called "month" with 12 values - one for each
  # month of the year.  Order the factor levels so that the months are in order
  # from January to December



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
students = data.frame(Name, Age, Graduated)# Note: Strings will be stored as factors
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

data("mtcars")

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

#### EXERCISES ####
# Write code to show following results:
# 1. Using USArrests dataset, find the 3 states with the highest Murder rate.
# 2. Using mtcars dataset, find the strongest horsepower car that has 3 gears.
# 3. Using mtcars dataset, average of horse power (hp) of those cars having 4 gears and 6 cylindars (cyl).







