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
