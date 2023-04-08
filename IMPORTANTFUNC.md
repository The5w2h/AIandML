1. read.csv()
2. Table$Col *To select the col in a dataset*
3. ifelse() *Three params. 1. Condition, 2. value that should be entered if val = true, and 3. value that should be entered if val = false*
4. is.na *If the val in a col is empty*
5. Way to write ifelse and average: na.rm = TRUE $\implies$ Ask R fill the missing value
> dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
