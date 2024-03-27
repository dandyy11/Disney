# Add a year column
disney_movies$year <- format(as.Date(disney_movies$release_date), "%Y")

# Aggregate data by year
yearly_gross_summary <- disney_movies %>%
  group_by(year) %>%
  summarize(total_gross = sum(total_gross), inflation_adjusted_gross = sum(inflation_adjusted_gross))

# Plotting
ggplot(data = yearly_gross_summary, aes(x = year)) +
  geom_line(aes(y = total_gross, colour = "Total Gross")) +
  geom_line(aes(y = inflation_adjusted_gross, colour = "Inflation Adjusted Gross")) +
  theme_minimal() +
  labs(title = "Disney Movies Gross Revenue Trend (1937-2016)", y = "Gross Revenue ($)", x = "Year")
