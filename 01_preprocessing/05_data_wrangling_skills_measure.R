
#Load LFS clean database
load("data/LFS_clean.rda")
load("C:/Users/destt/The University of Nottingham/Underemployment_quants - General/raw_datasets/LFS_clean/LFS_clean.rda")


#Examining skills variables labels

table(LFS_clean$quali)
attr(LFS_clean$quali, "labels")
table(LFS_clean$degree)
attr(LFS_clean$degree, "labels")
table(LFS_clean$higher)
attr(LFS_clean$higher, "labels")

#Matching skills levels

table(LFS_clean$quali, LFS_clean$degree)
table(LFS_clean$quali, LFS_clean$higher)
table(LFS_clean$higher, LFS_clean$degree)

#Creating unified skills variable

LFS_clean_skills <- LFS_clean %>% mutate(education = case_when(
  higher == 1 & degree == c(1|2|3|4|5|6) & quali == c(1|2|3|4|5|6|7) ~ 1,
  higher == 2 & degree == c(1|2|3|4|5|6) & quali == c(1|2|3|4|5|6|7) ~ 2,
  higher == 3 & degree == c(1|2|3|4|5|6) & quali == c(1|2|3|4|5|6|7) ~ 3,
  higher == 4 & degree == c(1|2|3|4|5|6) & quali == c(1|2|3|4|5|6|7) ~ 3,
  higher == 5 & degree == c(1|2|3|4|5|6) & quali == c(1|2|3|4|5|6|7) ~ 3,
  is.na(higher) & degree == 2 & quali == c(1|2|3|4|5|6|7) ~ 4,
  is.na(higher) & degree == 3 & quali == c(1|2|3|4|5|6|7) ~ 5,
  is.na(higher) & degree == 4 & quali == c(1|2|3|4|5|6|7) ~ 6,
  is.na(higher) & degree == 5 & quali == c(1|2|3|4|5|6|7) ~ 7,
  is.na(higher) & degree == 6 & quali == c(1|2|3|4|5|6|7) ~ 8,
  is.na(higher) & is.na(degree) & quali == 2 ~ 9,
  is.na(higher) & is.na(degree) & quali == 3 ~ 10,
  is.na(higher) & is.na(degree) & quali == 4 ~ 11,
  is.na(higher) & is.na(degree) & quali == 5 ~ 12,
  is.na(higher) & is.na(degree) & quali == 6 ~ 13,
  is.na(higher) & is.na(degree) & quali == 7 ~ 14,
  is.na(higher) & is.na(degree) & is.na(quali) ~ NA,
 ))



table(LFS_clean_skills$education)
LFS_clean_skills %>% select(education, quali, degree, higher) %>% 
  view()
view(LFS_clean_skills$education, LFS_clean_skills$quali, LFS_clean_skills$higher, LFS_clean_skills$degree)
count(LFS_clean_skills$education)