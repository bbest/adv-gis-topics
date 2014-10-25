---
  layout: article
title: "admin for instructors"
excerpt: "administrative overview"
image:
  feature:
  teaser:
  thumb:
  share: false
ads: false
toc: true
---

## Data

Place all input data files into a folder "raw", and [7-zip](http://www.7-zip.org/) that folder to raw.7z (in Windows Explorer, right click on raw folder > 7-Zip > add to "raw.7z").

## Lab Instructions

Create lab#.md in relevant wk#/ folder of https://github.com/ucsb-bren/esm296-4f. Link to lab#.md from /index.md and/or /wk#/index.md.

- /**index.md** contains course syllabus

    - **wk#**/ contains each week's of material
    
        - **index.md** describes and links out to week's content or is skipped in preference of placing content directly to main /index.md course syllabus.
        
        - **lab#.md** contains the lab instructions
        
        - **img**/ folder contains all images referenced by lab or lecture files
        
While the # associated with a lab is always the same as the homework (hw) students are to turn in, a lab could span more than one week so wk # could be offset.

## Markdown

Every markdown document hosted on the course instruction site requires a yaml header like so in order to be properly rendered by the [Jekyll Github](http://jekyllrb.com/docs/structure/) site:

```yaml
---
  layout: article
title: "admin for instructors"
excerpt: "administrative overview"
image:
  feature:
  teaser:
  thumb:
  share: false
ads: false
toc: true
---
```

The rest of the document is to be in [Markdown format](https://guides.github.com/features/mastering-markdown/).


## Google Drawing for Images

Note that we can use [Google Drawings](https://docs.google.com/drawings) to size and annotate images used in labs. This  allows these images to be later edited in a quick easy online sharable way. File > Publish to the web... > Embed and paste provided HTML snippet into the lab#.md markdown document.

## Google Drive for Files

You can [Get shareable link](http://googledrive.blogspot.com/2014/09/sharingupdates.html) from Google Drive to link PDF or other non Google native content. More tips specific to Google Documents, Presentations and Spreadsheets here to [Create Direct Links to your Files on Google Drive](http://www.labnol.org/internet/direct-links-for-google-drive/28356/).

## Github.com for Code

Github does a nice job syntax highlighting code, so you can still place them in a given wk# folder and then link to the absolute github.com URL, eg [`https://github.com/ucsb-bren/esm296-4f/blob/gh-pages/wk4/get_species.R`](https://github.com/ucsb-bren/esm296-4f/blob/gh-pages/wk4/get_species.R), or embed [markdown blockcode for syntax highlighting](https://help.github.com/articles/github-flavored-markdown/#syntax-highlighting). For example this R code block:

```r
library(sp)
library(rgdal)
library(dismo)

# set variables to the scientific name of your speciess
genus   = 'Pinus'
species = 'longaeva'

# path to output shapefile constructed from scientific name of your speciess
shp = sprintf('H:/esm296-4f/project/data/gbif_%s_%s', genus, species)

# get data from Global Biodiversity Information Facility (GBIF)
sp = gbif(genus, species, sp=T, removeZeros=T)
```
