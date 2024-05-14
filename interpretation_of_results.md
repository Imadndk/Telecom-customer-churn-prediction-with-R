There are only 11 missing values in the TotalCharges field, so we remove the corresponding rows from the dataset. There are three continuous variables: Tenure, MonthlyCharges, and TotalCharges. SeniorCitizen is in 'int' form and can be transformed into a categorical variable.

By analyzing the boxplot of your continuous variables (Tenure, MonthlyCharges, and TotalCharges), we see no points that significantly deviate from the main distribution of the data. The "whiskers" represent the range of the IQR (Interquartile Range), which corresponds to the central half of the data. Therefore, the absence of points outside the whiskers suggests that there are no extreme outliers in your data.

Based on the exploratory data analysis (EDA), we identified categorical variables that have labels like "No" and "No internet service" or "No phone service." We can simplify the cleaning by grouping these categories under the single label "No."

Standardization of Continuous Variables

Creation of Dummy Variables

Once the cleaning and transformation steps for the variables are done (cleaning categoricals, standardizing continuous variables, creating derived and dummy variables), it's time to combine the results to get the final dataset ready for training and evaluating your machine learning model.

Splitting Data into Training and Validation Sets

Checking Correlation Between Continuous Variables

The model is adequate and of good quality.
