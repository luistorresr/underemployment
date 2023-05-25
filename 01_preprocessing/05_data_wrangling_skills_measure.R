
###Load LFS clean database
load("data/LFS_clean.rda")

###Examining skills variables and labels

table(LFS_clean$quali)
attr(LFS_clean$quali, "labels")
table(LFS_clean$degree)
attr(LFS_clean$degree, "labels")
table(LFS_clean$higher)
attr(LFS_clean$higher, "labels")

###Reviewing skills levels

table(LFS_clean$quali, LFS_clean$degree)
table(LFS_clean$quali, LFS_clean$higher)
table(LFS_clean$higher, LFS_clean$degree)
table(LFS_clean$quali, LFS_clean$quali2)

###Creating and labeling unified skills variable

LFS_clean <- LFS_clean %>% mutate(education = case_when(
  #Doctorate
  higher == 1 & degree == 1 & quali == 1 ~ 1,
  higher == 1 & degree == 2 & quali == 1 ~ 1,
  higher == 1 & degree == 3 & quali == 1 ~ 1,
  higher == 1 & degree == 4 & quali == 1 ~ 1,
  higher == 1 & degree == 5 & quali == 1 ~ 1,
  #Masters
  higher == 2 & degree == 1 & quali == 1 ~ 2,
  higher == 2 & degree == 2 & quali == 1 ~ 2,
  higher == 2 & degree == 3 & quali == 1 ~ 2,
  higher == 2 & degree == 4 & quali == 1 ~ 2,
  higher == 2 & degree == 5 & quali == 1 ~ 2,
  higher == 2 & degree == 1 & quali == 3 ~ 2,
  #PG Certificate
  higher == 3 & degree == 1 & quali == 1 ~ 3,
  higher == 3 & degree == 2 & quali == 1 ~ 3,
  higher == 3 & degree == 3 & quali == 1 ~ 3,
  higher == 3 & degree == 4 & quali == 1 ~ 3,
  higher == 3 & degree == 5 & quali == 1 ~ 3,
  higher == 3 & degree == 1 & quali == 2 ~ 3,
  higher == 3 & degree == 1 & quali == 3 ~ 3,
  higher == 4 & degree == 1 & quali == 1 ~ 3,
  higher == 4 & degree == 2 & quali == 1 ~ 3,
  higher == 4 & degree == 3 & quali == 1 ~ 3,
  higher == 4 & degree == 4 & quali == 1 ~ 3,
  higher == 4 & degree == 5 & quali == 1 ~ 3,
  higher == 4 & degree == 1 & quali == 3 ~ 3,
  #DK HE
  higher == 5 & degree == 1 & quali == 1 ~ 4,
  higher == 5 & degree == 2 & quali == 1 ~ 4,
  higher == 5 & degree == 3 & quali == 1 ~ 4,
  higher == 5 & degree == 4 & quali == 1 ~ 4,
  higher == 5 & degree == 5 & quali == 1 ~ 4,
  is.na(higher) & degree == 1 & quali == 1 ~ 4,
  is.na(higher) & degree == 1 & quali == 2 ~ 4,
  is.na(higher) & degree == 1 & quali == 4 ~ 4,
  is.na(higher) & degree == 1 & quali == 3 ~ 4,
  is.na(higher) & degree == 1 & quali == 5 ~ 4,
  is.na(higher) & degree == 1 & quali == 6 ~ 4,
  is.na(higher) & degree == 1 & quali == 7 ~ 4,
  #First degree
  is.na(higher) & degree == 2 & quali == 1 ~ 5,
  is.na(higher) & degree == 2 & quali == 2 ~ 5,
  is.na(higher) & degree == 2 & quali == 4 ~ 5,
  is.na(higher) & degree == 2 & quali == 3 ~ 5,
  is.na(higher) & degree == 2 & quali == 5 ~ 5,
  is.na(higher) & degree == 2 & quali == 6 ~ 5,
  is.na(higher) & degree == 2 & quali == 7 ~ 5,
  #Foundation degree
  is.na(higher) & degree == 3 & quali == 1 ~ 6,
  is.na(higher) & degree == 3 & quali == 2 ~ 6,
  is.na(higher) & degree == 3 & quali == 4 ~ 6,
  is.na(higher) & degree == 3 & quali == 3 ~ 6,
  is.na(higher) & degree == 3 & quali == 5 ~ 6,
  is.na(higher) & degree == 3 & quali == 6 ~ 6,
  is.na(higher) & degree == 3 & quali == 7 ~ 6,
  #Graduate membership of a professional institution
  is.na(higher) & degree == 4 & quali == 1 ~ 7,
  is.na(higher) & degree == 4 & quali == 2 ~ 7,
  is.na(higher) & degree == 4 & quali == 4 ~ 7,
  is.na(higher) & degree == 4 & quali == 3 ~ 7,
  is.na(higher) & degree == 4 & quali == 5 ~ 7,
  is.na(higher) & degree == 4 & quali == 6 ~ 7,
  is.na(higher) & degree == 4 & quali == 7 ~ 7,
  #Other degree
  is.na(higher) & degree == 5 & quali == 1 ~ 8,
  is.na(higher) & degree == 5 & quali == 2 ~ 8,
  is.na(higher) & degree == 5 & quali == 4 ~ 8,
  is.na(higher) & degree == 5 & quali == 3 ~ 8,
  is.na(higher) & degree == 5 & quali == 5 ~ 8,
  is.na(higher) & degree == 5 & quali == 6 ~ 8,
  is.na(higher) & degree == 5 & quali == 7 ~ 8,
  #DK degree
  is.na(higher) & degree == 6 & quali == 1 ~ 9,
  is.na(higher) & degree == 6 & quali == 2 ~ 9,
  is.na(higher) & degree == 6 & quali == 4 ~ 9,
  is.na(higher) & degree == 6 & quali == 3 ~ 9,
  is.na(higher) & degree == 6 & quali == 5 ~ 9,
  is.na(higher) & degree == 6 & quali == 6 ~ 9,
  is.na(higher) & degree == 6 & quali == 7 ~ 9,
  is.na(higher) & is.na(degree) & quali == 1 ~ 9,
  #HE
  is.na(higher) & is.na(degree) & quali == 2 ~ 10,
  #GCE, A-level or equivalent 
  is.na(higher) & is.na(degree) & quali == 3 ~ 11,
  #GCSE grades A*-C or equivalent 
  is.na(higher) & is.na(degree) & quali == 4 ~ 12,
  #Other qual 
  is.na(higher) & is.na(degree) & quali == 5 ~ 13,
  #No qual
  is.na(higher) & is.na(degree) & quali == 6 ~ 14,
  #DK qual
  is.na(higher) & is.na(degree) & quali == 7 ~ 15,
  #NA
  is.na(higher) & is.na(degree) & is.na(quali) ~ NA,
))

LFS_clean$education <- set_labels(LFS_clean$education, labels = c("Doctorate","Masters","PG Certificate","Don't know higher degree",
                                                                            "First degree","Foundation degree", "Graduate membership of a professional institution","Other degree","Don't know degree",
                                                                            "Higher education", "GCE, A-level or equivalent","GCSE grades A*-C or equivalent","Other qualification","No qualification","Don't know qualification")) 
 
table(LFS_clean$education)

###Clustering skills levels



###Matching skills with occupations levels

### saving the clean dataset

save(LFS_clean, file = "./data/LFS_clean.rda")

rm(list = ls()) # clean the global environment

