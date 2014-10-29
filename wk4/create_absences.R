# load libraries
library(sp)
library(rgdal)
library(raster)
library(rgeos)
library(dismo)
library(ggplot2)
library(ggmap)

# variables for you to set ----

# input species presence points shp path, and output absence points
shp_presence = 'H:/esm296-4f/project/data/gbif_Pinus_longaeva'
shp_absence  = 'H:/esm296-4f/project/data/absence_Pinus_longaeva'

# multiplier to number of presence points to apply
m_absence = 2

# set inner/outer radius for area from which to sample
inner_radius_km = 5
outer_radius_km = 50

# output map as png for quick sanity check
map_png = 'H:/esm296-4f/github/project/img/absence_Pinus_longaeva_map.png'


# create absence points ----

# get species presence points
pts_sp = readOGR(dirname(shp_presence), basename(shp_presence))

# create inner and outer circles
c_i = circles(pts_sp, d=inner_radius_km*1000, lonlat=T)
c_o = circles(pts_sp, d=outer_radius_km*1000, lonlat=T)

# get outer circle area by dissolving outer circles, erase inner circles
ply_o   = gUnaryUnion(c_o@polygons)
ply_abs = erase(ply_o, c_i@polygons)

# sample random points from outer area
pts_abs = spsample(ply_abs, nrow(sp)*m_absence, type='random'), iter=25)

# create output directories if don't exist
dir.create(dirname(shp_absence), recursive=T, showWarnings=F)
dir.create(dirname(map_png), recursive=T, showWarnings=F)

# write output shapefile of absence points, needs attribute table first
d = data.frame(presence=rep(0, length(pts_abs)))
pts_abs_d = SpatialPointsDataFrame(pts_abs, d)
writeOGR(pts_abs_d, dirname(shp_absence), basename(shp_absence), driver='ESRI Shapefile')


# plot map ----

# get bounding box extent
bb = as.vector(bbox(ply_abs))

# get map
m = get_map(location=bb, source='google', maptype='terrain', crop=T)

# plot
png(map_png, width=2000, height=1600, res=150)
ggmap(m)
dev.off()

plot(ply_abs)
plot(pts_sp, col='green', pch=20, add=T)
plot(pts_abs, col='red', pch=21, add=T)

geom_point(aes(x = Longitude, y = Latitude), data = data, 
           alpha = .5, color="darkred", size = 3)

