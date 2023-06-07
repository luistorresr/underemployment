
###Load LFS clean database
load("data/LFS_clean.rda")

###Examining skills variables and labels

table(LFS_clean$quali)
attr(LFS_clean$quali, "labels")
table(LFS_clean$quali2)
attr(LFS_clean$quali2, "labels")
table(LFS_clean$degree)
attr(LFS_clean$degree, "labels")
table(LFS_clean$higher)
attr(LFS_clean$higher, "labels")

###Reviewing skills variables

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
  higher == 1 & degree %in% 1:6 & quali %in% 1:7 & quali2 %in% 0:6 ~ 1,
  #Masters
  higher == 2 & degree %in% 1:6 & quali %in% 1:7 & quali2 %in% 0:6 ~ 2,
  #PG Diploma
  higher %in% 3:4 & degree %in% 1:6 & quali %in% 1:7 & quali2 %in% 0:6 ~ 3,
  #DK HE
  higher == 5 & degree %in% 1:6 & quali %in% 1:7 & quali2 %in% 0:6 ~ 4,
  is.na(higher) & degree == 1 & quali %in% 1:7 & quali2 %in% 0:6 ~ 4,
  #First degree
  is.na(higher) & degree == 2 & quali %in% 1:7 & quali2 %in% 0:6 ~ 5,
  #Foundation degree
  is.na(higher) & degree == 3 & quali %in% 1:7 & quali2 %in% 0:6 ~ 6,
  #Graduate membership of a professional institution
  is.na(higher) & degree == 4 & quali %in% 1:7 & quali2 %in% 0:6 ~ 7,
  #Other degree
  is.na(higher) & degree == 5 & quali %in% 1:7 & quali2 %in% 0:6 ~ 8,
  #DK degree
  is.na(higher) & degree == 6 & quali %in% 1:7 & quali2 %in% 0:6 ~ 9,
  is.na(higher) & is.na(degree) & quali == 1 & quali2 %in% 0:6 ~ 9,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 4 ~ 9,
  #HE
  is.na(higher) & is.na(degree) & quali == 2 & quali2 %in% 0:6 ~ 10,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 5 ~ 10,
  # GCE, A-level or equivalent
  is.na(higher) & is.na(degree) & quali == 3 & quali2 %in% 0:6 ~ 11,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 3 ~ 11,
  # GCSE grades A*-C or equivalent
  is.na(higher) & is.na(degree) & quali == 4 & quali2 %in% 0:6 ~ 12,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 2 ~ 12,
  # Other qualification
  is.na(higher) & is.na(degree) & quali == 5 & quali2 %in% 0:6 ~ 13,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 6 ~ 13,
  #No qual
  is.na(higher) & is.na(degree) & quali == 6 & quali2 %in% 0:6 ~ 14,
  is.na(higher) & is.na(degree) & is.na(quali) & quali2 == 1 ~ 14,
  #DK qual
  is.na(higher) & is.na(degree) & quali == 7 & quali2 %in% 0:6 ~ 15,
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
