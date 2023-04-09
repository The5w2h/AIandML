# function for backward elimination
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

# Passing params to the function
SL = 0.05
dataset = dataset[, c(1,2,3,4,5)]
backwardElimination(training_set, SL)