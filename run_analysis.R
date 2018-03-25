#### Coursera Getting and cleaning data Week 4 - peer grades assignment


#### data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#### description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  


### create one R script called run_analysis.R that does the following. 
# I)   Merges the training and the test sets to create one data set.
# II)  Extracts only the measurements on the mean and standard deviation for each measurement. 
# III) Uses descriptive activity names to name the activities in the data set
# IV)  Appropriately labels the data set with descriptive variable names. 
# V)   From the data set in step 4, creates a second, 
#              independent tidy data set with the average of each variable for each activity and each subject.


# 0) clean worksapce, set environment and add needed packages
ls()  #list files
rm(list= ls()) #removes evrything

setwd("    YOUR WORKING DIRECTORY ")

library(data.table)
library(dplyr)
library(tidyr)
library(utils)
library(readr)


# I) READ and merges the training and test data  sets to create one dataset
features <- read.table("features.txt", header= FALSE, stringsAsFactors = FALSE) 
activity <- read.table("activity_labels.txt", header= FALSE) 

# test data
test_X <-  read.table("test/X_test.txt") 
testLabels <- read.table("test/Y_test.txt") 
testSubject <- read.table("test/subject_test.txt") 

# training data
train_X <-  read.table("train/X_train.txt") 
trainLabels <- read.table("train/Y_train.txt") 
trainSubject <- read.table("train/subject_train.txt") 

# create a tidy data set
# merge data set using CBIND columns and RBIND for rows, subjects as factors, remove duplicates - if any, 
test <- cbind(testSubject, testLabels, test_X)
train <- cbind(trainSubject, trainLabels,train_X)

combined <- rbind(test, train)

colnames(combined) <- c("subject", "activity", features$V2)

combinedSubject <- as.factor(combined$subject)

# all dataset
all <- combined[, !duplicated(colnames(combined))]


# II)  Extracts only the measurements on the mean and standard deviation for each measurement
extract <- select(all, subject, activity, contains("mean"), contains("std"))


# III) Uses descriptive activity names to name the activities in the data set
activities <- mutate(activity, activity= tolower(V2))
all$activity[all$activity == 1] <- activities[1,3]
all$activity[all$activity == 2] <- activities[2,3]
all$activity[all$activity == 3] <- activities[3,3]
all$activity[all$activity == 4] <- activities[4,3]
all$activity[all$activity == 5] <- activities[5,3]
all$activity[all$activity == 6] <- activities[6,3]


# IV)  Appropriately labels the data set with descriptive variable names
names(all) <- gsub("^t"   , "time"        , names(all))
names(all) <- gsub("^f"   , "frequency"   , names(all))
names(all) <- gsub("^Acc" , "acceleration", names(all))
names(all) <- gsub("^Mag" , "magnitude"   , names(all))
names(all) <- gsub("^Gyro", "gyroscope"   , names(all))


#  V) From the data set in step 4, creates a second, independent tidy data set with the 
#      average of each variable for each activity and each subject.

all_mean <- all %>% 
    group_by(activity, subject) %>% 
    summarize_each(funs(mean))