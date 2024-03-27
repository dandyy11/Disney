install.packages("readxl")

library(readxl)
library(dplyr)
library(ggplot2)

# Load the dataset
disney_movies <- read_excel("E:/Baylor Material/STA 5V85 - Capstone/Disney.csv")

# Basic overview
total_movies <- nrow(disney_movies)
average_total_gross <- mean(disney_movies$total_gross)
average_inflation_adjusted_gross <- mean(disney_movies$inflation_adjusted_gross)
unique_genres <- length(unique(disney_movies$genre))
unique_mpaa_ratings <- length(unique(disney_movies$mpaa_rating))
earliest_release_date <- min(disney_movies$release_date)
latest_release_date <- max(disney_movies$release_date)

# Print overview
print(paste("Total Movies:", total_movies))
print(paste("Average Total Gross:", average_total_gross))
print(paste("Average Inflation Adjusted Gross:", average_inflation_adjusted_gross))
