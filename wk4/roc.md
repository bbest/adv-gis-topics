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

Receiver Operating Characteristic (ROC) Curves were first developed during WWII for tuning radios. We're going to use them to adjust the dial on our species distribution model. Let's take a look at the ROC plot from lab 4.

![](glm1_diagnostic_plot_cropped.png)

The two axis correspond with the accuracy of the model output, which can incur two types of errors:

1.  **False positives (FP)** occurs when the GLM predicts presence of the species for a given location, when in fact our validation dataset says it does NOT occur there (ie TestData=1 and presence=0). This is also known as an error of "commission", or Type I error. The False positive rate (FPR) (x axis of ROC plot above) is the number of false positives over all the known *positives* from the training dataset (ie TestData=1 and presence=1).

2.  **False negatives (FN)** occurs when the GLM predicts absence of the species for a given location, when in fact our validation dataset says it does occur there (ie TestData=1 and presence=1). This is also called an error of "ommission", or Type II error. The True positive rate (TPR) (y axis of ROC plot above) is the number of false positives over all the known *negatives* from the training dataset (ie TestData=1 and presence=0).

|Tables|Are|Cool|
|------|:-:|---:|
|col 3 is|right-aligned|\$1600|
|col 2 is|centered|\$12|
|zebra stripes|are neat|\$1|

|||predicted|predicted|rates|
|--:|--:|:-------:|:-------:|:---:|
|||1|0||
|truth|1|true positive (TP)|false negative (FN)|TPR = TP / (TP + FN)|
|truth|0|false positive (FP)|true negative (TN)|FPR = FP / (FP + TN)|

-   true positive rate (TPR) = true positives (TP) / all positives (truth == 1) = TP / (TP + FN)

-   false positive rate (FPR) = false positives (TP) / all negatives (truth == 0) = FP / (FP + TN)

![](.img/roc_mapped.png)

    ## Warning: package 'dplyr' was built under R version 3.1.1

    ## 
    ## Attaching package: 'dplyr'
    ## 
    ## The following object is masked from 'package:stats':
    ## 
    ##     filter
    ## 
    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    ## Warning: package 'knitr' was built under R version 3.1.1

    ## cutoff=0.1
    ## TP=72 | FN=187 | TPR=0.28
    ## FP=60 | TN=5 | FPR=0.92
    ## 
    ## cutoff=0.3
    ## TP=70 | FN=223 | TPR=0.24
    ## FP=24 | TN=7 | FPR=0.77
    ## 
    ## cutoff=0.7
    ## TP=51 | FN=238 | TPR=0.18
    ## FP=9 | TN=26 | FPR=0.26
    ## 
    ## cutoff=0.9
    ## TP=35 | FN=247 | TPR=0.12
    ## FP=0 | TN=42 | FPR=0.00

cutoff=0.1 TP=72 | FN=187 | TPR=0.28 FP=60 | TN=5 | FPR=0.92

cutoff=0.3 TP=70 | FN=223 | TPR=0.24 FP=24 | TN=7 | FPR=0.77

cutoff=0.7 TP=51 | FN=238 | TPR=0.18 FP=9 | TN=26 | FPR=0.26

cutoff=0.9 TP=35 | FN=247 | TPR=0.12 FP=0 | TN=42 | FPR=0.00
