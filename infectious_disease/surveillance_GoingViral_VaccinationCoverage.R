## generate cumulative vaccination coverage over a number of time points using a logistic functional form
# start_cov is the starting vaccination coverage level as a proportion (default is 0)
# end_cov is the expected final coverage at the end of the time period as a proportion (default is 0.8)
# nsteps is the number of time points to provide coverage at

# will produce a series of coverages- they are non monotonic but this could reflect reporting revisions over time


generate_vaccination_coverage <- function(start_cov=0, end_cov=0.8, nsteps=100){
  # assume vaccination coverage follows logistic growth
  x <- start_cov
  for(i in 2:nsteps){
    x[i] <- x[i-1] + rnorm(1, mean = (end_cov-start_cov)/nsteps, sd = 1/nsteps)
  }
  x
}
