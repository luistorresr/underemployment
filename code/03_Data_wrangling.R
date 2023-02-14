
##################### Data wrangling ##############################

# Creating missing variables in the datasets

## Creating the variable "quarter", "PIWT" for income weight, YEAR, and PWT for population weighs among others

jm05 <- jm05 %>% mutate(year = 2005, quarter = 1, PIWT = , PWT = )
aj05 <- aj05 %>% mutate(year = 2005, quarter = 2, PIWT = , PWT = )
js05 <- js05 %>% mutate(year = 2005, quarter = 3, PIWT = , PWT = )
od05 <- od05 %>% mutate(year = 2005, quarter = 4, PIWT = , PWT = )

jm06 <- jm06 %>% mutate(year = 2006, quarter = 1, PIWT = , PWT = )
aj06 <- aj06 %>% mutate(year = 2006, quarter = 2, PIWT = , PWT = )
js06 <- js06 %>% mutate(year = 2006, quarter = 3, PIWT = , PWT = )
od06 <- od06 %>% mutate(year = 2006, quarter = 4, PIWT = , PWT = )

jm07 <- jm07 %>% mutate(year = 2007, quarter = 1, PIWT = , PWT = )
aj07 <- aj07 %>% mutate(year = 2007, quarter = 2, PIWT = , PWT = )
js07 <- js07 %>% mutate(year = 2007, quarter = 3, PIWT = , PWT = )
od07 <- od07 %>% mutate(year = 2007, quarter = 4, PIWT = , PWT = )

jm08 <- jm08 %>% mutate(year = 2008, quarter = 1, PIWT = , PWT = )
aj08 <- aj08 %>% mutate(year = 2008, quarter = 2, PIWT = , PWT = )
js08 <- js08 %>% mutate(year = 2008, quarter = 3, PIWT = , PWT = )
od08 <- od08 %>% mutate(year = 2008, quarter = 4, PIWT = , PWT = )

jm09 <- jm09 %>% mutate(year = 2009, quarter = 1, PIWT = , PWT = )
aj09 <- aj09 %>% mutate(year = 2009, quarter = 2, PIWT = , PWT = )
js09 <- js09 %>% mutate(year = 2009, quarter = 3, PIWT = , PWT = )
od09 <- od09 %>% mutate(year = 2009, quarter = 4, PIWT = , PWT = )

jm10 <- jm10 %>% mutate(year = 2010, quarter = 1, PIWT = , PWT = )
aj10 <- aj10 %>% mutate(year = 2010, quarter = 2, PIWT = , PWT = )
js10 <- js10 %>% mutate(year = 2010, quarter = 3, PIWT = , PWT = )
od10 <- od10 %>% mutate(year = 2010, quarter = 4, PIWT = , PWT = )

jm11 <- jm11 %>% mutate(year = 2011, quarter = 1, PIWT = , PWT = )
aj11 <- aj11 %>% mutate(year = 2011, quarter = 2, PIWT = , PWT = )
js11 <- js11 %>% mutate(year = 2011, quarter = 3, PIWT = , PWT = )
od11 <- od11 %>% mutate(year = 2011, quarter = 4, PIWT = , PWT = )

jm12 <- jm12 %>% mutate(year = 2012, quarter = 1, PIWT = , PWT = )
aj12 <- aj12 %>% mutate(year = 2012, quarter = 2, PIWT = , PWT = )
js12 <- js12 %>% mutate(year = 2012, quarter = 3, PIWT = , PWT = )
od12 <- od12 %>% mutate(year = 2012, quarter = 4, PIWT = , PWT = )

jm13 <- jm13 %>% mutate(year = 2013, quarter = 1, PIWT = , PWT = )
aj13 <- aj13 %>% mutate(year = 2013, quarter = 2, PIWT = , PWT = )
js13 <- js13 %>% mutate(year = 2013, quarter = 3, PIWT = , PWT = )
od13 <- od13 %>% mutate(year = 2013, quarter = 4, PIWT = , PWT = )

jm14 <- jm14 %>% mutate(year = 2014, quarter = 1, PIWT = , PWT = )
aj14 <- aj14 %>% mutate(year = 2014, quarter = 3, PIWT = , PWT = )
js14 <- js14 %>% mutate(year = 2014, quarter = 4, PIWT = , PWT = )
od14 <- od14 %>% mutate(year = 2014, quarter = 4, PIWT = , PWT = )

jm15 <- jm15 %>% mutate(year = 2015, quarter = 1, PIWT = , PWT = )
aj15 <- aj15 %>% mutate(year = 2015, quarter = 2, PIWT = , PWT = )
js15 <- js15 %>% mutate(year = 2015, quarter = 3, PIWT = , PWT = )
od15 <- od15 %>% mutate(year = 2015, quarter = 4, PIWT = , PWT = )

jm16 <- jm16 %>% mutate(year = 2016, quarter = 1, PIWT = , PWT = )
aj16 <- aj16 %>% mutate(year = 2016, quarter = 2, PIWT = , PWT = )
js16 <- js16 %>% mutate(year = 2016, quarter = 3, PIWT = , PWT = )
od16 <- od16 %>% mutate(year = 2016, quarter = 4, PIWT = , PWT = )

jm17 <- jm17 %>% mutate(year = 2017, quarter = 1, PIWT = , PWT = )
aj17 <- aj17 %>% mutate(year = 2017, quarter = 2, PIWT = , PWT = )
js17 <- js17 %>% mutate(year = 2017, quarter = 3, PIWT = , PWT = )
od17 <- od17 %>% mutate(year = 2017, quarter = 4, PIWT = , PWT = )

jm18 <- jm18 %>% mutate(year = 2018, quarter = 1, PIWT = , PWT = )
aj18 <- aj18 %>% mutate(year = 2018, quarter = 2, PIWT = , PWT = )
js18 <- js18 %>% mutate(year = 2018, quarter = 3, PIWT = , PWT = )
od18 <- od18 %>% mutate(year = 2018, quarter = 4, PIWT = , PWT = )

jm19 <- jm19 %>% mutate(year = 2019, quarter = 1, PIWT = , PWT = )
aj19 <- aj19 %>% mutate(year = 2019, quarter = 2, PIWT = , PWT = )
js19 <- js19 %>% mutate(year = 2019, quarter = 3, PIWT = , PWT = )
od19 <- od19 %>% mutate(year = 2019, quarter = 4, PIWT = , PWT = )

jm20 <- jm20 %>% mutate(year = 2020, quarter = 1, PIWT = , PWT = )
aj20 <- aj20 %>% mutate(year = 2020, quarter = 2, PIWT = , PWT = )
js20 <- js20 %>% mutate(year = 2020, quarter = 3, PIWT = , PWT = )
od20 <- od20 %>% mutate(year = 2020, quarter = 4, PIWT = , PWT = )

jm21 <- jm21 %>% mutate(year = 2021, quarter = 1, PIWT = , PWT = )
aj21 <- aj21 %>% mutate(year = 2021, quarter = 2, PIWT = , PWT = )
js21 <- js21 %>% mutate(year = 2021, quarter = 3, PIWT = , PWT = )
od21 <- od21 %>% mutate(year = 2021, quarter = 4, PIWT = , PWT = )

jm22 <- jm22 %>% mutate(year = 2022, quarter = 1, PIWT = , PWT = )
aj22 <- aj22 %>% mutate(year = 2022, quarter = 2, PIWT = , PWT = )
js22 <- js22 %>% mutate(year = 2022, quarter = 3, PIWT = , PWT = )


# Selecting variables

variables <- c(
       
         # SERIES
       
        "year",
        "quarter",
        "sequence", 
        
        # BASIC FILTERS
        
        "ILODEFR", # Basic economic activity (ILO definition) (not include 4 = under 16)
        "INECAC05", # Basic economic activity (ILO definition) (extended)
        "STAT",  # Employment status (respondents currently in work or who have worked in the last eight years)

        # DEMOGRAPHICS
        
        "COUNTRY",  # Country within UK
        "GOVTOF2", # gov region
        
        # Respondent characteristics
        
        "SEX", # 1 male, 2 female
        "AGE", # number
        "AGEEUL", # age bands
        "ETHUKEUL", # ethnic group

        # MAIN JOB
        
        "STATR", # Employment status in main job (reported)
        "WRKING", # Whether in paid job in reference week, either as employee or as self-employed
        "JBAWAY", # Whether temporary away from paid job (if "no" in WRKING)
        "PUBLICR", # Whether working in public or private sector (reported)
        "INDE07M", # Industry section in main job 
        "SC10MMJ", # Major occupation group
        "MANAGER", # managerial status in current job (filter by STAT = 1)  
        "REGWKR", # Region of place of work (reported)

        # MAIN JOB - TIME
        
        ## full vs part time (complement with hours data)
        
        "FTPTWK", # Whether full or part time in main job (filter for the required economics activity)        
        "YPTJOB", # Reason for part time job

        ## work arrangements
        
        "JOBTYP", # Whether job permanent (filter by Stat=1 AND EverWk<1)
        "AGWRK", # Whether agency worker (applies to JOBTYP = 1)
        "FLED10", # Type of agreed work arrangement

        # SECOND JOB
        
        "SECJOB", # Whether had second job in reference week
        "Y2JOB", # Whether had 2 jobs because of a change of job in reference week (this is mainly for filtering in some variables)
        "STAT2", # Employment status for those in regular second jobs
        "INDS07S", # Industry section in second job - 21 categories
        "MANAG2", # Did you have any managerial duties?
        "REGWK2R", # Region of workplace for second job (reported)
        "SC10SMJ", # Major occupation group (second job)
        
        # HOURS
        
        ## overall 
        
        "SUMHRS", # Total hours worked in reference week in main and second jobs
        "VARYHR", # Whether weekly hours tend to vary
        
        
        ## Main job 
        
        "BACTHR", # Basic actual hours in main job (per week)- It does not include overtime (paid or unpaid).
        "TTACHR", # Total actual hours worked in main job in reference week includes any paid or unpaid overtime
        "PAIDHRA", # Paid Hours - based on actual hours per week
        
        ## Second job
        
        "ACTHR2", # Actual hours in second job including overtime (filter by Y2Job=2)

        ## Work more hours (Seeking for work survey section)
        "UNDEMP", # Whether would like to work longer hours, at current basic rate of pay, given the opportunity
        "UNDHRS", # Number of extra hours would like to work
        
        
        # EARNINGS           
       
        "GRSSWK", # Gross weekly pay in main job
        "GRSSWK2", # Gross weekly pay in second job
        
        # SKILLS
        
        
        
        ## Seeking for work
        "DIFJOB", # Whether looking for different or additional paid job or business
        "TYEMPS", # Type of employment sought (DIFJOB = 1)
        "LKSELA", # Whether looking for work as employee or self employed
        "ADDJOB", # Whether seeking replacement or additional job (DIFJOB = 1)

        
        # weights
        "PWT", "PIWT"
        ) 

#### selecting the variables in all dataset and creating temporary datasets

t1 <- jm05 %>% select(variables) 
t2 <- aj05 %>% select(variables)
t3 <- js05 %>% select(variables)
t4 <- od05 %>% select(variables)

t5 <- jm06 %>% select(variables) 
t6 <- aj06 %>% select(variables)
t7 <- js06 %>% select(variables)
t8 <- od06 %>% select(variables)

t9  <- jm07 %>% select(variables) 
t10 <- aj07 %>% select(variables)
t11 <- js07 %>% select(variables)
t12 <- od07 %>% select(variables)

t13 <- jm08 %>% select(variables) 
t14 <- aj08 %>% select(variables)
t15 <- js08 %>% select(variables)
t16 <- od08 %>% select(variables)

t17 <- jm09 %>% select(variables) 
t18 <- aj09 %>% select(variables)
t19 <- js09 %>% select(variables)
t20 <- od09 %>% select(variables)

t21 <- jm10 %>% select(variables) 
t22 <- aj10 %>% select(variables)
t23 <- js10 %>% select(variables)
t24 <- od10 %>% select(variables)

t25 <- jm11 %>% select(variables) 
t26 <- aj11 %>% select(variables)
t27 <- js11 %>% select(variables)
t28 <- od11 %>% select(variables)

t29 <- jm12 %>% select(variables) 
t30 <- aj12 %>% select(variables)
t31 <- js12 %>% select(variables)
t32 <- od12 %>% select(variables)

t33 <- jm13 %>% select(variables) 
t34 <- aj13 %>% select(variables)
t35 <- js13 %>% select(variables)
t36 <- od13 %>% select(variables)

t37 <- jm14 %>% select(variables) 
t38 <- aj14 %>% select(variables)
t39 <- js14 %>% select(variables)
t40 <- od14 %>% select(variables)

t41 <- jm15 %>% select(variables) 
t42 <- aj15 %>% select(variables)
t43 <- js15 %>% select(variables)
t44 <- od15 %>% select(variables)

t45 <- jm16 %>% select(variables) 
t46 <- aj16 %>% select(variables)
t47 <- js16 %>% select(variables)
t48 <- od16 %>% select(variables)

t49 <- jm17 %>% select(variables) 
t50 <- aj17 %>% select(variables)
t51 <- js17 %>% select(variables)
t52 <- od17 %>% select(variables)

t53 <- jm18 %>% select(variables) 
t54 <- aj18 %>% select(variables)
t55 <- js18 %>% select(variables)
t56 <- od18 %>% select(variables)

t57 <- jm19 %>% select(variables) 
t58 <- aj19 %>% select(variables)
t59 <- js19 %>% select(variables)
t60 <- od19 %>% select(variables)

t61 <- jm20 %>% select(variables) 
t62 <- aj20 %>% select(variables)
t63 <- js20 %>% select(variables)
t64 <- od20 %>% select(variables)

t65 <- jm21 %>% select(variables) 
t66 <- aj21 %>% select(variables)
t67 <- js21 %>% select(variables)
t68 <- od21 %>% select(variables)

t69 <- jm22 %>% select(variables) 
t70 <- aj22 %>% select(variables)
t71 <- js22 %>% select(variables)


#### combine all temporary datasets

LFS_all <- rbind(t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15,
                 t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30,
                 t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45,
                 t46, t47, t48, t49, t50, t51, t52, t53, t54, t55, t56, t57, t58, t59, t60,
                 t61, t62, t63, t64, t65, t66, t67, t68, t69, t70, t71) # combined database


LFS_all <- as_tibble(LFS_all) # creating a tibble for data manipulation

save(LFS_all, file = "./Data_clean/LFS_all.rda") # load the saved dataset for data manipulation

rm(list = ls()) # clean the global environment to save memory

load("./Data_clean/LFS_all.rda") # this is the file for analysis

#### Create a working dataset to clean

LFS_clean <- LFS_all # working dataset

### Cleaning the working dataset 

LFS_clean <- LFS_clean %>% 
        set_na(na = c(-8, -9), drop.levels = TRUE, as.tag = FALSE) %>% 
        as_tibble(.) # NAs for: does not apply(-9), no answer(-8)

l_LFS_clean <- get_labels(LFS_clean, values = "n") # check value labels 

LFS_clean <- LFS_clean %>% 
        set_na(na = c(POTHR = 99, UOTHR = 99, ACTHR2 = 99), 
               drop.levels = TRUE, as.tag = FALSE) %>% 
        as_tibble(.) # NAs for specific variable labels

l_LFS_clean <- get_labels(LFS_clean, values = "n") # check value labels 


### Recording and creating variables based on existing ones

## Replacing sex and ILO unemployment labels

LFS_clean$SEX <- replace_labels(LFS_clean$SEX, labels = c("Men" = 1, "Women" = 2)) # changing male and female

LFS_clean$ILODEFR <- replace_labels(LFS_clean$ILODEFR, labels = c("Not employed" = 2)) # replace ILO unemployment

l_LFS_clean <- get_labels(LFS_clean, values = "n") # check value labels 


## recoding "Scotland North Caledonian Canal" for Scotland

LFS_clean <- LFS_clean %>% mutate(COUNTRY2 = recode_factor(factor(COUNTRY), 
                                                   `1` = "England",
                                                   `2` = "Wales",
                                                   `3` = "Scotland", 
                                                   `4` = "Scotland",
                                                   `5` = "Northern Ireland")) %>% 
                                                as_numeric(., keep.labels = TRUE)

## recoding age bands

LFS_clean <- LFS_clean %>% 
        mutate(AGEEUL_2 = recode_factor(factor(AGEEUL),
                                        `1`="Below 18", `2`="Below 18", `3`="Below 18", 
                                        `4`="Below 18", `5`="Below 18", `6`="Below 18",
                                        `7`="Aged 18-24", `8`="Aged 18-24", `9`="Aged 18-24",
                                        `10`="Aged 18-24", `11`="Aged 18-24", `12`="Aged 18-24", `13`="Aged 18-24", 
                                        `14`="Aged 25-29", 
                                        `15`="Aged 30-39", `16`="Aged 30-39", 
                                        `17`="Aged 40-49", `18`="Aged 40-49",
                                        `19`="Aged 50-64", `20`= "Aged 50-64", `21`= "Aged 50-64",
                                        `22`="Above 64", `23` = "Above 64", `24`= "Above 64", 
                                        `25`= "Above 64", `26` = "Above 64", `27`= "Above 64", 
                                        `28`= "Above 64")) %>% 
        as_numeric(., keep.labels = TRUE)


## recoding occupations

LFS_clean <- LFS_clean %>% 
        mutate(NSECMJ10_2 = recode_factor(factor(NSECMJ10), 
                          `1` = "Management & professional",
                          `2` = "Management & professional",
                          `3` = "Intermediate", 
                          `4` = "Small employers & own account",
                          `5` = "Lower supervisory & technical",
                          `6` = "Routine & semi-routine",
                          `7` = "Routine & semi-routine", 
                          `8` = "Never worked, unemployed, and nec")) %>% 
       as_numeric(., keep.labels = TRUE)


## adding labels to QUARTER
LFS_clean$QUARTER <- set_labels(LFS_clean$QUARTER, labels = c("Jan/Mar19" = 1, "Apr/Jun19" = 2, "Jul/Sep19" = 3, "Oct/Dec19" = 4,
                                                              "Jan/Mar20" = 5, "Feb/Apr20" = 6, "Mar/May20" = 7,
                                                              "Apr/Jun20" = 8, "May/Jul20" = 9, "Jun/Aug20" = 10,
                                                              "Jul/Sep20" = 11, "Aug/Oct20" = 12, "Sep/Nov20" = 13,
                                                             "Oct/Dec20" = 14, "Nov20/Jan21" = 15,"Dec20/Feb21" = 16,
                                                             "Jan/Mar21" = 17, "Feb/Apr21" = 18, 
                                                             "Mar/May21" = 19, "Apr/Jun21" = 20, "May/Jul21" = 21,
                                                             "Jun/Aug21" = 22))

## adding labels to FLED10
LFS_clean$FLED10 <- set_labels(LFS_clean$FLED10, labels = c("Flexitime" = 1, 
                                                            "Annualised hours" = 2, 
                                                            "Term time working" = 3, 
                                                            "Job sharing" = 4, 
                                                            "Nine day fortnight" = 5, 
                                                            "Four and a half day week" = 6, 
                                                            "Zero hours contract" = 7,
                                                            "On-Call Working" = 8, 
                                                            "None of these" = 9, 
                                                            "Don’t know" = 10))



## Ethnicity 

LFS_clean <- LFS_clean %>% mutate(ETHUKEUL_2 = recode_factor(factor(ETHUKEUL), 
                                                             `1` = "White",
                                                             `2` = "Minority-ethnic", `3` = "Minority-ethnic", 
                                                             `4` = "Minority-ethnic", `5` = "Minority-ethnic",
                                                             `6` = "Minority-ethnic",`7` = "Minority-ethnic",
                                                             `8` = "Minority-ethnic",`9` = "Minority-ethnic")) %>% 
  as_numeric(., keep.labels = TRUE)



## Length of non-permanent job by type

LFS_clean  <- LFS_clean %>% 
  mutate(TEMLEN_2 = recode_factor(factor(TEMLEN), # recode lengh of temporary job 
                                  `1` = "Less than 1 month",
                                  `2` = "Less than 3 months", 
                                  `3` = "Less than 6 months", 
                                  `4` = "Less than 12 months", 
                                  `5` = "Less than 18 months",
                                  `6` = "Less than 24 months",
                                  `7` = "2 years or more", `8` = "2 years or more", `9` = "2 years or more",
                                  `10` = "2 years or more", 
                                  `11` = "Time not fixed yet")) %>% as_numeric(., keep.labels = TRUE) 

# Industry section in main job

get_labels(d_self$INDE07M)

LFS_clean <- LFS_clean%>% mutate(INDE07M_2 = recode_factor(factor(INDE07M), 
                                                      `1` = "Agriculture, forestry and fishing",
                                                      `2` = "Energy and water", `3` = "Manufacturing", 
                                                      `4` = "Construction", `5` = "Distribution, hotels and restaurants",
                                                      `6` = "Transport and communication",`7` = "Banking and finance",
                                                      `8` = "Public admin, education and health",`9` = "Other services")) %>% as_numeric(., keep.labels = TRUE)




l_LFS_clean <- get_labels(LFS_clean, values = "n") # value labels 

### saving the clean dataset

save(LFS_clean, file = "./Data_clean/LFS_clean.rda")

rm(list = ls()) # clean the global environment

######################### END WORKING WITH ORIGINAL DATASETS ####################################