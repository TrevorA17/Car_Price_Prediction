# Load necessary libraries
library(plumber)
library(glmnet)

# Load the saved Lasso model
loaded_model_lasso <- readRDS("./models/lasso_model.rds")

#* @apiTitle Car Price Prediction API
#* @apiDescription Predict the price of a car based on its features using a Lasso regression model.

#* @post /predict_price
#* @param Levy Numeric: Levy on the car.
#* @param Manufacturer Character: Manufacturer of the car.
#* @param Model Character: Model of the car.
#* @param Category Character: Category of the car.
#* @param Leather_interior Character: Presence of leather interior (Yes or No).
#* @param Fuel_type Character: Fuel type of the car.
#* @param Engine_volume Numeric: Engine volume of the car.
#* @param Mileage Numeric: Mileage of the car.
#* @param Cylinders Numeric: Number of cylinders in the car.
#* @param Gear_box_type Character: Gear box type of the car.
#* @param Drive_wheels Character: Drive wheels of the car.
#* @param Wheel Character: Wheel type of the car.
#* @param Color Character: Color of the car.
#* @param Airbags Numeric: Number of airbags in the car.
#* @serializer unboxedJSON
predict_price <- function(Levy, Manufacturer, Model, Category, Leather_interior, Fuel_type, Engine_volume, Mileage, Cylinders, Gear_box_type, Drive_wheels, Wheel, Color, Airbags) {
  # Prepare the input data
  new_data <- data.frame(
    Levy = as.numeric(Levy),
    Manufacturer = as.character(Manufacturer),
    Model = as.character(Model),
    Category = as.factor(Category),
    Leather_interior = as.factor(Leather_interior),
    Fuel_type = as.factor(Fuel_type),
    Engine_volume = as.numeric(Engine_volume),
    Mileage = as.numeric(Mileage),
    Cylinders = as.numeric(Cylinders),
    Gear_box_type = as.factor(Gear_box_type),
    Drive_wheels = as.factor(Drive_wheels),
    Wheel = as.factor(Wheel),
    Color = as.factor(Color),
    Airbags = as.numeric(Airbags)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_model_lasso, s = "lambda.min", newx = as.matrix(new_data))
  
  # Return the prediction
  return(as.character(prediction))
}
