
##################### LFS Data wrangling ##############################

# Load LFS combined dataset

load("data/LFS_combined.rda")

# Create a working dataset to clean

LFS_clean <- LFS_combined # working dataset

view_df(LFS_clean, show.id = FALSE)  # check variables and labels

rm(LFS_combined) # remove to save memory

# Cleaning the working dataset 

LFS_clean <- LFS_clean %>% 
        set_na(na = c(-8, -9), drop.levels = TRUE, as.tag = FALSE) %>% 
        as_tibble(.) # NAs for: does not apply(-9), no answer(-8)

LFS_clean <- LFS_clean %>% 
        set_na(na = c(ACTHR2 = 99, OVHRS = 99), 
               drop.levels = TRUE, as.tag = FALSE) %>% 
        as_tibble(.) # NAs for specific variable labels

# Recording and creating variables based on existing ones

## adding label to year 

set_label(LFS_clean$year) <- "Year" # set variable label

## adding labels to quarter

set_label(LFS_clean$quarter) <- "Calendar quarter" # add variable label
LFS_clean$quarter <- set_labels(LFS_clean$quarter, 
                                labels = c("Jan/Mar" = 1, "Apr/Jun" = 2, "Jul/Sep" = 3, "Oct/Dec" = 4))

## changing male and female

LFS_clean$SEX <- replace_labels(LFS_clean$SEX, 
                                labels = c("Men" = 1, "Women" = 2)) 

set_label(LFS_clean$SEX) <- "Sex" # set variable label

get_labels(LFS_clean$SEX, values = "n")

## changing ethnicity

LFS_clean$ETH <- replace_labels(LFS_clean$ETH, 
                                labels = c("White" = 1, "Mixed ethnicity" = 2, "Asian / Asian British" = 3, 
                                           "Black/African/Caribean/British Black" = 4, "Chinese" = 5, "Other ethnic group" = 6)) 

set_label(LFS_clean$ETH) <- "Ethnicity" # set variable label

get_labels(LFS_clean$ETH, values = "n")

## changing ILO value labels 
LFS_clean$ILODEFR <- replace_labels(LFS_clean$ILODEFR, 
                                    labels = c("In employment" = 1, "Not employed" = 2, "Inactive" = 3, "Under 16" = 4)) 

get_labels(LFS_clean$ILODEFR, values = "n")

set_label(LFS_clean$ILODEFR) <- "Basic economic activity (ILO definition) (reported)" # add variable label

## labeling INECAC05 (basic economic activity)

LFS_clean$INECAC05 <- remove_all_labels(LFS_clean$INECAC05)

LFS_clean$INECAC05 <- set_labels(LFS_clean$INECAC05, labels = c(
  "Employee" = 1,
  "Self-employed" = 2,
  "Government employment & training programmes" = 3,
  "Unpaid family worker" = 4,
  "ILO unemployed" = 5,
  "Inactive - seeking, unavailable, student" = 6,
  "Inactive - seeking, unavailable, looking after family, home" = 7,
  "Inactive - seeking, unavailable, temporarily sick or injured" = 8,
  "Inactive - seeking, unavailable, long-term sick or disabled" = 9,
  "Inactive - seeking, unavailable, other reason" = 10,
  "Inactive - seeking, unavailable, no reason given" = 11,
  "Inactive - not seeking, would like work, waiting results of job application" = 12,
  "Inactive - not seeking, would like work, student" = 13,
  "Inactive - not seeking, would like work, looking after family, home" = 14,
  "Inactive - not seeking, would like work, temporarily sick or injured" = 15,
  "Inactive - not seeking, would like work, long term sick or disabled" = 16,
  "Inactive - not seeking, would like work, believes no jobs available" = 17,
  "Inactive - not seeking, would like work, not yet started looking" = 18,
  "Inactive - not seeking, would like work, does not need or want employment" = 19,
  "Inactive - not seeking, would like work, retired from paid work" = 20,
  "Inactive - not seeking, would like work, other reason" = 21,
  "Inactive - not seeking, would like work, no reason given" = 22,
  "Inactive - not seeking, not like work, waiting results of job application" = 23,
  "Inactive - not seeking, not like work, student" = 24,
  "Inactive - not seeking, not like work, looking after family, home" = 25,
  "Inactive - not seeking, not like work, temporarily sick or injured" = 26,
  "Inactive - not seeking, not like work, long term sick or disabled" = 27,
  "Inactive - not seeking, not like work, believes no jobs available" = 28,
  "Inactive - not seeking, not like work, not yet started looking" = 29,
  "Inactive - not seeking, not like work, does not need or want employment" = 30,
  "Inactive - not seeking, not like work, retired from paid work" = 31,
  "Inactive - not seeking, not like work, other reason" = 32,
  "Inactive - not seeking, not like work, no reason given" = 33,
  "Under 16" = 34))

set_label(LFS_clean$INECAC05) <- "Basic economic activity (ILO definition) (reported)" # add variable label

get_labels(LFS_clean$INECAC05, values = "n")


## Labeling STAT (Employment status)

LFS_clean$STAT <- remove_all_labels(LFS_clean$STAT) # Overall 
set_label(LFS_clean$STAT) <- "Employment status" # add variable label
LFS_clean$STAT <- set_labels(LFS_clean$STAT, labels = c(
  "Employee" = 1,
  "Self-employed" = 2, 
  "Government scheme" = 3,
  "Unpaid family worker" = 4))

LFS_clean$STATR <- remove_all_labels(LFS_clean$STATR) # main job
set_label(LFS_clean$STATR) <- "Employment status (main job)" # add variable label
LFS_clean$STATR <- set_labels(LFS_clean$STATR, labels = c(
  "Employee" = 1,
  "Self-employed" = 2, 
  "Government scheme" = 3,
  "Unpaid family worker" = 4))

LFS_clean$STAT2 <- remove_all_labels(LFS_clean$STAT2) # main job
set_label(LFS_clean$STAT2) <- "Employment status (second job)" # add variable label
LFS_clean$STAT2 <- set_labels(LFS_clean$STAT2, labels = c(
  "Employee" = 1,
  "Self-employed" = 2))

## Adding labels to GOVTOF2 (Government office regions)

LFS_clean$GOVTOF2 <- remove_all_labels(LFS_clean$GOVTOF2) # main job
set_label(LFS_clean$GOVTOF2) <- "Government office regions" # add variable label
LFS_clean$GOVTOF2 <- set_labels(LFS_clean$GOVTOF2, labels = c(
  "North East" = 1,
  "North West" = 2, 
  "Yorkshire and Humberside" = 4,
  "East Midlands" = 5, 
  "West Midlands" = 6, 
  "Eastern" = 7,
  "London" = 8, 
  "South East" = 9,
  "South West" = 10,
  "Wales" = 11,
  "Scotland" = 12,
  "Northern Ireland" = 13))

## Recoding "Scotland North Caledonian Canal" for Scotland

LFS_clean <- LFS_clean %>% mutate(COUNTRY2 = recode_factor(factor(COUNTRY), 
                                                   `1` = "England",
                                                   `2` = "Wales",
                                                   `3` = "Scotland", 
                                                   `4` = "Scotland",
                                                   `5` = "Northern Ireland")) %>% 
                                                as_numeric(., keep.labels = TRUE)

LFS_clean$COUNTRY <- NULL # delete old variable

set_label(LFS_clean$COUNTRY2) <- "Country within UK" # add variable label

get_labels(LFS_clean$COUNTRY2, values = "n")


## Adding labels to PUBLICR (Whether working in public or private sector (reported))

LFS_clean$PUBLICR <- remove_all_labels(LFS_clean$PUBLICR) # main job
set_label(LFS_clean$PUBLICR) <- "Whether working in public or private sector (reported)" # add variable label
LFS_clean$PUBLICR <- set_labels(LFS_clean$PUBLICR, labels = c(
  "Private sector" = 1,
  "Public sector" = 2))

  
## recoding NSEC
LFS_clean <- LFS_clean %>% 
        mutate(NSEC2 = recode_factor(factor(NSEC), 
                          `1` = "Management & professional",
                          `2` = "Management & professional",
                          `3` = "Intermediate", 
                          `4` = "Small employers & own account",
                          `5` = "Lower supervisory & technical",
                          `6` = "Routine & semi-routine",
                          `7` = "Routine & semi-routine", 
                          `8` = "Never worked, unemployed, and nec")) %>% 
        as_numeric(., keep.labels = TRUE)

LFS_clean$NSEC <- NULL # delete old variable

set_label(LFS_clean$NSEC2) <- "NS-SEC major group" # add variable label


# Industry section

LFS_clean$ind1 <- remove_all_labels(LFS_clean$ind1) # main job
set_label(LFS_clean$ind1) <- "Industry section (main job)" # add variable label
LFS_clean$ind1 <- set_labels(LFS_clean$ind1, labels = c(
                             "Agriculture, forestry and fishing" = 1,
                             "Mining and quarrying" = 2,
                             "Manufacturing" = 3,
                             "Electricity, gas, steam and air conditioning supply" = 4,
                             "Water supply, sewerage, waste management and remediation activities" = 5,
                             "Construction" = 6,
                             "Wholesale and retail trade; repair of motor vehicles and motorcycles" = 7,
                             "Transportation and storage" = 8,
                             "Accommodation and food service activities" = 9,
                             "Information and communication" = 10,
                             "Financial and insurance activities" = 11,
                             "Real estate activities" = 12,
                             "Professional, scientific and technical activities" = 13,
                             "Administrative and support service activities" = 14,
                             "Public administration and defence; compulsory social security" = 15,
                             "Education" = 16,
                             "Human health and social work activities" = 17,
                             "Arts, entertainment and recreation"  = 18,
                             "Other service activities" = 19,
                             "Activities of households as employers; undifferentiated goods- and services producing activities of households for own use" = 20,
                             "Activities of extraterritorial organisations and bodies" = 21))


LFS_clean$ind2 <- remove_all_labels(LFS_clean$ind2) # second job
set_label(LFS_clean$ind2) <- "Industry section (Second job)" # add variable label
LFS_clean$ind2 <- set_labels(LFS_clean$ind2, labels = c("Agriculture, forestry and fishing" = 1,
                                                        "Mining and quarrying" = 2,
                                                        "Manufacturing" = 3,
                                                        "Electricity, gas, steam and air conditioning supply" = 4,
                                                        "Water supply, sewerage, waste management and remediation activities" = 5,
                                                        "Construction" = 6,
                                                        "Wholesale and retail trade; repair of motor vehicles and motorcycles" = 7,
                                                        "Transportation and storage" = 8,
                                                        "Accommodation and food service activities" = 9,
                                                        "Information and communication" = 10,
                                                        "Financial and insurance activities" = 11,
                                                        "Real estate activities" = 12,
                                                        "Professional, scientific and technical activities" = 13,
                                                        "Administrative and support service activities" = 14,
                                                        "Public administration and defence; compulsory social security" = 15,
                                                        "Education" = 16,
                                                        "Human health and social work activities" = 17,
                                                        "Arts, entertainment and recreation"  = 18,
                                                        "Other service activities" = 19,
                                                        "Activities of households as employers; undifferentiated goods- and services producing activities of households for own use" = 20,
                                                        "Activities of extraterritorial organisations and bodies" = 21))


## add value labels to Occupation

LFS_clean$occu1 <- remove_all_labels(LFS_clean$occu1) # main job
set_label(LFS_clean$occu1) <- "Major occupation group (main job)" # add variable label
LFS_clean$occu1 <- set_labels(LFS_clean$occu1, labels = c(
  "Managers, Directors And Senior Officials" = 1,
  "Professional Occupations" = 2,
  "Associate Professional Occupations" = 3,
  "Administrative And Secretarial Occupations" = 4,
  "Skilled Trades Occupations" = 5,
  "Caring, Leisure And Other Service Occupations" = 6,
  "Sales And Customer Service Occupations" = 7,
  "Process, Plant And Machine Operatives" = 8,
  "Elementary Occupations" = 9))

LFS_clean$occu2 <- remove_all_labels(LFS_clean$occu2) # main job
set_label(LFS_clean$occu2) <- "Major occupation group (second job)" # add variable label
LFS_clean$occu2 <- set_labels(LFS_clean$occu2, labels = c(
  "Managers, Directors And Senior Officials" = 1,
  "Professional Occupations" = 2,
  "Associate Professional Occupations" = 3,
  "Administrative And Secretarial Occupations" = 4,
  "Skilled Trades Occupations" = 5,
  "Caring, Leisure And Other Service Occupations" = 6,
  "Sales And Customer Service Occupations" = 7,
  "Process, Plant And Machine Operatives" = 8,
  "Elementary Occupations" = 9))


## adding value labels to REGWKR

LFS_clean$REGWKR <- remove_all_labels(LFS_clean$REGWKR) # main job
set_label(LFS_clean$REGWKR) <- "Region of place of work (reported)" # add variable label
LFS_clean$REGWKR <- set_labels(LFS_clean$REGWKR, labels = c(
  "Tyne & Wear" = 1,
  "Rest of North East" = 2,
  "South Yorkshire" = 3,
  "West Yorkshire" = 4,
  "Rest of Yorks & Humberside" = 5,
  "East Midlands" = 6,
  "East Anglia" = 7,
  "Central London" = 8,
  "Inner London" = 9,
  "No Code 10" = 10,
  "Outer London" = 11,
  "Rest of South East" = 12,
  "South West" = 13,
  "West Midlands (met county)" = 14,
  "Rest of West Midlands" = 15,
  "Greater Manchester" = 16,
  "Merseyside" = 17,
  "Rest of North West" = 18,
  "Wales" = 19,
  "Strathclyde" = 20,
  "Rest of Scotland" = 21,
  "Northern Ireland" = 22,
  "Workplace outside UK" = 23))

## adding value labels to FTPTWK

LFS_clean$FTPTWK <- remove_all_labels(LFS_clean$FTPTWK) # main job
set_label(LFS_clean$FTPTWK) <- "Whether full or part time in main job" # add variable label
LFS_clean$FTPTWK <- set_labels(LFS_clean$FTPTWK, labels = c(
  "Full-time" = 1,
  "Part-time" = 2))

## adding value labels to YPTJOB

LFS_clean$YPTJOB <- remove_all_labels(LFS_clean$YPTJOB)
set_label(LFS_clean$YPTJOB) <- "Reason for part time job" # add variable label
LFS_clean$YPTJOB <- set_labels(LFS_clean$YPTJOB, labels = c(
  "Student/still at school" = 1,
  "Ill/disabled" = 2,
  "Could not find full-time job" = 3,
  "Did not want full-time job" = 4))

## adding value labels to JOBTYP main and second job

LFS_clean$JOBTYP <- remove_all_labels(LFS_clean$JOBTYP)
set_label(LFS_clean$JOBTYP) <- "Whether job permanent" # add variable label
LFS_clean$JOBTYP <- set_labels(LFS_clean$JOBTYP, labels = c(
  "Permanent" = 1,
  "Not permanent in some way" = 2))

get_labels(LFS_clean$JOBTYP, values = "n") # check value labels 

LFS_clean$JOBTYP2 <- remove_all_labels(LFS_clean$JOBTYP2)
set_label(LFS_clean$JOBTYP2) <- "Permanency of second job" # add variable label
LFS_clean$JOBTYP2 <- set_labels(LFS_clean$JOBTYP2, labels = c(
  "Permanent" = 1,
  "Not permanent in some way" = 2))

get_labels(LFS_clean$JOBTYP2, values = "n") # check value labels 

## adding value labels to WHYTMP6

LFS_clean$WHYTMP6 <- remove_all_labels(LFS_clean$WHYTMP6)
set_label(LFS_clean$WHYTMP6) <- "Reason for temporary job" # add variable label
LFS_clean$WHYTMP6 <- set_labels(LFS_clean$WHYTMP6, labels = c(
  "Contract which includes period of training" = 1,
  "Had a contract for probationary period" = 2,
  "Could not find a permanent job" = 3,
  "Did not want a permanent job" = 4,
  "Some other reason" = 5))

get_labels(LFS_clean$WHYTMP6, values = "n") # check value labels 


## adding value labels to SECJOB

LFS_clean$SECJOB <- remove_all_labels(LFS_clean$SECJOB)
set_label(LFS_clean$SECJOB) <- "Whether had second job in reference week" # add variable label
LFS_clean$SECJOB <- set_labels(LFS_clean$SECJOB, labels = c(
  "Yes" = 1,
  "No" = 2))

get_labels(LFS_clean$SECJOB, values = "n") # check value labels 

##  adding value labels to Y2JOB

LFS_clean$Y2JOB <- remove_all_labels(LFS_clean$Y2JOB)
set_label(LFS_clean$Y2JOB) <- "Whether had 2 jobs because of a change of job in reference week" # add variable label
LFS_clean$Y2JOB <- set_labels(LFS_clean$Y2JOB, labels = c(
  "Yes (changed jobs during week)" = 1,
  "No" = 2))

get_labels(LFS_clean$Y2JOB, values = "n") # check value labels 

##  adding value labels to VARYHR

LFS_clean$VARYHR <- remove_all_labels(LFS_clean$VARYHR)
set_label(LFS_clean$VARYHR) <- "Whether weekly hours tend to vary" # add variable label
LFS_clean$VARYHR <- set_labels(LFS_clean$VARYHR, labels = c(
  "Yes" = 1,
  "No" = 2))

get_labels(LFS_clean$VARYHR, values = "n") # check value labels 

## adding variable labels to hours 

set_label(LFS_clean$BUSHR) <- "Total usual hours excluding overtime (main job)" # add variable label
set_label(LFS_clean$BACTHR) <- "Total actual hours excluding overtime (main job)"  # add variable label
set_label(LFS_clean$TTACHR) <- "Total actual hours including overtime (main job)" # add variable label

set_label(LFS_clean$ACTHR2) <- "Actual hours in second job including overtime" # add variable label

set_label(LFS_clean$SUMHRS) <- "Total hours worked in reference week in main and second jobs"


##  adding value labels to DIFJOB

LFS_clean$DIFJOB <- remove_all_labels(LFS_clean$DIFJOB)
set_label(LFS_clean$DIFJOB) <- "Whether looking for different or additional paid job or business" # add variable label
LFS_clean$DIFJOB <- set_labels(LFS_clean$DIFJOB, labels = c(
  "Yes" = 1,
  "No" = 2))

get_labels(LFS_clean$DIFJOB, values = "n") # check value labels 


##  adding value labels to ADDJOB

LFS_clean$ADDJOB <- remove_all_labels(LFS_clean$ADDJOB)
set_label(LFS_clean$ADDJOB) <- "Whether seeking replacement or additional job" # add variable label
LFS_clean$ADDJOB <- set_labels(LFS_clean$ADDJOB, labels = c(
  "A new job to replace your present (main) job" = 1,
  "An additional job" = 2))

get_labels(LFS_clean$ADDJOB, values = "n") # check value labels 


##  adding value labels to PREFHR

LFS_clean$PREFHR <- remove_all_labels(LFS_clean$PREFHR)
set_label(LFS_clean$PREFHR) <- "Preferred working hours in new job being looked for" # add variable label
LFS_clean$PREFHR <- set_labels(LFS_clean$PREFHR, labels = c(
  "Longer" = 1,
  "Shorter" = 2,
  "The same" = 3,
  "Don’t know, no preference" = 4))

get_labels(LFS_clean$PREFHR, values = "n") # check value labels 


##  adding value labels to UNDEMP

LFS_clean$UNDEMP <- remove_all_labels(LFS_clean$UNDEMP)
set_label(LFS_clean$UNDEMP) <- "Whether would like to work longer hours, at current basic rate of pay, given the opportunity" # add variable label
LFS_clean$UNDEMP <- set_labels(LFS_clean$UNDEMP, labels = c(
  "Yes" = 1,
  "No" = 2))

get_labels(LFS_clean$UNDEMP, values = "n") # check value labels 


##  adding value labels to LESPAY2

LFS_clean$LESPAY2 <- remove_all_labels(LFS_clean$LESPAY2)
set_label(LFS_clean$LESPAY2) <- "Whether prefer to work shorter hours than at present in current job" # add variable label
LFS_clean$LESPAY2 <- set_labels(LFS_clean$LESPAY2, labels = c(
  "Yes" = 1,
  "No" = 2))

get_labels(LFS_clean$LESPAY2, values = "n") # check value labels 


##  adding value labels to LESPAY3

LFS_clean$LESPAY3 <- remove_all_labels(LFS_clean$LESPAY3)
set_label(LFS_clean$LESPAY3) <- "Whether would work shorter hours for less pay" # add variable label
LFS_clean$LESPAY3 <- set_labels(LFS_clean$LESPAY3, labels = c(
  "Yes" = 1,
  "No" = 2))

get_labels(LFS_clean$LESPAY3, values = "n") # check value labels 

# check variables and labels

view_df(LFS_clean, show.id = FALSE, file = "./data/variable_view.html", max.len = 40) 

## adding labels to education variables

LFS_clean$higher <- remove_all_labels(LFS_clean$higher) # higher education 
set_label(LFS_clean$higher) <- "Type of higher degree" # add variable label
LFS_clean$higher <- set_labels(LFS_clean$higher, labels = c(
  "Doctorate" = 1,
  "Masters" = 2,
  "Postgraduate Certificate in Education" = 3,
  "Other postgraduate degree or professional qualification" = 4,
  "Don’t know" = 5))

get_labels(LFS_clean$higher, values = "n") # check value labels 
table(LFS_clean$higher)

LFS_clean$degree <- remove_all_labels(LFS_clean$degree) # first degree education
set_label(LFS_clean$degree) <- "Type of degree already held" # add variable label
LFS_clean$degree <- set_labels(LFS_clean$degree, labels = c(
  "A higher degree (including PGCE)" = 1,
  "A first degree" = 2,
  "A foundation degree" = 3,
  "A graduate membership of a professional institution" = 4,
  "Other" = 5,
  "Don’t know" = 6))

table(LFS_clean$degree)
get_labels(LFS_clean$degree, values = "n") # check value labels 

LFS_clean$quali <- remove_all_labels(LFS_clean$quali) # any general qualifications  
set_label(LFS_clean$quali) <- "Highest qualification" # add variable label
LFS_clean$quali <- set_labels(LFS_clean$quali, labels = c(
  "Degree or equivalent" = 1,
  "Higher education" = 2,
  "GCE, A-level or equivalent " = 3,
  "GCSE grades A*-C or equivalent" = 4,
  "Other qualifications" = 5,
  "No qualification" = 6,
  "Don’t know" = 7))

table(as_label(LFS_clean$quali))
get_labels(LFS_clean$quali, values = "n") # check value labels 

LFS_clean <- LFS_clean %>% 
  mutate(quali2 = 
           case_when(quali == 1 ~ 4, 
                     quali == 2 ~ 5,
                     quali == 3 ~ 3,
                     quali == 4 ~ 2,
                     quali == 5 ~ 6,
                     quali == 6 ~ 1, 
                     quali == 7 ~ 0))

LFS_clean$quali2 <- set_labels(LFS_clean$quali2, labels = c(
  "Don’t know" = 0,
  "No qualification" = 1,
  "GCSE grades A*-C or equivalent" = 2, 
  "GCE, A-level or equivalent" = 3, 
  "Degree or equivalent" = 4, 
  "Higher education" = 5, 
  "Other qualifications" = 6))


###Examining skills variables and labels

table(LFS_clean$quali)
attr(LFS_clean$quali, "labels")
table(LFS_clean$quali2)
attr(LFS_clean$quali2, "labels")
table(LFS_clean$degree)
attr(LFS_clean$degree, "labels")
table(LFS_clean$higher)
attr(LFS_clean$higher, "labels")

### Reviewing skills variables

table(LFS_clean$quali, LFS_clean$degree)
table(LFS_clean$quali, LFS_clean$higher)
table(LFS_clean$higher, LFS_clean$degree)
table(LFS_clean$quali, LFS_clean$quali2)

table(LFS_clean$quali2, LFS_clean$degree)
table(LFS_clean$quali2, LFS_clean$higher)
table(LFS_clean$higher, LFS_clean$degree)

###Creating and labeling unified skills variable

LFS_clean <- LFS_clean %>% mutate(education = case_when(
  #Doctorate
  higher == 1 & degree %in% 1:6 & quali %in% 1:7 ~ 1,
  #Masters
  higher == 2 & degree %in% 1:6 & quali %in% 1:7 ~ 2,
  #PG Diploma
  higher %in% 3:4 & degree %in% 1:6 & quali %in% 1:7 ~ 3,
  #DK HE
  higher == 5 & degree %in% 1:6 & quali %in% 1:7 ~ 4,
  is.na(higher) & degree == 1 & quali %in% 1:7 ~ 4,
  #First degree
  is.na(higher) & degree == 2 & quali %in% 1:7 ~ 5,
  #Foundation degree
  is.na(higher) & degree == 3 & quali %in% 1:7 ~ 6,
  #Graduate membership of a professional institution
  is.na(higher) & degree == 4 & quali %in% 1:7 ~ 7,
  #Other degree
  is.na(higher) & degree == 5 & quali %in% 1:7 ~ 8,
  #DK degree
  is.na(higher) & degree == 6 & quali %in% 1:7 ~ 9,
  is.na(higher) & is.na(degree) & quali == 1 ~ 9,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 4 ~ 9,
  #HE
  is.na(higher) & is.na(degree) & quali == 2 ~ 10,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 5 ~ 10,
  # GCE, A-level or equivalent
  is.na(higher) & is.na(degree) & quali == 3 ~ 11,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 3 ~ 11,
  # GCSE grades A*-C or equivalent
  is.na(higher) & is.na(degree) & quali == 4 ~ 12,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 2 ~ 12,
  # Other qualification
  is.na(higher) & is.na(degree) & quali == 5 ~ 13,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 6 ~ 13,
  #No qual
  is.na(higher) & is.na(degree) & quali == 6 ~ 14,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 1 ~ 14,
  #DK qual
  is.na(higher) & is.na(degree) & quali == 7 ~ 15,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 0 ~ 15,
  #NA
  is.na(higher) & is.na(degree) & is.na(quali) & is.na(quali) ~ NA,
))

LFS_clean$education <- set_labels(LFS_clean$education, labels = c("Doctorate","Masters","PG Certificate","Don't know higher degree",
                                                                  "First degree","Foundation degree", "Graduate membership of a professional institution","Other degree","Don't know degree",
                                                                  "Higher education", "GCE, A-level or equivalent","GCSE grades A*-C or equivalent","Other qualification","No qualification","Don't know qualification")) 


###Clustering skills and occupations through normative approach 

#Transforming skills into ISCED-97

table(LFS_clean$education)
attr(LFS_clean$education, "labels")

LFS_clean <- LFS_clean %>% mutate(ISCED = case_when(education == 1 ~ 6,
                                                    education %in% 2:9 ~ 5,
                                                    education == 10 ~ 4,
                                                    education == 11 ~ 3,
                                                    education %in% 12:13 ~ 2,
                                                    education == 15 ~ 2,
                                                    education == 14 ~ 1,
                                                    is.na(education) ~ NA
))         

#Clustering ISCED-97 into levels

table(LFS_clean$ISCED)

LFS_clean <- LFS_clean %>% mutate(ISCED_cat = case_when(
  ISCED %in% 5:6 ~ 3,
  ISCED %in% 3:4 ~ 2,
  ISCED %in% 1:2 ~ 1,
  is.na(ISCED)  ~ NA
))

LFS_clean$ISCED_cat <- set_labels(LFS_clean$ISCED_cat, 
                                  labels = c("Low-skilled","Intermediate","High-skilled"))

table(LFS_clean$ISCED_cat)
attr(LFS_clean$ISCED_cat, "labels")

#Clustering ISCO-88 into skill levels

table(LFS_clean$occu1)
table(LFS_clean$occu2)
table(LFS_clean$occu1,LFS_clean$occu2)

LFS_clean <- LFS_clean %>% mutate(ISCO = case_when(
  occu1 %in% 1:3 | occu2 %in% 1:3 ~ 3,
  occu1 %in% 4:8 | occu2 %in% 4:8 ~ 2,
  occu1 == 9 | occu2 == 9 ~ 1,
  is.na(occu1) & is.na(occu2) ~ NA
))

LFS_clean$ISCO <- set_labels(LFS_clean$ISCO, 
                             labels = c("Low-skilled","Intermediate","High-skilled"))

table(LFS_clean$ISCO)
attr(LFS_clean$ISCO, "labels")

###Matching skills with occupations levels

LFS_clean <- LFS_clean %>% mutate(sk_mm = case_when(
  #Overeducated
  ISCED_cat > ISCO ~ 1, 
  #Matched
  ISCED_cat == ISCO ~ 2,
  #Undereducated
  ISCED_cat < ISCO ~ 3,
))

LFS_clean$sk_mm <- set_labels(LFS_clean$sk_mm, 
                              labels = c("Overeducated","Matched","Undereducated"))

table(LFS_clean$ISCED_cat, LFS_clean$ISCO)
table(LFS_clean$sk_mm)
attr(LFS_clean$sk_mm, "labels")

glimpse(LFS_clean)

### saving the clean dataset

save(LFS_clean, file = "./data/LFS_clean.rda")

rm(list = ls()) # clean the global environment

######################### END WORKING WITH ORIGINAL DATASETS ##############################

