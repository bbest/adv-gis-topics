---
layout: home
title:
excerpt:
image:
  feature:
  teaser:
  thumb:
share: false
ads: false
toc: true
---

# Clipping and projecting with OGR

> This assumes you've read and understood [Clipping and projecting with GDAL](./GDAL.html)

In order to clip vector data with OGR, the data being clipped and the data that define the area-of-interest both need to be in the same projection. Let's check the projections of the files we're interested in using. We use the command `ogrinfo -al -so` (see the [manual page](http://www.gdal.org/ogrinfo.html) for more info) to display all available metadata (size, projection, etc.), but not the actual data:

    $ ogrinfo -al -so InVEST_CV/global_polygon.shp
    INFO: Open of `InVEST_CV/global_polygon.shp'
          using driver `ESRI Shapefile' successful.

    Layer name: global_polygon
    Geometry: Polygon
    Feature Count: 180497
    Extent: (-180.000000, -90.000000) - (180.000000, 83.633389)
    Layer SRS WKT:
    GEOGCS["GCS_WGS_1984",
        DATUM["WGS_1984",
            SPHEROID["WGS_84",6378137.0,298.257223563]],
        PRIMEM["Greenwich",0.0],
        UNIT["Degree",0.0174532925199433]]
    id: String (80.0)
    area: Real (19.15)
    
    $ ogrinfo -al -so InVEST_CV/AOI_BarkClay.shp
    INFO: Open of `InVEST_CV/AOI_BarkClay.shp'
          using driver `ESRI Shapefile' successful.

    Layer name: AOI_BarkClay
    Geometry: Polygon
    Feature Count: 1
    Extent: (208219.025694, 5298738.660312) - (391517.926152, 5497492.251075)
    Layer SRS WKT:
    PROJCS["WGS_1984_UTM_Zone_10N",
        GEOGCS["GCS_WGS_1984",
            DATUM["WGS_1984",
                SPHEROID["WGS_84",6378137.0,298.257223563]],
            PRIMEM["Greenwich",0.0],
            UNIT["Degree",0.0174532925199433]],
        PROJECTION["Transverse_Mercator"],
        PARAMETER["False_Easting",500000.0],
        PARAMETER["False_Northing",0.0],
        PARAMETER["Central_Meridian",-123.0],
        PARAMETER["Scale_Factor",0.9996],
        PARAMETER["Latitude_Of_Origin",0.0],
        UNIT["Meter",1.0]]
    Name: String (60.0)
    land: Integer (4.0)

Oops. The data to be clipped (`global_polygon`) is in a different projection from the data defining the area-of-interest (`AOI_BarkClay`). We'll need to project one into the projection of the other. A general rule for situations like this is to project the smaller of the two datasets. We'll use the `du -b` command to see how many bytes the shapefiles consume:

    $ du -b */*.shp
    428	InVEST_CV/AOI_BarkClay.shp
    7352544	InVEST_CV/Geomorphology_BarkClay.shp
    1516	InVEST_CV/SeaLevRise_WCVI.shp
    1124	InVEST_CV/Structures_BarkClay.shp
    583228	InVEST_CV/WaveWatchIII.shp
    19922312	InVEST_CV/continentalShelf.shp
    161500092	InVEST_CV/global_polygon.shp

Yikes. `InVEST_CV/global_polygon.shp` is like 400,000 times larger than `InVEST_CV/AOI_BarkClay.shp`. We'll project `InVEST_CV/AOI_BarkClay.shp`, using `ogr2ogr` ([manual page](http://www.gdal.org/ogr2ogr.html)):

    $ ogr2ogr -t_srs EPSG:4326 aoi.shp InVEST_CV/AOI_BarkClay.shp

> Note: the input/output file order in ogr2ogr is **backwards** from normal commands. In the example above, `aoi.shp` is the *output* file, and `InVEST_CV/AOI_BarkClay.shp` is the *input* file.
>
> Yes, they *are* doing this just to annoy you...

OK, now you can use QGIS's Vector&rarr;Geoprocessing Tools&rarr;Clip tool to clip `global_polygon`, using `roi` as the clip layer. Or, you can do it with `ogr2ogr`:

    $ ogr2ogr -clipdst aoi.shp clip.shp InVEST_CV/global_polygon.shp

Here, `clip.shp` is the output file.
