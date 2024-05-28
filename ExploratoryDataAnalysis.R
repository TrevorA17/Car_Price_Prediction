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

# Load the required libraries
install.packages("dplyr")
install.packages("e1071")
library(dplyr)
library(e1071)

# Measures of Frequency
frequency_count <- car_data %>%
  select(Manufacturer, Model, Category, Leather_interior, Fuel_type, Gear_box_type, Drive_wheels, Wheel, Color) %>%
  summarise_all(~list(table(.)))

# Display frequency counts
frequency_count

# Measures of Central Tendency
central_tendency <- car_data %>%
  summarise(
    mean_Levy = mean(Levy, na.rm = TRUE),
    median_Levy = median(Levy, na.rm = TRUE),
    mean_Engine_volume = mean(Engine_volume, na.rm = TRUE),
    median_Engine_volume = median(Engine_volume, na.rm = TRUE),
    mean_Mileage = mean(Mileage, na.rm = TRUE),
    median_Mileage = median(Mileage, na.rm = TRUE),
    mean_Cylinders = mean(Cylinders, na.rm = TRUE),
    median_Cylinders = median(Cylinders, na.rm = TRUE),
    mean_Airbags = mean(Airbags, na.rm = TRUE),
    median_Airbags = median(Airbags, na.rm = TRUE),
    mean_Price = mean(Price, na.rm = TRUE),
    median_Price = median(Price, na.rm = TRUE)
  )

# Display measures of central tendency
central_tendency

# Measures of Distribution
distribution_measures <- car_data %>%
  summarise(
    var_Levy = var(Levy, na.rm = TRUE),
    sd_Levy = sd(Levy, na.rm = TRUE),
    range_Levy = diff(range(Levy, na.rm = TRUE)),
    skewness_Levy = skewness(Levy, na.rm = TRUE),
    kurtosis_Levy = kurtosis(Levy, na.rm = TRUE),
    
    var_Engine_volume = var(Engine_volume, na.rm = TRUE),
    sd_Engine_volume = sd(Engine_volume, na.rm = TRUE),
    range_Engine_volume = diff(range(Engine_volume, na.rm = TRUE)),
    skewness_Engine_volume = skewness(Engine_volume, na.rm = TRUE),
    kurtosis_Engine_volume = kurtosis(Engine_volume, na.rm = TRUE),
    
    var_Mileage = var(Mileage, na.rm = TRUE),
    sd_Mileage = sd(Mileage, na.rm = TRUE),
    range_Mileage = diff(range(Mileage, na.rm = TRUE)),
    skewness_Mileage = skewness(Mileage, na.rm = TRUE),
    kurtosis_Mileage = kurtosis(Mileage, na.rm = TRUE),
    
    var_Cylinders = var(Cylinders, na.rm = TRUE),
    sd_Cylinders = sd(Cylinders, na.rm = TRUE),
    range_Cylinders = diff(range(Cylinders, na.rm = TRUE)),
    skewness_Cylinders = skewness(Cylinders, na.rm = TRUE),
    kurtosis_Cylinders = kurtosis(Cylinders, na.rm = TRUE),
    
    var_Airbags = var(Airbags, na.rm = TRUE),
    sd_Airbags = sd(Airbags, na.rm = TRUE),
    range_Airbags = diff(range(Airbags, na.rm = TRUE)),
    skewness_Airbags = skewness(Airbags, na.rm = TRUE),
    kurtosis_Airbags = kurtosis(Airbags, na.rm = TRUE),
    
    var_Price = var(Price, na.rm = TRUE),
    sd_Price = sd(Price, na.rm = TRUE),
    range_Price = diff(range(Price, na.rm = TRUE)),
    skewness_Price = skewness(Price, na.rm = TRUE),
    kurtosis_Price = kurtosis(Price, na.rm = TRUE)
  )

# Display measures of distribution
distribution_measures                              

# Correlation matrix for numeric columns
correlation_matrix <- cor(car_data %>% select(Levy, Engine_volume, Mileage, Cylinders, Airbags, Price), use = "complete.obs")

# Covariance matrix for numeric columns
covariance_matrix <- cov(car_data %>% select(Levy, Engine_volume, Mileage, Cylinders, Airbags, Price), use = "complete.obs")

# Display correlation and covariance matrices
correlation_matrix
covariance_matrix
