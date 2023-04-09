# Data Pre-processing Template

# Set working directory
# *** Importing the Data Set
dataset = read.csv('Data.csv')

# *** Missing data
# Options (1. Remove the rows having missing data,
# 2. Replace by the <mean>)

dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
# Replace for <Salary> col.
dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)

# *** Encoding Categorical Data
# Convert text into numbers
# <Country> and <Purchased> col values are categorical
# Factors are non-numeric, so <scale()> function does not work

dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))

dataset$Purchased = factor(dataset$Purchased,
                         levels = c('Yes', 'No'),
                         labels = c(1, 0))

# *** Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123) # Used for Randomization

# The <split> function results TRUE or FALSE, based on whether the row 
#is selected for Training Data Set or not
split = sample.split(dataset$Purchased, SplitRatio = 0.8)

#subset of dataset where split is TRUE
training_set = subset(dataset, split == TRUE) # subset created 

test_set = subset(dataset, split == FALSE)

# *** Feature Scaling
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])