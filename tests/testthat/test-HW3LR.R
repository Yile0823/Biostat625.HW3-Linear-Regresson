# tests/testthat/test-linear_regression.R

library(testthat)
library(HW3LR)  # Replace with your actual package name

# Read the sample dataset
my_data <- read.csv("C:\\HW3LR\\test.csv")  # Replace with the path to your dataset

# Prepare the predictor matrix X and the response variable Y
Y <- my_data$y  # Response variable
X <- cbind(1, my_data$x)  # Create the X matrix including the intercept term

# Define the results object in each test case
test_that("linear_regression computes coefficients correctly", {
  # Call your linear regression function
  results <- linear_regression(X, Y)

  # Check if the length of the regression coefficients is correct
  expect_equal(length(results$coefficients), ncol(X), info = "Coefficient length mismatch")

  # Check if R-squared is within the valid range
  expect_true(results$r_squared >= 0 && results$r_squared <= 1, info = "R-squared out of bounds")

  # Check if the Mean Squared Error (MSE) is non-negative
  expect_true(results$mse >= 0, info = "MSE should be non-negative")
})

test_that("linear_regression generates diagnostic plots", {
  # Define the results object again here
  results <- linear_regression(X, Y)

  # Verify that the diagnostic plots have been generated
  expect_output(print(results$diagnostic_plots), "Diagnostic plots have been generated.")
})
