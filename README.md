#AI and ML

#### Steps required in ML
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

#### Feature Scaling
> **RULE**
> Feature scaling is applied on *Columns ONLY*. Can’t be applied across a column.

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

x<sub>min</sub> in Salary column = $52,000
x<sub>min</sub> in Age column = 40

Applying below formula
> $$ x - x<sub>min</sub> \over x~max~ - x~min~ $$

➡️ Salary x<sub>min</sub> = $52,000
➡️ Age x<sub>min</sub> = 40 

| Salary      | Age         |
| ----------- | ----------- |
| $1     | 1       |
| $0.44     | 0.8        |
| $0     | 0        |
