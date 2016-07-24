
<!-- README.md is generated from README.Rmd. Please edit that file -->
`sentimental` : Tools to Work with the [`text-processing.com`](text-processing.com) API.

If you have modest NLP needs, this API package provides an alternative to getting Java-based packages to work or performing processing on your local system.

NOTE: There is a limit of 1,000 API calls per day imposed by the API.

The following functions are implemented:

-   `part_of_speech`: Part-of-peech tagging and chunking on text phrase\_extract\`: Phrase extraction & named entity recognition on text
-   `sentiment`: Analyze the sentiment of text
-   `sentimental`: Tools to Work with the 'text-processing.com' API
-   `stem`: Perform word stemming on text

### TODO

-   CRAN
-   S-expression parser (convert string to a `list`)

### Installation

``` r
devtools::install_github("hrbrmstr/sentimental")
```

### Usage

``` r
library(sentimental)
#> 
#> Attaching package: 'sentimental'
#> The following object is masked from 'package:graphics':
#> 
#>     stem

# current verison
packageVersion("sentimental")
#> [1] '0.0.0.9000'
```

### Test Results

``` r
library(sentimental)
library(testthat)

date()
#> [1] "Sun Jul 24 07:59:41 2016"

sentiment("hi friend")
#> $probability
#> $probability$neg
#> [1] 0.4323145
#> 
#> $probability$neutral
#> [1] 0.8148469
#> 
#> $probability$pos
#> [1] 0.5676855
#> 
#> 
#> $label
#> [1] "neutral"

stem("interestingly enough they overwhelmingly supported the wrong candidate")
#> $text
#> [1] "interestingli enough they overwhelmingli support the wrong candid"

part_of_speech("Maine is nice")
#> $text
#> [1] "(S (GPE Maine/NNP) is/VBZ nice/JJ)"

phrase_extract("Maine is nice")
#> $text
#> [1] "(S (GPE Maine/NNP) is/VBZ nice/JJ)"
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
