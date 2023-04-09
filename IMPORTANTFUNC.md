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
```
