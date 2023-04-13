```R
0. // Indexes in R starts with [1]
1. read.csv()
2. Table$Col *To select the col in a dataset*
3. ifelse() *Three params. 1. Condition, 2. value that should be entered if val = true, and 3. value that should be entered if val = false*
4. is.na *If the val in a col is empty*
5. Way to write ifelse and average: na.rm = TRUE $\implies$ Ask R fill the missing value
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
                     
6. *For Encoding Categorical Data* factor(x, levels = c(), labels = c())
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
7. install.packages('caTools')
8. library(caTools) # caTool is *without* quotes. library is used to include a library.
9. set.seed(123) # Used for RANDOMIZATION. Should be same, for same results.
10. # The <split> function results TRUE or FALSE, based on whether the row is selected for Training DateSet or not
split = sample.split(dataset$Purchased, SplitRatio = 0.8) #0.8 means 80% data has to be selected for Training Dataset # A good split ratio is 75%
11. training_set = subset(dataset, split == TRUE) # subset for Training created which contains subset of dataset where split is TRUE
12. test_set = subset(dataset, split == FALSE) # subset for Test created which contains subset of dataset where split is FALSE
13. training_set = scale(training_set) # Feature Scaling works only on numeric col. Factor function does not change Categorical col to numeric
14. # Feature Scaling. [, 2:3] since col 2 and 3 are numeric col.
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])
15. regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)
# the lm() function takes care of FEATURE SCALING, so scale function is not required
16. # Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience, # means Salary is proportional to YearsExperience
               data = training_set)
17.summary(regressor) # Shows how to use summary() funciton

Call:
lm(formula = Salary ~ YearsExperience, data = training_set) # formula where Salary is Dependent var, YearExperience is Independent var, model is build on training_set

Residuals:
    Min      1Q  Median      3Q     Max 
-7325.1 -3814.4   427.7  3559.7  8884.6 

Coefficients: # Important
                Estimate Std. Error t value Pr(>|t|)    
(Intercept)        25592       2646   9.672 1.49e-08 *** # Stats significance. No star = No signf. and 3 Star = Highly significant
YearsExperience     9365        421  22.245 1.52e-14 *** # Lower P value mean more Stat significant i.e. independent var will has significant effect on # dependent var.
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 5391 on 18 degrees of freedom
Multiple R-squared:  0.9649 # Used for single var.,	Adjusted R-squared:  0.963 # Used for multiple independent var
F-statistic: 494.8 on 1 and 18 DF,  p-value: 1.524e-14
18. y_pred = predict(regressor, newdata = test_set) # IMPORTANT function
# y_pred: predictor
# regressor: model
# newdata: dataset on which this new model (regressor) needs to be tested

19. # Visualising the Training set results
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
  
 20. # Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ ., # Dot is used for selecting all col. Alt: Profit ~ R.D.Spend + Administration + Marketing.spend + State
               data = training_set)
Call:
lm(formula = Profit ~ ., data = training_set)

Residuals:
   Min     1Q Median     3Q    Max 
-33128  -4865      5   6098  18065 

Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    # Last 2 col P val and SL are most important as it tells about Stat Signi
(Intercept)      4.965e+04  7.637e+03   6.501 1.94e-07 *** MORE IMPACT since 3 Star
R.D.Spend        7.986e-01  5.604e-02  14.251 6.70e-16 *** MORE IMPACT since 3 Star
Administration  -2.942e-02  5.828e-02  -0.505    0.617    
Marketing.Spend  3.268e-02  2.127e-02   1.537    0.134    
State2           1.213e+02  3.751e+03   0.032    0.974    # lm() created the dummy variable State2 and State3 automatically, so redundant dependency is        avoided
State3           2.376e+02  4.127e+03   0.058    0.954    # lm() created the dummy variable State2 and State3 automatically
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 9908 on 34 degrees of freedom
Multiple R-squared:  0.9499,	Adjusted R-squared:  0.9425 
F-statistic:   129 on 5 and 34 DF,  p-value: < 2.2e-16

21. # function for backward elimination
backwardElimination = function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"]) # using max and coef fn
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar) # using which fn
      x = x[, -j] # removing that from the vector
    }
    numVars = numVars - 1
  }
  return(summary(regressor)) # returning summary of regressor
}

22. # Fitting Polynomial Regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)
              
23. x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1) # x_grid is a sequence. Sequence is a LOOP
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(poly_reg, # x_grid usage
                                        newdata = data.frame(Level = x_grid,
                                                             Level2 = x_grid^2,
                                                             Level3 = x_grid^3,
                                                             Level4 = x_grid^4))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')
  
 24. # Using predict fn
 predict(lin_reg, data.frame(Level = 6.5)) # dataset of only 1 line, only 1 cell
```
