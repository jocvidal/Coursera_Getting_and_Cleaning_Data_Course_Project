rm( list = ls() )

setwd("C:/Users/Dalvin/Desktop/Jose/COURSERA - DATA SCIENCE/data cleaning/week4/homework")
library(dplyr)

#Read the data
#---------------------------------------------
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
X_test  <- read.table("./UCI HAR Dataset/test/X_test.txt",   quote="\"", comment.char="")
y_test  <- read.table("./UCI HAR Dataset/test/y_test.txt",   quote="\"", comment.char="")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
subject_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt",   quote="\"", comment.char="")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
features <- read.table("./UCI HAR Dataset/features.txt", quote="", comment.char="")

#1.	Merges the training and the test sets to create one data set.
#----------------------------------------------------------------
X=rbind(X_test,X_train)
y=rbind(y_test,y_train)
names(X)<-features[,2]
X$subject=c(subject_test[,1], subject_train[,1])
X$activity <- as.character(y)

rm("X_test","X_train","y_test","y_train")

# 2.	Extracts only the measurements on the mean and standard deviation for each measurement.
#----------------------------------------------------------------
a<-grep( "mean\\(\\)" ,names(X) , value = TRUE)  #\\( to denote (
b<-grep( "std\\(\\)"  ,names(X) , value = TRUE)  #\\( to denote (
c<-c(a,b,"subject", "activity")
X<-X[,c]

# 3.	Uses descriptive activity names to name the activities in the data set
#---------------------------------------------------------------
y_fact<-factor(y[,1])
levels(y_fact)<-activity_labels[,2]
X$activity <- y_fact

# 4.	Appropriately labels the data set with descriptive variable names.
#---------------------------------------------------------------
a=gsub("mean\\(\\)", "Mean", names(X))
a=gsub("std\\(\\)", "Std", a)
a=gsub("\\-", "", a)

names(X)<- a

# 5.	From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
#---------------------------------------------------------------
result <- X %>% group_by( subject,activity  ) %>% summarise_each( funs(mean) )
write.table(result, file = "tidy_data.txt", sep = ",", row.name=FALSE)
