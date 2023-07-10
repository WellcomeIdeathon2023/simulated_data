


# Model 1
# ----------


# "True" causal model
set.seed(51034)

N <- 10000
temperature <- runif(N)
rice_yield <- temperature + rnorm(N, sd = 0.01)
suicide <-  -rice_yield + rnorm(N, sd = 0.01)

dd <- data.frame(temperature = temperature,
                 rice_yield = rice_yield,
                 suicide = suicide)

write.csv(dd, 'data/no_confounding_simulated_data.csv')


hist(temperature)
hist(rice_yield)
hist(suicide)


plot(temperature ~ rice_yield)
plot(suicide ~ rice_yield)
plot(suicide ~ temperature)

mts <- lm(suicide ~ temperature)
mrt <- lm(rice_yield ~ temperature)
msr <- lm(suicide ~ rice_yield)

msr$coefficients['rice_yield'] * mrt$coefficients['temperature']




# Wrong answer
mts <- lm(suicide ~ temperature)
mtr <- lm(rice_yield ~ temperature)
mrs <- lm(suicide ~ rice_yield + temperature)

mrs$coefficients['rice_yield'] * mtr$coefficients['temperature']



# Right answer?
mts <- lm(suicide ~ temperature)
mtr <- lm(rice_yield ~ temperature)
mrs <- lm(suicide ~ rice_yield)
mrs2 <- lm(suicide ~ rice_yield + temperature)

# indirect
mrs$coefficients['rice_yield'] * mtr$coefficients['temperature']

# direct
mrs2$coefficients['temperature']
confint(mrs2)





# "True" causal model

N <- 10000
temperature <- runif(N)
rice_yield <- temperature + rnorm(N, sd = 0.01)
suicide <-  -rice_yield + temperature + rnorm(N, sd = 0.01)

hist(temperature)
hist(rice_yield)
hist(suicide)


plot(temperature ~ rice_yield)
plot(suicide ~ rice_yield)
plot(suicide ~ temperature)


# Right answer?
mts <- lm(suicide ~ temperature)
mtr <- lm(rice_yield ~ temperature)
mrs <- lm(suicide ~ rice_yield) # Nonsense
mrs2 <- lm(suicide ~ rice_yield + temperature)

# indirect
mrs2$coefficients['rice_yield'] * mtr$coefficients['temperature']



# direct
mrs2$coefficients['temperature']
confint(mrs2)






# Model 2
# ----------


# "True" causal model
set.seed(5271717)
N <- 10000
temperature <- runif(N)
unobserved <- runif(N)
rice_yield <- temperature + 0.7 * unobserved + rnorm(N, sd = 0.01)
suicide <-  -rice_yield + 0.7*unobserved + 0*temperature +  rnorm(N, sd = 0.01)


dd <- data.frame(temperature = temperature,
                 rice_yield = rice_yield,
                 suicide = suicide,
                 unobserved = unobserved)

write.csv(dd, 'data/confounding_simulated_data.csv')


hist(temperature)
hist(rice_yield)
hist(suicide)


plot(temperature ~ rice_yield)
plot(suicide ~ rice_yield)
plot(suicide ~ temperature)


# Right answer?
mtr <- lm(rice_yield ~ temperature)

mts <- lm(suicide ~ temperature)
mrs <- lm(suicide ~ rice_yield)
mrs2 <- lm(suicide ~ rice_yield + temperature)

# indirect
mrs$coefficients['rice_yield'] * mtr$coefficients['temperature']

# direct
mrs2$coefficients['temperature']
confint(mrs2)




# "True" causal model

N <- 10000
temperature <- runif(N)
unobserved <- runif(N)
rice_yield <- temperature + 0.7 * unobserved + rnorm(N, sd = 0.01)
suicide <-  -rice_yield + 0.7*unobserved + 0.5*temperature +  rnorm(N, sd = 0.01)

hist(temperature)
hist(rice_yield)
hist(suicide)


plot(temperature ~ rice_yield)
plot(suicide ~ rice_yield)
plot(suicide ~ temperature)


# Right answer?
mtr <- lm(rice_yield ~ temperature)

mts <- lm(suicide ~ temperature) # Combined effect
mrs <- lm(suicide ~ rice_yield) # Nonsense
mrs2 <- lm(suicide ~ rice_yield + temperature)



mtr <- lm(rice_yield ~ temperature)

mts <- lm(suicide ~ temperature) # Combined effect
mrs <- lm(suicide ~ rice_yield) # Nonsense
mrs2 <- lm(suicide ~ rice_yield + temperature + unobserved)



