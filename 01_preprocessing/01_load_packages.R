
########################### Load packages ##############################################

### R version 4.2.2 (2022-10-31)

#### packages needed
if(!require(tidyverse)) install.packages("tidyverse", repos = "http://cran.us.r-project.org")
if(!require(haven)) install.packages("haven", repos = "http://cran.us.r-project.org")
if(!require(sjlabelled)) install.packages("sjlabelled", repos = "http://cran.us.r-project.org")
if(!require(Hmisc)) install.packages("Hmisc", repos = "http://cran.us.r-project.org")
if(!require(sjPlot)) install.packages("sjPlot", repos = "http://cran.us.r-project.org")

library(tidyverse) # several tools for data manipulation
library(haven) # read SPSS, Stata, and SAS data
library(sjlabelled) # get_labels function
library(Hmisc) # many functions useful for data analysis
library(sjPlot) # create a html with variable and value labels


########################### END  ##############################################
