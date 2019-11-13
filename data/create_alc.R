#Name:Hem Raj Bhattarai
#Date:13.11.2019
#Comment on file: The downloaded files are in comma seprated files. 

#Setting working directory
setwd("C:/Users/hemb/Documents/IODS-project/data")
getwd()

#reading the data
studentmat<-read.csv("student-mat.csv", header = TRUE)
studentpor<-read.csv("student-por.csv", header = TRUE)

#Looking into the data dimensions and strucutre
dim(studentmat)
dim(studentpor)
str(studentmat)
str(studentpor)

