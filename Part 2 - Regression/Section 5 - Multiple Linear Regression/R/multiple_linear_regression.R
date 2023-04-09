# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling : Not required since lm already takes care of Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ ., # Dot is used for selecting all col. Alt: Profit ~ R.D.Spend + Administration + Marketing.spend + State
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# # Visualising the Training set results
# library(ggplot2)
# ggplot() + # each component is added by +
#   geom_point(aes(x = training_set$R.D.Spend, y = training_set$Profit), # aes is the aesthetic fn. X and Y var.
#              colour = 'red') + # 1. Plot everything on the *training*  set
#   geom_line(aes(x = training_set$R.D.Spend, y = predict(regressor, newdata = training_set)),
#             colour = 'blue') + # 2. Plot the regression line
#   ggtitle('R.D.Spend vs Profit (Training set)') + # 3. Title. Simple *gg* prefix will work
#   xlab('R.D.Spend') + # Label for x-axis
#   ylab('Profit') # Label for y-axis

# Fitting model via Backward Elimination
# use multiple r-squared and adjusted r-squared
# check SLs of predictors using summary(regressor_be). Sort by max. Remove the one with max
regressor_be_1 = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, # Dot is used for selecting all col. Alt: Profit ~ R.D.Spend + Administration + Marketing.spend + State
               data = dataset) # dataset instead of training_set
summary(regressor_be_1)
# remove State as State2 and State3 have P val > 0.994
regressor_be_2 = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend, # Dot is used for selecting all col. Alt: Profit ~ R.D.Spend + Administration + Marketing.spend + State
                  data = dataset)
summary(regressor_be_2)
# remove Administration as Administration has max P val greated than SL
regressor_be_3 = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, # Dot is used for selecting all col. Alt: Profit ~ R.D.Spend + Administration + Marketing.spend + State
                    data = dataset) # select Marketing.Spend since SL = 'dot'
summary(regressor_be_3) # Marketing.spend is a borderline case, so can be considered

y_pred_1 = predict(regressor_be_3, test_set)
