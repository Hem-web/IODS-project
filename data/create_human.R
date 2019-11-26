
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
names(gii)[7] <- "PSE/F"
names(gii)[8] <- "PSE/M"
names(gii)[9] <- "LFPR/F"
names(gii)[10] <- "LFPR/M"
