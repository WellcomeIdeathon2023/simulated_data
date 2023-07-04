# This function produces some simulated timeseries data - with a quadratic 
# trends and different constant values.

#' Generate some toy climate timeseries
#' 
#' @param arg_vals_days Vector (numeric). The timepoints for evaluation.
#' @param num_reps Numeric. Number of different timeseries.
#' @param mean_of_noise Numeric. Mean of noise (within ARIMA model).
#' @param spread_trends Numeric. Spread of the trends about 0.
#' @param spread_consts Numeric. Spread of the const values about 40.
generate_toy_climate_data <- function(
    arg_vals_days = 1:(2*365),
    num_reps = 2,
    mean_of_noise = 0.02,
    spread_trends = 5,
    spread_consts = 10,
    seed_in = 123
){
  set.seed(seed_in)  # for reproducibility
  trends = runif(num_reps, min = -spread_trends, max = spread_trends)
  consts = runif(num_reps, min = 40 - spread_consts, max = 40 + spread_consts)
  
  eg_df <- data.frame(matrix(nrow = length(arg_vals_days),
                             ncol = num_reps))
  colnames(eg_df) <- 1:num_reps
  
  for (j in 1:num_reps) {
    eg_fluc_data <- sapply(
      arg_vals_days,
      function(i) {
        consts[j] + trends[j]*(i/365)**2 + 5*cos(i*2*pi/365) + 0.3 * sin(i*pi/3)
      }
    ) + arima.sim(
      length(arg_vals_days), 
      mean = mean_of_noise,
      model = list(order = c(1,0,0), ar = 0.9)
    )
    eg_df[, j] <- eg_fluc_data
  }
  return(eg_df)
}

# # example for plotting
# matplot(
#   generate_toy_climate_data(num_reps = 5,
#                             spread_consts = 10), 
#   type = 'l', 
#   col = 1:5, 
#   lty = 1,
#   main = "Examples of simulated timeseries",
#   xlab = "Time (days)",
#   ylab = "Value"
# )