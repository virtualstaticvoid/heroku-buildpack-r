#
# Example R program
#

library(rgeos)

# Example taken from rgeos documentation

gArea(readWKT("POINT(1 1)"))
gArea(readWKT("LINESTRING(0 0,1 1,2 2)"))
gArea(readWKT("LINEARRING(0 0,3 0,3 3,0 3,0 0)"))

p1 = readWKT("POLYGON((0 0,3 0,3 3,0 3,0 0))")
p2 = readWKT("POLYGON((0 0,3 0,3 3,0 3,0 0),(1 1,2 1,2 2,1 2,1 1))")

gArea(p1)
p1@polygons[[1]]@area

gArea(p2)
p2@polygons[[1]]@area
