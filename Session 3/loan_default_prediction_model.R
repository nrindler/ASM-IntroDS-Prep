install.packages('randomForest')
install.packages('gmodels')
install.packages('pbkrtest')
install.packages('caret')
install.packages('e1071')
library(randomForest)
library(gmodels)
library(pbkrtest)
library(caret)
library(e1071)

setwd("/Users/User/Desktop/")
df <- read.csv("data.csv")

df.train <- df[1:200,]
df.test <- df[201:300,1:10]
df.testlabels <- df[201:300,11]

df.testlabels <- as.character(df.testlabels)
df.testlabels <- factor(df.testlabels)

summary(df.testlabels)

set.seed(123)
fit <- randomForest(loanStatus ~ .,data=df.train, importance=TRUE, ntree=2000)
varImpPlot(fit)

prediction <- predict(fit, df.test, type = "class")
CrossTable(x = df.testlabels, y = prediction, prop.chisq=TRUE)
confusionMatrix(prediction, df.testlabels)
