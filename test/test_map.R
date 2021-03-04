###########

if(!require(jsonlite)) install.packages('jsonlite')
if(!require(ggmap))    install.packages('ggmap')
if(!require(ggplot2))  install.packages('ggplot2')
library(jsonlite)
library(ggmap)
library(ggplot2)
library(tidyverse)
#map_data = fromJSON("data/Takeout/Location History/Location History.json")
map_data = readRDS('data/map_data.RDS')
map_data$locations

locations = map_data$locations
loc_dat1 =  locations %>%
  mutate(lat = latitudeE7/1e7, 
         lng = longitudeE7/1e7) %>%
  mutate(year = str_sub(timestampMs, 1, 2), 
         month= str_sub(timestampMs, 3, 4))

loc_dat_sample = loc_dat1 %>%
  slice(1:50000)


key<-read.csv('security/gapi.csv')
register_google(key = key[1,2])
map = get_map(c(127.024612, 37.532600), 
              zoom = 10, 
              source = 'stamen', 
              maptype = "toner")


ggmap(map) + 
  geom_point(data = loc_dat_sample, 
             aes(x = lng, y = lat, color = month), alpha = 0.5) +
  theme(legend.position = 'right') +
  labs(
    x = 'longitute', 
    y = 'latitude', 
    title = "Location history of me"
  )


############list.dirs()
list.dirs()[23]
library(tidyverse)
list.dirs()[23] %>% 
  str_sub(., 3)

list.files(list.dirs()[23])

paste0(list.dirs()[23] %>% str_sub(., 3),
       "/", 
       list.files(list.dirs()[23])[1])


map_temp  = fromJSON(
  paste0(list.dirs()[23] %>% str_sub(., 3),
         "/", 
         list.files(list.dirs()[23])[1])
)

map_temp
#



















temp <- tempfile(fileext = ".zip")














d1 <- drive_down



paste0("~/", ls$name[1])
data1 <- drive_get(paste0("~/", ls$name[1]))

paste0("~/", ls$name[2])
data2 <- drive_get(paste0("~/", ls$name[2]))
