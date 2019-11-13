#Name:Hem Raj Bhattarai
#Date:13.11.2019
#Comment on file: The downloaded files are as comma seprated files. 

#Setting working directory
setwd("C:/Users/hemb/Documents/IODS-project/data")
getwd()

#reading the data
studentmat<-read.table("student-mat.csv", sep = ";", header = TRUE)
studentpor<-read.table("student-por.csv", sep = ";", header = TRUE)

#Looking into the data dimensions and strucutre
dim(studentmat)
dim(studentpor)
str(studentmat)
str(studentpor)
colnames(studentmat)
colnames(studentpor)

#Comment on the data dimensions and structures: 

#installing package
library(rlang)
library(dplyr)

