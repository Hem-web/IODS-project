# 6.11.2019 
# read the data into memory
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# Look at the dimensions of the data
dim(lrn14)

# Look at the structure of the data
str(lrn14)
#print the "Attitude" colum vector  of the lrn14 data
lrn14$Attitude
#create column "attitude" by scaling te column "Attitude"
