
#read the data

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#Exploring the strucutre and dimensions of the data
dim(hd)
dim(gii)
str(hd)
str(gii)
summary(hd)
summary(gii)

# Giving the new names to the colums 
library(tidyverse)
#changing the colnames of df data frame
names(hd)[1] <- "HDIR"
names(hd)[2] <- "C"
names(hd)[3] <- "HDI"
names(hd)[4] <- "LEB"
names(hd)[5] <- "EYE"
names(hd)[6] <- "MYE"
names(hd)[7] <- "GNI"
names(hd)[8] <- "GNI/HDI"
#chnánging the colmun names of gii data frame
names(gii)[1] <- "GIIR"
names(gii)[2] <- "C"
names(gii)[3] <- "GII"
names(gii)[4] <- "MMR"
names(gii)[5] <- "ABR"
names(gii)[6] <- "PRP"
names(gii)[7] <- "PSE_F"
names(gii)[8] <- "PSE_M"
names(gii)[9] <- "LFPR_F"
names(gii)[10] <- "LFPR_M"

#Mutate the “Gender inequality” data and create two new variables. 
#The first one should be the ratio of Female and Male populations with secondary education in each country. (i.e. edu2F / edu2M). 
#The second new variable should be the ratio of labour force participation of females and males in each country (i.e. labF / labM)
library(tidyverse)
library(dplyr)
gii1<-gii %>% mutate(edu2F/edu2M = (PSE_F)/(PSE_M), na.rm = TRUE, labF/labM = (LFPR_F)/(LFPR_M), na.rm = TRUE)

# Joining the two data set
human<- inner_join(hd, gii, by = "C")
dim(human)
str(human)
