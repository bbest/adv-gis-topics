library(dismo)
library(rgdal)
library(raster)

# set variables to the scientific name of your speciess
genus   = 'Megaptera'
species = 'novaeangliae'

# path to output shapefile constructed from scientific name of your speciess
shp     = sprintf('H:/esm296-4f/project/data/gbif_%s_%s', genus, species)

# get data from Global Biodiversity Information Facility (GBIF)
sp = gbif(genus, species, sp=T, removeZeros=T)

# make folder if doesn't exist
dir.create(dirname(shp), showWarnings=F, recursive=T)

# write to shapefile
writeOGR(sp, dsn=dirname(shp), layer=basename(shp), driver='ESRI Shapefile')
