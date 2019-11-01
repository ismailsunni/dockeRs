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

