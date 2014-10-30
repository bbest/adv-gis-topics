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


## 1. Create Website

To share content on the web, let's get started with creating a pretty website.

Visit Github.com, login if needed, and create a new repository.

![](./img/github_add_repo_dropdown.PNG)

For the Repository name, enter your Github username.github.io and tick the box to Initialize this repository with a README. This will be your public website and you can add add a Description if you like.

Now go to your repository <span class="octicon octicon-tools"></span> Settings (right nav pane, lower), and click on the Automatic page generator.

![](./img/github_autopages.PNG)

Let's just go with the default home page for now (you can edit later) and Continue to layouts. Have fun choosing a layout aligned with your aesthetic sensibilities and Publish page.

![](./img/github_themes.PNG)

You'll notice some webby files now in your repository: images, javascripts, stylesheets, and index.html. (The params.json is used internally for the automatic page generator.)

Now add https://USER.github.io (replacing USER with your Github username) to the Website entry at top next to Description and Save. Finally, check out your website! (Might take up to 10 minutes to appear)

## Git clone website locally

Now let's get that website cloned locally to your machine so you can easily add and edit content. Launch Git Bash and enter the following commands, replacing FIRST LAST, USER, EMAIL variables with your own Github information. After setting these variables in the first couple lines, you can run the rest of the commands as is, since they use variable substitution.

```bash
# set to your own information
USER=bbest
FIRST_LAST="Ben Best"
EMAIL=bbest@nceas.ucsb.edu

# clone repo
git clone https://github.com/$USER/$USER.github.io.git /h/esm296-4f/$USER.github.io

# enter credentials
cd /h/esm296-4f/$USER.github.io
git config user.name "$FIRST_LAST"
git config user.email $EMAIL
git config credential.helper wincred
git config push.default simple

# push a test to ensure password saved
git touch test.md
git add test.md
git commit -m "testing"
git push
```

## 2. Get polygons of bristlecone pine distribution

Let's continuing with our pet organism the bristlecone pine (_Pinus longaeva_). Download the species distribution shapefile from this website:
  
  - [GECSC: Tree Species Distribution Maps for North America](http://esp.cr.usgs.gov/data/little/)

Unzip and create directories as needed so the shapefile and associated files live at this exact path:

```
H:\esm296-4f\lab5\raw\pinulong.shp
```



## Review