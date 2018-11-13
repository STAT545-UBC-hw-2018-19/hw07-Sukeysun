My functions in foofactors
================
Sukey

-   [Installtion](#installtion)
-   [Functions in foofactor](#functions-in-foofactor)
    -   [fbind](#fbind)
    -   [freq\_out](#freq_out)
    -   [detect\_factor](#detect_factor)
    -   [reorder\_factor](#reorder_factor)
    -   [set\_factor](#set_factor)
    -   [read\_dataframe](#read_dataframe)
    -   [write\_dataframe](#write_dataframe)

Installtion
===========

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(devtools)
# devtools::install_github("STAT545-UBC-students/hw07-Sukeysun")
```

Functions in foofactor
======================

Factors are a very useful type of variable in R, but they can also drive you nuts. Especially the "stealth factor" that you think of as character.

Can we soften some of their sharp edges?

fbind
-----

Binding two factors via `fbind()`:

``` r
library(foofactors)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
```

Simply catenating two factors leads to a result that most don't expect.

``` r
c(a, b)
```

    ## [1] 1 3 4 2 1 3 4 2

The `fbind()` function glues two factors together and returns factor.

``` r
fbind(a, b)
```

    ## [1] character hits      your      eyeballs  but       integer   where it 
    ## [8] counts   
    ## Levels: but character counts eyeballs hits integer where it your

Often we want a table of frequencies for the levels of a factor. The base `table()` function returns an object of class `table`, which can be inconvenient for downstream work. Processing with `as.data.frame()` can be helpful but it's a bit clunky.

``` r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
```

    ## x
    ##  a  b  c  d  e 
    ## 25 26 17 17 15

``` r
as.data.frame(table(x))
```

    ##   x Freq
    ## 1 a   25
    ## 2 b   26
    ## 3 c   17
    ## 4 d   17
    ## 5 e   15

freq\_out
---------

The `freq_out()` function returns a frequency table as a well-named `tbl_df`:

``` r
freq_out(x)
```

    ## # A tibble: 5 x 2
    ##   x         n
    ##   <fct> <int>
    ## 1 a        25
    ## 2 b        26
    ## 3 c        17
    ## 4 d        17
    ## 5 e        15

detect\_factor
--------------

The `detect_factor` function is a function to test whether the factor is character.

``` r
x <- c('a', 'b', 'b')
x_fact <- factor(x)
y <- c('a', 'b')
y_fact <- factor(y)
detect_factor(x_fact)
```

    ## [1] "Input is a factor"

``` r
detect_factor(y_fact)
```

    ## [1] "input is a character"

x\_fact is factor while y\_fact is character as the length of unique values of y\_fact is equal to the length of y\_fact

reorder\_factor
---------------

The `reorder_factor` returns the input factor in descending order

``` r
x <- c('c', 'b', 'd')
x_fact <- factor(x)
y <- c('c','c','d')
y_fact <- factor(y)
levels(y) <- c('d','c')
print("The original order of factor")
```

    ## [1] "The original order of factor"

``` r
levels(x_fact)
```

    ## [1] "b" "c" "d"

``` r
levels(y_fact)
```

    ## [1] "c" "d"

``` r
print("Reorder the input factor")
```

    ## [1] "Reorder the input factor"

``` r
reorder_factor(x_fact)
```

    ## [1] "d" "c" "b"

``` r
reorder_factor(y_fact)
```

    ## [1] "d" "c"

set\_factor
-----------

This function sets levels to the order in which they appear in the data, i.e. set the levels “as is”

``` r
x <- c("b","c","a")
x_fact <- factor(x)
print("The original order of factor")
```

    ## [1] "The original order of factor"

``` r
levels(x_fact)
```

    ## [1] "a" "b" "c"

``` r
print("Set factor")
```

    ## [1] "Set factor"

``` r
set_factor(x_fact)
```

    ## [1] "b" "c" "a"

The original order of x levles is set in an increasing order. Now the it is set as the sequence that each level appears.

read\_dataframe
---------------

read data frames to plain text delimited files while retaining factor levels

``` r
gdURL <- "http://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt"
df <- read_dataframe(gdURL)


data.frame( variable = names( df ),
           classes = sapply( df, class ),
           factorlevel = sapply( df, nlevels ),
           first_values = sapply( df, function( x ) paste0( head( x ),  collapse = ", ") ),
           row.names = NULL ) %>%
  knitr::kable()
```

| variable  | classes |  factorlevel| first\_values                                                                |
|:----------|:--------|------------:|:-----------------------------------------------------------------------------|
| country   | factor  |          142| Afghanistan, Afghanistan, Afghanistan, Afghanistan, Afghanistan, Afghanistan |
| year      | integer |            0| 1952, 1957, 1962, 1967, 1972, 1977                                           |
| pop       | numeric |            0| 8425333, 9240934, 10267083, 11537966, 13079460, 14880372                     |
| continent | factor  |            5| Asia, Asia, Asia, Asia, Asia, Asia                                           |
| lifeExp   | numeric |            0| 28.801, 30.332, 31.997, 34.02, 36.088, 38.438                                |
| gdpPercap | numeric |            0| 779.4453145, 820.8530296, 853.10071, 836.1971382, 739.9811058, 786.11336     |

We can see that the country and continent is read as factor.

write\_dataframe
----------------

write data frames to plain text delimited files while retaining factor levels. The dataframe will be named as "written\_dataframe.txt"

``` r
df <-  data.frame(x = (c("a","b","c")),y=c("d","e","f"))
write_dataframe(df)
```
