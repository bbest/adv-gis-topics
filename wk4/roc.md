---
layout: article
title: "Receiver Operating Characteristic (ROC) Curve"
excerpt: "and the confusion matrix"
image:
  feature:
  teaser:
  thumb:
share: false
ads: false
toc: true
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

``` {.r}
library(foreign)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'
    ## 
    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag
    ## 
    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` {.r}
library(knitr)
```

|Tables|Are|Cool|
|------|:-:|---:|
|col 3 is|right-aligned|\$1600|
|col 2 is|centered|\$12|
|zebra stripes|are neat|\$1|

|truth|predicted|predicted|
|----:|:-------:|:-------:|
||1|0|
|1|true positive (TP)|false negative (FN)|
|0|false positive (FP)|true negative (TN)|

``` {.r}
# read in attribute table of predicted observation shapefile
dbf = 'H:/esm296-4f/wk4/derived/obs_pred.dbf'
d = read.dbf(dbf) %>%
  filter(TestData==TRUE) %>%
  select(presence, starts_with('pred_'))

# iterate over predicted fields
flds_pred = sprintf('pred_%02d', c(1,3,7,9))
for (fld in flds_pred){
    
  # true positive rate
#   d
#    %>% 
#     mutat
    
  
  # false positive rate
}
```
