---
layout: home
permalink: /
image:
  feature: terrain_1600x800.jpg
toc: true
---

Nice short link to this page: <https://tinyurl.com/ESM296>

## Venue

Fridays, 03&ndash;31 October 2014 (5 weeks), at 08:30&ndash;11:30, in Bren 3035 ("the GIS Lab")

## Instructors

* [Ben Best](http://cmap.msi.ucsb.edu/people/ben-best)
    * <bbest@nceas.ucsb.edu>
    * office hours: after class, 15:00–17:00, in Bren 4324
* [James Frew](http://frew.eri.ucsb.edu/)
    * <frew@ucsb.edu>
    * office hours: [by appointment](mailto:frew@ucsb.edu?subject=ESM 296 appt), or drop by Bren 4524
* [Lisa Wedding](http://www.centerforoceansolutions.org/people/early-career-fellows/lisa-wedding)
    * <lwedding@stanford.edu>
    * office hours: after class, 13:00–15:00, in Bren 4324

## Course Description

A series of intensive lab sessions focused on specific computational languages (e.g., Python, R, shell) and tools (e.g., GDAL/OGR, InVEST, MGET, ModelBuilder) applied to the spatial analysis of environmental problems. ESM 263 (or consent of instructor) is an absolute prerequisite.

## Student Learning Outcomes

Students are able to demonstrate a proficiency in the following advanced GIS skills: programming with ArcPy, R, Open-source GIS, Rmarkdown, InVEST, MGET, Online GIS. At the end of the course students will be able to develop spatial questions, design and conduct final group project using one of the advanced GIS skills learned during the lab section of the course.

## Grading

(150 total points)

The **5 lab assignments** (10 points each) are worth **50 points total**. The are due at 08:00 on the Wednesday following the lab in which they were assigned. All homework will be posted to your github and detailed instructions will be reviewed in Week 1 lecture.

The **final group project** is **100 points total** and a Project Proposal is due Friday October 10 at 4 PM. The final report is due Friday, November 7 at 4 PM. Please refer to the **final report rubric** ([PDF](https://purl.org/net/frew/ESM296/final_project_rubric.pdf)) for specific grading details.

## Course Outline

<a name="wk1"></a>
### Week 1, Oct 3: Course Intro & Advanced Model Builder (Best; Frew)

* Course Intro - Weekly lab topics, final project & grading
    * slides ([PDF](https://purl.org/net/frew/ESM296/course_intro_slides.pdf))

* [**Lecture 1**](./wk1/lec1.html):
    * Introduction to Programming in ArcGIS
        * ArcGIS Model Builder - > Python
    * Intro to Github
    * Programming with ArcPy
    
* [**Lab 1**](./wk1/lab1.html): Wind Energy Lab

Support materials:

- [git](./wk1/git.html)
- [rmarkdown_cheatsheet](./wk1/rmarkdown_cheatsheet.pdf)

<a name="wk2"></a>
### Week 2, Oct 10: Python Programming and Open-Source QGIS (Best; Frew)

* **Part I**: Python programming (Best)

* **Part II**: Open-source QGIS (Frew)

[Week 2](./wk2) has a tight schedule.

<a name="wk3"></a>
### Week 3, Oct 17: Extending ArcGIS with InVEST Ecosystem Services (Wedding)

* **Lecture 3a**: Guest speaker (Natural Capital Project staff) Introduction to ecosystem service evaluation theory and practice using InVEST (Integrated Valuation of Environmental Services and Tradeoffs)
* **Lecture 3b**: [Introduction to InVEST applications, CA case study example and review for Coastal Vulnerability Modeling lab](./wk3/INVEST_UCSB_lmw_week3.pdf)
    * InVEST
    * Background on Python
* **Lab 3**: [Coastal Vulnerability Modeling using InVEST](./wk3/ESM296-4F_CoastalVulnerabilityModelingInVEST_GISLab.pdf)
    * [Clipping and projecting with GDAL](./wk3/GDAL.html)
    * data: [InVEST_CV.7z](https://www.dropbox.com/s/rond5cwobgbzuwg/InVEST_CV.7z?dl=0)

<a name="wk4"></a>
### Week 4, Oct 24: Extending ArcGIS with MGET Species Distribution Modeling (Best; Wedding)

* **Lecture 4a**: Guest speaker (Larry Crowder) Spatial ecological analysis and OBIS SEAMAP (Spatial Ecological Analysis of Megavertebrate Animal Populations)
* **Lecture 4b**: Introduction to MGET (Marine Geospatial Ecology Tools) applications, CA case study example and review for Species Distribution Modeling Lab
    * MGET
    * Background on R, Matlab, Python
    * ArcPy
* **Lab 4**: Species Distribution Modeling Lab using MGET

<a name="wk5"></a>
### Week 5, Oct 31: Publshing Maps Online (Frew; Best; Wedding)

* **Lecture 5**: Introduction to Online GIS
    * ArcGIS Online
    * WorldMap
    * Leaflet Mapper
* **Lab 5**: ArcGIS Online Lab and Final Project Support

<a name="proj"></a>
## Final Group Project

For the final group project assignment, you will submit a written report based on analysis with a geospatial tool, introduced in ESM 296-4F, in the following topical areas:

* **Ecosystem service evaluation**
    * Pick an ecosystem service. See InVEST manual: recommend only Coastal Vulnerability model for California counties / area of interest.
    
* **Species distribution modeling**
    * Pick a species, identify observations available through GBIF (map of locations for the chosen spp).

For more details on submitting your project proposal, see [project](./project)
