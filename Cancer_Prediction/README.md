# Breast Cancer Tumor Prediction

 ## Business Problem  
 A hospital has been trying to improve its care conditions by analyzing the historic survival of its patients. They tried looking at their data but could not identify the main factors leading to high survivals.
 
 ## The dataset
The dataset contains the patient records collected from a hospital. 

- ID number
- Diagnosis (M = malignant, B = benign)
- radius (mean of distances from center to points on the perimeter)
texture (standard deviation of gray-scale values)
- perimeter
- area
- smoothness (local variation in radius lengths)
- compactness (perimeter^2 / area - 1.0)
- concavity (severity of concave portions of the contour)
- concave points (number of concave portions of the contour)
- symmetry
- fractal dimension ("coastline approximation" - 1)
The mean, standard error and "worst" or largest (mean of the three largest values) of these features were computed for each image, resulting in 30 features. For instance, field 3 is Mean Radius, field 13 is Radius SE, field 23 is Worst Radius.
All feature values are recorded with four significant digits.
Missing attribute values: none
Class distribution: 357 benign, 212 malignant
 
 ## Objective
 
To develop a model that will predict and classify  a patient's breast cancer.
 
## Requirements 
Libraries used - To successfully run this Jupyter notebook the following libraries need to be installed.
    - Python 3     - Pandas     - Scikit-Learn     - Seaborn     - Matplotlib     - Numpy  
    
## Data Preprocessing
Preprocessing work done on the data included:

1. Replacing  values  with a hard coded value like (eg 1 for M, 0 for B)

## Models 

1. Support Vector Machin

2. Random Forest Classifier

3. Naive Bayes

4. K Nearest Neighbors

5. Decision Tree Classifier

6. Logistic Regression

## Results

Performance Evaluation Metric used:

1.F1 score

2. Cross Validation

3. Training and test accuracy

4. Confusion matrix


