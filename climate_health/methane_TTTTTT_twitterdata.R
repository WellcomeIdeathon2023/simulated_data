#add minidataset with Fake Twitter data
lat <- c(35.409483, 35.32, 35.337660)
lon <- c(-119.032986, -118.9, -119.17580)
hashtag <- c("<b>@hmiller</b> at 2023-07-01 12:28:05: <br/>#methaneleak #Bakersfield", 
             "<b>@minnie123</b> at 2023-07-02 24:10:10: <br/>#stopleaks #gaskills #methaneleak", 
             "<b>@jpterson</b> at 2023-07-01 13:09:11: <br/>#methaneleak #StopFossilFuels")
text <- str_wrap(c("<i>Smells like gas is leaking from the <br/>old pipe behind the train tracks", 
                   "<i>My neighbor's having a leak on their <br/>property. We called the company <br/>but they <br/>haven't gotten back to us", 
                   "<i>How many more leaks does it take for <br/>people to understand gas is dangerous?"),10)

tweets <- bind_cols(lat,lon,hashtag,text)
names(tweets) <- c("lat","lon","hashtag","text")

leaflet() %>% addTiles() %>% addScaleBar() %>% addPopups(data=tweets,lat=~lat,lng=~lon, 
                                                         paste0(tweets$hashtag, "<br/><br/>", tweets$text) ,
                                                         options = popupOptions(closeButton = T), group = "Markers") %>% 
  addLayersControl(overlayGroups = "Markers")

  
 
  
  
  