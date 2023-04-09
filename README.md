# AI and ML

## Steps required in ML
* Data Preprocessing
  * Import
  * Clean
  * Split: **Training (80%) and Test (20%)**
  >Importance
  Training DataSet is used to build Models (Linear regression etc.).
  Take data from Test and apply the Model to Test data.
  Compare predicted values with actual values.
* Modeling
  * Build
  * Train
  * **Make predictions**
* Evaluation
  * Calculate **performance metrics**
  * Make verdict

### Feature Scaling
💡 <span style="color:'#FF0000'"> **RULE** </span>
> <span style="color:'red'">**RULE** </span>
> Feature scaling is applied on *Columns ONLY*. Can’t be applied across a column.

*Why to use?*
> So that the Euclidean distance is not dominated by a column. Puts all the values on same scale.

##### 1. Normalization: 
Values are always between [0;1]
* Get max in the col
* Get min in the col
> $$ x - x<sub>min</sub> \over x~max~ - x~min~ $$
##### 2. Standardization: 
Values are always between [-3;+3]
1. Find $\mu$
2. Find $\sigma$
> $$ (x-\mu) \over \sigma $$

Example:

| Salary      | Age         |
| ----------- | ----------- |
| $70,000     | 45       |
| $60,000     | 44        |
| $52,000     | 40        |

x<sub>min</sub> in Salary column = $52,000, and x<sub>min</sub> in Age column = 40

Applying below formula
> $$ x - x<sub>min</sub> \over x~max~ - x~min~ $$

$\implies$ Salary x<sub>min</sub> = $52,000
$\implies$ Age x<sub>min</sub> = 40 

| Salary      | Age         |
| ----------- | ----------- |
| $1     | 1       |
| $0.44     | 0.8        |
| $0     | 0        |

$\therefore$ Person 2 is closer to Person 1 in Age.

> **Predict dependent var (col) based on independent vars (cols)**

### Data Preprocessing Steps
1. Get the **DataSet**
2. Import the lib
3. Import the DataSet
4. **Missing Data**
5. Categorical Data
6. Splitting the DataSet into **Training** and **Test** sets
7. **Feature Scaling**

## Types of Regression
Machine Learning Regression models:
1. Simple Linear Regression
2. Multiple Linear Regression
3. Polynomial Regression
4. Support Vector for Regression (SVR)
5. Decision Tree Regression
6. Random Forest Regression

## Simple Linear Regression
$$
\hat{y} = b_0 + b_1 X_1
$$

where <br>
$\hat{y}$ = *PREDICTED* dependent var, <br>
  $b_0$ = y intercept (a constant), <br>
  $b_1$ = slope co-efficient, <br>
  $X_1$ = *PREDICTOR* independent variable <br>
  
### Ordinary Least Squares
A: Which sloped line is the best one? Use *Least Squares*. Project data points vertically on the regression line. <br>
$\hat{y_i}$ = **Predicted Value** via regression line <br>
$y_i$ = **Actual Value**
Find the line for which the diff between *Predicted Value and Actual Value* is least. The diff is called **Residual** represented by $\epsilon_i$
💡 Residual Square is of interest.

$$
\epsilon_i = y_i - \hat{y_i} 
$$

$b_0$ and $b_1$ should be such that, $\epsilon^2$ is **minimized**.
1. Find out the residual square for each of the data points
2. Sum them
3. The line for which the *Sum* in point 2 is **smallest** is the best line

#### Coding Steps
1. **Read** the dataset
2a. **Split** the dataset into Train and Test: (library caTools, split(col, splitratio) )
2b. **Create subset** of train and test sets using subset(dataset, split = bool) *TRUE* for train
3. ***Make the Model*** Use lm formula to make the model or fit the regression line lm(formula = dep. var ~ ind. var, data = dataset)
4. **Predict** using predict func. predict(modelname, newdata = test subset)
5. **Visualize Train Set** using ggplot2 in steps separated by '+' sign geom_point + geom_line + ggtitle + xlab + ylab


## Multiple Linear Regression
$$
\hat{y} = b_0 + b_1 X_1 + b_2 X_2 + b_3 X_3 + ... + b_n X_n
$$

### Assumption
**Anscombe's Quartet** dataset should be fit for using Linear Regression
1. Linearity: linear rel between y and x
2. Homoscedasticity: equal varince (i.e. there should **No Cone**)
3. Mutlivariate Normality: normality of error distribution 😕. What does this mean?
4. Independence of obs: No correlation $\rho$ = 0 between observation. No pattern in data. e.g. Stock market
5. Lack of multicollinearity: Predictors should not be correlated
6. No **Outlier**

### Dummy Variables
Used to deal with **Categorical var** in a multiple linear reg equation.
1. Find all the diff cat levels that you have. Create a new col per new category. *These new col are called **Dummy Var** *
2. Put 1 for the rows where that cat is present, else put 0.
3. Used for multicollinearity. Include all BUT ONE dummy var

## P value
1. Are these insights statistically significant. Feel about experiment vs statistical significance.
2. Hypothesis Testing: H_0: null hypo, H_a alt hypo
