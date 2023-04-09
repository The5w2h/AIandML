# Simple Linear Regression
# GOAL: Predict if there is relation between Salary and No of Years of Exp
# Predict Salary based on NoY of Experience
# Step 1: Find which var is dependent and which one is independent
# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)

# Good split ratio is 75%
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience, # means Salary is proportional to YearsExp
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
library(ggplot2)
ggplot() + # each component is added by +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary), # aes is the aesthetic fn. X and Y var.
             colour = 'red') + # 1. Plot everything on the *training*  set
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') + # 2. Plot the regression line
  ggtitle('Salary vs Experience (Training set)') + # 3. Title. Simple *gg* prefix will work
  xlab('Years of experience') + # Label for x-axis
  ylab('Salary') # Label for y-axis

# Visualizing the Test set results
#install.packages('ggplot2')
library(ggplot2) # not in quotes
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary), # *geom* prefix since a line or point is related to geometry
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of experience') +
  ylab('Salary')