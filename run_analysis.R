Enter file contents here

url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file (url, "data_set.zip")
unzip ("data_set.zip")
unlink ("data_set.zip")
setwd(".//UCI HAR Dataset")


d_test_full <- read.table (".//test/x_test.txt")
d_test_y <- read.table (".//test/y_test.txt")
d_train <- read.table (".//train/x_train.txt")
d_train_y <- read.table (".//train/y_train.txt")


## reading activities into a and subjects 
a = read.table ("activity_labels.txt")
d_test_subject <- read.table (".//test/subject_test.txt")
d_train_subject <- read.table (".//train/subject_train.txt")
f = read.table ("features.txt")


## merging both data sets, test and train 
d_final_set = rbind (d_test_full, d_train)
d_final_y = rbind (d_test_y, d_train_y)
d_final_subject =rbind (d_test_subject, d_train_subject)

## finding variables in "features.txt" which contains std and mean

s = sort (c(grep ("mean", f$V2, ignore.case=TRUE), grep ("std", f$V2,ignore.case=TRUE)))

## extracting only those columns which correspond to those variables 

d_tidy <- d_final_set [,s]
names (d_tidy) = f[s,2]

## merging with Activities and Subjects, by adding 2 more columns 

d_tidy = cbind (d_tidy, "Activity"= d_final_y$V1)
d_tidy = cbind (d_tidy, "Subject"=d_final_subject$V1)


## replacing Activity number with Activity name 
d_tidy$Activity = a [d_tidy$Activity, 2]

## aggregating all variables for each Subject & Activity combination 
tidy = aggregate (d_tidy[, 1:86], by = list (Activity=d_tidy$Activity, Subject = d_tidy$Subject ), mean )


## write table to the file 
write.table (tidy, file = "TidySet.txt", row.names = FALSE)
