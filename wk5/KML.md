# KML: the shapefile of the Web

## Web

* format + identifier + I/O protocol
    * format = HTML
        * markup language: structure embedded in content
    * identifier = URI
        * protocol + location (server) + name
    * protocol = HTTP
        * send message to location:80, GET/PUT name's content
* Web browser is an HTTP client that GETs URLs and renders returned content

## KML is to geodata as HTML is to text

* HTML structures text
    * headings (`<h1>`, `<h2>`, ...)
    * paragraphs (`<p>`, `<blockquote>`, ...)
    * lists (`<ul>`, `<ol>`, `<li>`, ...)
    * link (`<a>`)
    * style (`<i>`, `<b>`, ...)
* KML structures geodata
    * geometry (`<Point>`, `<LineString>`, ...)
    * attributes (`<name>`, `<description>`, ...)
    * style (`<Style>`, `<LookAt>`, ...)

* HTML and KML are both "flavors" of XML
    * simple syntax
        * **element** = `<`*tag*`>`*content*`</`*tag*`>`
            * NB: tag name **case** matters: `<Foo>` and `<foo>` are different!
        * **document** = sequence of (possibly nested) **elements**
            * always exactly 1 top-level (outermost) element
            * nested elements cannot overlap

## simple KML example

Copy:

    <?xml version="1.0" encoding="utf-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2">
      <Placemark>
        <name>Frew's office (Bren Hall 4524)</name>
        <description>http://frew.eri.ucsb.edu</description>
        <Point>
          <coordinates>-119.84183,34.413415,0</coordinates>
        </Point>
      </Placemark>
    </kml>

into *Notepad++* and save as `frew.kml`.

Double-click `frew.kml` in *Windows Explorer*. (Windows knows that files with names ending in `.kml` should be opened by Google Earth.)

*Google Earth* launches and you see something like this:

![Frew's office on Google Earth](https://purl.org/net/frew/ESM296/wk5/frew.jpg)

## picking the example apart:

    <?xml version="1.0" encoding="utf-8"?>

This document is marked up with XML, as defined by version 1.0 of the XML standard, and possibly including non-Roman-alphabet characters (e.g., всемирная паутина).

All XML documents require this as the first line of text.

    <kml xmlns="http://www.opengis.net/kml/2.2">

The top-level XML element ("there can be only 1..."). Everything inside the `kml` element is marked up with KML, as defined by version 2.2 of the KML standard.

      <Placemark>

The `Placemark` element defines a single *placemark*, one of the fundamental KML geographic feature types. Just a like a feature in a shapefile, a placemark has both geometry and attributes.

        <name>Frew's office (Bren Hall 4524)</name>

`name` is a required text attribute for a placemark. Google Earth will display the value of `name` next to whatever icon it uses for the placemark; other KML clients may do other things with it.

> Note: By convention, KML uses capitalized tag names (e.g. `Placemark`) for elements that can contain other elements. (Yes, the `kml` element is an exception to this...)

        <description>http://frew.eri.ucsb.edu</description>

`description` is an optional text attribute for a placemark. Google Earth will display the value of `description` inside a pop-up text balloon when you select (click on) the associated placemark. Google Earth recognizes URLs in a `description`, and makes them live (clickable).

        <Point>

`Point` defines the placemark's geometry. KML supports all the usual vector geometry types: points, lines, polygons, etc.

          <coordinates>-119.84183,34.413415,0</coordinates>

A `Point` element must always contain a `coordinates` element, which specifies the placemark's location in WGS 84 geographic (lat-lon) coordinates.

> Note: WGS 84 is the *only* coordinate system supported by KML.

        </Point>
      </Placemark>
    </kml>

## KMZ: packaging KML with support files

Click on this link: <https://purl.org/net/frew/ESM296/wk5/Islay.kmz>. Save it somewhere and then double-click on the saved file. This is a simple example of a KML document with multiple features and image annotations.

The `.kmz` suffix indicates that the file is a *compressed KML* document. If you want to see what's inside it (as opposed to just displaying it), you have to uncompress it first. From *Windows Explorer*, right-click `Islay.kmz` and select *7-Zip→Extract to "Islay\"*. This will create the following folder structure:

    Islay\
        doc.kml
        images\
            Ardbeg.jpg
            Bruichladdich.jpg
            ...

That's right, a `.kmz` file is really a Zip archive in disguise.

A `.kmz` file always contains a top-level file named `doc.kml` which is the actual KML document. The KMZ format is thus often used to compress a really huge KML document so it will download faster.

A `.kmz` file may also contain any number of additional files and folders, which `doc.kml` can reference. The `.kmz` file can thus be a stand-alone packaging containing all the data needed to render the map.

In this example, the folder `images` contains image files that are referenced by placemark `<description>` elements in `doc.kml`. (Look at `doc.kml` in *Notepad++* to see how this is done.)

## How fancy can KML get?

(Don't ask...)

Seriously, while KML is full-flegded vector data format (it can do everything a shapefile can), it's really a **map document** format:

* KML documents can include lots of styling information
    * icons
    * line thickness, color, etc.
    * text boxes
    * elaborate descriptions
    * references (i.e. URLs) of images to display

* KML allows for some degree of interactivity (if the client supports it)
    * nested folders of features
    * clickable hyperlinks
    * level-of-detail display (e.g., image pyramids)

We could teach a whole class on this (and Frew does: ESM 264). Meanwhile, if you want to go hog-wild with KML bells-n-whistles, check out:

* The Google KML home page: <https://developers.google.com/kml>
* [The KML Handbook](http://www.informit.com/store/kml-handbook-geographic-visualization-for-the-web-9780321525598): the (currently) only book devoted to KML, full of fancy examples.
    * There should be a copy in the Bren Library, unless it's grown happy feet...

## Creating KML with OGR

Since KML is just text, you can create a KML document by hand using a text editor like *Notepad++*

(...stunned silence...)

OK, not even Frew does this (not usually, anyway).

The easiest way to create KML is to use `ogr2ogr` to generate a KML equivalent of any of the other [OGR-supported data formats](http://www.gdal.org/ogr_formats.html).

Here's an example of converting a shapefile to KML. Start up GitBash and `cd` to somewhere where you won't clobber anything else. Then:

    $ $ curl http://www.countyofsb.org/gis/download/ranchos.zip -o ranchos.zip
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    100 83147  100 83147    0     0   520k      0 --:--:-- --:--:-- --:--:--  520k

The `curl` command lets you fetch a file from the web without having to use a web browser (cool, huh?)

We just fetched a shapefile containing the boundaries of the original Spanish/Mexican land grants in Santa Barbara County. Let's check to see what's in it:

    $ unzip -l ranchos.zip
    Archive:  ranchos.zip
      Length      Date    Time    Name
    ---------  ---------- -----   ----
          388  03/02/2010 08:42   ranchos.shx
        16938  03/02/2010 08:42   ranchos.dbf
          565  03/02/2010 08:42   ranchos.prj
          492  03/02/2010 08:42   ranchos.sbn
          148  03/02/2010 08:42   ranchos.sbx
       104756  03/02/2010 08:42   ranchos.shp
        16252  03/02/2010 08:42   ranchos.shp.xml
    ---------                     -------
       139539                     7 files

Since the files aren't in a separate folder, we'll create one to put them in. (It's always a good idea to keep each shapefile in its own folder.)

    $ mkdir ranchos
    $ cd ranchos
    $ unzip ../ranchos.zip
    Archive:  ../ranchos.zip
      inflating: ranchos.shx
      inflating: ranchos.dbf
      inflating: ranchos.prj
      inflating: ranchos.sbn
      inflating: ranchos.sbx
      inflating: ranchos.shp
      inflating: ranchos.shp.xml
    $ cd ..

It's also always a good idea to run `ogrinfo` on a weird new file, just to make sure you can read it, and that it contains what your expect:

    $ ogrinfo -al -so ranchos
    INFO: Open of `ranchos'
          using driver `ESRI Shapefile' successful.

    Layer name: ranchos
    Geometry: Polygon
    Feature Count: 36
    Extent: (5762576.937655, 1961988.213767) - (6133891.330851, 2232646.304339)
    Layer SRS WKT:
    PROJCS["NAD_1983_StatePlane_California_V_FIPS_0405_Feet",
        GEOGCS["GCS_North_American_1983",
            DATUM["North_American_Datum_1983",
                SPHEROID["GRS_1980",6378137.0,298.257222101]],
            PRIMEM["Greenwich",0.0],
            UNIT["Degree",0.0174532925199433]],
        PROJECTION["Lambert_Conformal_Conic_2SP"],
        PARAMETER["False_Easting",6561666.666666666],
        PARAMETER["False_Northing",1640416.666666667],
        PARAMETER["Central_Meridian",-118.0],
        PARAMETER["Standard_Parallel_1",34.03333333333333],
        PARAMETER["Standard_Parallel_2",35.46666666666667],
        PARAMETER["Latitude_Of_Origin",33.5],
        UNIT["Foot_US",0.3048006096012192]]
    ID: String (100.0)
    Index_ID: String (15.0)
    CREATED_BY: String (100.0)
    DISCLAIMER: String (250.0)

Note that the shapefile's coordinate system is not WGS 84, which KML requires. Don't worry, though; `ogr2ogr` is smart enough to project the coordinates into WGS 84 when it creates a KML document.

Note also that if you keep each shapefile in its own folder, then the OGR commands let you refer to the shapefile by its folder name, without having to use the `.shp` extension.

OK, let's generate some KML:

    $ ogr2ogr -f KML ranchos.kml ranchos

(Remember, the order of the files is backwards from GDAL...)

Now display the KML in Google Earth:

    $ start ranchos.kml

and you should see something like this:

![SB ranchos on Google Earth](https://purl.org/net/frew/ESM296/wk5/ranchos.jpg)

The read boundaries and clear polygons are Google Earth's default style. You can mess with the generated KML if you want it to look different.

Try clicking inside one of the rancho outlines in Google Earth. The balloon you see is populated with the polygon's attributes, as extracted from the shapefile. Sweet.

## Other ways to read/write KML

### QGIS

To display a KML document in QGIS, just drag it into the map's *Layers* list.

To export a QGIS map layer as a KML document:

1. right-click on the layer in the Layers list and select *Save As...*
2. in the *Save vector layer as...* panel:
    1. Set *Format* to *Keyhole Markup Language [KML]*
    2. Specify a filename to save the KML in.
    3. Make sure the *CRS* is *WGS 84*
    4. If you want to save the layers line color and weight, set *Symbology export* to *Feature symbology*
        * Note: polygon fill styles won't export to KML (this is a bug).
    5. **important**: Set *AltitudeMode* to *clampToGround*

### ArcGIS

To display a KML document in ArcGIS, use the *KML To Layer* tool.

To export an ArcGIS map layer, use the *Layer to KML* tool.

To export an entire ArcGIS map's active layers, use the *Map To KML* tool.

* Here's an [example](https://purl.org/net/frew/ESM296/wk5/distance_to_roads.kmz), from the dark depths of your past...

The ArcGIS KML export tools *do* correctly save the layer(s)'s style information in the generated KML.

## Displaying KML in a web browser

You can load a local `.kml` or `.kmz` file into Google Earth, QGIS, ArcGIS, etc.; but you can't load a local file into a web browser that's running a mapping application like Google Maps. This is for security reasons (otherwise, any Web program could upload random files from your computer to [evil.com](http://youtu.be/R-9eYvvfhf4) or wherever.)

In order to load a KML document into a browser-based mapping client, the KML document must be accessible via a URL. In plain English, this means you have to park it on a web server somewhere.

I've uploaded the `ranchos.kml` file we just created to the course web server. You can access it as <https://purl.org/net/frew/ESM296/wk5/ranchos.kml>. More to the point, so can Google:

1. Go to <http://maps.google.com>
2. Click on the little gear at the bottom right of the display, and select *My Places*
3. Cut-n-paste `https://purl.org/net/frew/ESM296/wk5/ranchos.kml` into the search box above tghe map, and click the search button.

You'll see the rancho outlines drawn on a Google Map.

You can pan-n-zoom, but you can't query the polygon attributes, nor do they display in the feature list to the left of the map. Bummer.

But, this is just to show how the pieces fit together. If you want to do web maps right, you'll assemble a custom web page with the specific map components you need. Over to Ben...
