# load libraries quietly
suppressWarnings(suppressPackageStartupMessages({
  library(sp)
  library(rgdal)
  library(raster)
  library(rgeos)
  library(dismo)
  library(ggplot2)
  library(ggmap)
  library(dplyr)
}))

# variables for you to set ----

# input species presence points shp path, and output absence points
shp_presence = 'H:/esm296-4f/project/data/gbif_Pinus_longaeva'
shp_absence  = 'H:/esm296-4f/project/data/absence_Pinus_longaeva'

# multiplier to number of presence points to apply
m_absence = 2

# set inner/outer radius for area from which to sample
inner_radius_km = 10
outer_radius_km = 100

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
pts_abs = spsample(ply_abs, nrow(pts_sp)*m_absence, type='random')

# add attribute tables so exportable as shapefile, and plottable by ggplot2
pts_abs = SpatialPointsDataFrame(
  pts_abs, data.frame(presence=rep(0, length(pts_abs))))
ply_abs = SpatialPolygonsDataFrame(
  ply_abs, data.frame(presence=rep(0, length(ply_abs))))

# write output shapefile of absence points, needs attribute table first
writeOGR(pts_abs, dirname(shp_absence), basename(shp_absence), driver='ESRI Shapefile')


# plot map ----

# create output directory if don't exist
dir.create(dirname(map_png), recursive=T, showWarnings=F)

# prep data for plotting with ggplot2
xy_sp  = as.data.frame(coordinates(pts_sp))
xy_abs = as.data.frame(coordinates(pts_abs))
names(xy_sp)  = c('lon','lat')
names(xy_abs) = c('lon','lat')
ply_abs@data$id = rownames(ply_abs@data)
ply_abs.points  = fortify(ply_abs, region='id')
ply_abs.df      = inner_join(ply_abs.points, ply_abs@data, by='id')

# get bounding box extent, with extended range
x = extendrange(bbox(ply_abs)['x',], f=0.25)
y = extendrange(bbox(ply_abs)['y',], f=0.25)
bb = c(x[1], y[1], x[2], y[2])

# get map
m = suppressWarnings(get_map(location=bb, source='google', maptype='terrain', crop=T))

# plot
png(map_png, width=1000, height=800, res=72)
ggmap(m, extent='device', darken=c(0.4,'white')) + 
  geom_point(
    data=xy_sp, aes(x=lon, y=lat), color='darkgreen', alpha=0.5) +
  geom_polygon(
    data=ply_abs.df, aes(x=long, y=lat, group=group), color='darkblue', fill=NA) +
  geom_point(
    data=xy_abs, aes(x=lon, y=lat), color='red', alpha=0.5)
dev.off()