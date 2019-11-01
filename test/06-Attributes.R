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

