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

