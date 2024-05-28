# Load dataset
car_data <- read.csv("data/car_price_prediction.csv", colClasses = c(
  Levy = "numeric",
  Manufacturer = "factor",
  Model = "factor",
  Category = "factor",
  `Leather interior` = "factor",
  `Fuel type` = "factor",
  `Engine volume` = "numeric",
  Mileage = "numeric",
  Cylinders = "integer",
  `Gear box type` = "factor",
  `Drive wheels` = "factor",
  Wheel = "factor",
  Color = "factor",
  Airbags = "integer",
  Price = "numeric"
))

# Display the structure of the dataset
str(car_data)

# View the first few rows of the dataset
head(car_data)

# View the dataset in a separate viewer window
View(car_data)
