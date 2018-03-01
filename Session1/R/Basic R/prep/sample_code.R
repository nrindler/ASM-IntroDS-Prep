#' Sample code from R Basics Presentation
#' Sept 2017
#' Created by DataViz My 
#' @author Nadav Rindler and Shak Hassan

#Variable assignment
a = 49  #numeric
sqrt(a) 

b <- "The dog ate my homework" #character
sub("dog","cat",b)

c <- (1+1==3)  #logical
c


#vector
v <- seq(1:10)
v

#matrix
m <- matrix(1:20, nrow=5,ncol=4)
m

#vector from matrix row
w <- m[1,]
w

#vector from matrix column
x <- m[,1]
x

#array
a <- array(c('green','yellow'),dim = c(3,3,2))
a

#list
doe <-  list(name="john",age=28,married=F)
doe
doe$name
doe[1]
doe[[1]]

#data frame
Galactic <- data.frame(
  Group = c("Stormtrooper", "The Resistance","Jedi"), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Goodness = c(FALSE,TRUE,TRUE)
)
Galactic
Galactic[,2:3]
Galactic[,c("height","weight")]

#built-in constants
letters
month.name
month.abb
pi

#built-in functions
sqrt(64)
round(3.141593, digits=2)
strsplit("dengue", "")
toupper("hello world")
paste("Today is", date())

#user input
my.name <- readline(prompt="Enter your name: ")

#others
help.search("barplot")
?help #eg : ?mean

#Environment
getwd() #print working directory
setwd() #set working directory

#Install packages
#install.packages("PackageNameCaseSensitive")
#library(PackageNameCaseSensitive)

#delete object
rm(a) #deletes object a


