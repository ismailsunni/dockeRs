## ------------------------------------------------------------------------
library(tidyverse)
library(sf)
system.file("gpkg/nc.gpkg", package="sf") %>% read_sf() %>% 
    st_transform(32119) -> nc.32119


## ------------------------------------------------------------------------
ggplot() + geom_sf(data = nc.32119) 


## ----eval=FALSE----------------------------------------------------------
## ggplot(nc.32119) + geom_sf()


## ------------------------------------------------------------------------
ggplot() + geom_sf(data = nc.32119) + theme_void() +
  theme(panel.grid.major = element_line(color = "white"))


## ------------------------------------------------------------------------
ggplot() + geom_sf(data = nc.32119) + aes(fill = BIR74) +
    scale_fill_gradientn(colors = viridis::viridis(20))


## ------------------------------------------------------------------------
ggplot() + geom_sf(data = nc.32119) + geom_sf(data = st_centroid(nc.32119))


## ------------------------------------------------------------------------
nc <- sf::st_read(system.file("gpkg/nc.gpkg", package = "sf"), quiet = TRUE)
nc_3857 <- sf::st_transform(nc, "+init=epsg:3857")
ggplot() + 
    geom_sf(data = nc_3857[1:3, ], aes(fill = AREA)) + 
	geom_sf_label(data = nc_3857[1:3, ], aes(label = NAME))


## ----geomraster,fig.cap='(ref:geomstars)'--------------------------------
library(stars)
library(ggplot2)
library(viridis)
system.file("tif/L7_ETMs.tif", package = "stars") %>% read_stars() -> x
ggplot() + geom_stars(data = x) + 
	coord_equal() + 
	facet_wrap(~band) + 
	scale_fill_viridis() + 
	theme_void() +
    scale_x_discrete(expand=c(0,0)) +
    scale_y_discrete(expand=c(0,0))


## ------------------------------------------------------------------------
ggplot() + geom_stars(data = x, downsample = c(10,10,1)) + 
	coord_equal() + 
	facet_wrap(~band) + 
	scale_fill_viridis() + 
	theme_void() +
    scale_x_discrete(expand=c(0,0))+
    scale_y_discrete(expand=c(0,0))


## ------------------------------------------------------------------------
library(spacetime)
data(air) # this loads several datasets in .GlobalEnv
d = st_dimensions(station = st_as_sfc(stations), time = dates)
aq = st_as_stars(list(PM10 = air), dimensions = d)
# ggplot() + geom_stars(data = aq[,,3000])
aq.sf = st_as_sf(aq[,,3000], long=TRUE)
ggplot() + 
   geom_sf(data = st_as_sf(DE_NUTS1)) + 
   geom_sf(data = aq.sf, mapping = aes(col = PM10)) + 
   ggtitle(aq.sf$time[1])

