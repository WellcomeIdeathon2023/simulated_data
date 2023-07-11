#' Takes an fd object (from FDA package), which  is assumed to be a densely timeseries, and produces a noisy and sparse subsample.
#'
#' @param climate_timeseries_fd fd object. The smoothed timeseries to manipulate into producing a sampled timeseries.
#' @param time_vec Numeric vector. Corresponds to the timepoints of climate_timeseries_fd to predict. NOTE: that the dataset will be manipulated and then sparsely sampled to match this.
#' @param x_stretch Numeric. The amount the 'stretch' the timeseries in the x (time) direction. For example, asking for timepoints 0, 2, 4 and asking for an x-stretch of 1/2 would actually sample timepoints 0, 1, 2.
#' @param y_stretch Numeric. The amount the 'stretch' the timeseries in the y (output) direction.
#' @param noise_level Numeric. The standard deviation of ARIMA model noise added in addition to the sampling.
reduce_climate_to_sparse <- function(climate_timeseries_fd,
                                     time_vec,
                                     which_rep = 1,
                                     x_stretch = 1,
                                     y_stretch = 1,
                                     noise_level = 1e-2) {
  
  # do x-shift
  min_time <- min(time_vec)
  max_time <- max(time_vec)
  freq_timeseries <- seq(min_time, max_time, length.out = 1000)
  new_eval_points <- (freq_timeseries - min_time) * x_stretch + min_time
  output_data <- fda::eval.fd(new_eval_points, climate_timeseries_fd)[, which_rep]
  
  # do y-shift
  output_data <- (output_data - min(output_data)) * y_stretch + min(output_data)
  
  # add noise
  output_data <- output_data + rnorm(length(output_data), sd = noise_level)
  
  # return evenly spaced timepoints
  sparse_sampling_pts <- seq(
    from = 1, 
    to = length(output_data),
    length.out = length(time_vec)
  )
  
  return(output_data[sparse_sampling_pts])
}