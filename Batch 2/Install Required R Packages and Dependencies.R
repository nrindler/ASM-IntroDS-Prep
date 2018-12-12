# LOAD REQUIRED PACKAGES
# R version 3.5.1 (2018-07-02) -- "Feather Spray"

packages <- c("rstudioapi","dplyr","lubridate","caret","corrplot","randomForest",
              "gmodels","insuranceData","ggplot2","MASS","pROC")

# CHECK IF ALL REQUIRED PACKAGES ARE INSTALLED - IF NOT, INSTALL THEM
new.packages <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

#load packages
lapply(packages, require, character.only = TRUE)