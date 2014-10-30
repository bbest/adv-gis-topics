---
layout: article
title: "Creating Interactive Spatial Content Online Using Github and Leaflet"
excerpt: "week 5"
image:
  feature:
  teaser:
  thumb:
share: false
ads: false
toc: true
---


## Introduction

In the modern world of conservation, engaging a broad range of stakeholders is vital to the success of any given proposal. Interactive online maps provide a powerful tool for facilitiating the visibility and interest in relevant spatial products that you derive.

Goals:

- Create GeoJSON files (using GDAL), which automatically get rendered with their own interactive map in Github. Do this for:

  - points
  
  - polygons  

- Create free public website using Github.

- Create your own interactive map with multiple layers, combining:

  - points
  
  - polygons
  
  - raster (as an image overlay)
  
  - background map of your choosing

## 1. Get polygons of bristlecone pine distribution

Let's continuing with our pet organism the bristlecone pine (_Pinus longaeva_). Download the species distribution shapefile from this website:
  
  - [GECSC: Tree Species Distribution Maps for North America](http://esp.cr.usgs.gov/data/little/)

Unzip and create directories as needed so the shapefile and associated files live at this exact path:

```
H:\esm296-4f\lab5\raw\pinulong.shp
```

## 2. Create Website

To share content on the web, let's get started with creating a pretty website.

Visit Github.com, login if needed, and create a new repository.

![](./img/github_add_repo_dropdown.PNG)

For the Repository name, enter your Github username.github.io and tick the box to Initialize this repository with a README. This will be your public website and you can add add a Description if you like.

Now go to your repository <span class="octicon octicon-tools"></span> Settings (lower right) of this new Github repo. , Github Pages, click on Automatic page generator. 

![](./img/github_autopages.PNG)

Notice that although your repository is private this site will be public.

Accept the default project site info and click Continue to layouts. Have fun choosing one to your aesthetic sensibilities and Publish page.

![](./img/github_themes.PNG)

You should see a notice like:

> Your project page has been created at http://bbest.github.io. It may take up to 10 minutes to activate. Read more at https://help.github.com/pages.

Return to RStudio and pull the latest changes from the Git pane.



## Review