
# IMPORTING DATA

## IMPORTANT: There is no need to run this script as the resulted database is made available for the analysis.

## (1) UK LABOUR FORCE SURVEY

### This and the following scripts are based on the Labour Force Survey - all datasets from 2006 to 2022 (quarters only) 
### To run this script, the UK LFS datasets (quarters only) from 2006 onwards are needed. They are available at https://ukdataservice.ac.uk

### Data files

#### Temporarily set the working directory where the data files are located.

setwd("replace for your directory path")

jm06 <- read_spss("UKDA-5369-spss/spss/spss19/lfsp_jm06_end_user.sav") # January to March (wave 1)
aj06 <- read_spss("UKDA-5466-spss/spss/spss19/lfsp_aj06_end_user.sav") # April to June (wave 2)
js06 <- read_spss("UKDA-5547-spss/spss/spss19/lfsp_js06_end_user.sav") # July to September (wave 3)
od06 <- read_spss("UKDA-5609-spss/spss/spss19/lfsp_od06_end_user.sav") # October to December (wave 4)

jm07 <- read_spss("UKDA-5657-spss/spss/spss19/lfsp_jm07_end_user.sav") # January to March (wave 1)
aj07 <- read_spss("UKDA-5715-spss/spss/spss19/lfsp_aj07_end_user.sav") # April to June (wave 2)
js07 <- read_spss("UKDA-5763-spss/spss/spss19/lfsp_js07_end_user.sav") # July to September (wave 3)
od07 <- read_spss("UKDA-5796-spss/spss/spss19/lfsp_od07_end_user.sav") # October to December (wave 4)

jm08 <- read_spss("UKDA-5851-spss/spss/spss19/lfsp_jm08_end_user.sav") # January to March (wave 1)
aj08 <- read_spss("UKDA-6013-spss/spss/spss19/lfsp_aj08_end_user.sav") # April to June (wave 2)
js08 <- read_spss("UKDA-6074-spss/spss/spss19/lfsp_js08_end_user.sav") # July to September (wave 3)
od08 <- read_spss("UKDA-6119-spss/spss/spss19/lfsp_od08_end_user.sav") # October to December (wave 4)

jm09 <- read_spss("UKDA-6199-spss/spss/spss19/lfsp_jm09_end_user.sav") # January to March (wave 1)
aj09 <- read_spss("UKDA-6276-spss/spss/spss19/lfsp_aj09_end_user.sav") # April to June (wave 2)
js09 <- read_spss("UKDA-6334-spss/spss/spss19/lfsp_js09_end_user.sav") # July to September (wave 3)
od09 <- read_spss("UKDA-6404-spss/spss/spss19/lfsp_od09_end_user.sav") # October to December (wave 4)

jm10 <- read_spss("UKDA-6457-spss/spss/spss19/lfsp_jm10_end_user.sav") # January to March (wave 1)
aj10 <- read_spss("UKDA-6548-spss/spss/spss19/lfsp_aj10_end_user.sav") # April to June (wave 2)
js10 <- read_spss("UKDA-6632-spss/spss/spss19/lfsp_js10_end_user.sav") # July to September (wave 3)
od10 <- read_spss("UKDA-6715-spss/spss/spss19/lfsp_od10_end_user.sav") # October to December (wave 4)

jm11 <- read_spss("UKDA-6782-spss/spss/spss19/lfsp_jm11_end_user.sav") # January to March (wave 1)
aj11 <- read_spss("UKDA-6851-spss/spss/spss19/lfsp_aj11_end_user.sav") # April to June (wave 2)
js11 <- read_spss("UKDA-6906-spss/spss/spss24/lfsp_js11_end_user_pwt18.sav") # July to September (wave 3)
od11 <- read_spss("UKDA-6975-spss/spss/spss24/lfsp_od11_end_user_pwt18.sav") # October to December (wave 4)

jm12 <- read_spss("UKDA-7037-spss/spss/spss24/lfsp_jm12_end_user.sav") # January to March (wave 1)
aj12 <- read_spss("UKDA-7108-spss/spss/spss24/lfsp_aj12_end_user.sav") # April to June (wave 2)
js12 <- read_spss("UKDA-7174-spss/spss/spss24/lfsp_js12_end_user.sav") # July to September (wave 3)
od12 <- read_spss("UKDA-7220-spss/spss/spss24/lfsp_od12_end_user.sav") # October to December (wave 4)

jm13 <- read_spss("UKDA-7277-spss/spss/spss24/lfsp_jm13_end_user.sav") # January to March (wave 1)
aj13 <- read_spss("UKDA-7376-spss/spss/spss24/lfsp_aj13_end_user.sav") # April to June (wave 2)
js13 <- read_spss("UKDA-7452-spss/spss/spss24/lfsp_js13_end_user.sav") # July to September (wave 3)
od13 <- read_spss("UKDA-7468-spss/spss/spss24/lfsp_od13_end_user.sav") # October to December (wave 4)

jm14 <- read_spss("UKDA-7501-spss/spss/spss24/lfsp_jm14_end_user.sav") # January to March (wave 1)
aj14 <- read_spss("UKDA-7557-spss/spss/spss24/lfsp_aj14_end_user.sav") # April to June (wave 2)
js14 <- read_spss("UKDA-7570-spss/spss/spss25/lfsp_js14_eul_pwt18.sav") # July to September (wave 3)
od14 <- read_spss("UKDA-7664-spss/spss/spss24/lfsp_od14_eul.sav") # October to December (wave 4)

jm15 <- read_spss("UKDA-7725-spss/spss/spss24/lfsp_jm15_eul.sav") # January to March (wave 1)
aj15 <- read_spss("UKDA-7781-spss/spss/spss24/lfsp_aj15_eul.sav") # April to June (wave 2)
js15 <- read_spss("UKDA-7842-spss/spss/spss25/lfsp_js15_eul_pwt18.sav") # July to September (wave 3)
od15 <- read_spss("UKDA-7902-spss/spss/spss24/lfsp_od15_end_user.sav") # October to December (wave 4)

jm16 <- read_spss("UKDA-7985-spss/spss/spss25/lfsp_jm16_eul.sav") # January to March (wave 1)
aj16 <- read_spss("UKDA-8039-spss/spss/spss24/lfsp_aj16_eul.sav") # April to June (wave 2)
js16 <- read_spss("UKDA-8104-spss/spss/spss25/lfsp_js16_eul_pwt18.sav") # July to September (wave 3)
od16 <- read_spss("UKDA-8145-spss/spss/spss24/lfsp_od16_eul.sav") # October to December (wave 4)

jm17 <- read_spss("UKDA-8195-spss/spss/spss25/lfsp_jm17_eul.sav") # January to March (wave 1)
aj17 <- read_spss("UKDA-8235-spss/spss/spss24/lfsp_aj17_eul.sav") # April to June (wave 2)
js17 <- read_spss("UKDA-8292-spss/spss/spss25/lfsp_js17_eul_pwt18.sav") # July to September (wave 3)
od17 <- read_spss("UKDA-8326-spss/spss/spss24/lfsp_od17_eul.sav") # October to December (wave 4)

jm18 <- read_spss("UKDA-8343-spss/spss/spss25/lfsp_jm18_eul.sav") # January to March (wave 1)
aj18 <- read_spss("UKDA-8381-spss/spss/spss24/lfsp_aj18_eul.sav") # April to June (wave 2)
js18 <- read_spss("UKDA-8407-spss/spss/spss25/lfsp_js18_eul_pwt18.sav") # July to September (wave 3)
od18 <- read_spss("UKDA-8447-spss/spss/spss24/lfsp_od18_end_user_pwt18.sav") # October to December (wave 4)

jm19 <- read_spss("UKDA-8485-spss/spss/spss24/lfsp_jm19_eul_pwt18.sav") # January to March (wave 1)
aj19 <- read_spss("UKDA-8563-spss/spss/spss24/lfsp_aj19_eul_pwt18.sav") # April to June (wave 2)
js19 <- read_spss("UKDA-8588-spss/spss/spss25/lfsp_js19_eul_pwt18.sav") # July to September (wave 3)
od19 <- read_spss("UKDA-8614-spss/spss/spss25/lfsp_od19_eul.sav") # October to December (wave 4)

jm20 <- read_spss("UKDA-8639-spss/spss/spss25/lfsp_jm20_eul_pwt22.sav") # January to March (wave 1)
aj20 <- read_spss("UKDA-8671-spss/spss/spss25/lfsp_aj20_eul_pwt22.sav") # April to June (wave 2)
js20 <- read_spss("UKDA-8720-spss/spss/spss25/lfsp_js20_eul_pwt22.sav") # July to September (wave 3)
od20 <- read_spss("UKDA-8777-spss/spss/spss25/lfsp_od20_eul_pwt22.sav") # October to December (wave 4)

jm21 <- read_spss("UKDA-8806-spss/spss/spss25/lfsp_jm21_eul_pwt22.sav") # January to March 2021 (wave 1)
aj21 <- read_spss("UKDA-8826-spss/spss/spss25/lfsp_aj21_eul_pwt22.sav") # April to June 2021 (wave 2)
js21 <- read_spss("UKDA-8872-spss/spss/spss25/lfsp_js21_eul_pwt22.sav") # July to September (wave 3)
od21 <- read_spss("UKDA-8915-spss/spss/spss25/lfsp_od21_eul_pwt22.sav") # October to December (wave 4)

jm22 <- read_spss("UKDA-8957-spss/spss/spss25/lfsp_jm22_eul_pwt22.sav") # January to March (wave 1)
aj22 <- read_spss("UKDA-8999-spss/spss/spss25/lfsp_aj22_eul_pwt22.sav") # April to June (wave 2)
js22 <- read_spss("UKDA-9027-spss/spss/spss25/lfsp_js22_eul_pwt22.sav") # July to September (wave 3)

od22 <- read_spss("UKDA-9052-spss/spss/spss25/lfsp_od22_eul_pwt22.sav") # October to December (wave 4) 

## Set the working directory back to where your computer folder where you created the R-Studio project

setwd("replace for your directory path")

## Save imported databases

save(jm06,aj06,js06,od06,jm07,aj07,js07,od07,jm08,aj08,js08,od08,jm09,aj09,js09,od09,jm10,aj10,
     js10,od10,jm11,aj11,js11,od11,jm12,aj12,js12,od12,jm13,aj13,js13,od13,jm14,aj14,js14,od14,jm15,aj15,js15,od15,
     jm16,aj16,js16,od16,jm17,aj17,js17,od17,jm18,aj18,js18,od18,jm19,aj19,js19,od19,jm20,aj20,js20,od20,jm21,aj21,
     js21,od21,jm22,aj22,js22,od22, file = "data/LFS.rda")

##### delete data files to save memory

rm(jm06,aj06,js06,od06,jm07,aj07,js07,od07,jm08,aj08,js08,od08,jm09,aj09,js09,od09,jm10,aj10,
   js10,od10,jm11,aj11,js11,od11,jm12,aj12,js12,od12,jm13,aj13,js13,od13,jm14,aj14,js14,od14,jm15,aj15,js15,od15,
   jm16,aj16,js16,od16,jm17,aj17,js17,od17,jm18,aj18,js18,od18,jm19,aj19,js19,od19,jm20,aj20,js20,od20,jm21,aj21,
   js21,od21,jm22,aj22,js22,od22) 

######################## END IMPORTING DATA ####################################