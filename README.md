# Data Preprocessing for Customer Churn Prediction

## Overview
This script performs essential data preprocessing for a customer churn dataset. It includes steps like handling missing values, creating dummy variables, scaling numerical features, and preparing data for model training.

## Steps
1. **Loading Data**: Reads the dataset from the specified path.
2. **Missing Values**: Removes rows with missing values.
3. **Feature Engineering**:
   - Encodes `SeniorCitizen` as a categorical variable.
   - Replaces "No internet service" and "No phone service" with "No".
4. **Scaling**: Scales numerical columns (`tenure`, `MonthlyCharges`, `TotalCharges`) using `scale`.
5. **Dummy Variables**: Creates dummy variables for categorical features.
6. **Data Splitting**: Splits the data into training and validation sets.

## Key Functions
- `gsub()`: For string replacement in the data.
- `data.frame()`: For structuring transformed data.
- `scale()`: For standardizing numerical features.

## Output
- `telecom_final`: The preprocessed dataset ready for model training.
---

# Feature Engineering for Customer Churn Dataset

This script focuses on creating meaningful features from raw data to enhance model performance.

## Key Transformations
1. **Numerical Features**:
   - `tenure`, `MonthlyCharges`, and `TotalCharges` are scaled using `scale`.
2. **Categorical Features**:
   - Converts `SeniorCitizen` to categorical with levels `YES` and `NO`.
   - Replaces redundant categories (`No internet service`, `No phone service`) with `No`.
   - Creates dummy variables for all categorical columns.
3. **Combined Dataset**:
   - Combines scaled numerical features and dummy variables into a final dataset, `telecom_final`.

## Libraries Used
- `tidyverse`: For efficient data manipulation.
- `caret`: For splitting and scaling data.

## Output
- A ready-to-use dataset for model training and evaluation.

## Usage
1. Place the dataset in the specified path.
2. Run the script to generate `telecom_final`.
3. Use `telecom_final` as input for modeling scripts.
---
# Logistic Regression Model for Customer Churn Prediction

## Overview
This script trains a logistic regression model to predict customer churn based on processed features. It evaluates the model using accuracy and AUC metrics.

## Steps
1. **Model Training**:
   - Uses the `glm` function to fit a logistic regression model.
   - Training data: 80% of the preprocessed dataset.
2. **Prediction**:
   - Predicts churn probabilities on the validation/test dataset.
   - Converts probabilities to binary predictions (0 or 1) using a threshold of 0.5.
3. **Evaluation**:
   - Calculates accuracy to assess prediction correctness.
   - Plots the ROC curve and computes the AUC to evaluate model performance.

## Key Libraries
- `caret`: For data partitioning.
- `pROC`: For ROC curve and AUC computation.

## Output
- **Metrics**:
  - `Accuracy`: Proportion of correct predictions.
  - `AUC`: Area under the ROC curve.
- **Plots**:
  - ROC curve visualization.

## How to Run
1. Load the script in RStudio.
2. Ensure all required libraries are installed.
3. Run the script step by step.
4. Review the accuracy and AUC printed in the console and examine the ROC curve plot.

## Notes
- Adjust the `seed` value to ensure reproducibility.
- Change the prediction threshold (default = 0.5) for different sensitivity levels.
