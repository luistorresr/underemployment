
# IMPORTING DATA

## UK LABOUR FORCE SURVEY

## This and the following scripts are based on the Labour Force Survey - all datasets from 2005 to 2022 (quarters only) 
# IMPORTANT: There is no need to run this script as the resulted database is made available for the analysis.
# To run this script, the UK LFS datasets (quarters only) from 2005 onwards are needed. They are available at https://ukdataservice.ac.uk

### Data files

#### UPDATE: population weights have been updated with 2020 weights from January 2020 (changed from the 11 November 2021) 

jm05 <- read_spss("") # January to March (wave 1)
aj05 <- read_spss("") # April to June (wave 2)
js05 <- read_spss("") # July to September (wave 3)
od05 <- read_spss("") # October to December (wave 4)

jm06 <- read_spss("") # January to March (wave 1)
aj06 <- read_spss("") # April to June (wave 2)
js06 <- read_spss("") # July to September (wave 3)
od06 <- read_spss("") # October to December (wave 4)

jm07 <- read_spss("") # January to March (wave 1)
aj07 <- read_spss("") # April to June (wave 2)
js07 <- read_spss("") # July to September (wave 3)
od07 <- read_spss("") # October to December (wave 4)

jm08 <- read_spss("") # January to March (wave 1)
aj08 <- read_spss("") # April to June (wave 2)
js08 <- read_spss("") # July to September (wave 3)
od08 <- read_spss("") # October to December (wave 4)

jm08 <- read_spss("") # January to March (wave 1)
aj09 <- read_spss("") # April to June (wave 2)
js09 <- read_spss("") # July to September (wave 3)
od09 <- read_spss("") # October to December (wave 4)

jm10 <- read_spss("") # January to March (wave 1)
aj10 <- read_spss("") # April to June (wave 2)
js10 <- read_spss("") # July to September (wave 3)
od10 <- read_spss("") # October to December (wave 4)

jm11 <- read_spss("") # January to March (wave 1)
aj11 <- read_spss("") # April to June (wave 2)
js11 <- read_spss("") # July to September (wave 3)
od11 <- read_spss("") # October to December (wave 4)

jm12 <- read_spss("") # January to March (wave 1)
aj12 <- read_spss("") # April to June (wave 2)
js12 <- read_spss("") # July to September (wave 3)
od12 <- read_spss("") # October to December (wave 4)

jm13 <- read_spss("") # January to March (wave 1)
aj13 <- read_spss("") # April to June (wave 2)
js13 <- read_spss("") # July to September (wave 3)
od13 <- read_spss("") # October to December (wave 4)

jm14 <- read_spss("") # January to March (wave 1)
aj14 <- read_spss("") # April to June (wave 2)
js14 <- read_spss("") # July to September (wave 3)
od14 <- read_spss("") # October to December (wave 4)

jm15 <- read_spss("") # January to March (wave 1)
aj15 <- read_spss("") # April to June (wave 2)
js15 <- read_spss("") # July to September (wave 3)
od15 <- read_spss("") # October to December (wave 4)

jm16 <- read_spss("") # January to March (wave 1)
aj16 <- read_spss("") # April to June (wave 2)
js16 <- read_spss("") # July to September (wave 3)
od16 <- read_spss("") # October to December (wave 4)

jm17 <- read_spss("") # January to March (wave 1)
aj17 <- read_spss("") # April to June (wave 2)
js17 <- read_spss("") # July to September (wave 3)
od17 <- read_spss("") # October to December (wave 4)

jm18 <- read_spss("") # January to March (wave 1)
aj18 <- read_spss("") # April to June (wave 2)
js18 <- read_spss("") # July to September (wave 3)
od18 <- read_spss("") # October to December (wave 4)

jm19 <- read_spss("") # January to March (wave 1)
aj19 <- read_spss("") # April to June (wave 2)
js19 <- read_spss("") # July to September (wave 3)
od19 <- read_spss("") # October to December (wave 4)

jm20 <- read_spss("") # January to March (wave 1)
aj20 <- read_spss("") # April to June (wave 2)
js20 <- read_spss("") # July to September (wave 3)
od20 <- read_spss("") # October to December (wave 4)

jm21 <- read_spss("") # January to March 2021 (wave 1)
aj21 <- read_spss("") # April to June 2021 (wave 2)
js21 <- read_spss("") # July to September (wave 3)
od21 <- read_spss("") # October to December (wave 4)

jm22 <- read_spss("") # January to March (wave 1)
aj22 <- read_spss("") # April to June (wave 2)
js22 <- read_spss("") # July to September (wave 3)

od22 <- read_spss("") # October to December (wave 4) - not yet available



#### Extracting labels and questions for inspection

# Labels

l_LFS19_JM <- get_labels(LFS19_JM, values = "n")
l_LFS19_AJ <- get_labels(LFS19_AJ, values = "n")
l_LFS19_JS <- get_labels(LFS19_JS, values = "n")
l_LFS19_OD <- get_labels(LFS19_OD, values = "n")

l_LFS20_JM <- get_labels(LFS20_JM, values = "n") #labels January to March (wave 1)
l_LFS20_FA <- get_labels(LFS20_FA, values = "n") #labels February to April (covid)
l_LFS20_MM <- get_labels(LFS20_MM, values = "n") #labels March to May (covid)
l_LFS20_AJ <- get_labels(LFS20_AJ, values = "n") #labels April to June (wave 2)
l_LFS20_MJ <- get_labels(LFS20_MJ, values = "n") #labels May to July (covid)
l_LFS20_JA <- get_labels(LFS20_JA, values = "n") #labels June to August (covid)
l_LFS20_JS <- get_labels(LFS20_JS, values = "n") #labels July to September (wave 3)
l_LFS20_AO <- get_labels(LFS20_AO, values = "n") #labels August to October (covid)
l_LFS20_SN <- get_labels(LFS20_SN, values = "n") #labels September to November (covid)
l_LFS20_OD <- get_labels(LFS20_OD, values = "n") #labels October to December (wave 4)

l_LFS21_NJ <- get_labels(LFS21_NJ, values = "n") #labels Nov 2020 to Jan 2021
l_LFS21_DF <- get_labels(LFS21_DF, values = "n") #labels Dec 2020 to Feb 2021
l_LFS21_JM <- get_labels(LFS21_JM, values = "n") #labels Jan to Mar 2021
l_LFS21_FA <- get_labels(LFS21_FA, values = "n") #labels Feb to Apr 2021

l_LFS21_MM <- get_labels(LFS21_MM, values = "n")
l_LFS21_AJ <- get_labels(LFS21_AJ, values = "n")
l_LFS21_MJ <- get_labels(LFS21_MJ, values = "n")
l_LFS21_JA <- get_labels(LFS21_JA, values = "n")


# Questions

q_LFS19_JM <- as.data.frame(label(LFS19_JM))
q_LFS19_AJ <- as.data.frame(label(LFS19_AJ))
q_LFS19_JS <- as.data.frame(label(LFS19_JS))
q_LFS19_OD <- as.data.frame(label(LFS19_OD))

q_LFS20_JM <- as.data.frame(label(LFS20_JM))
q_LFS20_FA <- as.data.frame(label(LFS20_FA))
q_LFS20_MM <- as.data.frame(label(LFS20_MM))
q_LFS20_AJ <- as.data.frame(label(LFS20_AJ))
q_LFS20_MJ <- as.data.frame(label(LFS20_MJ))
q_LFS20_JA <- as.data.frame(label(LFS20_JA))
q_LFS20_JS <- as.data.frame(label(LFS20_JS))
q_LFS20_AO <- as.data.frame(label(LFS20_AO))
q_LFS20_SN <- as.data.frame(label(LFS20_SN))
q_LFS20_OD <- as.data.frame(label(LFS20_OD))

q_LFS21_NJ <- as.data.frame(label(LFS21_NJ))
q_LFS21_DF <- as.data.frame(label(LFS21_DF))
q_LFS21_JM <- as.data.frame(label(LFS21_JM))
q_LFS21_FA <- as.data.frame(label(LFS21_FA))

q_LFS21_MM <- as.data.frame(label(LFS21_MM))
q_LFS21_AJ <- as.data.frame(label(LFS21_AJ))
q_LFS21_MJ <- as.data.frame(label(LFS21_MJ))
q_LFS21_JA <- as.data.frame(label(LFS21_JA))

        
######################## END IMPORTING DATA ####################################