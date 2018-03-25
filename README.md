# Getting-and-cleaning-data-programming-assignment-Week-4
This repository is created for the peer review of programming assignment in Week 4 of the Coursera getting and cleaning data course

Peer-graded Assignment: Getting and Cleaning Data Course Project

This repo was created to finish the assignment for week 4 of Getting and Cleaning Data Coursera course.

First, download and unzip the data file into your R working directory.

Second, download the R source code into your R working directory.

Finally, execute R source code to generate tidy data file.

Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. 
The variable in the data Y indicates activity type the subjects performed during recording.

Code explanation
The code combined training dataset and test dataset, and extracted partial variables to create another dataset 
with the averages of each variable for each activity.

Derived new dataset
The new generated dataset contains variables calculated based on the mean and standard deviation. 
Each row of the dataset is an average of each activity type for all subjects.

Read training and test dataset into R environment. 
Read variable names into R envrionment. 
Read subject index into R environment.
Merge the training and the test sets to create one data set. 
Use command rbind to combine training and test set.
Extract only the measurements on the mean and standard deviation for each measurement. 
Use grep command to get column indexes for variable name contains "mean()" or "std()".
Uses descriptive activity names to name the activities in the data set.
Activity labels are converted to characters and add a new column as factor is added.
Appropriate labels with descriptive variable names are attached to variable columns.

From the data set in step 4 a second, independent tidy data set with the average of each variable for each activity and each subject 
is created by using the pipeline command to create a new tidy dataset with command group_by and summarize_each from dplyr package


