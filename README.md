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
> RULE
> Feature scaling is applied on *Columns ONLY*. Can’t be applied across a column.

##### Normalization: 
Values are always between [0;1]
* Get max in the col
* Get min in the col
> $$ x - x~min~ \over x~max~ - x~min~ $$
##### Standardization: 
Values are always between [-3;+3]
Avg
SD
= (x-avg)/sd
Ex: s1, s2, s3 = {$70k, $60k, $52k}, a1, a2, a3 = {45, 44, 40}
Diff = {s1-s2, s3-s2}, {a1-a2, a3-a2} = {10k, 8k}, {1, 4}
Therefore, scaling is important.
N = s: {(60-52)/(70-52)}, a: {(44-40)/(45-40)}
=> N = s: {0.44}, a: {0.8}
