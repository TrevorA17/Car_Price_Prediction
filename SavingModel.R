# Load necessary libraries
library(caret)
library(glmnet)

# Define control for cross-validation
control <- trainControl(method = "cv", number = 10)

# Train Lasso regression model
lasso_model <- cv.glmnet(x_train, y_train, alpha = 1, trControl = control)

# Create a directory named "models" if it doesn't exist
if (!file.exists("./models")) {
  dir.create("./models")
}

# Save the trained Lasso model to a file
saveRDS(lasso_model, file = "./models/lasso_model.rds")

# Load the saved Lasso model
loaded_model_lasso <- readRDS("./models/lasso_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  Levy = 1399,
  Manufacturer = "LEXUS",
  Model = "RX 450",
  Category = "Jeep",
  Leather_interior = "Yes",
  Fuel_type = "Hybrid",
  Engine_volume = 3.5,
  Mileage = 186005,
  Cylinders = 6,
  Gear_box_type = "Automatic",
  Drive_wheels = "4x4",
  Wheel = "Left wheel",
  Color = "Silver",
  Airbags = 12
)

# Use the loaded model to make predictions for new data
predictions_loaded_model <- predict(loaded_model_lasso, s = "lambda.min", newx = as.matrix(new_data))

# Print predictions
print(predictions_loaded_model)
