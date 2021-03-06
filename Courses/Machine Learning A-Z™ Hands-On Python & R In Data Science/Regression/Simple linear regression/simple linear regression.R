# Import dataset
data <- read.csv("Salary_Data.csv")


#Spliting into train and test
library(caTools)
set.seed(42)
split=sample.split(data$Salary,SplitRatio = 2/3)
training_set=subset(data,split==TRUE)
test_set=subset(data,split != TRUE)


# Fitting Linear Models
regressor=lm(formula = Salary ~ YearsExperience,data = training_set)
summary(regressor)

# Predicting the test result.
y_pred = predict(regressor,newdata=test_set)
y_pred


# Visualizing the training_set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),
             colour='red') +
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata = training_set)),
            color='blue') +
  ggtitle('Salary vs Experience (Training set') +
  xlab('Years of Experience') +
  ylab('Salary')

# Visualizing the test_set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary),
             colour='red') +
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata = training_set)),
            color='blue') +
  ggtitle('Salary vs Experience (Training set') +
  xlab('Years of Experience') +
  ylab('Salary')

