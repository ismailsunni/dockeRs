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

## ----polar, out.width = '50%', fig.cap="Two-dimensional polar (red) and Cartesian (blue) coordinates", eval=TRUE, fig=TRUE, echo=FALSE----
par(mar = rep(0,4))
plot(3, 4, xlim = c(-6,6), ylim = c(-6,6), asp = 1)
axis(1, pos = 0, at = 0:6)
axis(2, pos = 0, at = -6:6)
xd = seq(-5, 5, by = .1)
lines(xd, sqrt(25 - xd^2), col = 'grey')
lines(xd, -sqrt(25 - xd^2), col = 'grey')
arrows(0, 0, 3, 4, col = 'red', length = .15, angle = 20)
text(1.5, 2.7, label = "r", col = 'red')
xd = seq(3/5, 1, by = .1)
lines(xd, sqrt(1 - xd^2), col = 'red')
text(1.2, 0.5, label = parse(text = "phi"), col = 'red')
lines(c(3,3), c(0,4), lty = 2, col = 'blue')
lines(c(0,3), c(4,4), lty = 2, col = 'blue')
text(3.3, 0.3, label = "x", col = 'blue')
text(0.3, 4.3, label = "y", col = 'blue')


## ----ellipse, out.width = '50%', fig.cap="Angles on an ellipse: geodetic (blue) and geocentric (red) latitude", eval=TRUE, fig=TRUE, echo=FALSE----
par(mar = rep(0,4))
x = 4
y = 5/8 * sqrt(48)
plot(x, y, xlim = c(-6,6), ylim = c(-8,8), asp = 1)
axis(1, pos = 0, at = 0:9)
axis(2, pos = 0, at = -5:5)
xd = seq(-8, 8, by = .1)
lines(xd, 5/8 * sqrt(64 - xd^2), col = 'grey')
lines(xd, 5/8 * -sqrt(64 - xd^2), col = 'grey')
arrows(0, 0, x, y, col = 'red', length = .15, angle = 20)
b = (x * 25) / (-y * 64)
a = y - x * b
abline(a, b, col = 'grey')
b = -1/b
x0 = x - y / b
arrows(x0, 0, x, y, col = 'blue', length = .15, angle = 20)
text(1.2, 0.5, label = parse(text = "psi"), col = 'red')
text(3, 0.5, label = parse(text = "phi"), col = 'blue')


## ------------------------------------------------------------------------
(d = as.Date("1970-02-01"))
as.numeric(d)


## ------------------------------------------------------------------------
(t = as.POSIXct("1970-01-02 00:00", tz = "UTC"))
as.numeric(t)

## ------------------------------------------------------------------------
(pt = st_point(c(0,1)))
attributes(pt)


## ------------------------------------------------------------------------
system.file("shape/storms_xyz_feature.shp", package="sf") %>%
	st_read()
system.file("shape/storms_xyzm_feature.shp", package="sf") %>% # badly named!
	st_read()
(pzm = st_point(c(1,2,3,4)))


## ------------------------------------------------------------------------
(m1 = rbind(c(8, 1), c(2, 5), c(3, 2)))
(mp = st_multipoint(m1))
(ls = st_linestring(m1))


## ------------------------------------------------------------------------
st_dimension(mp)
st_dimension(ls)


## ------------------------------------------------------------------------
m2 = rbind(c(22,20), c(18, 15))
(mls = st_multilinestring(list(m1, m2)))


## ------------------------------------------------------------------------
(ring1 = rbind(c(0,0), c(4,0), c(4,4), c(0,4), c(0,0)))
(p1 = st_polygon(list(ring1)))
(ring2 = ring1 + 5)
(ring3 = (ring1[5:1,] / 4) + 6)
(p2 = st_polygon(list(ring2, ring3)))


## ------------------------------------------------------------------------
(mpol = st_multipolygon(list(list(ring1), list(ring2, ring3))))


## ------------------------------------------------------------------------
st_geometrycollection(list(pt, mp, ls, mpol))


## ------------------------------------------------------------------------
st_point(c(1/3, 2/3))
print(st_point(c(1/3, 2/3)), digits = 16)
print(st_point(c(1/3, 2/3)), digits = 3)


## ------------------------------------------------------------------------
(wkb = st_as_binary(st_point(c(1/3, 2/3))))
st_as_sfc(wkb)[[1]]


## ------------------------------------------------------------------------
st_is_simple(st_linestring(rbind(c(0,0), c(1,1), c(1,0), c(0,1)))) # self-intersects
st_is_valid(st_polygon(list(rbind(c(1,1), c(0,0), c(1,1), c(2,2), c(2,1), c(1,1))))) # repeats


## ------------------------------------------------------------------------
(e = st_intersection(st_point(c(0,0)), st_point(c(1,1))))


## ------------------------------------------------------------------------
st_is_empty(e)


## ------------------------------------------------------------------------
methods(st_cast)


## ------------------------------------------------------------------------
(ls <- st_as_sfc("CIRCULARSTRING(0 0,1 0,1 1)") %>% st_cast("LINESTRING"))
plot(ls, axes = TRUE)


## ------------------------------------------------------------------------
rbind(c(0,0), c(1,1), c(1,0), c(0,1)) %>% st_linestring() %>% st_cast("POINT")


## ------------------------------------------------------------------------
rbind(c(0,0), c(1,1), c(1,0), c(0,1)) %>% st_linestring() %>% st_cast("POINT")


## ------------------------------------------------------------------------
(p <- rbind(c(0,0), c(1,1), c(1,0), c(0,1)) %>% st_linestring() %>% st_sfc() %>% st_cast("POINT"))


## ------------------------------------------------------------------------
pt <- st_point(c(1, 0))
ls <- st_linestring(matrix(c(4, 3, 0, 0), ncol = 2))
poly1 <- st_polygon(list(matrix(c(5.5, 7, 7, 6, 5.5, 0, 0, -0.5, -0.5, 0), ncol = 2)))
poly2 <- st_polygon(list(matrix(c(6.6, 8, 8, 7, 6.6, 1, 1, 1.5, 1.5, 1), ncol = 2)))
multipoly <- st_multipolygon(list(poly1, poly2))

j <- st_geometrycollection(list(pt, ls, poly1, poly2, multipoly))

st_collection_extract(j, "POLYGON")
st_collection_extract(j, "POINT")
st_collection_extract(j, "LINESTRING")


## ------------------------------------------------------------------------
(sfc = st_sfc(st_point(c(0,1)), st_point(c(-3,2)), crs = 4326))


## ------------------------------------------------------------------------
class(sfc)


## ------------------------------------------------------------------------
attributes(sfc) %>% names() %>% setdiff("class")


## ------------------------------------------------------------------------
(p <- rbind(c(0,0), c(1,1), c(1,0), c(0,1)) %>% st_linestring() %>% st_sfc() %>% st_cast("POINT"))


## ------------------------------------------------------------------------
length(p)


## ------------------------------------------------------------------------
p %>% st_combine
p %>% st_combine %>% st_cast("LINESTRING")


## ------------------------------------------------------------------------
p[[2]]


## ------------------------------------------------------------------------
(g = st_sfc(st_point(c(0,0)), st_linestring(rbind(c(0,0), c(1,1)))))


## ------------------------------------------------------------------------
g %>% st_is("LINESTRING")


## ------------------------------------------------------------------------
st_sf(g) %>% filter(st_is(., "LINESTRING"))


## ------------------------------------------------------------------------
sf = st_sf(sfc)
class(sf)


## ------------------------------------------------------------------------
sf %>% attributes() %>% names() %>% setdiff(c("row.names", "class", "names"))


## ------------------------------------------------------------------------
pts = rbind(c(-179,0), c(179,0), c(179,1), c(-179,1), c(-179,0))
date_line = st_sfc(st_polygon(list(pts)), crs = 4326)
st_bbox(date_line) %>% st_as_sfc()


## ------------------------------------------------------------------------
pts = rbind(c(0,89), c(120,89), c(240,89), c(0,89))
pole = st_sfc(st_polygon(list(pts)), crs = 4326)
st_bbox(pole) %>% st_as_sfc()


## ------------------------------------------------------------------------
st_is_valid(st_polygon(list(rbind(c(0,0), c(0,1), c(1,1), c(0,0)))))

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

## ------------------------------------------------------------------------
st_is_simple(st_sfc(
	st_point(c(0,1)),
	st_linestring(rbind(c(0,0), c(1,1), c(0,1), c(1,0))))) # self-intersects


## ------------------------------------------------------------------------
st_is_valid(st_sfc(
	st_linestring(rbind(c(1,1), c(1,2))),
	st_linestring(rbind(c(1,1), c(1,1))))) # zero-length


## ------------------------------------------------------------------------
st_is_empty(st_point())


## ------------------------------------------------------------------------
demo(nc, ask = FALSE, echo = FALSE)
st_is_longlat(nc)
nc2 <- st_transform(nc, 3857) # to web Mercator
st_is_longlat(nc2)
st_is_longlat(st_point(0:1))


## ------------------------------------------------------------------------
st_is(st_point(0:1), "POINT")
all(st_is(nc, "POLYGON"))
all(st_is(nc, "MULTIPOLYGON"))


## ------------------------------------------------------------------------
st_sfc(st_point(0:1), st_point(1:2)) == st_sfc(st_point(0:1))
st_linestring(rbind(c(0,0), c(1,1))) == st_linestring(rbind(c(1,1), c(0,0)))


## ------------------------------------------------------------------------
(r <- st_touches(nc2[1:2,], nc2))
str(r)


## ------------------------------------------------------------------------
methods(class = 'sgbp')


## ------------------------------------------------------------------------
B = st_linestring(rbind(c(0,0), c(1,0)))
A = st_point(c(0.5, 0)) # halfway the line
st_relate(A, B)


## ------------------------------------------------------------------------
st_relate(A, B, pattern = "F0FFFFFFF") %>% as.matrix()


## ------------------------------------------------------------------------
st_distance(nc[1:3,], nc[2:4,], by_element = TRUE) %>% setNames(NULL)
st_distance(nc[1:3,], nc[2:4,])


## ----vor, out.width='60%', fig.cap="left: convex hull (red) around a polygon (black); right: voronoi diagram (red) from a `MULTIPOINT` (black)", echo=TRUE, eval=TRUE, fig=TRUE----
par(mar = rep(0,4), mfrow = c(1, 2))
plot(st_geometry(nc)[1], col = NA, border = 'black')
plot(st_convex_hull(st_geometry(nc)[1]), add = TRUE, col = NA, border = 'red')
box()
set.seed(131)
mp = st_multipoint(matrix(runif(20), 10))
plot(mp)
plot(st_voronoi(mp), add = TRUE, col = NA, border = 'red')
box()


## ------------------------------------------------------------------------
(A = st_point(c(1,2)))
(B = st_linestring(rbind(c(2,2), c(3,4))))
-A
B + A
st_sfc(B + A) * matrix(c(1,0,0,2), 2, 2)
st_sfc(A, B) * c(3, 5) # scale first by 3, second by 5:


## ------------------------------------------------------------------------
a = st_sf(a = 1, geom = st_sfc(st_linestring(rbind(c(0,0), c(1,0)))))
b = st_sf(b = 1:3, geom = st_sfc(st_point(c(0,0)), st_point(c(1,0)), st_point(c(2,0))))
st_intersection(a, b)


## ------------------------------------------------------------------------
st_union(b, by_feature = FALSE) # default
st_union(b, by_feature = TRUE) # default


## ------------------------------------------------------------------------
bb = st_geometry(b)
c(bb, bb)


## ------------------------------------------------------------------------
c(st_point(0:1), st_point(1:2))


## ------------------------------------------------------------------------
st_combine(c(bb, bb))


## ------------------------------------------------------------------------
(x = st_combine(st_sfc(st_linestring(rbind(c(0,0), c(1,1))), st_linestring(rbind(c(1,0),c(0,1))))))
st_is_valid(x)
st_union(x) %>% st_is_valid()


## ------------------------------------------------------------------------
sq = function(pt, sz = 1) st_polygon(list(rbind(c(pt - sz), 
  c(pt[1] + sz, pt[2] - sz), c(pt + sz), c(pt[1] - sz, pt[2] + sz), c(pt - sz))))
x = st_sf(box = 1:3, st_sfc(sq(c(0,0)), sq(c(1.7, -0.5)), sq(c(0.5, 1))))
(ixx = st_intersection(x, x)) %>% nrow
lengths(st_overlaps(ixx, ixx))


## ------------------------------------------------------------------------
(i = st_intersection(x))


## ------------------------------------------------------------------------
lengths(st_overlaps(i, i))


## ----boxes, out.width='50%', fig.cap="left: three overlapping boxes -- how do we identify the small box where all three overlap? right: unique, non-overlapping n-ary intersections", echo=FALSE, eval=TRUE, fig=TRUE----
par(mar = rep(.1, 4), mfrow = c(1, 2))
plot(st_geometry(x), col = NA, border = sf.colors(3, categorical=TRUE), lwd = 3)
plot(st_intersection(st_geometry(x)), col = sf.colors(7, categorical=TRUE, alpha = .5))


## ------------------------------------------------------------------------
(xd = st_difference(x))


## ----diff, out.width='50%', fig.cap="difference between subsequent boxes, left: in original order; right: in reverse order", echo=FALSE, eval=TRUE, fig=TRUE----
par(mar = rep(.1, 4), mfrow = c(1, 2)) 
xg = st_geometry(x)
plot(st_difference(xg), col = sf.colors(3, alpha = .5, categorical=TRUE))
plot(st_difference(xg[3:1]), col = sf.colors(3, alpha = .5, categorical=TRUE))


## ------------------------------------------------------------------------
lengths(st_overlaps(xd, xd))


## ------------------------------------------------------------------------
(p = st_sfc(st_point(c(1e6/3, 1e4/3)), crs = 3857))
p %>% st_set_precision(-1) %>% st_as_binary() %>% st_as_sfc() %>% `[[`(1) %>% print(digits = 16)


## ------------------------------------------------------------------------
p %>% st_set_precision(1000) %>% st_as_binary() %>% st_as_sfc() %>% `[[`(1)


## ------------------------------------------------------------------------
p %>% st_set_precision(0.001) %>% st_as_binary() %>% st_as_sfc() %>% `[[`(1) # to nearest 1000
p %>% st_set_precision(0.05) %>% st_as_binary() %>% st_as_sfc()  %>% `[[`(1) # to nearest 20


## ------------------------------------------------------------------------
p %>% st_set_precision(units::set_units(5, cm)) %>% 
	st_as_binary() %>% 
	st_as_sfc() %>% `[[`(1) %>% print(digits = 10)


## ----invalid, out.width='60%', fig.cap="n-ary intersection that may lead to invalid geometries", echo=TRUE, eval=TRUE, fig=TRUE----
n = 12 # n points, equally spread along unit circle:
pts = (1:n)/n * 2 * pi 
xy = st_as_sf(data.frame(x = cos(pts), y = sin(pts)), coords = c("x", "y"))
buf_size = 0.8
precision = 1000
b = st_buffer(xy, buf_size)
i = st_intersection(st_set_precision(b, precision))
par(mar = rep(0, 4))
plot(i[1], col = sf.colors(nrow(i), categorical = TRUE))
all(st_is_valid(i))


## ------------------------------------------------------------------------
i = st_intersects(nc[1,], nc[2,])

## ------------------------------------------------------------------------
library(sf)
library(dplyr)
system.file("gpkg/nc.gpkg", package="sf") %>%
	read_sf() %>%
	st_transform(32119) %>%
	select(BIR74, SID74, NAME) %>%
	st_centroid() %>%
	head(n = 1) -> x # save as x
st_geometry(x)[[1]]


## ------------------------------------------------------------------------
nc <- system.file("gpkg/nc.gpkg", package="sf") %>%
	read_sf() %>%
	st_transform(32119)
nc1 <- nc %>% select(BIR74, SID74, NAME) %>%
	st_set_agr(c(BIR74 = "aggregate", SID74 = "aggregate", NAME = "identity"))


## ------------------------------------------------------------------------
nc1 %>% select(NAME) %>%
	st_centroid() %>%
	head(1)


## ------------------------------------------------------------------------
nc1 %>% select(NAME) %>%
	st_centroid() %>% 
	st_agr()


## ------------------------------------------------------------------------
a = st_sf(a = 1:2, geom = st_sfc(st_point(c(0,0)), st_point(c(1,1))))
b = st_sf(b = 3:4, geom = st_sfc(st_linestring(rbind(c(2,0), c(0,2))), st_point(c(1,1))))
st_join(a, b)
st_join(a, b, left = FALSE)
st_join(b, a)


## ----largest, out.width='60%', fig.cap='(ref:foo)', echo=FALSE-----------
# example of largest = TRUE:
nc <- st_transform(read_sf(system.file("shape/nc.shp", package="sf")), 2264)
gr = st_sf(
         label = apply(expand.grid(1:10, LETTERS[10:1])[,2:1], 1, paste0, collapse = " "),
         geom = st_make_grid(nc))
gr$col = sf.colors(10, categorical = TRUE, alpha = .3)
# cut, to check, NA's work out:
gr = gr[-(1:30),]
suppressWarnings(nc_j <- st_join(nc, gr, largest = TRUE))
# the two datasets:
opar = par(mfrow = c(2,1), mar = rep(0,4))
plot(st_geometry(nc_j))
plot(st_geometry(gr), add = TRUE, col = gr$col)
text(st_coordinates(st_centroid(st_geometry(gr))), labels = gr$label)
# the joined dataset:
plot(st_geometry(nc_j), border = 'black', col = nc_j$col)
text(st_coordinates(st_centroid(st_geometry(nc_j))), labels = nc_j$label, cex = .8)
plot(st_geometry(gr), border = 'green', add = TRUE)
par(opar)


## ----union, out.width='60%', fig.cap="left: invalid `MULTIPOLYGON` with two external rings with common boundary, right: valid `POLYGON` obtained after unioning the geometry left", echo=FALSE----
nc1 = st_geometry(nc)[1]
nc2 = st_geometry(nc)[2]
par(mfrow = c(1, 2))
plot(st_combine(c(nc1, nc2)))
plot(st_union(c(nc1, nc2)))


## ------------------------------------------------------------------------
p1 = st_polygon(list(rbind(c(0,0), c(4,0), c(4,4), c(0,4), c(0,0))))
d1 = st_sf(a = c(3,1), geom = st_sfc(p1, p1 + c(4, 0)))
d2 = st_sf(b = c(4), geom = st_sfc(p1 * .75 + c(3, 2)))


## ------------------------------------------------------------------------
(i = st_intersection(d1, d2))

## ----intersection, out.width='60%', fig.cap="left: overlapping geometries (d2: red); right: intersection areas (i: grey)"----
plot(d1, xlim = c(0,8), ylim = c(0, 6), col = NA, border = 1, reset = FALSE)
plot(d2, col = NA, border = 'red', add = TRUE, lwd = 2)
plot(d1, xlim = c(0,8), ylim = c(0, 6), col = NA, border = 1, lwd = 2, reset = FALSE)
plot(d2, col = NA, border = 'red', add = TRUE, lwd = 3)
plot(st_geometry(i), add = TRUE, col = grey(c(.7,.9)), , border = 'green', lwd = 1)


## ------------------------------------------------------------------------
st_join(d2, d1, largest = TRUE)


## ------------------------------------------------------------------------
aggregate(d1, d2, mean)


## ------------------------------------------------------------------------
d3 = st_sfc(p1 * .75 + c(3, 2), p1 * .75 + c(3,3))
st_interpolate_aw(d1, d3, extensive = FALSE)$a
st_interpolate_aw(d1, d3, extensive = TRUE)$a

## ----echo=FALSE----------------------------------------------------------
Sys.setenv(UDUNITS2_XML_PATH="")


## ------------------------------------------------------------------------
library(units)
(a = set_units(1:3, m))
a_km = set_units(1:3, km)
a + a_km
b = set_units(4:6, s)
a / b


## ----error=TRUE----------------------------------------------------------
a + b


## ------------------------------------------------------------------------
(d = as.Date("1970-02-01"))
as.numeric(d)


## ------------------------------------------------------------------------
(d = as.Date("01.02.1970", format = "%d.%m.%Y"))
format(d, format = "%d.%m.%Y")


## ------------------------------------------------------------------------
t = as.POSIXct("1970-01-01 01:00:00", tz = "UTC")
as.numeric(t)
names(unclass(as.POSIXlt(t)))
unclass(as.POSIXlt(t))$hour


## ------------------------------------------------------------------------
(t = as.POSIXct("1970-01-01 00:00:00", tz = "PST"))


## ------------------------------------------------------------------------
as.numeric(t)


## ------------------------------------------------------------------------
(t = as.POSIXct("1970-01-01 23:00:00", tz = "PST"))
as.Date(t)
format(as.POSIXct(as.Date(t)), tz = "UTC")


## ------------------------------------------------------------------------
Sys.setenv(TZ="UTC")


## ------------------------------------------------------------------------
st_crs(4326)


## ------------------------------------------------------------------------
st_crs("+proj=longlat")


## ------------------------------------------------------------------------
st_crs()


## ------------------------------------------------------------------------
methods(class = "crs")


## ------------------------------------------------------------------------
st_crs(4326) == st_crs("+proj=longlat")


## ------------------------------------------------------------------------
cat(st_as_text(st_crs(4326), pretty = TRUE))


## ------------------------------------------------------------------------
methods(st_crs)


## ------------------------------------------------------------------------
st_crs(st_sfc(crs = 4326), parameters = TRUE)[c(1:4, 8)]

## ----world,fig.cap="Earth country boundaries; left: mapping long/lat to x and y; right: as seen from space", fig=TRUE,echo=FALSE,message=FALSE----
library(sf)
library(rnaturalearth)
w <- ne_countries(scale = "medium", returnclass = "sf")
layout(matrix(1:2, 1, 2), c(2,1))
plot(st_geometry(w))

circ = function(l = c(-180:180), lon0 = 0, lat0 = 30) {
	deg2rad = pi / 180
	lat = atan(-cos((l - lon0) * deg2rad)/tan(lat0 * deg2rad)) / deg2rad
	xy = if (lat0 == 0) {
		l1 = lon0 - 90
		l2 = lon0 + 90
		rbind(c(l1,-90), c(l2,-90), c(l2,0), c(l2,90), c(l1,90), c(l1,0), c(l1,-90))
	} else if (lat0 > 0) {
		xy = cbind(lon = l, lat = lat)
		rbind(c(-180,90),xy,c(180,90),c(-180,90))
	} else {
		xy = cbind(lon = l, lat = lat)[length(l):1,]
		rbind(c(180,-90), xy, c(-180,-90),c(180,-90))
	}
	st_sfc(st_polygon(list(xy)), crs = st_crs(4326))
	# TODO: break at dateline, guarantee within -180,180
}

m = st_make_grid()
m = st_segmentize(m, 4e5)

i = 0
par(mar = rep(0,4))
lat=30+(i/2)
lon=-10-(i/2)
p4s=paste0("+proj=ortho +lat_0=", lat, " +lon_0=", lon)
plot(st_transform(m, st_crs(p4s), check = TRUE), col = 'lightblue', border = 'grey')
crc = circ(lat0 = lat, lon0 = lon)
w0 = suppressWarnings(st_intersection(w, crc))
w0 = st_cast(w0, "MULTIPOLYGON")
plot(st_transform(st_geometry(w0), st_crs(p4s), check = TRUE), add = TRUE)


## ----eval=FALSE----------------------------------------------------------
## library(sf)
## library(rnaturalearth)
## w <- ne_countries(scale = "medium", returnclass = "sf")
## plot(st_geometry(w))


## ------------------------------------------------------------------------
st_crs(w)


## ------------------------------------------------------------------------
DE = st_geometry(ne_countries(country = "germany", returnclass = "sf"))
DE.eqc = st_transform(DE, "+proj=eqc +lat_ts=51.14 +lon_0=90w")


## ------------------------------------------------------------------------
mean(st_bbox(DE)[c("ymin", "ymax")])


## ----eqc,out.width='60%', fig.cap="Germany in equidistant cylindrical projection: left with degrees, right with metres along the axes"----
par(mfrow = c(1, 2))
plot(DE, axes = TRUE)
plot(DE.eqc, axes = TRUE)


## ----error=TRUE----------------------------------------------------------
sq = rbind(c(-89,0), c(-89,1), c(-91,1), c(-91,0), c(-89,0))
pol = st_sfc(st_polygon(list(sq)), crs = 4326)
(pol.o = st_transform(pol, "+proj=ortho +lat_0=0 +lon_0=0"))[[1]]
st_is_valid(pol.o, NA_on_exception=FALSE)


## ------------------------------------------------------------------------
library(classInt)
r = rnorm(100)
classIntervals(r)
classIntervals(r)$brks


## ------------------------------------------------------------------------
(ls = st_sfc(st_linestring(rbind(c(-179.5, 52), c(179.5, 52))), crs = 4326))


## ------------------------------------------------------------------------
st_length(ls)


## ------------------------------------------------------------------------
dateline = st_sfc(st_linestring(rbind(c(180, 51), c(180, 53))), crs = 4326)
st_intersects(ls, dateline)


## ------------------------------------------------------------------------
(ls.w = st_wrap_dateline(ls))[[1]]


## ------------------------------------------------------------------------
(ls.w2 = st_wrap_dateline(st_segmentize(ls, units::set_units(30, km))))[[1]]


## ------------------------------------------------------------------------
st_bbox(ls.w)


## ------------------------------------------------------------------------
pole = st_sfc(st_polygon(list(rbind(c(0,80), c(120,80), c(240,80), c(0,80)))), crs = 4326)


## ------------------------------------------------------------------------
st_intersects(pole, st_sfc(st_point(c(0,90)), crs = 4326))


## ------------------------------------------------------------------------
st_area(pole)

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






## ------------------------------------------------------------------------
files = list.files("aq", pattern = "*.csv", full.names = TRUE)
r = lapply(files[-1], function(f) read.csv(f))


## ------------------------------------------------------------------------
Sys.setenv(TZ = "UTC") # make sure times are not interpreted as DST
r = lapply(r, function(f) {
		f$t = as.POSIXct(f$DatetimeBegin) 
		f[order(f$t), ] 
	}
) 


## ------------------------------------------------------------------------
r = r[sapply(r, nrow) > 1000]
names(r) =  sapply(r, function(f) unique(f$AirQualityStationEoICode))
length(r) == length(unique(names(r)))


## ------------------------------------------------------------------------
library(xts)
r = lapply(r, function(f) xts(f$Concentration, f$t))
aq = do.call(cbind, r)


## ------------------------------------------------------------------------
# remove stations with more than 75% missing values:
sel = apply(aq, 2, function(x) sum(is.na(x)) < 0.75 * 365 * 24)
aqsel = aq[, sel] # stations are in columns


## ------------------------------------------------------------------------
library(tidyverse)
read.csv("aq/AirBase_v8_stations.csv", sep = "\t", stringsAsFactors = FALSE) %>% 
	as_tibble  %>% 
	filter(country_iso_code == "DE", station_type_of_area == "rural", 
				 type_of_station == "Background") -> a2


## ------------------------------------------------------------------------
library(sf)
library(stars)
a2.sf = st_as_sf(a2, coords = c("station_longitude_deg", "station_latitude_deg"), crs = 4326)


## ------------------------------------------------------------------------
sel =  colnames(aqsel) %in% a2$station_european_code
aqsel = aqsel[, sel]


## ------------------------------------------------------------------------
tb = tibble(NO2 = apply(aqsel, 2, mean, na.rm = TRUE), station_european_code = colnames(aqsel))
crs = 32632
right_join(a2.sf, tb) %>% st_transform(crs) -> no2.sf 
# load German boundaries
data(air, package = "spacetime")
de <- st_transform(st_as_sf(DE_NUTS1), crs)
ggplot() + geom_sf(data = de) +  geom_sf(data = no2.sf, mapping = aes(col = NO2))


## ------------------------------------------------------------------------
library(gstat)
v = variogram(NO2~1, no2.sf)
plot(v, plot.numbers = TRUE)


## ------------------------------------------------------------------------
library(gstat)
v0 = variogram(NO2~1, no2.sf, cutoff = 100000, width = 10000)
plot(v0, plot.numbers = TRUE)


## ------------------------------------------------------------------------
v.m = fit.variogram(v, vgm(1, "Exp", 50000, 1))
plot(v, v.m, plot.numbers = TRUE)


## ------------------------------------------------------------------------
# build a grid over Germany:
bb = st_bbox(de)
dx = seq(bb[1], bb[3], 10000)
dy = seq(bb[4], bb[2], -10000) # decreases!
st_as_stars(matrix(0, length(dx), length(dy))) %>%
  st_set_dimensions(1, dx) %>%
  st_set_dimensions(2, dy) %>%
  st_set_dimensions(names = c("x", "y")) %>%
  st_set_crs(crs) -> grd
i = st_intersects(grd, de)
grd[[1]][lengths(i)==0] = NA
grd


## ------------------------------------------------------------------------
k = krige(NO2~1, no2.sf, grd, v.m)
ggplot() + geom_stars(data = k, aes(fill = var1.pred, x = x, y = y)) + 
	geom_sf(data = st_cast(de, "MULTILINESTRING")) + 
	geom_sf(data = no2.sf)


## ------------------------------------------------------------------------
a = aggregate(no2.sf["NO2"], de, mean)
b = krige(NO2~1, no2.sf, de, v.m)
b$sample = a$NO2
b$kriging = b$var1.pred
b %>% select(sample, kriging) %>% gather(var, NO2, -geometry) -> b2
ggplot() + geom_sf(data = b2, mapping = aes(fill = NO2)) + facet_wrap(~var) +
	 scale_fill_gradientn(colors = sf.colors(20))


## ------------------------------------------------------------------------
SE = function(x) sqrt(var(x)/length(x))
a = aggregate(no2.sf["NO2"], de, SE)
b$sample = a$NO2
b$kriging = sqrt(b$var1.var)
b %>% select(sample, kriging) %>% gather(var, NO2, -geometry) -> b2
ggplot() + geom_sf(data = b2, mapping = aes(fill = NO2)) + facet_wrap(~var) +
	 scale_fill_gradientn(colors = sf.colors(20))


## ------------------------------------------------------------------------
library(viridis)
s = krige(NO2~1, no2.sf, grd, v.m, nmax = 30, nsim = 10)
g = ggplot() + coord_equal() +
	scale_fill_viridis() +
    theme_void() +
	scale_x_discrete(expand=c(0,0)) +
	scale_y_discrete(expand=c(0,0))
g + geom_stars(data = s[,,,1:6]) + facet_wrap(~sample)


## ------------------------------------------------------------------------
library(vroom)
v = vroom("aq/pop/Zensus_Bevoelkerung_100m-Gitter.csv")
v %>% filter(Einwohner > 0) %>% 
	select(-Gitter_ID_100m) %>%
	st_as_sf(coords = c("x_mp_100m", "y_mp_100m"), crs = 3035) %>%
	st_transform(st_crs(grd)) -> b
a = aggregate(b, st_as_sf(grd, na.rm = FALSE), sum)


## ------------------------------------------------------------------------
grd$ID = 1:prod(dim(grd)) # so we can find out later which grid cell we have
ii = st_intersects(grd["ID"], st_cast(st_union(de), "MULTILINESTRING"))
grd_sf = st_as_sf(grd["ID"], na.rm = FALSE)[lengths(ii) > 0,]
iii = st_intersection(grd_sf, st_union(de))
grd$area = st_area(grd)[[1]] + units::set_units(grd$A1, m^2) # NA's
grd$area[iii$ID] = st_area(iii)


## ------------------------------------------------------------------------
grd$pop_dens = a$Einwohner / grd$area
sum(grd$pop_dens * grd$area, na.rm = TRUE) # verify
sum(b$Einwohner)
g + geom_stars(data = grd, aes(fill = sqrt(pop_dens), x = x, y = y))


## ------------------------------------------------------------------------
(a = aggregate(grd["pop_dens"], no2.sf, mean))
no2.sf$pop_dens = st_as_sf(a)[[1]]
summary(lm(NO2~sqrt(pop_dens), no2.sf))


## ----no2scat, out.width = '50%', fig.cap="Scatter plot of 2017 annual mean NO2 concentration against population density, for rural background air quality stations", eval=TRUE, fig=TRUE, echo=FALSE----
plot(NO2~sqrt(pop_dens), no2.sf)
abline(lm(NO2~sqrt(pop_dens), no2.sf))


## ------------------------------------------------------------------------
no2.sf = no2.sf[!is.na(no2.sf$pop_dens),]
vr = variogram(NO2~sqrt(pop_dens), no2.sf)
vr.m = fit.variogram(vr, vgm(1, "Exp", 50000, 1))
plot(vr, vr.m, plot.numbers = TRUE)


## ------------------------------------------------------------------------
kr = krige(NO2~sqrt(pop_dens), no2.sf, grd["pop_dens"], vr.m)
k$kr1 = k$var1.pred
k$kr2 = kr$var1.pred
st_redimension(k[c("kr1", "kr2")], 
	along = list(what = c("kriging", "residual kriging"))) %>%
	setNames("NO2") -> km
g + geom_stars(data = km, aes(fill = NO2, x = x, y = y)) + 
	geom_sf(data = st_cast(de, "MULTILINESTRING")) + 
	geom_sf(data = no2.sf) + facet_wrap(~what)


## ----eval=FALSE----------------------------------------------------------
## library(gstat)
## demo(cokriging)
## demo(cosimulation)


## ------------------------------------------------------------------------
aqx = aq[,colnames(aq) %in% a2$station_european_code]
sfc = st_geometry(a2.sf)[match(colnames(aqx), a2.sf$station_european_code)]
st_as_stars(NO2 = as.matrix(aqx)) %>%
	st_set_dimensions(names = c("time", "station")) %>%
	st_set_dimensions("time", index(aqx)) %>%
	st_set_dimensions("station", sfc) -> no2.st
v.st = variogramST(NO2~1, no2.st[,1:(24*31)], tlags = 0:48)


## ------------------------------------------------------------------------
v1 = plot(v.st)
v2 = plot(v.st, map = FALSE)
print(v1, split = c(1,1,2,1), more = TRUE)
print(v2, split = c(2,1,2,1), more = FALSE)


## ------------------------------------------------------------------------
# product-sum
prodSumModel <- vgmST("productSum",
	space=vgm(150, "Exp", 200, 0),
	time= vgm(20, "Sph",   40, 0),
	k=2)
StAni = estiStAni(v.st, c(0,200000))
(fitProdSumModel <- fit.StVariogram(v.st, prodSumModel, fit.method = 7,
	stAni = StAni, method = "L-BFGS-B",
	control = list(parscale = c(1,10,1,1,0.1,1,10)),
	lower = rep(0.0001, 7)))
plot(v.st, fitProdSumModel, wireframe=FALSE, all=TRUE, scales=list(arrows=FALSE), zlim=c(0,150))


## ------------------------------------------------------------------------
plot(v.st, model=fitProdSumModel, wireframe=TRUE, all=TRUE, scales=list(arrows=FALSE), zlim=c(0,185))


## ------------------------------------------------------------------------
set.seed(123)
pt = st_sample(de, 2)
t = st_get_dimension_values(no2.st, 1)
st_as_stars(list(pts = matrix(1, length(t), length(pt)))) %>%
	st_set_dimensions(names = c("time", "station")) %>%
	st_set_dimensions("time", t) %>%
	st_set_dimensions("station", pt) -> new_pt


## ------------------------------------------------------------------------
no2.st <- st_transform(no2.st, crs)
new_ts <- krigeST(NO2~1, data = no2.st["NO2"], newdata = new_pt,
	     nmax = 50, stAni = StAni, modelList = fitProdSumModel,
		 progress = FALSE)
plot(xts(t(new_ts[[2]]), t), type = 'l')


## ------------------------------------------------------------------------
t4 = t[(1:4 - 0.5) * (3*24*30)]

d = dim(grd)
st_as_stars(pts = array(1, c(d[1], d[2], time=length(t4)))) %>%
	st_set_dimensions("time", t4) %>%
	st_set_dimensions("x", st_get_dimension_values(grd, "x")) %>%
	st_set_dimensions("y", st_get_dimension_values(grd, "y")) %>%
	st_set_crs(crs) -> grd.st
new_int <- krigeST(NO2~1, data = no2.st["NO2"], newdata = grd.st,
	     nmax = 50, stAni = StAni, modelList = fitProdSumModel,
		 progress = FALSE)
plot(new_int[2,,,1], reset = FALSE)
plot(de, col = NA, border = 'red', add = TRUE)
plot(st_geometry(no2.sf), col = 'green', add = TRUE, pch = 16)






