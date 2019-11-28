
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
library(GGally)



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
summary(human)

# Exploring the data
 ##The human data is the part of a big data produced by "United Nations Development Programme". 
 ##This data is combination of two difference human development indices called, "Human Development Index (HDI)" and "Gender Inequality Index (GNI)"
 ##This data contains 195 observations in 19 different variables. 
 ##HDI accounts long and healthy lives (life.exB), Knowledge (expect.edu and mean.edu), and a decent standard living (GNI.capita) as three dimesnions.
 ##GII accounts health (MMR and adols.BR), empowerment (secedu.F and secedu.M), and labor market (labour.particip.F and labour.particip.M)as three dimesnions.
 ## In addition, the data also conatins, HDI itself, HDI and GII ratios, and also the newly formulated variables secedu.R (ratio of secedu2F tosecedu2M) and labour ratio (ratio of labour.particip.F to labour.particip.M)

#Transforming GNI varibles
library(stringr)
human$GNI.capita
str(human$GNI.capita) #looking into the GNI per capita (GNI.capita) column
human$GNI.capita<-str_replace(human$GNI.capita, pattern=",", replace ="") %>% as.numeric()  
str(human$GNI.capita)

#Excluding unwanted variables (or selecting those what we will need) from human data and naming it with  "human1".
human<-dplyr::select(human, country, secedu.R,labour.ratio, expect.edu, life.expB, GNI.capita, MMR, adols.BR, parlimanet.percent) 
str(human)

#Removing all rows with missing values
#In R, NA stands for not available, which means that the data point is missing. 
  #If a variable you wish to analyse contains missing values, there are usually two main options:
  #1.Remove the observations with missing values
  #2.Replace the missing values with actual values using an imputation technique.

complete.cases(human) # finding the completeness of the data. This will identify the NA values in the data frame.
data.frame(human[-1], comp = complete.cases(human)) # comp function is define to select only "TRUE" data
human <- filter(human, complete.cases(human)) #Here we filter the all The NA data and give the new name "human2". 
complete.cases(human) # All the data except last 7 row seems to be still "FALSE". So lets delete them.
dim(human)

#Excluding the observation related to the regions.
tail(human) #with tail function we can see last 10 observations of the human data.
last <- nrow(human) - 7 # define the last indice which we want to keep
human <- human[1:last, ] # choose everything until the last 7 observations. So leave empty after comma
colnames(human)

#Giving the row names as a countries name and deleting the country name coumn from the data.
rownames(human) <- human$country # add countries as rownames
human<- select(human, -country)
human<-dplyr::select(human, secedu.R, labour.ratio,expect.edu,life.expB, GNI.capita, MMR, adols.BR, parlimanet.percent)
dim(human)
rownames(human)
colnames(human)

#saving the data as a Table/text
write.table(human,file="~/IODS-project/data/human.txt")
human <- read.table("~/IODS-project/data/human.txt")

#Reading the data again 
str(human)
head(human)
dim(human)
summary(human)

