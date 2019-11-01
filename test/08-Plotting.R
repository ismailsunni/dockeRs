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

