# Load dataset
car_data <- read.csv("data/car_price_prediction.csv", colClasses = c(
  Levy = "numeric",
  Manufacturer = "character",
  Model = "character",
  Category = "factor",
  Leather_interior = "factor",
  Fuel_type = "factor",
  Engine_volume = "numeric",
  Mileage = "numeric",
  Cylinders = "numeric",
  Gear_box_type = "factor",
  Drive_wheels = "factor",
  Wheel = "factor",
  Color = "factor",
  Airbags = "numeric",
  Price = "numeric"
))

library(caTools)

# Split the cleaned dataset into training and testing sets
set.seed(123)  # for reproducibility
split <- sample.split(car_data_clean$Price, SplitRatio = 0.7)
train_data <- subset(car_data_clean, split == TRUE)
test_data <- subset(car_data_clean, split == FALSE)

# Display the dimensions of the training and testing sets
print("Training Set Dimensions:")
print(dim(train_data))
print("Testing Set Dimensions:")
print(dim(test_data))

# Perform bootstrapping on the cleaned dataset
boot_samples <- 1000
bootstrapped_means <- numeric(boot_samples)

for (i in 1:boot_samples) {
  boot_sample <- sample(car_data_clean$Price, replace = TRUE)
  bootstrapped_means[i] <- mean(boot_sample)
}

# Summary of bootstrapped means
summary_boot_means <- summary(bootstrapped_means)
print("Summary of Bootstrapped Means:")
print(summary_boot_means)

# Plot histogram of bootstrapped means
hist(bootstrapped_means, main = "Bootstrapped Means", xlab = "Mean Price")

# Load the required library
library(caret)

# Define training control
ctrl <- trainControl(method = "cv", number = 5)

# Perform cross-validation with linear regression on the cleaned dataset
lm_model <- train(Price ~ ., data = train_data, method = "lm", trControl = ctrl)

# Print the cross-validated linear regression model
print(lm_model)

# Load the required library
library(glmnet)

# Prepare data
x_train <- as.matrix(train_data[, -15])  # Exclude the target variable (Price)
y_train <- train_data$Price

# Train Lasso regression model
lasso_model <- cv.glmnet(x_train, y_train, alpha = 1)

# Display the best lambda value
print("Best Lambda for Lasso:")
print(lasso_model$lambda.min)

# Display the coefficients of the Lasso model
print("Coefficients of the Lasso model:")
print(coef(lasso_model, s = "lambda.min"))

# Train Ridge regression model
ridge_model <- cv.glmnet(x_train, y_train, alpha = 0)

# Display the best lambda value
print("Best Lambda for Ridge:")
print(ridge_model$lambda.min)

# Display the coefficients of the Ridge model
print("Coefficients of the Ridge model:")
print(coef(ridge_model, s = "lambda.min"))

print(ridge_model)
