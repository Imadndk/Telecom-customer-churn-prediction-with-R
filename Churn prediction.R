cat("\014")  # ctrl+L
install.packages("pacman")
library(pacman)  # No message.
install.packages("tidyverse")
library(tidyverse) 

install.packages("MASS")
install.packages("car")
install.packages("e1071")
install.packages("caret")
install.packages("cowplot")
install.packages("caTools")
install.packages("pROC")
install.packages("ggcorrplot")
library(tidyverse) 
library(MASS)
library(car)
library(e1071)
library(caret)
library(cowplot)
library(caTools)
library(pROC)
library(ggcorrplot)

list.files(path = "../input")

telecom <- read.csv("C:/Users/Hp/Downloads/WA_Fn-UseC_-Telco-Customer-Churn.csv")
head(telecom)
colSums(is.na(telecom))

telecom <- telecom[complete.cases(telecom),]
telecom$SeniorCitizen <- as.factor(ifelse(telecom$SeniorCitizen==1, 'YES', 'NO'))

options(repr.plot.width =4, repr.plot.height = 4)
boxplot(telecom$tenure)
boxplot(telecom$MonthlyCharges)
boxplot(telecom$TotalCharges)

telecom <- data.frame(lapply(telecom, function(x) {
  gsub("No internet service", "No", x)}))

telecom <- data.frame(lapply(telecom, function(x) {
  gsub("No phone service", "No", x)}))

num_columns <- c("tenure", "MonthlyCharges", "TotalCharges")
telecom[num_columns] <- sapply(telecom[num_columns], as.numeric)
telecom_int <- telecom[,c("tenure", "MonthlyCharges", "TotalCharges")]
telecom_int <- data.frame(scale(telecom_int))

telecom_cat <- telecom[,-c(1,6,19,20)]

#Creating Dummy Variables
dummy<- data.frame(sapply(telecom_cat,function(x) data.frame(model.matrix(~x-1,data =telecom_cat))[,-1]))
head(dummy)

telecom_final <- cbind(telecom_int,dummy)
head(telecom_final)


set.seed(123)
train = telecom_final[indices,]
validation = telecom_final[!(indices),]

indices = sample.split(telecom_final$Churn, SplitRatio = 0.8)
model_1 = glm(Churn ~ ., data = train, family = "binomial")
summary(model_1)

predictions <- predict(model_1, newdata = validation, type = "response")

# Convert probabilities to binary predictions (0 or 1)
predicted_classes <- ifelse(predictions > 0.5, 1, 0)

# Compare predicted classes with actual classes
accuracy <- mean(predicted_classes == validation$Churn)

# Print accuracy
print(paste("Accuracy:", accuracy))

 install.packages("caret")
library(caret)
X <- telecom_final[, !names(telecom_final) %in% "Churn"]
Y <- telecom_final$Churn

# Split the data into training and testing sets
set.seed(122) # Set seed for reproducibility
train_index <- createDataPartition(Y, p = 0.8, list = FALSE)
X_train <- X[train_index, ]
Y_train <- Y[train_index]
X_test <- X[-train_index, ]
Y_test <- Y[-train_index]
model <- glm(Churn ~ ., data = telecom_final[train_index, ], family = binomial)

# Make predictions on the test data
predictions <- predict(model, newdata = telecom_final[-train_index, ], type = "response")

# Convert probabilities to binary predictions (0 or 1)
predicted_classes <- ifelse(predictions > 0.5, 1, 0)

# Compare predicted classes with actual classes
accuracy <- mean(predicted_classes == Y_test)

# Print accuracy
print(paste("Accuracy:", accuracy))

install.packages("pROC")

y_pred_proba <- predict(model, newdata = X_test, type = "response")

# Calculate the ROC curve
library(pROC)
roc_obj <- roc(Y_test, y_pred_proba)

# Print AUC
print(paste("AUC:", auc(roc_obj)))

# Plot the ROC curve
plot(roc_obj, main = "ROC Curve", col = "blue", lwd = 2, print.thres = TRUE)
