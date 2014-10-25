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

Issues are created at the beginning of the course in the following exact sequence (so instructors can visit them with known URLs). Closing the given issue notifies us that you're done with the assignment. This issue can also be a forum by which you ask the instructor(s) any questions in private related to the assignment.

1. setup github

1. project proposal

1. hw1

1. hw2

1. hw3

1. hw4

1. hw5

1. final project

