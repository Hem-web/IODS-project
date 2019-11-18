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

#4# Joining two data sets:
library(dplyr)
#Identifying the common columns in both data frame
# Define own id for both datasets

por_id <- por %>% mutate(id=1000+row_number()) 
math_id <- math %>% mutate(id=2000+row_number())

# Which columns vary in datasets
free_cols <- c("id","failures","paid","absences","G1","G2","G3")

# The rest of the columns are common identifiers used for joining the datasets
join_cols <- setdiff(colnames(por_id),free_cols)

pormath_free <- por_id %>% bind_rows(math_id) %>% select(one_of(free_cols))

# Combine datasets to one long data
pormath <- por_id %>% 
  bind_rows(math_id) %>%
  # Aggregate data (more joining variables than in the example)  
  group_by(.dots=join_cols) %>%  
  # Calculating required variables from two obs  
  summarise(                                                           
    n=n(),
    id.p=min(id),
    id.m=max(id),
    failures=round(mean(failures)),     #  Rounded mean for numerical
    paid=first(paid),                   #    and first for chars
    absences=round(mean(absences)),
    G1=round(mean(G1)),
    G2=round(mean(G2)),
    G3=round(mean(G3))    
  ) %>%
  # Remove lines that do not have exactly one obs from both datasets
  #   There must be exactly 2 observations found in order to joining be succesful
  #   In addition, 2 obs to be joined must be 1 from por and 1 from math
  #     (id:s differ more than max within one dataset (649 here))
  filter(n==2, id.m-id.p>650) %>%  
  # Join original free fields, because rounded means or first values may not be relevant
  inner_join(pormath_free,by=c("id.p"="id"),suffix=c("",".p")) %>%
  inner_join(pormath_free,by=c("id.m"="id"),suffix=c("",".m")) %>%
  # Calculate other required variables  
  ungroup %>% mutate(
    alc_use = (Dalc + Walc) / 2,
    high_use = alc_use > 2,
    cid=3000+row_number()
  )


# structure and dimension or glimpse of the combined data the data
str(pormath)
dim(pormath)
colnames(pormath)


# Setting Wroking directory
setwd("~/IODS-project")


#Save created data to folder 'data' as a comma seperated (CSV) file
library(csvread)
write.csv(alc,file="~/IODS-project/data/pormath.csv")
readtest <- read.table("~/IODS-project/data/pormath.csv")
readtest
#Save created data to folder 'data' as a Table/text
write.table(alc,file="~/IODS-project/data/pormath.txt")
readtest1 <- read.table("~/IODS-project/data/pormath.txt")
readtest1






