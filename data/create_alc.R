#Name:Hem Raj Bhattarai
#Date:13.11.2019
#Comment on file: The downloaded files are as comma seprated files. 

#Setting working directory
setwd("C:/Users/hemb/Documents/IODS-project/data")
getwd()

#reading the data
math<-read.table("student-mat.csv", sep = ";", header = TRUE)
por<-read.table("student-por.csv", sep = ";", header = TRUE)

#Looking into the data dimensions and strucutre
dim(math)
dim(por)
str(math)
str(por)
colnames(math)
colnames(por)

#Comment on the data dimensions and structures: 

#installing package

library(dplyr)

# common columns to use as identifiers
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

# join the two datasets by the selected identifiers
math_por <- inner_join(math, por, by = "school")

# see the new column names
colnames(math_por)

# glimpse at the data
glimpse(math_por)


