
##################### Data wrangling ##############################

# Creating missing variables in the datasets

## Creating the variable "quarter", "PIWT" for income weight, YEAR, and PWT for population weighs


LFS19_JM <- LFS19_JM %>% mutate(QUARTER = 1, YEAR = 2019, FLED10 = NA, PIWT = PIWT18, PWT = PWT18)
LFS19_AJ <- LFS19_AJ %>% mutate(QUARTER = 2, YEAR = 2019, PIWT = PIWT18, PWT = PWT18)
LFS19_JS <- LFS19_JS %>% mutate(QUARTER = 3, YEAR = 2019, FLED10 = NA, PIWT = PIWT18, PWT = PWT18)
LFS19_OD <- LFS19_OD %>% mutate(QUARTER = 4, YEAR = 2019, PIWT = PIWT18, PWT = PWT18)

LFS20_JM <- LFS20_JM %>% mutate(QUARTER = 5, YEAR = 2020, FLED10 = NA, PIWT = PIWT20, PWT = PWT20)
LFS20_FA <- LFS20_FA %>% mutate(QUARTER = 6, YEAR = 2020, PIWT = NA, PWT = PWT20)
LFS20_MM <- LFS20_MM %>% mutate(QUARTER = 7, YEAR = 2020, PIWT = NA, PWT = PWT20)
LFS20_AJ <- LFS20_AJ %>% mutate(QUARTER = 8, YEAR = 2020, PIWT = PIWT20, PWT = PWT20)
LFS20_MJ <- LFS20_MJ %>% mutate(QUARTER = 9, YEAR = 2020, PIWT = NA, PWT = PWT20)
LFS20_JA <- LFS20_JA %>% mutate(QUARTER = 10, YEAR = 2020, PIWT = NA, PWT = PWT20)
LFS20_JS <- LFS20_JS %>% mutate(QUARTER = 11, YEAR = 2020, FLED10 = NA, PIWT = PIWT20, PWT = PWT20)
LFS20_AO <- LFS20_AO %>% mutate(QUARTER = 12, YEAR = 2020, PIWT = NA, PWT = PWT20)
LFS20_SN <- LFS20_SN %>% mutate(QUARTER = 13, YEAR = 2020, PIWT = NA, PWT = PWT20)
LFS20_OD <- LFS20_OD %>% mutate(QUARTER = 14, YEAR = 2020, PIWT = PIWT20, PWT = PWT20)

LFS21_NJ <- LFS21_NJ %>% mutate(QUARTER = 15, YEAR = 2020-21, PIWT = NA, PWT = PWT20)
LFS21_DF <- LFS21_DF %>% mutate(QUARTER = 16, YEAR = 2020-21, PIWT = NA, PWT = PWT20)

LFS21_JM <- LFS21_JM %>% mutate(QUARTER = 17,YEAR = 2021, PIWT = PIWT20, PWT = PWT20,
                                NSECMJ10 = NSECMJ20, # new variable to standardise to the old name
                                SC10MMJ = SC20MMJ, # new variable to standardise to the old name
                                SC10SMJ = SC20SMJ) # new variable to standardise to the old name

LFS21_FA <- LFS21_FA %>% mutate(QUARTER = 18, YEAR = 2021, PIWT = NA, PWT = PWT20,
                                NSECMJ10 = NSECMJ20, # new variable to standardise to the old name
                                SC10MMJ = SC20MMJ, # new variable to standardise to the old name
                                SC10SMJ = SC20SMJ) # new variable to standardise to the old name

LFS21_MM <- LFS21_MM%>% mutate(QUARTER = 19, YEAR = 2021, PIWT = NA, PWT = PWT20,
                                NSECMJ10 = NSECMJ20, # new variable to standardise to the old name
                                SC10MMJ = SC20MMJ, # new variable to standardise to the old name
                                SC10SMJ = SC20SMJ) # new variable to standardise to the old name

LFS21_AJ <- LFS21_AJ %>% mutate(QUARTER = 20, YEAR = 2021, PIWT = PIWT20, PWT = PWT20,
                                NSECMJ10 = NSECMJ20, # new variable to standardise to the old name
                                SC10MMJ = SC20MMJ, # new variable to standardise to the old name
                                SC10SMJ = SC20SMJ) # new variable to standardise to the old name

LFS21_MJ <- LFS21_MJ %>% mutate(QUARTER = 21, YEAR = 2021, PIWT = NA, PWT = PWT20,
                                NSECMJ10 = NSECMJ20, # new variable to standardise to the old name
                                SC10MMJ = SC20MMJ, # new variable to standardise to the old name
                                SC10SMJ = SC20SMJ) # new variable to standardise to the old name

LFS21_JA <- LFS21_JA %>% mutate(QUARTER = 22, YEAR = 2021, PIWT = NA, PWT = PWT20,
                                NSECMJ10 = NSECMJ20, # new variable to standardise to the old name
                                SC10MMJ = SC20MMJ, # new variable to standardise to the old name
                                SC10SMJ = SC20SMJ) # new variable to standardise to the old name



# Selecting variables

# common to all datasets

variables <- c(
       
         # Case identifiers
        "YEAR",
        "QUARTER",
        "IOUTCOME", # interview outcome
        
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
        "DISEA", # Disability: equality act
        "NSECMJ10", # NS-SEC major group (SOC2010 based) - National Statistics Socio-economic Classification   


        # MAIN JOB
        
        "STATR", # Employment status in main job (reported)
        "WRKING", # Whether in paid job in reference week, either as employee or as self-employed
        "JBAWAY", # Whether temporary away from paid job (if "no" in WRKING)
        "PUBLICR", # Whether working in public or private sector (reported)
        "SECTOR", # Whether working for private firm or business
        "SECTRO03", # Type of non-private organisation
        "INDE07M", # Industry section in main job 
        "SC10MMJ", # Major occupation group
        "MANAGER", # managerial status in current job (filter by STAT = 1)  
        "REGWKR", # Region of place of work (reported)

        # MAIN JOB - PRECARIOUS WORK INDICATORS
        
        ## full vs part time (complement with hours data)
        
        "FTPTWK", # Whether full or part time in main job (filter for the required economics activity)        
        "YPTJOB", # Reason for part time job (filter by FTPTWK = 2) 

        ## Permanent/Temporary Employment
        
        "JOBTYP", # Whether job permanent (filter by Stat=1 AND EverWk<1)
        "AGWRK", # Whether agency worker (applies to JOBTYP = 1)
        "WHYTMP6", # Reason for taking non-permanent job (filter by JOBTYP = 2) 
        "RESTMR6", # Reason job is temporary - Way in which job was not permanent
        "TEMLEN", # Length of non-permanent job
        "EMPLEN", # Length of time continuously employed
        "EMPMON", # Months continuously employed      
        
        ## work arrangements
        
        "FLED10", # Type of agreed work arrangement

        # SECOND JOB
        
        "SECJOB", # Whether had second job in reference week
        "Y2JOB", # Whether had 2 jobs because of a change of job in reference week (this is mainly for filtering in some variables)
        "STAT2", # Employment status for those in regular second jobs
        "INDS07S", # Industry section in second job - 21 categories
        "MANAG2", # Did you have any managerial duties?
        "JOBTYP2", # Permanency of second job
        "REGWK2R", # Region of workplace for second job (reported)
        "SC10SMJ", # Major occupation group (second job)
        
        # HOURS

        "EVEROT", # Whether ever work paid or unpaid overtime (filter use only)
        "POTHR", # Usual hours of paid overtime (filter by EVEROT = 1)
        "UOTHR", # Usual hours of unpaid overtime (filter by EVEROT = 1)
        
        "SUMHRS", # Total hours worked in reference week in main and second jobs

        "VARYHR", # Whether weekly hours tend to vary
        
        ## Main job 
        
        "BUSHR", # Total usual hours excluding overtime
        "TTUSHR", # Total usual hours including overtime
        "PAIDHRU", # Paid hours - based on usual hours per week, including paid overtime only
        "POTHR", # Usual hours of paid overtime
        "UOTHR", # Usual hours of unpaid overtime
        
        "BACTHR", # Basic actual hours in main job (per week)- It does not include overtime (paid or unpaid).
        "TTACHR", # Total actual hours worked in main job in reference week includes any paid or unpaid overtime
        "PAIDHRA", # Paid Hours - based on actual hours per week
        
        ## Second job
        
        "ACTHR2", # Actual hours in second job including overtime (filter by Y2Job=2)

        # EARNINGS           
        "GRSSWK", # Gross weekly pay in main job
        "GRSSWK2", # Gross weekly pay in second job
        
        # REDUNDANCY WITHIN LAST 3 MONTHS
        
        "REDUND", #  Whether made redundant in last three months (filter for 1 in each of the next ones)
        "REDPAID", # Have you left any paid job in the last three months?
        "REDSTAT", # Status in job (made redundant from) - applies to (((REDYL13 = 2 OR 3) AND REDPAID = 1) OR (REDANY = 1)).
        "REDYL13", # Could you tell me the reason you left your last job? (filter by REDPAID=Yes))
        "REDANY", # Whether made redundant from any other job in last 3 months (filter by REDYL13 = 1, 4, 5, 6, 7, 8, 9, 10, 11 AND REDPAID = 1))
        "REDCLOS",  # Reason for leaving job left in last three months (REDYL13 = 2 OR 3 AND REDPAID = 1) OR (REDANY = 1))     
        "INDE07R", #  Industry sectors in job made redundant from
        
        # self-employment
        
        ### NOTE: partime, redundancy, hours, income, seeking also applies
        
        "SELF1", # Other methods of payment aside from receiving a salary or wage direct from an employer
        "SELF2", # Other methods of payment aside from receiving a salary or wage direct from an employer
        "SELF3", # Other methods of payment aside from receiving a salary or wage direct from an employer
        "SELF4", # Other methods of payment aside from receiving a salary or wage direct from an employer
        "SOLOR", # Self-employed with or without employees (reported)
        "ONETEN", # Number (1 – 10) of employees working for self employed person. Filter by "SOLOR" ==2
        "CONSEY", # Year started as continuously self employed
        "SOLO2", # Working alone or employees in second job (reported)
        
        ## Seeking for work
        "DIFJOB", # Whether looking for different or additional paid job or business
        "TYEMPS", # Type of employment sought (DIFJOB = 1)
        "LKSELA", # Whether looking for work as employee or self employed
        "ADDJOB", # Whether seeking replacement or additional job (DIFJOB = 1)
        "UNDEMP", # Whether would like to work longer hours, at current basic rate of pay, given the opportunity
        "UNDHRS", # Number of extra hours would like to work
        
        # weights
        "PWT", "PIWT" # data for PIWT18 is not available for the new covid series
        ) 

#### selecting the variables in all dataset and creating temporary datasets

t1a <- LFS19_JM %>% select(variables) # FLED10 does not exist 
t2a <- LFS19_AJ %>% select(variables) # `                     
t3a <- LFS19_JS %>% select(variables) # FLED10 does not exist 
t4a <- LFS19_OD %>% select(variables) #                       

t1 <- LFS20_JM %>% select(variables) # FLED10 does not exist t
t2 <- LFS20_FA %>% select(variables)
t3 <- LFS20_MM %>% select(variables)
t4 <- LFS20_AJ %>% select(variables)
t5 <- LFS20_MJ %>% select(variables) #                        
t6 <- LFS20_JA %>% select(variables) #                        
t7 <- LFS20_JS %>% select(variables) # FLED10 does not exist  
t8 <- LFS20_AO %>% select(variables) #                        
t9 <- LFS20_SN %>% select(variables) #                       
t10 <- LFS20_OD %>% select(variables)#                        

t11 <- LFS21_NJ %>% select(variables)
t12 <- LFS21_DF %>% select(variables)

t13 <- LFS21_JM %>% select(variables)
t14 <- LFS21_FA %>% select(variables)

t15 <- LFS21_MM %>% select(variables)
t16 <- LFS21_AJ %>% select(variables)
t17 <- LFS21_MJ %>% select(variables)
t18 <- LFS21_JA %>% select(variables)

#### combine all temporary datasets

LFS_all <- rbind(t1a, t2a, t3a, t4a, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10,
                 t11, t12, t13, t14, t15, t16, t17, t18) # working database
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