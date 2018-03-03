###################################
# HANDS-ON EXERCISE: DENGUE DATA SET
###################################

#' ANSWER KEY
#' R Basics Presentation
#' Sept 2017
#' Created by DataViz My 
#' @author Nadav Rindler & Shak Hassan

### NOTE: IN ORDER TO SUCCESSFULLY RUN THIS CODE, YOU MUST FIRST HAVE EXECUTED
    # ALL CODE IN THE 'dengue.R' SCRIPT
    # One way to do this is to use the 'source' function in R
setwd("C:/Users/nadav.rindler/Documents/DataViz/DSPL Sept2017/Basic R")
source("dengue.R")



### EXERCISES ###

# 1 - CALCULATE total dengue cases in Malaysia for the year 2011
#Hint: Sum across the state totals calculated in Step #8
sum(dengue_data$state_total)

# 2 - CALCULATE the maximum # of cases for each state across all weeks
#Hint: Modify code in Step #10
#Help page: ?apply
#Change the MARGIN argument in the apply function to apply over COLUMNS instead of ROWS
highest_each_state <- apply(weekly_counts, 1, max)

# 3 - CALCULATE the average of dengue cases for each state for the whole year
#Hint: use the weekly_counts object
#Hint: ?rowMeans
#Alternatively, can use the same apply function from Exercise #2, but change the function being applied
rowMeans(weekly_counts)
apply(weekly_counts,1,mean)

# 4 - PLOT *last* 12 weeks of data for PERLIS state as a LINE graph
#Hint: Modify code from Step #17
#Make sure to update both the axis text and chart title  
ggplot(data=dengue_state[40:52,], #Specify data set -- SUBSET DATA -- take first 10 observations
       aes(x=date, y=PERLIS)) + #Set chart's X and Y variables
  geom_line(color="red", size=1) + #Set chart type (line) and line color and size
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + #Rotate X axis text 90 degrees
  labs(y="Total Cases",x="Week",title="Dengue Cases in PERLIS : 2011",
       subtitle="Weeks 40-52") #Set chart and axis labels


# 5 - PLOT monthly dengue cases in PERLIS as a BARPLOT
#Hint: Modify code from Step #19 - change state in the Y Variable
#Hint: Change the chart type from geom_line() to geom_bar() -- see Step #11
#Make sure to update the chart title

# 5 - ADVANCED: Update the X axis labels to list every THIRD month (3 months)
#Hint: try modifying the ?scale_x_date function (See step #19)

ggplot(data=dengue_month, mapping=aes(x=Month, y=SELANGOR)) + 
  geom_bar(fill="red", stat="identity") +  
  scale_x_date(date_labels="%Y-%m", date_breaks = "3 months") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title="Monthly Dengue Cases in PERLIS: 2011",y="Total Cases", x="Month")

# 6 - ADVANCED: Which month in 2011 has the highest total number of dengue cases?
#Hint: Create monthly total in "dengue_month" dataset using ?rowSums
#Hint: Use ?which.max to find which row in the monthly_total column has the highest value 
dengue_month$month_total <- rowSums(dengue_month[,2:16])
dengue_month[which.max(dengue_month$month_total),"Month"]

# 7 - ADVANCED: For each month, list the state with the most dengue cases
#Hint: use dengue_month dataset
#Hint: Combine ?apply with ?which.max across the state columns
#Hint: Use names(dengue_month) to identify the column name associated with the column index
dengue_month$max_state <- names(dengue_month[,2:16])[apply(dengue_month[,2:16],1,which.max)]
dengue_month$max_state
