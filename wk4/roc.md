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
