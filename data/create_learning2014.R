# # Author: Hem Raj Bhattarai
#Date: 6.11.2019 
#Data Wrangling excersie where we will play with the given data frame by making changes (e.g. addition of new column) on it.

# reading the data and looking at it's dimensions (with function dim.) and structure (with function str.)
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
dim(lrn14)
str(lrn14)

#Comment on dimension and strucuture of the data
#There are 183 obervations (rows) with 60 variables (columns).
#All the data are intergers where gender is defined under two factors Male and female. Age is presented in years and points or
#score is ranged from 0 as minimum and 33 as maximum.

#print the "Attitude" colum vector  of the lrn14 data
lrn14$Attitude
#create column "attitude" by scaling te column "Attitude"


#installing the package
library(dplyr)
install.packages("dplyr")
# questions related to deep, surface and strategic learning

deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

#select the columns related to deep learning, surface learning and strategic learning

deep_columns <- lrn14 %>% select(one_of(deep_questions))
surface_columns <- lrn14 %>% select(one_of(surface_questions))
strategic_columns <- lrn14 %>% select(one_of(strategic_questions))

# Creating a analyses dataset with variables gender, age, attitude, deep, stra, surf and points

learning2014 <- lrn14 %>% mutate(attitude=Attitude/10, deep=rowMeans(deep_columns,na.rm=TRUE),
                                 surf=rowMeans(surface_columns,na.rm=TRUE), stra=rowMeans(strategic_columns,na.rm=TRUE)) %>% filter(Points!=0) %>% select(gender, age=Age, attitude, deep, stra, surf, points=Points)


# see the stucture of the new dataset
dim(learning2014)

# Setting Wroking directory
setwd("~/IODS-project")

#Save created data to folder 'data' as an Excel worksheet
library(openxlsx)
write.xlsx(learning2014,file="~/IODS-project/data/learning2014.xlsx")


#Save created data to folder 'data' as a comma seperated (CSV) file
library(csvread)
write.csv(learning2014,file="~/IODS-project/data/learning2014.csv")
readtest <- read.csv("~/IODS-project/data/learning2014.csv")
#checking the head and structure of the data saved in csv format
str(readtest)
head(readtest)
str(learning2014)
head(learning2014)

#This function helps to get the full data frame in the console window
options(max.print=9999999)
readtest

#Save created data to folder 'data' as a Table/text
write.table(learning2014,file="~/IODS-project/data/learning2014.txt")
readtest1 <- read.table("~/IODS-project/data/learning2014.txt")
readtest1
#checking the head and structure of the data saved in text format
str(readtest1)
head(readtest1)
str(learning2014)
head(learning2014)




