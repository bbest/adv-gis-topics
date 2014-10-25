---
layout: article
title: "admin"
excerpt: "administrative overview"
image:
  feature:
  teaser:
  thumb:
share: false
ads: false
toc: true
---

A consistent file management strategy will reduce confusion.

## Principles

- Don't alter raw input data.

- Create reproducible analysis with models / scripts. Any use of tools should be recorded in a model or script.

- Delete intermediate scratch files.

## Structure

Recommended file structure:

- **github**

    - **lab#**
    
        - **README.md** to contain write-up in [Markdown format](https://guides.github.com/features/mastering-markdown/)
        
        - **img** folder to contain images referenced in README.md like so:
        
            ```
            ![](./img/test.png)
            ```
          

- **lab#**

    - **raw** folder contains raw data inputs for lab assignments and should not be altered.
    
    - **lab#.mxd** saved to the lab# containing folder as very first step, to provide home directory in Catalog pane. Folder paths should be made relative.
    
    - **lab#.gdb** stores all interim feature classes. Created from inside Catalog pane of saved lab#.mxd and made the default gdb.
    
    - **lab#.tbx** stores all models. Created from inside Catalog pane of saved lab#.mxd and made the default gdb. Model paths should be made relative.
    
    - **derived** folder contains derived outputs, especially rasters which are best stored as tifs outside a geodatabase.
    

This from [ArcGIS Help: Methods for distributing tools]().

![](arc_org.png)



