#
# Example R program
#

# example from http://www.inside-r.org/packages/cran/geor/docs/sample.geodata

require(geoR)

par(mfrow=c(1,2))
S1 <- grf(2500,  grid="reg", cov.pars=c(1, .23))
image(S1, col=gray(seq(0.9,0.1,l=100)))
y1 <- sample.geodata(S1, 80)
points(y1$coords, pch=19)
## Now a preferential sampling
y2 <- sample.geodata(S1, 80, coef=1.3)
## which is equivalent topps
## y2 <- sample.geodata(S1, 80, prob=exp(1.3*S1$data))
points(y2$coords, pch=19, col=2)
## and now a clustered (but not preferential)
S2 <- grf(2500,  grid="reg", cov.pars=c(1, .23))
y3 <- sample.geodata(S1, 80, prob=exp(1.3*S2$data))
## which is equivalent to
## points(y3$coords, pch=19, col=4)
image(S2, col=gray(seq(0.9,0.1,l=100)))
points(y3$coords, pch=19, col=4)
