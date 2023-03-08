
##################### LFS Data wrangling ##############################

# Load LFS combined dataset

load("imported_data/LFS_all.rda")

#### Create a working dataset to clean

LFS_clean <- LFS_all # working dataset

rm(LFS_all) # remove to save memory


### Cleaning the working dataset 

LFS_clean <- LFS_clean %>% 
        set_na(na = c(-8, -9), drop.levels = TRUE, as.tag = FALSE) %>% 
        as_tibble(.) # NAs for: does not apply(-9), no answer(-8)

LFS_clean <- LFS_clean %>% 
        set_na(na = c(ACTHR2 = 99), 
               drop.levels = TRUE, as.tag = FALSE) %>% 
        as_tibble(.) # NAs for specific variable labels

view_df(LFS_clean) # check value labels 


### Recording and creating variables based on existing ones

## Replacing sex and ILO unemployment labels

LFS_clean$SEX <- replace_labels(LFS_clean$SEX, labels = c("Men" = 1, "Women" = 2)) # changing male and female

get_labels(LFS_clean$SEX, values = "n")

LFS_clean$ILODEFR <- replace_labels(LFS_clean$ILODEFR, labels = c("Not employed" = 2)) # replace ILO unemployment

get_labels(LFS_clean$ILODEFR, values = "n")


## Recoding "Scotland North Caledonian Canal" for Scotland

LFS_clean <- LFS_clean %>% mutate(COUNTRY2 = recode_factor(factor(COUNTRY), 
                                                   `1` = "England",
                                                   `2` = "Wales",
                                                   `3` = "Scotland", 
                                                   `4` = "Scotland",
                                                   `5` = "Northern Ireland")) %>% 
                                                as_numeric(., keep.labels = TRUE)


## recoding NSEC

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

# Industry section in main job

get_labels(d_self$INDE07M)

LFS_clean <- LFS_clean%>% mutate(INDE07M_2 = recode_factor(factor(INDE07M), 
                                                      `1` = "Agriculture, forestry and fishing",
                                                      `2` = "Energy and water", `3` = "Manufacturing", 
                                                      `4` = "Construction", `5` = "Distribution, hotels and restaurants",
                                                      `6` = "Transport and communication",`7` = "Banking and finance",
                                                      `8` = "Public admin, education and health",`9` = "Other services")) %>% as_numeric(., keep.labels = TRUE)



### saving the clean dataset

save(LFS_clean, file = "./Data_clean/LFS_clean.rda")

rm(list = ls()) # clean the global environment

######################### END WORKING WITH ORIGINAL DATASETS ####################################