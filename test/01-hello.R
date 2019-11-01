## ----first-map, fig.cap="a first map", eval=TRUE, fig=TRUE---------------
library(tidyverse)
library(sf)
system.file("gpkg/nc.gpkg", package="sf") %>%
	read_sf() %>%
	st_transform(32119) %>%
	select(BIR74) %>%
	plot(graticule = TRUE, axes = TRUE)


## ------------------------------------------------------------------------
library(tidyverse)
library(sf)


## ----eval=FALSE----------------------------------------------------------
## a %>% b() %>% c() %>% d(n = 10)


## ----eval=FALSE----------------------------------------------------------
## d(c(b(a)), n = 10)


## ----eval=FALSE----------------------------------------------------------
## tmp1 <- b(a)
## tmp2 <- c(tmp1)
## tmp3 <- d(tmp2, n = 10)


## ------------------------------------------------------------------------
(file <- system.file("gpkg/nc.gpkg", package="sf"))


## ------------------------------------------------------------------------
(file %>% read_sf()  -> nc)


## ------------------------------------------------------------------------
class(nc)


## ------------------------------------------------------------------------
(nc %>% st_transform(32119) -> nc.32119)


## ------------------------------------------------------------------------
(nc.32119 %>% select(BIR74) -> nc.32119.bir74)


## ----eval=FALSE----------------------------------------------------------
## nc.32119.bir74 %>% plot(graticule = TRUE, axes = TRUE)


## ----first-mapa, fig.cap="a first map", eval=FALSE, fig=FALSE, echo=TRUE----
## system.file("gpkg/nc.gpkg", package="sf") %>%
## 	read_sf() %>%
## 	st_transform(32999) %>%
## 	select(BIR74) %>%
## 	plot(graticule = TRUE, axes = TRUE)

## ----first-mapb, fig.cap="a first map", eval=TRUE, fig=FALSE, echo=FALSE----
try(system.file("gpkg/nc.gpkg", package="sf") %>%
	read_sf() %>%
	st_transform(32999) %>%
	select(BIR74) %>%
	plot(graticule = TRUE, axes = TRUE))


## ----first-mapc, fig.cap="a first map", eval=FALSE, fig=FALSE, echo=TRUE----
## system.file("gpkg/nc.gpkg", package="sf") %>%
## 	read_sf() %>%
## 	st_transform(32119) %>%
## 	select(BIR75) %>%
## 	plot(graticule = TRUE, axes = TRUE)

## ----first-mapd, fig.cap="a first map", eval=TRUE, fig=FALSE, echo=FALSE----
try(system.file("gpkg/nc.gpkg", package="sf") %>%
	read_sf() %>%
	st_transform(32119) %>%
	select(BIR75) %>%
	plot(graticule = TRUE, axes = TRUE))


## ----eval=FALSE----------------------------------------------------------
## ?library


## ------------------------------------------------------------------------
methods(select)


## ------------------------------------------------------------------------
nc %>% select(BIR74) %>% names()


## ------------------------------------------------------------------------
nc %>% as_tibble(validate = TRUE) %>% select(BIR74) %>% names()


## ----firstggplot,fig.cap="first ggplot"----------------------------------
ggplot() + geom_sf(data = nc.32119) + aes(fill = BIR74) +
    theme(panel.grid.major = element_line(color = "white")) +
    scale_fill_gradientn(colors = sf.colors(20))


## ----firstgather,fig.cap="ggplot with facet maps"------------------------
nc.32119 %>% select(SID74, SID79) %>% gather(VAR, SID, -geom) -> nc2
ggplot() + geom_sf(data = nc2, aes(fill = SID)) + facet_wrap(~VAR, ncol = 1) +
  scale_y_continuous(breaks = 34:36) +
  scale_fill_gradientn(colors = sf.colors(20)) +
  theme(panel.grid.major = element_line(color = "white"))


## ------------------------------------------------------------------------
suppressPackageStartupMessages(library(mapview))
nc.32119 %>% mapview(zcol = "BIR74", legend = TRUE, col.regions = sf.colors)


## ------------------------------------------------------------------------
st_drivers("vector") %>% nrow() # vector drivers
st_drivers("raster") %>% nrow() # raster drivers


## ----gdal-fig, out.width = '100%', echo=FALSE,fig.cap = "sf and its dependencies; arrows indicate strong dependency, dashed arrows weak dependency"----
knitr::include_graphics("images/sf_deps.png")


## ------------------------------------------------------------------------
library(stars)
tif = system.file("tif/L7_ETMs.tif", package = "stars")
(x = tif %>% read_stars())


## ------------------------------------------------------------------------
plot(x)


## ------------------------------------------------------------------------
tif_file = paste0(tempfile(), ".tif")
write_stars(x, tif_file)


## ------------------------------------------------------------------------
read_stars(tif_file, proxy = TRUE)


## ------------------------------------------------------------------------
system.file("gpkg/nc.gpkg", package="sf") %>% read_sf() -> nc


## ------------------------------------------------------------------------
list.files(system.file("shape/", package = "sf"))


## ------------------------------------------------------------------------
system.file("shape/nc.shp", package="sf") %>% read_sf() -> nc


## ------------------------------------------------------------------------
system.file("shape", package="sf") %>% read_sf() -> something


## ------------------------------------------------------------------------
system.file("shape", package="sf") %>% st_layers()


## ------------------------------------------------------------------------
dataset <- system.file("shape", package="sf")
layer <- "nc"
nc <- read_sf(dataset, layer)


## ------------------------------------------------------------------------
str <- '{
  "type": "FeatureCollection",
  "features": [
    { "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [102.0, 0.5]
      },
      "properties": {
        "prop0": "value0"
      }
    },
    { "type": "Feature",
      "geometry": {
        "type": "LineString",
        "coordinates": [
          [102.0, 0.0], [103.0, 1.0], [104.0, 0.0], [105.0, 1.0]
        ]
      },
      "properties": {
        "prop0": "value0",
        "prop1": 0.0
      }
    },
    { "type": "Feature",
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [100.0, 0.0], [101.0, 0.0], [101.0, 1.0],
            [100.0, 1.0], [100.0, 0.0]
          ]
        ]
      },
      "properties": {
        "prop0": "value0",
        "prop1": { "this": "that" }
      }
    }
  ]
}'
(sf_obj <- read_sf(str))


## ------------------------------------------------------------------------
library(RSQLite)
db = system.file("sqlite/meuse.sqlite", package = "sf")
dbcon <- dbConnect(dbDriver("SQLite"), db)
(s = st_read(dbcon, "meuse.sqlite"))[1:3,]
dbDisconnect(dbcon)


## ------------------------------------------------------------------------
st_read(db)[1:3,]

