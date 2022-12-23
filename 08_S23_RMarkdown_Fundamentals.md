RMarkdown_Reference
================
Vemprala
2022-12-21

## Most common formats in HTML are shown in this document

This markdown’s output format is set to github_document so that all the
details are nicely displayed on the github page. R markdown, on the
other hand, can generate output in a variety of formats. For example, if
a PDF output is required, using pdf_document will suffice.

#### Lets first display an image.

![We are part of UP Business Community - PSOB](Images/PSOB.png)

**[name of link](https://github.com/NagaVemprala/R_Programming)** “Go
back to Homepage”

#### The code below displays a bulleted list with sub-bullets under some items.

-   This markdown is part of the R learning experience (Introductory
    concepts)

-   By following the steps below, anyone can become a data scientist who
    can assist businesses in making sound decisions.

    -   First, learn R.

    -   You could easily switch to Python later

-   R provides students with a wide range of opportunities

The code below displays a numbered list.

1.  Item 2. The numbers are incremented automatically in the output.
2.  Item 3. Look at some of the requirements that employers post in
    their job postings.

#### Demonstrating how to use italics. Do you want to know what Martin Luther King Jr. said about education?

*The function of education, therefore, is to teach one to think
intensively and to think critically. But education which stops with
efficiency may prove the greatest menace to society. The most dangerous
criminal may be the man gifted with reason, but with no morals. “We must
remember that intelligence is not enough,” King advised. “Intelligence
plus character — that is the goal of true education.”*

#### Demonstrating how to use some bold words. Again from the words of King. Jr

*“We must remember that intelligence is not enough,” King advised.*
**“Intelligence plus character** *— that is the goal of true
education.”*

#### Demonstrating how to use headers.

#### Headers are used throughout this markdown file.

# Some of the headers are BIGGGGG!

## Some of the headers are MEDIUM!

### Some of the headers are SMALL!

#### Some of the headers are extra small!

#### You can show the results without showing the code using R markdown. For example, show the summary of iris dataset

    ##   Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
    ##  Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
    ##  1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
    ##  Median :5.800   Median :3.000   Median :4.350   Median :1.300  
    ##  Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
    ##  3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
    ##  Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
    ##        Species  
    ##  setosa    :50  
    ##  versicolor:50  
    ##  virginica :50  
    ##                 
    ##                 
    ## 

#### Nice tables can be easily created with R markdown. Here is a 3x3 table

| Level              | AWS                           | Google                       |
|--------------------|-------------------------------|------------------------------|
| Foundation         | Certified Cloud Practitioner  | Cloud Digital Leader         |
| Associate level    | AWS Certified Developer       | Associate Cloud Engineer     |
| Professional level | Certified Solutions Architect | Professional Cloud Developer |

#### Including nice plots. This time the code to generate the plot is also shown.

``` r
plot(pressure)
```

<img src="08_S23_RMarkdown_Fundamentals_files/figure-gfm/pressure-1.png" style="display: block; margin: auto auto auto 0;" />

#### Lastly, the session info is displayed here.

``` r
sessionInfo()
```

    ## R version 4.1.3 (2022-03-10)
    ## Platform: x86_64-w64-mingw32/x64 (64-bit)
    ## Running under: Windows 10 x64 (build 18363)
    ## 
    ## Matrix products: default
    ## 
    ## locale:
    ## [1] LC_COLLATE=English_United States.1252 
    ## [2] LC_CTYPE=English_United States.1252   
    ## [3] LC_MONETARY=English_United States.1252
    ## [4] LC_NUMERIC=C                          
    ## [5] LC_TIME=English_United States.1252    
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] compiler_4.1.3  magrittr_2.0.3  fastmap_1.1.0   cli_3.2.0      
    ##  [5] tools_4.1.3     htmltools_0.5.2 rstudioapi_0.13 yaml_2.3.5     
    ##  [9] stringi_1.7.6   rmarkdown_2.13  highr_0.9       knitr_1.38     
    ## [13] stringr_1.4.0   xfun_0.30       digest_0.6.29   rlang_1.0.2    
    ## [17] evaluate_0.15
