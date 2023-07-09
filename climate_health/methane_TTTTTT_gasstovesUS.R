#shapefile of US states obtained from: "data/Boundaries/cb_2018_us_state_20m/cb_2018_us_state_20m.shp"

#Simulates use of gas cookstoves across 50 US states

shp <- data.frame()
shp$gas <- rnorm(nrow(shp), mean=.38, sd=.2) #simulate prevalence of gas cook stoves in the US
shp$gas_cat <- as.factor(shp$gas_cat)


