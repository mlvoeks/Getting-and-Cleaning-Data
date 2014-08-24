# ## run_analysis.R
# The purpose of this script is to do the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## read features to obtain the x_test and x_train column headers
features <- (read.table("./getting and cleansing data/UCI HAR Dataset/features.txt", header = FALSE, sep = " "))
## subset features to just use the 2nd column  that has the column names
features <- features[,2]
## transpose the column of names into a row of names so it can be used with the x_test and x_train datasets
features <- t(features)
# create subject_test dataframe from read subject_test and add column name 'subject' to the dataframe
subject_test <- as.data.frame(read.table("./getting and cleansing data/UCI HAR Dataset/test/subject_test.txt", header = FALSE,
                           col.names = "subject"))
# create x_test dataframe from read x_test and add column names from features to the dataframe
x_test <- as.data.frame(read.table("./getting and cleansing data/UCI HAR Dataset/test/x_test.txt", header = FALSE, 
                            col.names = features))
# create y_test dataframe from read y_test and add column name 'activity' to the dataframe
y_test <- as.data.frame(read.table("./getting and cleansing data/UCI HAR Dataset/test/y_test.txt", header = FALSE,
                            col.names = "activity"))
# create subject_train dataframe from read subject_train and add column name 'subject' to the dataframe
subject_train <- as.data.frame(read.table("./getting and cleansing data/UCI HAR Dataset/train/subject_train.txt", header = FALSE, 
                            col.names = "subject"))
# create x_train dataframe from read x_train and add column names from features to the dataframe
x_train <- as.data.frame(read.table("./getting and cleansing data/UCI HAR Dataset/train/x_train.txt", header = FALSE,
                      col.names = features))
# create y_train dataframe from read y_train and add column name 'activity' to the dataframe
y_train <- as.data.frame(read.table("./getting and cleansing data/UCI HAR Dataset/train/y_train.txt", header = FALSE,
                      col.names = "activity"))
# add the activity column to the x_test data
x_test_y_test <- cbind(y_test, x_test)
# add the activity column to the x_train data
x_train_y_train <- cbind(y_train, x_train)
# add the subject column to the x_train data
x_train_y_train_subject <- cbind(subject_train, x_train_y_train)
# add the subject column to the x_test data
x_test_y_test_subject <- cbind(subject_test, x_test_y_test)
# make vector of column numbers to select from test and train datasets
myvar <- c(1, 2, 3, 4, 5, 6, 7,	8, 43, 44, 45, 46, 47, 48, 83, 84, 85, 86, 87, 88, 123, 124, 125, 126, 127,	128, 163, 164, 165,	166, 167, 168,
           203,	204, 216, 217, 229, 230, 242, 243, 255, 256, 268, 269, 270, 271, 272, 273, 347, 348, 349, 350, 351, 352, 426, 427, 428, 429,
           430, 431, 505, 506, 518, 519, 531, 532, 544, 545)
# make condensed dataframes using myvar to select appropriate columns
x_test_condensed <-  as.data.frame(x_test_y_test_subject[,myvar])
x_train_condensed <- as.data.frame(x_train_y_train_subject[,myvar])
# make combined dataframe from condensed test and train dataframes
x_combined_condensed <- as.data.frame(rbind(x_test_condensed, x_train_condensed))
# trasnform activity numbers meaningful lables
x_combined_condensed$activity[x_combined_condensed$activity==1] <- "WALKING"
x_combined_condensed$activity[x_combined_condensed$activity==2] <- "WALKING UPSTAIRS"
x_combined_condensed$activity[x_combined_condensed$activity==3] <- "WALKING DOWNSTAIRS"
x_combined_condensed$activity[x_combined_condensed$activity==4] <- "SITTING"
x_combined_condensed$activity[x_combined_condensed$activity==5] <- "STANDING"
x_combined_condensed$activity[x_combined_condensed$activity==6] <- "LAYING"
# trasnform column names to meaningful lables
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAcc.mean...X"] <- "Average X axis body accel mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAcc.mean...Y"] <- "Average Y axis body accel mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAcc.mean...Z"] <- "Average Z axis body accel mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAcc.std...X"] <- "Average X axis body accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAcc.std...Y"] <- "Average Y axis body accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAcc.std...Z"] <- "Average Z axis body accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tGravityAcc.mean...X"] <- "Average X axis gravity accel mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tGravityAcc.mean...Y"] <- "Average Y axis gravity accel mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tGravityAcc.mean...Z"] <- "Average Z axis gravity accel mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tGravityAcc.std...X"] <- "Average X axis gravity accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tGravityAcc.std...Y"] <- "Average Y axis gravity accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tGravityAcc.std...Z"] <- "Average Z axis gravity accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAccJerk.mean...X"] <- "Average X axis body accel jerk mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAccJerk.mean...Y"] <- "Average Y axis body accel jerk mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAccJerk.mean...Z"] <- "Average Z axis body accel jerk mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAccJerk.std...X"] <- "Average X axis body accel jerk std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAccJerk.std...Y"] <- "Average Y axis body accel std jerk dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAccJerk.std...Z"] <- "Average Z axis body accel jerk std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyro.mean...X"] <- "Average X axis body gyro mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyro.mean...Y"] <- "Average Y axis body gyro mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyro.mean...Z"] <- "Average Z axis body gyro mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyro.std...X"] <- "Average X axis body gyro std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyro.std...Y"] <- "Average Y axis body gyro std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyro.std...Z"] <- "Average Z axis body gyro std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyroJerk.mean...X"] <- "Average X axis body gyro jerk mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyroJerk.mean...Y"] <- "Average Y axis body gyro jerk mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyroJerk.mean...Z"] <- "Average Z axis body gyro jerk mean "
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyroJerk.std...X"] <- "Average X axis body gyro jerk std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyroJerk.std...Y"] <- "Average Y axis body gyro std jerk dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyroJerk.std...Z"] <- "Average Z axis body gyro jerk std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAccMag.mean.."] <- "Average Triax body accel mean"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAccMag.std.."] <- "Average Triax body accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tGravityAccMag.mean.."] <- "Average Triax gravity accel mean"
names(x_combined_condensed)[names(x_combined_condensed) =="tGravityAccMag.std.."] <- "Average Triax gravity accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAccJerkMag.mean.."] <- "Average Triax body accel jerk mean"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyAccJerkMag.std.."] <- "Average Triax body accel jerk std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyroMag.mean.."] <- "Average Triax body gyro mean"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyroMag.std.."] <- "Average Triax body gyro std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyroJerkMag.mean.."] <- "Average Triax body gyro jerk mean"
names(x_combined_condensed)[names(x_combined_condensed) =="tBodyGyroJerkMag.std.."] <- "Average Triax body gyro jerk std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAcc.mean...X"] <- "Average X axis Freq body accel mean"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAcc.mean...Y"] <- "Average Y axis Freq body accel mean"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAcc.mean...Z"] <- "Average Z axis Freq body accel mean"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAcc.std...X"] <- "Average X axis Freq body accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAcc.std...Y"] <- "Average Y axis Freq body accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAcc.std...Z"] <- "Average Z axis Freq body accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAccJerk.mean...X"] <- "Average X axis Freq body accel jerk mean"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAccJerk.mean...Y"] <- "Average Y axis Freq body accel jerk mean"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAccJerk.mean...Z"] <- "Average Z axis Freq body accel jerk mean"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAccJerk.std...X"] <- "Average X axis Freq body accel jerk std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAccJerk.std...Y"] <- "Average Y axis Freq body accel jerk std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAccJerk.std...Z"] <- "Average Z axis Freq body accel jerk std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyGyro.mean...X"] <- "Average X axis Freq body gyro mean "
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyGyro.mean...Y"] <- "Average Y axis Freq body gyro mean "
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyGyro.mean...Z"] <- "Average Z axis Freq body gyro mean "
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyGyro.std...X"] <- "Average X axis Freq body gyro std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyGyro.std...Y"] <- "Average Y axis Freq body gyro std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyGyro.std...Z"] <- "Average Z axis Freq body gyro std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAccMag.mean.."] <- "Average Freq body accel mean"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyAccMag.std.."] <- "Average Freq body accel std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyBodyAccJerkMag.mean.."] <- "Average Freq body accel jerk mean"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyBodyAccJerkMag.std.."] <- "Average Freq body accel jerk std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyBodyGyroMag.mean.."] <- "Average Freq body gyro mean"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyBodyGyroMag.std.."] <- "Average Freq body gyro std dev"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyBodyGyroJerkMag.mean.."] <- "Average Freq body gyro jerk mean"
names(x_combined_condensed)[names(x_combined_condensed) =="fBodyBodyGyroJerkMag.std.."] <- "Average Freq body gyro jerk std dev"
# aggregate the data by subject and activity and calculate mean (average) values for each type of measure
x_agg <- aggregate(x_combined_condensed, by=list(x_combined_condensed$subject,x_combined_condensed$activity), mean, simplify = FALSE)
# remove grouping column 1 and NA column created by 'In mean.default(X[[xxL]], ...) : argument is not numeric or logical: returning NA' warning
x_agg_df <- as.data.frame(x_agg[,c(2:3, 5:70)])
# rename Group.2 column to activity
names(x_agg_df)[names(x_agg_df) =="Group.2"] <- "activity"
# coerce result to a character dataframe
x_agg_df_char <- data.frame(lapply(x_agg_df, as.character), stringsAsFactors=FALSE)
# save the results to a text file
write.table(x_agg_df_char, "aggregate_run_analysis_data.txt", row.names = FALSE)



