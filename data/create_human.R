
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
colnames(hd)
colnames(gii)


# Read the required package 
library(tidyr)
library(dplyr)


#changing the colnames of df data frame
colnames(hd) <- c("HDI.r", "country", "HDI", "life.expB", "expect.edu", "mean.edu", "GNI.capita", "GNIminusHDI")
colnames(gii) <- c("GII.r", "country", "gender.ineq", "MMR", "adols.BR", "parlimanet.percent", "secedu.F", "secedu.M", "labour.particip.F", "labour.particip.M")
colnames(hd)
colnames(gii)


#Mutate the “Gender inequality” data and create two new variables. 
#The first one should be the ratio of Female and Male populations with secondary education in each country. (i.e. edu2F / edu2M). 
#The second new variable should be the ratio of labour force participation of females and males in each country (i.e. labF / labM)
gii<- dplyr::mutate(gii, secedu.R = (secedu.F/secedu.M), labour.ratio = (labour.particip.F/labour.particip.M))
colnames (gii)
dim(gii)


# Joining the two data set
human<- inner_join(hd, gii, by = "country")
dim(human)
str(human)

#saving the data as a Table/text
write.table(human,file="~/IODS-project/data/human.txt")
human <- read.table("~/IODS-project/data/human.txt")

#Reading the data again 
str(human)
head(human)
dim(human)

