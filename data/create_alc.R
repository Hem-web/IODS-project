#Name:Hem Raj Bhattarai
#Date:13.11.2019
#Comment on file: The downloaded files are as comma seprated files. 

#Setting working directory
setwd("C:/Users/hemb/Documents/IODS-project/data")
getwd()


##reading the data
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
#In both data sets there are 33 variables which were accounted to evaluate the performance of students 
# on two subjects, mathematics and portugese language in two different portugese schools. There were
#395 observations on  those variables for mathematics and 649 observations for portugese language.


#installing package

library(dplyr)

#4# Joining two data sets:
#Identifying the common columns in both data frame
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

# join the two datasets by the selected identifiers
math_por <- inner_join(math, por, by = join_by)
colnames(math_por)

# structure and dimension or glimpse of the combined data the data
str(math_por)
dim(math_por)
colnames(math_por)


## Joining the duplicated answers by using if-else function
alc <- math_por %>% select(one_of(join_by))
colnames(alc)

for(column_name in notjoined_columns) {
  # select two columns from 'math_por' with the same original name
  two_columns <- select(math_por, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    alc[column_name] <- first_column}}


## Data mutation
 library(ggplot2)

# This function is creating a new column name "alc_use" by averaging daily and weekly alchol consumption
# and also creating a logical column "high_use" be defining use of alchol or "alc_use" which is greater than 2.
alc <- alc %>% mutate (alc_use = (Dalc+Walc)/2, high_use = (alc_use > 2))
colnames(alc)
glimpse (alc)

# For bar graphs visulaization of alcohol use by sex
g1 <- ggplot(data = alc, aes(x = alc_use))
g1 + geom_bar()
g1 + geom_bar()+ facet_wrap("sex")

# Setting Wroking directory
setwd("~/IODS-project")


#Save created data to folder 'data' as a comma seperated (CSV) file
library(csvread)
write.csv(alc,file="~/IODS-project/data/alc.csv")
readtest <- read.table("~/IODS-project/data/alc.csv")
readtest
#Save created data to folder 'data' as a Table/text
write.table(alc,file="~/IODS-project/data/alc.txt")
readtest1 <- read.table("~/IODS-project/data/alc.txt")
readtest1







