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

# Display the structure of the dataset
str(car_data)

# View the first few rows of the dataset
head(car_data)

# View the dataset in a separate viewer window
View(car_data)

# Summary of missing values
missing_values_summary <- sapply(car_data, function(x) sum(is.na(x)))
missing_values_summary

# Visualize missing values using a heatmap
install.packages("naniar")
library(naniar)
library(ggplot2)

# Plot missing values
gg_miss_var(car_data) + labs(title = "Missing Values in Car Dataset")

# Detailed plot of missing data
vis_miss(car_data) + labs(title = "Detailed Missing Values in Car Dataset")