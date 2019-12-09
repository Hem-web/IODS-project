
# CHAPTER6: Analysis of longitudinal data
# DATA WRANGLING
#Author: Hem Raj Bhattarai

#Install/load the necessary packages
library(dplyr)
library(tidyr)
library(ggplot2)
#Load the data

setwd("~/IODS-project/data")
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep  ='\t', header = T)

# column names, dimensions, and strucutre of the data
names(BPRS) # column names
names(RATS)
dim(BPRS)
dim(RATS)
str(BPRS)
str(RATS)
summary(BPRS)
summary(RATS)

# About data and it's summary in brief:
#1. RATS data: This data is about rats growth rate. It contains the rats body weight recorded weekly (upto 9 weeks) from three different groups of rats feding on different diets.
#2. BPRS data: This data is about clinical trial where 40 male were randonmly assigned two different groups and and each subject was rated
# as bried brief psychiatric rating scale (BPRS) measured before treatment began (week 0) and then at weekly intervals for eight weeks

#Converting the categorical variables into factors
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
RATS$ID <- factor(RATS$ID )
RATS$Group <- factor(RATS$Group)
str(BPRS)
str(RATS)

#Changing data from wide to long format using gather() function: 
?gather #Check what gather can do
# Here all the weeks (0 to 8) columns were complied into one column and it is defined as "weeks" by using key command.
# Here, the values under the weeks are then compiled under "bprs" column matching to the correspoding variables.
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject) 
RATSL <-  RATS %>% gather(key = WD, value = Weight, -ID, -Group) 
str(BPRSL)
str(RATSL)

# Add variable week and Time to the data:
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)%>% mutate(week = as.integer(substr(weeks, 5, 5)))
RATSL <-  RATS %>% gather(key = WD, value = Weight, -ID, -Group)%>% mutate(Time = as.integer(substr(WD, 3, 4))) 
glimpse(BPRSL)
glimpse(RATSL)

#Understanding the necessity of long format compared to wide format 
# It is important to transform the data from wide to long format while dealing with repeated measurement becuase it keeps the measurement in single variable
# which is easier to manipulate, transform and validate.
# Brief summaries on variables:After changing both data set from wide to long format we have merged the variables so that it will be easy to run to analyse them.
#During this procedure, RATS data is constrained to two factors (ID and group) with one variable as "weight".
#Whereas in BPRS data,it is the same with two factors (treatment and subejct) with one variable as "bprs" value.


#saving the data as a Table/text
write.table(BPRSL,file="~/IODS-project/data/BPRSL.txt")
write.table(RATSL,file="~/IODS-project/data/RATSL.txt")

BPRSL <- read.table("~/IODS-project/data/BPRSL.txt")
RATSL <- read.table("~/IODS-project/data/RATSL.txt")


#Reading the data again 
dim(BPRSL)
dim(RATSL)
str(BPRSL)
str(RATSL)
head(BPRSL)
head(RATSL)





