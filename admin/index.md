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

- Don't alter raw input data. Keep a folder called "raw", import feature classes to be worked on into a file geodatabase, and 

- Create reproducible analysis with models / scripts. Any use of tools should be recorded in a model or script.

    - While it's tempting and easy to simply select the available layers as inputs to your tools, it is strongly recommended to use source data from the Catalog pane as inputs whenever possible. This is because:
    
        1. Layers in your ArcMap document are temporary to the life of the document, hence changes in your layers may render your model later useless. And certainly the model can only be ran from within that ArcMap document, whereas if pointing to file inputs it can also run within ArcCatalog.
        
        1. Selected features in your layers are respected by many tools, hence only some features may have the desired function applied. It's very easy to select a row in a table or feature on a map and later be confused as to why your tool didn't seem to work, when in reality it did, just on a subset of the data.
        
        1. For tool parameters allowing for multiple inputs, it's much easier to browse to the containing folder or geodatabase to select multiple inputs, rather than selecting layers one at a time.

- Delete intermediate scratch files.

- Store relative paths, an option for both ArcMap documents and models.

## File Management

Recommended file management scheme for `H:\esm296-4f`. There's usually a **lab** for every week (**wk**) of class instruction and associated homework (**hw**) to turn in. While the # associated with a lab is always the same as the hw turned in, a lab could span more than one week so wk # could be offset.

- **github**/ is the folder which points to your github repository at `https://github.com/USER/esm296-4f` where `USER` is your Github username.

    - **hw#**/ is your homework for lab#, using a different name to reduce the likelihood of placing files in the wrong folder.
    
        - **README.md** to contain write-up in [Markdown format](https://guides.github.com/features/mastering-markdown/)
        
        - **img**/ folder to contain images rendered in the README.md as markdown like so for an image called test.png (note the use of a "relative" path):
        
            ```
            ![](./img/test.png)
            ```          

- **lab#**/

    - **raw**/ folder contains raw data inputs for lab assignments and should not be altered.
    
    - **lab#.mxd** saved to the lab# containing folder as very first step, to provide home directory in Catalog pane. Folder paths should be made relative.
    
    - **lab#.gdb** stores all interim feature classes. Created from inside Catalog pane of saved lab#.mxd and made the default gdb.
    
    - **lab#.tbx** stores all models. Created from inside Catalog pane of saved lab#.mxd and made the default gdb. Model paths should be made relative.
    
    - **derived**/ folder contains derived outputs, especially rasters which are best stored as tifs outside a geodatabase.
    
This borrows from [ArcGIS Help: Methods for distributing tools]().

![](arc_org.png)

## Course Instructions on Github Site

Visit the course site and refresh your browser to see the latest lecture and lab content.

## Turning in Homework via Github Issue

Issues are created at the beginning of the course in the following exact sequence (so instructors can visit them with known URLs). Closing the given issue notifies us that you're done with the assignment. You can also add a comment to a given issue to address instructor(s) by their Github username with the "@" prefix (ie @bbest, @jamesfrew or @lwedding) to ask any questions in private related to the assignment.

1. setup github
1. project proposal
1. hw1
1. hw2
1. hw3
1. hw4
1. hw5
1. final project

