---
layout: article
title: "Week 2"
excerpt: "Python programming, QGIS"
image:
  feature:
  teaser:
  thumb:
share: false
ads: false
toc: true
---

## Agenda

8:30 - 8:50 Introductions

- Pass around sign up sheet: Name, Email, Github username, Auditing (Y/N)

- Introduce selves: Name, Program (MS/PhD/...), Auditing?, How do you hope to use GIS?

- Thanks for the feedback! Here are the [survey results](https://docs.google.com/a/nceas.ucsb.edu/forms/d/1jwZg3MR2BrkDtRZl5QSkRjaXijL0JyUvAGiwkRQvBHc/viewanalytics#start=publishanalytics). We're listening. Pace is generally OK, but need clearer instructions, bigger picture relevance and less material. 

- [Project proposals](../project)

8:50 - 9:10 [Reorganize](./reorg.html) files

9:10 - 10:00 [Lab 1: review](../wk1/lab1.html#review), [Lab 2: Python Programming](./python.html)

10:00 - 11:00 [QGIS](./QGIS.html)

11:00 - 11:30 [Extra](./extra.html) (time permitting)
 
## FAQ

- Q: **Why Github?** A: can collaborate with edits, even through web browser. Use in current projects (eg ohi-science/issues). Could apply to your group project / internships / etc.

- Q: **Why use "in_memory"?** Just so don't clog disk. But doesn't behave well in ArcMap if have Add to Display in Model Builder. Not there when close and reopen (get red exclamation). Get similar effect if output of a model is input to another and it is marked as Intermediate in model.

- Q: **Why not just select available layers for inputs to tools?** A: Best if you browse to find inputs on disk, especially for multiple input tools like Calculate Statistics, since then ensure works regardless of in memory layers that happen to be loaded in your ArcMap document and allows exported scripts to work (because don't have access to in memory layers not explicitly already part of the script).

## Cheat sheets

- [git](cheatsheets/git_cheatsheet.pdf?raw=true)
- [Python](cheatsheets/python_cheat_sheet.pdf)
- [Rmarkdown](https://github.com/ucsb-bren/esm296-4f/blob/master/wk1/rmarkdown_cheatsheet.pdf?raw=true)
- [R](cheatsheets/r_cheatsheet.pdf)
- [R Spatial](http://www.maths.lancs.ac.uk/~rowlings/Teaching/UseR2012/cheatsheet.html)

## Further Resources

We only have time to give you the briefest of introductions to Python and R in this course. Here are more resources for diving deeper.

Python tutorials

- [The Python Tutorial - Python.org](https://docs.python.org/2/tutorial/): authoritative, long document
- [Python - CodeAcademy](http://www.codecademy.com/en/tracks/python): interactive 13 hr course
- [Learn Python the Hard Way](http://learnpythonthehardway.org/book/): full outline of topics
- [Software Carpentry: Python](http://www.software-carpentry.org/v5/novice/python/index.html)

R tutorials

- [Try R - CodeSchool.com](http://tryr.codeschool.com/levels/1/challenges/3): interactive console
- [Intro to R - DataCamp.com](https://www.datacamp.com/courses/introduction-to-r): interactive console. Can even customize and [create your our own course](https://github.com/Data-Camp/datacamp).
- [Intro R Lecture - UCLA](http://www.ats.ucla.edu/stat/r/seminars/intro.htm): good functional overview
- [Crash Course in R - Spatial.ly](http://spatial.ly/2013/05/crash/)

Useful Reference Sites for R

- [Rdocumentation.org](http://Rdocumentation.org)
- [CRAN Task Views](http://cran.r-project.org/web/views/)

ArcGIS Python Tutorials

- [GIS Programming and Automation - Penn State](https://www.e-education.psu.edu/geog485/)
- [Intro to Python for ArcGIS - Stanford](https://sites.google.com/site/stanfordgis2013/introduction-to-python-for-arcgis)

Open Source Python Tutorials

- [Spatial Analysis with python - luxbulb.org](http://complex.luxbulb.org/howto/spatial-analysis-python)
  - [Geospatial tutorial for SciPy 2013](https://github.com/kjordahl/SciPy2013)
- [GDAL Tutorial - GDAL.org](http://www.gdal.org/gdal_tutorial.html)
- [OGR Tutorial - GDAL.org](http://www.gdal.org/ogr_apitut.html)
- [Python Spatial Analysis Library (PySAL) Tutorials](http://pysal.readthedocs.org/en/latest/users/tutorials/intro.html)

R Spatial Tutorials

- [R Spatial Tips](http://spatial.ly/r/): using sp objects, ggplot2, ggmaps, export to KML
- [Geospatial in R](http://www.maths.lancs.ac.uk/~rowlings/Teaching/UseR2012/introductionTalk.html): great intros and worked examples
- [Spatial Data Analysis with R - URI](http://scicomp2014.edc.uri.edu/posts/2014-02-04-Hollister.html)
- [R sp graphics example figures](http://rspatial.r-forge.r-project.org/gallery/)

Deeper into Scientific Python

- [iPython: Gallery of Interesting IPython Notebooks](https://github.com/ipython/ipython/wiki/A-gallery-of-interesting-IPython-Notebooks)

Books on ArcGIS Python

- [Python Scripting for ArcGIS](http://www.amazon.com/Python-Scripting-ArcGIS-Paul-Zandbergen/dp/1589482824)

R Markdown

- [rmarkdown_cheatsheet.pdf](rmarkdown_cheatsheet.pdf)
- [markdown basics - Github help](https://help.github.com/articles/markdown-basics)
- [mastering markdown - Github guides](https://guides.github.com/features/mastering-markdown/)
- [stackedit.io](https://stackedit.io) for live preview of markdown
