# Cleaning-Data-Project

The R code does the following:

## Extract info from the "test" folder

The measurements file, activity label file, and subject number file should be stored (relative to the working directory) at "./UCI HAR Dataset/test/X_test.txt", "./UCI HAR Dataset/test/y_test.txt", and "./UCI HAR Dataset/test/subject_test.txt" respectively.

The "cbind" command will merge these data together.

## Extract info from the "train" folder

The measurements file, activity label file, and subject number file should be stored (relative to the working directory) at "./UCI HAR Dataset/train/X_train.txt", "./UCI HAR Dataset/train/y_train.txt", and "./UCI HAR Dataset/train/subject_train.txt" respectively.

The "cbind" command will merge these data together.

## Merging the "test" and "train" sets together.

This is done by "rbind" command.

## Read all the column names

The column names file should be located at "./UCI HAR Dataset/features.txt". 

### Manually input the names for the "activity" and "subject" column

## Locate all columns with names including the phrase "mean" or "std", but exclude the phrease "meanFreq"

### Manually include the "activity" and "subject" column

## Extract our required data

## Converting a numeric vector to a factor vector

### Manually assigning the levels for this factor vector

## Assigning the column names

## Finding the mean of each observation, grouped by "activity" and "subject"

## Reassigning the column name, because we are finding the mean of the mean, and mean of the deviation.

### Manually reassign the "activity" and "subject" column name.

## Write final data into a txt file.