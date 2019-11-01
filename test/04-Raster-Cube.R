## ------------------------------------------------------------------------
tif = system.file("tif/L7_ETMs.tif", package = "stars")
library(stars)
x = read_stars(tif)


## ------------------------------------------------------------------------
x


## ------------------------------------------------------------------------
length(x)
class(x[[1]])
dim(x[[1]])


## ------------------------------------------------------------------------
st_dimensions(x)


## ------------------------------------------------------------------------
st_bbox(x)


## ------------------------------------------------------------------------
write_stars(x, "x.tif")


## ----eval=FALSE----------------------------------------------------------
## st_drivers("raster")


## ----firststars,fig.cap="6 30m Landsat bands downsampled to 90m for Olinda, Br."----
plot(x)


## ----starsrgb, out.width = '100%', fig.cap = "two RGB composites", fig = 3, fig.show = 'hold'----
par(mfrow = c(1, 2))
plot(x, rgb = c(3,2,1), reset = FALSE, main = "RGB")    # rgb
plot(x, rgb = c(4,3,2), main = "False color (NIR-R-G)") # false color


## ------------------------------------------------------------------------
log(x)
x + 2 * log(x)


## ------------------------------------------------------------------------
x2 = x
x2[x < 50] = NA
x2


## ------------------------------------------------------------------------
x2[is.na(x2)] = 0
x2


## ------------------------------------------------------------------------
st_apply(x, c("x", "y"), mean)


## ------------------------------------------------------------------------
ndvi = function(x) (x[4]-x[3])/(x[4]+x[3])
st_apply(x, c("x", "y"), ndvi)


## ------------------------------------------------------------------------
as.data.frame(st_apply(x, c("band"), mean))


## ------------------------------------------------------------------------
st_apply(x, c("band"), quantile, c(.25, .5, .75))


## ------------------------------------------------------------------------
st_apply(x, c("x", "y"), quantile, c(.25, .5, .75))


## ----rastertypes, echo=FALSE,fig.cap="raster types supported by the stars package"----
x = 1:5
y = 1:4
d = st_dimensions(x = x, y = y, .raster = c("x", "y"))
m = matrix(runif(20),5,4)
r1 = st_as_stars(r = m, dimensions = d)

r = attr(d, "raster")
r$affine = c(0.2, -0.2)
attr(d, "raster") = r
r2 = st_as_stars(r = m, dimensions = d)

r = attr(d, "raster")
r$affine = c(0.1, -0.3)
attr(d, "raster") = r
r3 = st_as_stars(r = m, dimensions = d)

x = c(1, 2, 3.5, 5, 6)
y = c(1, 1.5, 3, 3.5)
d = st_dimensions(x = x, y = y, .raster = c("x", "y"))
r4 = st_as_stars(r = m, dimensions = d)

grd = st_make_grid(cellsize = c(10,10), offset = c(-130,10), n= c(8,5), crs=st_crs(4326))
r5 = st_transform(grd, "+proj=laea +lon_0=-70 +lat_0=35")

par(mfrow = c(2,3), mar = c(0.1, 1, 1.1, 1))
r1 = st_make_grid(cellsize = c(1,1), n = c(5,4), offset = c(0,0))
plot(r1, main = "regular")
plot(st_geometry(st_as_sf(r2)), main = "rotated")
plot(st_geometry(st_as_sf(r3)), main = "sheared")
plot(st_geometry(st_as_sf(r4, as_points = FALSE)), main = "rectilinear")
plot(st_geometry((r5)), main = "curvilinear")


## ----eval=FALSE----------------------------------------------------------
## install.packages("starsdata", repos = "http://pebesma.staff.ifgi.de", type = "source")


## ------------------------------------------------------------------------
granule = system.file("sentinel/S2A_MSIL1C_20180220T105051_N0206_R051_T32ULE_20180221T134037.zip", package = "starsdata")
file.size(granule)
base_name = strsplit(basename(granule), ".zip")[[1]]
s2 = paste0("SENTINEL2_L1C:/vsizip/", granule, "/", base_name, ".SAFE/MTD_MSIL1C.xml:10m:EPSG_32632")
(p = read_stars(s2, proxy = TRUE))
object.size(p)


## ------------------------------------------------------------------------
p2 = p * 2


## ------------------------------------------------------------------------
plot(p)


## ------------------------------------------------------------------------
floor(sqrt(prod(dim(p)) / prod(dev.size("px"))))


## ------------------------------------------------------------------------
methods(class = "stars_proxy")


## ----eval=FALSE----------------------------------------------------------
## a[i,j,k]


## ----eval=FALSE----------------------------------------------------------
## a[,j,]


## ------------------------------------------------------------------------
library(spacetime)
data(air) # this loads several datasets in .GlobalEnv
dim(air)
d = st_dimensions(station = st_as_sfc(stations), time = dates)
(aq = st_as_stars(list(PM10 = air), dimensions = d))


## ----airst, fig.cap="space-time diagram of PM$_{10}$ measurements by time and station", echo=TRUE, eval=TRUE, fig=TRUE----
image(aperm(log(aq), 2:1), main = "NA pattern (white) in PM10 station time series")


## ----airmap, fig.cap="locations of PM$_{10}$ measurement stations, showing mean values", echo=TRUE, eval=TRUE, fig=TRUE----
plot(st_as_sf(st_apply(aq, 1, mean, na.rm = TRUE)), reset = FALSE, pch = 16,
	ylim = st_bbox(DE)[c(2,4)])
plot(DE, add=TRUE)


## ------------------------------------------------------------------------
(a = aggregate(aq, st_as_sf(DE_NUTS1), mean, na.rm = TRUE))


## ----airagg, fig.cap="areal mean PM$_{10}$ values, for six days"---------
library(tidyverse)
a %>% filter(time >= "2008-01-01", time < "2008-01-07") %>% plot(key.pos = 4)


## ----airts, fig.cap="areal mean PM$_{10}$ values, for six days"----------
suppressPackageStartupMessages(library(xts))
plot(as.xts(a)[,4], main = DE_NUTS1$NAME_1[4])


## ----bristol1, fig.cap="Origin destination data zones for Bristol, UK, with zone 33 (E02003043) colored red"----
library(spDataLarge)
plot(st_geometry(bristol_zones), axes = TRUE, graticule = TRUE)
plot(st_geometry(bristol_zones)[33], col = 'red', add = TRUE)


## ------------------------------------------------------------------------
head(bristol_od)


## ------------------------------------------------------------------------
nrow(bristol_zones)^2
nrow(bristol_od)


## ------------------------------------------------------------------------
# create O-D-mode array:
bristol_tidy <- bristol_od %>% select(-all) %>% gather("mode", "n", -o, -d)
head(bristol_tidy)


## ------------------------------------------------------------------------
od = bristol_tidy %>% pull("o") %>% unique
nod = length(od)
mode = bristol_tidy %>% pull("mode") %>% unique
nmode = length(mode)
a = array(0L,  c(nod, nod, nmode), 
	dimnames = list(o = od, d = od, mode = mode))


## ------------------------------------------------------------------------
a[as.matrix(bristol_tidy[c("o", "d", "mode")])] = bristol_tidy$n


## ------------------------------------------------------------------------
order = match(od, bristol_zones$geo_code) # it happens this equals 1:102
zones = st_geometry(bristol_zones)[order]


## ------------------------------------------------------------------------
library(stars)
(d = st_dimensions(o = zones, d = zones, mode = mode))


## ------------------------------------------------------------------------
(odm = st_as_stars(list(N = a), dimensions = d))


## ------------------------------------------------------------------------
plot(odm[,,33] + 1, logz = TRUE)


## ------------------------------------------------------------------------
d = st_apply(odm, 2, sum)
which.max(d[[1]])


## ------------------------------------------------------------------------
st_apply(odm, 1:2, sum)


## ------------------------------------------------------------------------
st_apply(odm, c(1,3), sum)


## ------------------------------------------------------------------------
st_apply(odm, c(2,3), sum)


## ------------------------------------------------------------------------
o = st_apply(odm, 1, sum)


## ------------------------------------------------------------------------
d = st_apply(odm, 2, sum)


## ------------------------------------------------------------------------
x = (c(o, d, along = list(od = c("origin", "destination"))))
plot(x, logz = TRUE)


## ------------------------------------------------------------------------
library(units)
a = as.numeric(set_units(st_area(st_as_sf(o)), km^2))
dens_o = o / a
dens_d = d / a
plot(c(dens_o, dens_d, along = list(od = c("origin", "destination"))), logz = TRUE)

