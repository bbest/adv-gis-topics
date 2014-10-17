# Clipping and projecting with GDAL

*QGIS*, like most open-source GIS software, uses the [GDAL (Geospatial Data Abstraction Library)](http://www.gdal.org/) software package to implement a lot of what ArcGIS would call "tools" or "geoprocessing". All of the GDAL functionality is also accessible as *bash* commands.

> For historical reasons, there are [GDAL commands](http://www.gdal.org/gdal_utilities.html), which operate on raster data, and [OGR commands](http://www.gdal.org/ogr_utilities.html), which operate on vector data. The whole shmodz is collectively referred to as "GDAL".

## Setting up GDAL access from Git Bash

(You only need to do this once.)

Start up *Git Bash* and run the following commands:

    $ cd
    $ start notepad++ .bash_profile

This will make sure you're working in your home directory (i.e. your `H:` drive), and then start up *Notepad++* editing the file `.bash_profile`

> If you get a popup that says
>
    H:\.bash_profile doesn't exists. Create it?
> then click *Yes*.

Don't forget the initial `.` in `.bash_profile`: it's part of the name.
 
> Filenames beginning with `.` aren't displayed by the `ls` command (unless you specify the `-a` option.) It's a UNIX convention to use names beginning with `.` for files containing command-specific configuration or logging information. `.bash_profile` contains commands that `bash` runs whenever it start up.

Type or copy the following text into *Notepad++*:

    export PATH="$PATH:/c/Program Files/QGIS Chugiak/bin"

> `PATH` tells `bash` which folders to look in to find the commands that you tell it to run. We're telling `bash` to look in the folder containing the *QGIS* commands, in addtion to all the other folders it would usually look in. 

Save `.bash_profile` and quit *Notepad++*

Quit and restart *Git Bash*.

Run the following command:

    $ gdalinfo --version
    
You should see:

    GDAL 1.11.0, released 2014/04/16

which means that *Git Bash* can now run all the commands associated with QGIS, woohoo! (c'mon, you *are* excited about this, admit it...)

## Scripting GDAL

We're going to see how to run GDAL commands to do geoprocessing from *bash*. Specifically, we're going to create a **shell script**, which is a file containing a sequence of *bash* command, just like you'd type, one after another, on the *bash* command line. The shell script can then be run just like a command in its own right, very much like running a Python program.

If it's not still running, start up *Git Bash* and cd to whatever folder *contains* the `InVEST_CV` folder:

    $ cd ~/esm296-4f/wk3

> The `~` is a shorthand for your home folder (i.e., your `H` drive.)

Start up *Notepad++* editing `pre.sh`:

    $ start notepad++ pre.sh
    
Cutnpaste (or type, if you're a masochist) the following into Notepad++:

        # this lets you see the commands as they are executed
        # (but not the comments)
        #
    set -x
    
        # a list of the rasters that we want to clip and project
        #
    rasters="global_pop claybark_dem"
    
        # the shapefile that the rasters will be clipped to
        #
    roi=InVEST_CV/AOI_BarkClay.shp
    
        # arguments used by all the GDAL commands we'll run
        # -dstnotata -32768    : use -32768 as the output NO_DATA value
        # -of GTiff            : make the output raster a GeoTIFF
        # -co COMPRESS=DEFLATE : use the "DEFLATE" TIFF compression method
        #
    common_args="-dstnodata -32768 -of GTiff -co COMPRESS=DEFLATE"
    
        # arguments for the clip command
        # -cutline $roi    : clip the input to the shapefile $roi
        # -crop_to_cutline : clip to the shape (not just its bounding box)
        #
    clip_args="-cutline $roi -crop_to_cutline"
    
        # arguments for the project command
        # -t_srs EPSG:32610 : use UTM zone 10N for the output coordinate system
        #
    project_args="-t_srs EPSG:32610"
    
        # loop through all the files listed in $rasters
        #
    for file in $rasters
    do
            # clip ESRI grid InVEST_CV/$file into GeoTIFF ${file}_wgs84.tif
            #
        gdalwarp $common_args $clip_args InVEST_CV/$file ${file}_wgs84.tif
    
            # project GeoTIFF ${file}_wgs84.tif into GeoTIFF ${file}_utm10n.tif
            #
        gdalwarp $common_args $project_args ${file}_wgs84.tif ${file}_utm10n.tif
    done

Save `pre.sh` and quit `Notepad++`

Change the permission on `pre.sh` so it's **executable** (i.e., can be run as if it were a command):

    $ chmod +x pre.sh

> `chmod` is short for "change mode". The guys that invented UNIX **really** didn't like to type...

OK, what did we just do?

We copied a bunch of *bash* commands into `pre.sh` and made it executable as a command. If we run `pre.sh` as a command (which we will in a minute), it will run all of the commands it contains, one after another.

Specifically, here's what will happen:

    set -x
    
This tells `bash` to "echo" (type out in the *bash* window) each command before it's run. This is helpful so you can see what's going on, and in particular so you can tell how far a script got before it failed.

> *bash* uses `#` to indicate a comment, just like Python. Everything from a `#` to the end of the line is ignored when the script is run.

    rasters="global_pop claybark_dem"

This creates a **shell variable** called `rasters` and sets it to the words `global_pop` and `claybark_dem`, separated by a space.

Shell variables are pretty much like Python variables, except that you can't have any spaces around the `=`.

    roi=InVEST_CV/AOI_BarkClay.shp
    ...
    common_args="-dstnodata -32768 -of GTiff -co COMPRESS=DEFLATE"
    ...
    clip_args="-cutline $roi -crop_to_cutline"
    ...
    project_args="-t_srs EPSG:32610"

These are additional variables we'll use later. It's common in shell script to use variables for stuff that would otherwise have to be repeated (like the value of `common_args`), or for stuff that you might want to change later.

Note that if the value of a variable contains spaces, then you have to enclose it in quotes.

Note also that the value of `clip_args` uses the previously-defined variable `roi`. You get a variable's value by prefixing it with a `$`. Thus, anywhere `$roi` appears, *bash* replaces it with `InVEST_CV/AOI_BarkClay.shp`

    for file in $rasters
    do
    ...
    done

This is a **bash** loop, almost identical to a `for` loop in Python. The loop executes as many times as there are words in `$rasters`, with the value of `file` set to each word successively. In this case, the loop executes twice, once with `file=global_pop` and once with `file=claybark_dem`.

> Note: Unlike Python, indentation doesn't matter in bash scripts. The indentation in this script is solely to make it easier for you to read (a **highly** recommended practice.)

`gdalwarp` is GDAL's all-purpose spatial transformer. It can do subsetting, re-projection, and a bunch of other stuff; see the [gdalwarp manual page](http://www.gdal.org/gdalwarp.html) for details. First, we'll use it to clip the input ArcGIS grid file to the outline of our region-of-interest, also convert it from grid to GeoTIFF format:

    gdalwarp $common_args $clip_args InVEST_CV/$file ${file}_wgs84.tif

> GeoTIFF is a portable (non-proprietary) raster format that's much more suited to open-source processing than the proprietary ESRI grid format.

Note the `{}`s in `${file}_wgs84.tif`: they tell bash that only part of the character sequence `file_wgs84.tif` is a variable name. We use this trick a lot to construct filenames with a common prefix but different suffixes.

Second, we'll use `gdalwarp` to re-project the clipped raster from WGS 84 geographic coordinates into WGS 84 UTM zone 10N projected coordinates.

    gdalwarp $common_args $project_args ${file}_wgs84.tif ${file}_utm10n.tif
    
> How do we know that the input files are in WGS 84 geographic coordinates? By asking:
>
    $ gdalinfo -norat InVEST_CV/global_pop
    Driver: AIG/Arc/Info Binary Grid
    Files: InVEST_CV/global_pop
           InVEST_CV/global_pop.aux.xml
           InVEST_CV/global_pop\dblbnd.adf
           InVEST_CV/global_pop\hdr.adf
           InVEST_CV/global_pop\log
           InVEST_CV/global_pop\metadata.xml
           InVEST_CV/global_pop\prj.adf
           InVEST_CV/global_pop\sta.adf
           InVEST_CV/global_pop\vat.adf
           InVEST_CV/global_pop\w001001.adf
           InVEST_CV/global_pop\w001001x.adf
    Size is 43200, 16800
    Coordinate System is:
    GEOGCS["WGS 84",
        DATUM["WGS_1984",
            SPHEROID["WGS 84",6378137,298.257223563,
                AUTHORITY["EPSG","7030"]],
            TOWGS84[0,0,0,0,0,0,0],
            AUTHORITY["EPSG","6326"]],
        PRIMEM["Greenwich",0,
            AUTHORITY["EPSG","8901"]],
        UNIT["degree",0.0174532925199433,
            AUTHORITY["EPSG","9108"]],
        AUTHORITY["EPSG","4326"]]
    Origin = (-180.000000000000000,83.999999999436000)
    Pixel Size = (0.008333333333300,-0.008333333333300)
    Corner Coordinates:
    Upper Left  (-180.0000000,  84.0000000) (180d 0' 0.00"W, 84d 0' 0.00"N)
    Lower Left  (-180.0000000, -56.0000000) (180d 0' 0.00"W, 56d 0' 0.00"S)
    Upper Right ( 180.0000000,  84.0000000) (180d 0' 0.00"E, 84d 0' 0.00"N)
    Lower Right ( 180.0000000, -56.0000000) (180d 0' 0.00"E, 56d 0' 0.00"S)
    Center      (  -0.0000000,  14.0000000) (  0d 0' 0.00"W, 14d 0' 0.00"N)
    Band 1 Block=256x4 Type=Int32, ColorInterp=Undefined
      Description = global_pop
      Min=0.000 Max=1346772.000 
      Minimum=0.000, Maximum=1346772.000, Mean=8.339, StdDev=138.793
      NoData Value=-2147483647
      Metadata:
        LAYER_TYPE=athematic
        STATISTICS_MAXIMUM=1346772
        STATISTICS_MEAN=8.3388592165454
        STATISTICS_MINIMUM=0
        STATISTICS_STDDEV=138.79254699282

> The `-norat` option keeps `gdalinfo` from printing a whole bunch more detail that we don't need; see the [gdalinfo manual page](http://www.gdal.org/gdalinfo.html) for details. `gdalinfo` is a very handy command for finding out what's up with mystery data.

OK, enough with the exegesis. Let's run the sucker:

    $ pre.sh
    + rasters='global_pop claybark_dem'
    + roi=InVEST_CV/AOI_BarkClay.shp
    + common_args='-dstnodata -32768 -of GTiff -co COMPRESS=DEFLATE'
    + clip_args='-cutline InVEST_CV/AOI_BarkClay.shp -crop_to_cutline'
    + project_args='-t_srs EPSG:32610'
    + for file in '$rasters'
    + gdalwarp -dstnodata -32768 -of GTiff -co COMPRESS=DEFLATE -cutline InVEST_CV/AOI_BarkClay.shp -crop_to_cutline InVEST_CV/global_pop global_pop_wgs84.tif
    Creating output file that is 301P x 211L.
    Processing input file InVEST_CV/global_pop.
    Using internal nodata values (e.g. -2.14748e+009) for image InVEST_CV/global_pop.
    0...10...20...30...40...50...60...70...80...90...100 - done.
    + gdalwarp -dstnodata -32768 -of GTiff -co COMPRESS=DEFLATE -t_srs EPSG:32610 global_pop_wgs84.tif global_pop_utm10n.tif
    Creating output file that is 261P x 276L.
    Processing input file global_pop_wgs84.tif.
    Using internal nodata values (e.g. -32768) for image global_pop_wgs84.tif.
    0...10...20...30...40...50...60...70...80...90...100 - done.
    + for file in '$rasters'
    + gdalwarp -dstnodata -32768 -of GTiff -co COMPRESS=DEFLATE -cutline InVEST_CV/AOI_BarkClay.shp -crop_to_cutline InVEST_CV/claybark_dem claybark_dem_wgs84.tif
    Creating output file that is 9165P x 9938L.
    Processing input file InVEST_CV/claybark_dem.
    Using internal nodata values (e.g. -32768) for image InVEST_CV/claybark_dem.
    0...10...20...30...40...50...60...70...80...90...100 - done.
    + gdalwarp -dstnodata -32768 -of GTiff -co COMPRESS=DEFLATE -t_srs EPSG:32610 claybark_dem_wgs84.tif claybark_dem_utm10n.tif
    Creating output file that is 9165P x 9938L.
    Processing input file claybark_dem_wgs84.tif.
    Using internal nodata values (e.g. -32768) for image claybark_dem_wgs84.tif.
    0...10...20...30...40...50...60...70...80...90...100 - done.
    $

Things to note:

* Because you made `pre.sh` executable, you can run it just like any other command.
* Because of the `set -x`, you can see each command in the script as it executes (with a `+` in front of it.)
* In the commands that you see, all the variables prefixed with `$`s have been replaced by their values, so you see the command that was actually executed.
* `claybark_dem` has a lot more data in it than `global_pop`, so it takes longer to process.
