UCI HAR Dataset Summarization - README.md 
Getting-and-Cleaning-Data
=========================

This repository is for programming project Getting and Cleaning Data
Module 3 course project description

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

 You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 

A R script has been created called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

The following steps were performed to create the final tidy dataset.
1. Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Extract data from .zip file to it's own directory UCI HAR Dataset.  Test data will be located in a sub-directory under UCI HAR Dataset called test.  Train data will be located in a sub-directory under UCI HAR Dataset called train.
3. Read the files in the test directory named X_test.txt, subject_test.txt, and y_test.txt into dataframes of the same names.
4. Combine the test dataframes into a single dataframe containing the observations and tests and subjects.  
5. Combine the train dataframes into a single dataframe containing the observations and tests and subjects.  
6. Create a new dataframe that merges the test and train dataframes into a single dataframe.
7. Modify the Activity names to be meaningful
8. Modify the variable names to be meaningful.
9. Subset the new dataframe to create a new dataframe that contains only the measures of mean and standard deviation for each measure.
10. Aggregate the data to calculate average values for each activity and subject
11. Create a final dataframe with the average of each variable for each activity and each subject and coerce the data to character class
12. Write the final resulting dataset to a file named "aggregate_run_analysis_data.txt".