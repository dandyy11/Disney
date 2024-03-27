library(caret) # For data splitting and pre-processing
library(lmtest) # For linear regression diagnostics

# One-hot encoding for categorical variables
disney_movies$genre <- as.factor(disney_movies$genre)
disney_movies$mpaa_rating <- as.factor(disney_movies$mpaa_rating)
dummies <- dummyVars(" ~ genre + mpaa_rating", data = disney_movies)
disney_movies_transformed <- predict(dummies, newdata = disney_movies)

# Add the year feature
disney_movies_transformed$year <- as.numeric(format(as.Date(disney_movies$release_date), "%Y"))

# Prepare the data for modeling
set.seed(42) # For reproducibility
training_indices <- createDataPartition(disney_movies_transformed$total_gross, p = .8, list = FALSE)
train_data <- disney_movies_transformed[training_indices, ]
test_data <- disney_movies_transformed[-training_indices, ]

# Linear regression model
model <- lm(total_gross ~ . -inflation_adjusted_gross -release_date, data = train_data)
summary(model)

# Predict and evaluate
predictions <- predict(model, newdata = test_data)
rmse <- sqrt(mean((predictions - test_data$total_gross)^2))
print(paste("RMSE:", rmse))
