## generate cumulative vaccination coverage over a number of time points using a logistic functional form
# start_cov is the starting vaccination coverage level as a proportion (default is 0)
# end_cov is the expected final coverage at the end of the time period as a proportion (default is 0.8)
# nsteps is the number of time points to provide coverage at


generate_vaccination_coverage <- function(start_cov=0, end_cov=0.8, nsteps=100){
  # assume vaccination coverage follows logistic growth
  x0 <- nsteps/2
  L <- end_cov
  k <- 10/nsteps
  
  x <- 1:nsteps
  
  L/(1+exp(-k*(x-x0)))
}
