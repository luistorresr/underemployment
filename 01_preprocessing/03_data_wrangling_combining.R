##################### COMBINING DATASETS ##############################

# Load LFS data

load("replace for your directory path")

# Explore variable names

## Industry
### Industry section is INDS92M (main) and INDS92S (second) until 2008. From 2009 is INDS07M (main) and INDS07S (second).
### This requires standardization before linking databases as the project will analyse in detail two industries (Health & Social Work, Wholesale & Retail Industries)

view_df(jm06, show.id = FALSE)  # SIC 2007 conversion variable IN9207SM and IN9207SS
view_df(jm07, show.id = FALSE)  # SIC 2007 conversion variable IN9207SM and IN9207SS
view_df(aj22, show.id = FALSE)  # SIC 2007 conversion variable IN9207SM and IN9207SS

table(jm06$IN9207SM) # summary main job
table(jm08$IN9207SS) # summary second job
get_labels(jm08$IN9207SM, values = "n")
class(jm08$IN9207SM)

view_df(od09, show.id = FALSE)  
view_df(js22, show.id = FALSE)  

table(jm22$INDS07M)
get_labels(aj22$INDS07M, values = "n")


## Occupation
### 2005 to 2010,  SC2KMMJ, Major occupation group (main job) and SC2KSMJ	Major occupation group (second job)
### 2011 to 2020 SC10MMJ (main job) and  SC10SMJ (second job)
### 2021 and beyong is NSECMJ20 (main job) and SC20SMJ (second job)

view_df(jm21, show.id = FALSE)

## Needing further standardization 

###"FLED10", # Type of agreed work hours arrangement 
###"JB2T10", # way in which job was not permanent (agency, casua, seasonal, fixed contract, other)
###"LOOKM11", # Reasons for another job (respondent can add up to 3) (filter by ADDJOB = 1)
###"UNDY98", # you not looking for a job with longer hours or for an additional job (filter by UNDEMP = 1). Up to 9 options


# Standarising variable names across datasets

## Creating the variable "quarter", "PIWT" for income weight, YEAR, and PWT for population weighs among others

jm06 <- jm06 %>% mutate(year = 2006, quarter = 1, sequence = 1, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE4,
                        quali = HIQUAL5D)

aj06 <- aj06 %>% mutate(year = 2006, quarter = 2, sequence = 2, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE4,
                        quali = HIQUAL5D)

js06 <- js06 %>% mutate(year = 2006, quarter = 3, sequence = 3, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE4,
                        quali = HIQUAL5D)

od06 <- od06 %>% mutate(year = 2006, quarter = 4, sequence = 4, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE4,
                        quali = HIQUAL5D)

jm07 <- jm07 %>% mutate(year = 2007, quarter = 1, sequence = 5, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL5D)

aj07 <- aj07 %>% mutate(year = 2007, quarter = 2, sequence = 6, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL5D)

js07 <- js07 %>% mutate(year = 2007, quarter = 3, sequence = 7, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL5D)

od07 <- od07 %>% mutate(year = 2007, quarter = 4, sequence = 8, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL5D)

jm08 <- jm08 %>% mutate(year = 2008, quarter = 1, sequence = 9, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D)

aj08 <- aj08 %>% mutate(year = 2008, quarter = 2, sequence = 10, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D)

js08 <- js08 %>% mutate(year = 2008, quarter = 3, sequence = 11, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D)

od08 <- od08 %>% mutate(year = 2008, quarter = 4, sequence = 12, PIWT = PIWT14, PWT = PWT14, 
                        NSEC = NSECMMJ, 
                        ind1 = case_match(IN9207SM, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu1 = SC2KMMJ, 
                        ind2 = case_match(IN9207SS, "A"~1, "B"~2, "C"~3, "D"~4, "E"~5, "F"~6, "G"~7, "H"~8, "I"~9, "J"~10, "K"~11, "L"~12, "M"~13, "N"~14, "O"~15, "P"~16, "Q"~17, "R"~18, "S"~19, "T"~20, "U"~21), 
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D)

jm09 <- jm09 %>% mutate(year = 2009, quarter = 1, sequence = 13, PIWT = PIWT14, PWT = PWT14, NSEC = NSECMMJ, ind1 = INDS07M, occu1 = SC2KMMJ, ind2 = INDS07S, occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D)

aj09 <- aj09 %>% mutate(year = 2009, quarter = 2, sequence = 14, PIWT = PIWT14, PWT = PWT14, NSEC = NSECMMJ, ind1 = INDS07M, occu1 = SC2KMMJ, ind2 = INDS07S, occu2 = SC2KSMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D)

js09 <- js09 %>% mutate(year = 2009, quarter = 3, sequence = 15, PIWT = PIWT14, PWT = PWT14, NSEC = NSECMMJ, ind1 = INDS07M, occu1 = SC2KMMJ, ind2 = INDS07S, occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D)

od09 <- od09 %>% mutate(year = 2009, quarter = 4, sequence = 16, PIWT = PIWT14, PWT = PWT14, NSEC = NSECMMJ, 
                        ind1 = INDS07M, 
                        occu1 = SC2KMMJ, 
                        ind2 = NA, # error industry second job not found on data set
                        occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D)

jm10 <- jm10 %>% mutate(year = 2010, quarter = 1, sequence = 17, PIWT = PIWT14, PWT = PWT14, NSEC = NSECMMJ, ind1 = INDS07M, occu1 = SC2KMMJ, ind2 = INDS07S, occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D)

aj10 <- aj10 %>% mutate(year = 2010, quarter = 2, sequence = 18, PIWT = PIWT14, PWT = PWT14, NSEC = NSECMMJ, ind1 = INDS07M, occu1 = SC2KMMJ, ind2 = INDS07S, occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D)

js10 <- js10 %>% mutate(year = 2010, quarter = 3, sequence = 19, PIWT = PIWT14, PWT = PWT14, NSEC = NSECMMJ, ind1 = INDS07M, occu1 = SC2KMMJ, ind2 = INDS07S, occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D)

od10 <- od10 %>% mutate(year = 2010, quarter = 4, sequence = 20, PIWT = PIWT14, PWT = PWT14, NSEC = NSECMMJ, ind1 = INDS07M, occu1 = SC2KMMJ, ind2 = INDS07S, occu2 = SC2KSMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUAL8D) 

jm11 <- jm11 %>% mutate(year = 2011, quarter = 1, sequence = 21, PIWT = PIWT14, PWT = PWT14, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

aj11 <- aj11 %>% mutate(year = 2011, quarter = 2, sequence = 22, PIWT = PIWT14, PWT = PWT14, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

js11 <- js11 %>% mutate(year = 2011, quarter = 3, sequence = 23, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

od11 <- od11 %>% mutate(year = 2011, quarter = 4, sequence = 24, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

jm12 <- jm12 %>% mutate(year = 2012, quarter = 1, sequence = 25, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

aj12 <- aj12 %>% mutate(year = 2012, quarter = 2, sequence = 26, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

js12 <- js12 %>% mutate(year = 2012, quarter = 3, sequence = 27, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

od12 <- od12 %>% mutate(year = 2012, quarter = 4, sequence = 28, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

jm13 <- jm13 %>% mutate(year = 2013, quarter = 1, sequence = 29, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

aj13 <- aj13 %>% mutate(year = 2013, quarter = 2, sequence = 30, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

js13 <- js13 %>% mutate(year = 2013, quarter = 3, sequence = 31, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

od13 <- od13 %>% mutate(year = 2013, quarter = 4, sequence = 32, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

jm14 <- jm14 %>% mutate(year = 2014, quarter = 1, sequence = 33, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

aj14 <- aj14 %>% mutate(year = 2014, quarter = 3, sequence = 34, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

js14 <- js14 %>% mutate(year = 2014, quarter = 4, sequence = 35, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

od14 <- od14 %>% mutate(year = 2014, quarter = 4, sequence = 36, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL11D)

jm15 <- jm15 %>% mutate(year = 2015, quarter = 1, sequence = 37, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

aj15 <- aj15 %>% mutate(year = 2015, quarter = 2, sequence = 38, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

js15 <- js15 %>% mutate(year = 2015, quarter = 3, sequence = 39, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

od15 <- od15 %>% mutate(year = 2015, quarter = 4, sequence = 40, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

jm16 <- jm16 %>% mutate(year = 2016, quarter = 1, sequence = 41, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

aj16 <- aj16 %>% mutate(year = 2016, quarter = 2, sequence = 42, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

js16 <- js16 %>% mutate(year = 2016, quarter = 3, sequence = 43, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

od16 <- od16 %>% mutate(year = 2016, quarter = 4, sequence = 44, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

jm17 <- jm17 %>% mutate(year = 2017, quarter = 1, sequence = 45, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

aj17 <- aj17 %>% mutate(year = 2017, quarter = 2, sequence = 46, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

js17 <- js17 %>% mutate(year = 2017, quarter = 3, sequence = 47, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

od17 <- od17 %>% mutate(year = 2017, quarter = 4, sequence = 48, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

jm18 <- jm18 %>% mutate(year = 2018, quarter = 1, sequence = 49, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

aj18 <- aj18 %>% mutate(year = 2018, quarter = 2, sequence = 50, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

js18 <- js18 %>% mutate(year = 2018, quarter = 3, sequence = 51, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

od18 <- od18 %>% mutate(year = 2018, quarter = 4, sequence = 52, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

jm19 <- jm19 %>% mutate(year = 2019, quarter = 1, sequence = 53, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

aj19 <- aj19 %>% mutate(year = 2019, quarter = 2, sequence = 54, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

js19 <- js19 %>% mutate(year = 2019, quarter = 3, sequence = 55, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

od19 <- od19 %>% mutate(year = 2019, quarter = 4, sequence = 56, PIWT = PIWT18, PWT = PWT18, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

jm20 <- jm20 %>% mutate(year = 2020, quarter = 1, sequence = 57, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

aj20 <- aj20 %>% mutate(year = 2020, quarter = 2, sequence = 58, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

js20 <- js20 %>% mutate(year = 2020, quarter = 3, sequence = 59, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

od20 <- od20 %>% mutate(year = 2020, quarter = 4, sequence = 60, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ10, ind1 = INDS07M, occu1 = SC10MMJ, ind2 = INDS07S, occu2 = SC10SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

jm21 <- jm21 %>% mutate(year = 2021, quarter = 1, sequence = 61, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, ind1 = INDS07M, occu1 = SC20MMJ, ind2 = INDS07S, occu2 = SC20SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

aj21 <- aj21 %>% mutate(year = 2021, quarter = 2, sequence = 62, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, ind1 = INDS07M, occu1 = SC20MMJ, ind2 = INDS07S, occu2 = SC20SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

js21 <- js21 %>% mutate(year = 2021, quarter = 3, sequence = 63, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, ind1 = INDS07M, occu1 = SC20MMJ, ind2 = INDS07S, occu2 = SC20SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

od21 <- od21 %>% mutate(year = 2021, quarter = 4, sequence = 64, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, ind1 = INDS07M, occu1 = SC20MMJ, ind2 = INDS07S, occu2 = SC20SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL15D)

jm22 <- jm22 %>% mutate(year = 2022, quarter = 1, sequence = 65, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, ind1 = INDS07M, occu1 = SC20MMJ, ind2 = INDS07S, occu2 = SC20SMJ, 
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL22D)

aj22 <- aj22 %>% mutate(year = 2022, quarter = 2, sequence = 66, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, ind1 = INDS07M, occu1 = SC20MMJ, ind2 = INDS07S, occu2 = SC20SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL22D)

js22 <- js22 %>% mutate(year = 2022, quarter = 3, sequence = 67, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, ind1 = INDS07M, occu1 = SC20MMJ, ind2 = INDS07S, occu2 = SC20SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL22D)

od22 <- od22 %>% mutate(year = 2022, quarter = 4, sequence = 68, PIWT = PIWT22, PWT = PWT22, NSEC = NSECMJ20, ind1 = INDS07M, occu1 = SC20MMJ, ind2 = INDS07S, occu2 = SC20SMJ,
                        higher = HIGHO,
                        degree = DEGREE71,
                        quali = HIQUL22D)


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
        "SEX", # 1 male, 2 female
        "AGE", # number
        "NSEC", # occupational category 

        # MAIN JOB
        
        "STATR", # Employment status in main job (reported)
        "PUBLICR", # Whether working in public or private sector (reported)
        "ind1", # Industry section in main job 
        "occu1", # occupation in main job
        "REGWKR", # Region of place of work (reported)

        ## MAIN JOB - overall work arrangements
        
        ### full vs part time (complement with hours data)
        
        "FTPTWK", # Whether full or part time in main job (1 = full / 2 = part time)        
        "YPTJOB", # Reason for part time job (1 = Student / 2 = Ill or disable / 3 = could not find / 4 = did not want)

        ### work arrangements
        
        "JOBTYP", # Whether job permanent (1 = permanent / 2 = Not permanent in some way)
        "WHYTMP6", # Reason for the job to be temporary 

        # SECOND JOB
        
        "SECJOB", # Whether had second job in reference week
        "Y2JOB", # Whether had 2 jobs because of a change of job in reference week 
        "STAT2", # Employment status for those in regular second jobs
        "ind2", # Industry section in second job 
        "occu2", # occupation in second job
        
        ## SECOND JOB - overall work arrangements
        
        "JOBTYP2", # Whether job permanent (1 = permanent / 2 = Not permanent in some way)
       
        # HOURS
        
        ## overall 
        
        "SUMHRS", # Total hours worked in reference week in main and second jobs
        "VARYHR", # Whether weekly hours tend to vary
        
        ### Main job 
        "BUSHR", # Total usual hours excluding overtime (main job)" 
        "BACTHR", # Basic actual hours in main job (per week)- It does not include overtime (paid or unpaid).
        "TTACHR", # Total actual hours including overtime (main job)
        
        ### Second job
        
        "ACTHR2", # Actual hours in second job including overtime (filter by Y2Job=2)
        
        ### Main and second jobs
        
        "SUMHRS", # Total hours worked in reference week in main and second jobs

        # EARNINGS           
       
        "GRSSWK", # Gross weekly pay in main job
        "GRSSWK2", # Gross weekly pay in second job
        "HOURPAY", # Average gross hourly pay
        
        # SKILLS
        
        "higher", # higher degree
        "degree", # degrees
        "quali", # qualification
        
        ## Seeking for work
        "DIFJOB", # Whether looking for different or additional paid job or business
        "ADDJOB", # replace or add present job (filter DIFJOB =1)

        "PREFHR", # Preferred working hours in new job being looked for (filer by LOOKM11 =/= 5 or 6)
        
        # UNDER-EMPLOYMENT section on the LFS survey
        
        "UNDEMP", # Whether would like to work longer hours, at current basic rate of pay (filter by DIFJOB = 2)
        "UNDHRS", # Number of extra hours would like to work (filter by UNDEMP = 1)
        "UNDST", # Whether available to start working longer hours, or start a job with longer hours, within next two weeks
        
        "LESPAY2", # Whether prefer to work shorter hours than at present in current job
        "LESPAY3", # Whether would work shorter hours for less pay (LESPAY2 = 1).
        "OVHRS", # How many fewer hours would you like to work (LESPAY = 1 OR LESPAY3 = 1).
       
         # weights
        "PWT", # Person weight
        "PIWT" # Income weight 
        ) 

#### selecting the variables in all dataset and creating temporary datasets

t5 <- jm06 %>% select(all_of(variables))
t6 <- aj06 %>% select(all_of(variables))
t7 <- js06 %>% select(all_of(variables))
t8 <- od06 %>% select(all_of(variables))

t9  <- jm07 %>% select(all_of(variables)) 
t10 <- aj07 %>% select(all_of(variables))
t11 <- js07 %>% select(all_of(variables))
t12 <- od07 %>% select(all_of(variables))

t13 <- jm08 %>% select(all_of(variables))
t14 <- aj08 %>% select(all_of(variables))
t15 <- js08 %>% select(all_of(variables))
t16 <- od08 %>% select(all_of(variables))

t17 <- jm09 %>% select(all_of(variables))
t18 <- aj09 %>% select(all_of(variables))
t19 <- js09 %>% select(all_of(variables))
t20 <- od09 %>% select(all_of(variables))

t21 <- jm10 %>% select(all_of(variables)) 
t22 <- aj10 %>% select(all_of(variables))
t23 <- js10 %>% select(all_of(variables))
t24 <- od10 %>% select(all_of(variables))

t25 <- jm11 %>% select(all_of(variables))
t26 <- aj11 %>% select(all_of(variables))
t27 <- js11 %>% select(all_of(variables))
t28 <- od11 %>% select(all_of(variables))

t29 <- jm12 %>% select(all_of(variables))
t30 <- aj12 %>% select(all_of(variables))
t31 <- js12 %>% select(all_of(variables))
t32 <- od12 %>% select(all_of(variables))

t33 <- jm13 %>% select(all_of(variables)) 
t34 <- aj13 %>% select(all_of(variables))
t35 <- js13 %>% select(all_of(variables))
t36 <- od13 %>% select(all_of(variables))

t37 <- jm14 %>% select(all_of(variables))
t38 <- aj14 %>% select(all_of(variables))
t39 <- js14 %>% select(all_of(variables))
t40 <- od14 %>% select(all_of(variables))

t41 <- jm15 %>% select(all_of(variables))
t42 <- aj15 %>% select(all_of(variables))
t43 <- js15 %>% select(all_of(variables))
t44 <- od15 %>% select(all_of(variables))

t45 <- jm16 %>% select(all_of(variables))
t46 <- aj16 %>% select(all_of(variables))
t47 <- js16 %>% select(all_of(variables))
t48 <- od16 %>% select(all_of(variables))

t49 <- jm17 %>% select(all_of(variables))
t50 <- aj17 %>% select(all_of(variables))
t51 <- js17 %>% select(all_of(variables))
t52 <- od17 %>% select(all_of(variables))

t53 <- jm18 %>% select(all_of(variables))
t54 <- aj18 %>% select(all_of(variables))
t55 <- js18 %>% select(all_of(variables))
t56 <- od18 %>% select(all_of(variables))

t57 <- jm19 %>% select(all_of(variables))
t58 <- aj19 %>% select(all_of(variables))
t59 <- js19 %>% select(all_of(variables))
t60 <- od19 %>% select(all_of(variables))

t61 <- jm20 %>% select(all_of(variables)) 
t62 <- aj20 %>% select(all_of(variables))
t63 <- js20 %>% select(all_of(variables))
t64 <- od20 %>% select(all_of(variables))

t65 <- jm21 %>% select(all_of(variables))
t66 <- aj21 %>% select(all_of(variables))
t67 <- js21 %>% select(all_of(variables))
t68 <- od21 %>% select(all_of(variables))

t69 <- jm22 %>% select(all_of(variables))
t70 <- aj22 %>% select(all_of(variables))
t71 <- js22 %>% select(all_of(variables))
t72 <- od22 %>% select(all_of(variables))

#### combine all temporary datasets

LFS_combined <- rbind(t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15,
                 t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30,
                 t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45,
                 t46, t47, t48, t49, t50, t51, t52, t53, t54, t55, t56, t57, t58, t59, t60,
                 t61, t62, t63, t64, t65, t66, t67, t68, t69, t70, t71, t72) # combined database

save(LFS_combined, file = "data/LFS_combined.rda") # saving combine dataset in working directory

rm(list = ls()) # clean the global environment to save memory

######################### END COMBINING DATASETS ####################################