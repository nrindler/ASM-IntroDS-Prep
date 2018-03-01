###################################
# HANDS-ON EXERCISE: DENGUE DATA SET
###################################

#' R Basics Presentation
#' Sept 2017
#' Created by DataViz My 
#' @author Nadav Rindler & Shak Hassan

### IMPORT DATA ###

# 1 - SET working directory 
setwd("C:/Users/nadav.rindler/Documents/DataViz/DSPL Sept2017/Basic R")
  #Windows computers must use back-slashes "/" not forward slashes
  #check working directory using getwd()

# 2 - READ CSV and view object type
dengue_data=read.csv("Dengue_Cases_Malaysia_2011.csv", header = TRUE, sep = ",")
class(dengue_data)


### EXPLORE DATA ###

# 3 - GET dimension of the data frame - number of rows (1st) & columns (2nd)
dim(dengue_data)

# 4- GET column names
names(dengue_data)

# 5 - GET information about the structure of object
str(dengue_data)

# 6 - VIEW data set
View(dengue_data)

# 7 - GET summary of each column that shows minimum, maximum, and quartiles
summary(dengue_data)

# 8 - Practice selecting elemenets from data frame

  # Select first column by index
  dengue_data[,1]
  
  # Select first column by name
  dengue_data[,"NEGERI"]
  
  # Select first row by index
  dengue_data[1,]
  
  #Select rows where condition is TRUE
  dengue_data[dengue_data$NEGERI == "PERLIS",]

# 9 - COPY the data set, dropping first two columns: NEGERI, Year
weekly_counts <- dengue_data[,3:length(dengue_data)]
  #Index data frame: start at column "3" to exclude non-numeric columns (NEGERI, Year)

# 10 - CALCULATE 2011 total number of dengue cases for each state
  #add this total as a new column to the data.frame(dengue_data)
dengue_data$state_total <- rowSums(weekly_counts)
  #use built-in rowSums function ?rowSums

# 11 - CALCULATE the highest case across all weeks and states
max(weekly_counts, na.rm=TRUE)
  #na.rm statement excludes missing (NA) data

# 12 - CALCULATE the maximum # of cases for each week across all states
    #MARGIN = dimension of data: 1 for columns, 2 for rows
highest_each_week <- apply(weekly_counts, MARGIN=2, max)
  #note : can be written using sapply function: sapply(weekly_statistic, max)


### VISUALIZE DATA ###

# 13 - CHART total dengue cases in each state for the year 2011
    #using "ggplot" package
    #Uncomment first line to install ggplot2 package, if needed

#install.packages("ggplot2")
library(ggplot2)

q <- ggplot(data=dengue_data, #Specify data set
            mapping=aes(x=NEGERI, y=state_total)) + #Set chart X and Y variable
  geom_bar(fill="red", stat="identity") + #Specify chart type (bar chart) and color
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + #Rotate X axis text 90 degrees
  labs(title="Dengue Cases in Malaysia : 2011",
       y="Total Cases", x="Negeri") #Set chart and axis labels
q


### TRANSFORM DATA ###

# 14 - TRANSPOSE data from wide to long
t_matrix <- t(weekly_counts)
dengue_state <- as.data.frame(t_matrix)

# 15 - RENAME variables in dengue_state data set
names(dengue_state) <- dengue_data$NEGERI

# 16 - CREATE and ASSIGN new date variable for the 52 weeks
weeks <- as.Date(paste(2011,1:52,1,sep="-"),format="%Y-%U-%u")
weeks
dengue_state$date <- weeks


### VISUALIZE DATA ###

# 17 - PLOT weekly data for Selangor using ggplot()
t <- ggplot(data=dengue_state, #Specify data set 
            aes(x=date, y=SELANGOR)) + #Set chart's X and Y variables
  geom_line(color="red", size=1) + #Set chart type (line) and line color and size
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + #Rotate X axis text 90 degrees
  labs(y="Total Cases",x="Week",title="Dengue Cases in SELANGOR : 2011") #Set chart and axis labels
t
  #practice : try geom_point(), 

# 18 - PLOT first 10 weeks of data 
      #Change from line chart to dot plot
r <- ggplot(data=dengue_state[1:10,], #Specify data set -- SUBSET DATA -- take first 10 observations
            aes(x=date, y=SELANGOR)) + #Set chart's X and Y variables
  geom_point(color="red", size=1) + #Set chart type (line) and line color and size
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + #Rotate X axis text 90 degrees
  labs(y="Total Cases",x="Week",title="Dengue Cases in SELANGOR : 2011") #Set chart and axis labels
r

### AGGREGATE DATA ###

# 19 - SUM weekly data in each state by month
    #using dplyr and lubridate packages
    #Uncomment first two lines to install dplyr and lubridate packages, if needed

#install.packages("dplyr")
#install.packages("lubridate")
library(dplyr)
library(lubridate)

dengue_month <- dengue_state %>% 
  group_by(month_count = month(date)) %>% 
  summarize_each(funs(sum)) %>% 
  mutate(Month=as.Date(paste("2011",month_count,"1",sep="-"),format="%Y-%m-%d"))

# 20 - PLOT monthly Selangor dengue cases from aggregate data set
ggplot(data=dengue_month, #Specify monthly data set
            aes(x=Month, y=SELANGOR)) + #Set chart's X and Y variables
  geom_line(color="red", size=1) + #Set chart type (line) and line color and size
  scale_x_date(date_labels="%Y-%m", date_breaks = "1 month") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + #Rotate X axis text 90 degrees
  labs(y="Total Cases",x="Month",title="Dengue Cases in SELANGOR : 2011") #Set chart and axis labels




### EXERCISES ###

# 1 - CALCULATE total dengue cases in Malaysia for the year 2011
  #Hint: Sum across the state totals calculated in Step #10


# 2 - CALCULATE the maximum # of cases for each state across all weeks
  #Hint: Modify code in Step #12
      #Help page: ?apply
      #Change the MARGIN argument in the apply function to apply over COLUMNS instead of ROWS


# 3 - CALCULATE the average of dengue cases for each state for the whole year
  #Hint: use the weekly_counts object
  #Hint: ?rowMeans
  #Alternatively, can use the same apply function from Exercise #2, but change the function being applied


# 4 - PLOT *last* 12 weeks of data for PERLIS state as a LINE graph
  #Hint: Modify code from Step #18
  #Make sure to update both the axis text and chart title  


# 5 - PLOT monthly dengue cases in PERLIS as a BARPLOT
  #Hint: Modify code from Step #20 - change state in the Y Variable
  #Hint: Change the chart type from geom_line() to geom_bar() -- see Step #13
  #Make sure to update the chart title

# 5 - ADVANCED: Update the X axis labels to list every THIRD month (3 months)
  #Hint: try modifying the ?scale_x_date function (See step #20)


# 6 - ADVANCED: Which month in 2011 has the highest total number of dengue cases?
  #Hint: Create monthly total in "dengue_month" dataset using ?rowSums
  #Hint: Use ?which.max to find which row in the monthly_total column has the highest value 


# 7 - ADVANCED: For each month, list the state with the most dengue cases
  #Hint: use dengue_month dataset
  #Hint: Combine ?apply with ?which.max across the state columns
  #Hint: Use names(dengue_month) to identify the column name associated with the column index

