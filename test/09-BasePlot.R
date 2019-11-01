## ----plotsf,out.width='100%',fig.cap="default plot with multiple attributes", fig=TRUE----
system.file("gpkg/nc.gpkg", package="sf") %>% read_sf -> nc
plot(nc)


## ----plotkey,out.width='60%',fig.cap="two attributes sharing a key", fig=TRUE----
suppressPackageStartupMessages(library(dplyr))
nc %>% select(SID74, SID79) %>% plot(key.pos = 4) # 1: below; 4: right


## ----viridis,out.width='60%',fig.cap="controlling key color and breaks; log transform causes zero values to remain uncolored; custom key size parameters",fig=TRUE----
plot(nc["SID74"], logz = TRUE, pal = viridis::viridis,
    breaks = c(0,.5,1,1.5,2,2.5), at = c(0,.5,1,1.5,2,2.5),
	key.width = lcm(1.3), key.length = 1)


## ----figadd,out.width='60%',fig.cap="adding plot elements to a map with a key; graticule and axes",fig=TRUE----
plot(nc["SID74"], pal = viridis::viridis, reset = FALSE, graticule = TRUE, axes = TRUE)
plot(st_point(c(-81.498,36.434)), col = 'red', pch = 1, cex = 4, lwd = 3, add = TRUE)
layout(matrix(1)) # manually reset the plotting region split-up


## ----starstext,out.width='60%',fig.cap="stars plots with text values (left) and interpolated rgb colors (right); both maps plot a 10 x 10 raster"----
tif = system.file("tif/L7_ETMs.tif", package = "stars")
library(stars)
x = read_stars(tif)
par(mfrow = c(1, 2))
plot(x[,1:10,1:10,1], text_values=TRUE, key.pos = NULL, col = viridis::viridis(10), 
	reset = FALSE)
plot(x[,1:10,1:10,1:3], rgb=1:3, interpolate = TRUE, reset = FALSE)


## ----rastersheared,fig.cap="sheared rasters, plotted as simple features; left: with merged polygon features, middle: with seperate polygons, right: as point features"----
par(mfrow = c(1, 3))
xs = adrop(x[,1:10,1:10,1])
attr(attr(xs, "dimensions"), "raster")$affine = c(1, 3)
plot(xs, col = viridis::viridis(10), key.pos = NULL, reset = FALSE)
plot(st_as_sf(xs, as_points = FALSE, merge = FALSE), pal = viridis::viridis, 
    key.pos = NULL, reset = FALSE)
plot(st_as_sf(xs, as_points = TRUE, merge = FALSE), key.pos = NULL, 
    pal = viridis::viridis, pch = 16, reset = FALSE)


## ----griddraw,fig.width=4,fig.height=4,fig.cap="simple plot created with grid functions"----
library(grid)
system.file("gpkg/nc.gpkg", package="sf") %>% read_sf -> nc
st_viewport(nc) %>% pushViewport
st_geometry(nc) %>% lapply(st_as_grob) %>% lapply(grid.draw) -> x

