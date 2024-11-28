# Parkinson's Disease Classification

This project focuses on developing and evaluating machine learning models to classify Parkinson's Disease (PD) based on voice features.

## Overview

The early detection of Parkinson's Disease is crucial for effective treatment and management. This project compares the performance of various machine learning classifiers to identify the best model for accurate classification.

## Classifiers Evaluated

- Logistic Regression
- Gaussian Naive Bayes
- K-Nearest Neighbors (KNN)
- Extreme Gradient Boosting (XGBoost)
- Support Vector Machines (SVM)

## Dataset

The dataset consists of voice features collected from individuals, including those diagnosed with Parkinson's Disease and healthy controls. Features such as pitch, jitter, shimmer, and harmonic-to-noise ratio are used for classification.

## Methodology

1. **Feature Selection:** Applied feature selection techniques to identify the most significant variables for classification.
2. **Model Training and Evaluation:** Trained and evaluated the classifiers using metrics like:
   - Accuracy
   - Precision
   - Recall
   - F1-score
3. **Optimization:** Tuned hyperparameters to improve model performance.

## Results

- **Full Dataset:** XGBoost achieved the highest accuracy of 91%.
- **After Feature Selection:** KNN outperformed other models with an accuracy of 91%.

## Installation and Usage

### Prerequisites

- Python 3.8+
- Required libraries: `pandas`, `numpy`, `scikit-learn`, `xgboost`, `matplotlib`

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/parkinsons-classification.git
   cd parkinsons-classification
