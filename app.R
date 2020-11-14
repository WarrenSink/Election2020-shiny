library(shiny)
library(spData)
library(tmap) # for static and interactive maps
library(leaflet) # for interactive maps
library(tidyverse) # tidyverse data visualization package
library(sf)

get_congress_map <- function(cong=113) {
  tmp_file <- tempfile()
  tmp_dir  <- tempdir()
  zp <- sprintf("http://cdmaps.polisci.ucla.edu/shp/districts%03i.zip",cong)
  download.file(zp, tmp_file)
  unzip(zipfile = tmp_file, exdir = tmp_dir)
  fpath <- paste(tmp_dir, sprintf("districtShapes/districts%03i.shp",cong), sep = "/")
  st_read(fpath)
}
cd114 <- get_congress_map(114)

us_states_map = st_transform(us_states, 2163)
us_states_map = tm_shape(us_states, projection = 2163) + tm_polygons() + 
  tm_layout(frame = FALSE)









