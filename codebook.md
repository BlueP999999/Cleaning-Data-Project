# Codebook for Cleaning Data Project

## Variables

The first column represents the activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The second column represents the test subject (subject number 1~30)

The remaining columns are those columns whose column name includes the phrase "mean()" or "std()". However, note that we need to exclude variables names that include "meanFreq()" and "gravityMean"


## Data

The numeric data (excluding the "activity" and "subject" column) represents the mean of many measurements of those variables. e.g. The "MEAN[tBodyAcc-mean()-X]" variable represents the mean of (tBodyAcc-mean()-X) over many measurements in our original data (i.e. mean of the means). Similarly, the "MEAN[tBodyAcc-std()-X]" variable represents the mean of (tBodyAcc-std()-X) over many measurements in our original data (i.e. mean of the standard deviations)

## Work done

First I combined measurements, activity type, and subject number file into one data frame (i.e. the "X-test.txt", "y_test.txt","subject_test.txt" file respectively, for both the "test" pool and "train" pool).

Afterwards I combined the "test" data framd and "train" data frame together.

Next I searched for all column names that include the word "mean" or "std", but exclude the word "meanFreq". I do not know how to search for "mean()" including the brackets, because "(", ")" are considered metacharacters in regular expression in R Language; I face some difficulty here and used an easy way out.

After extracting these columns that include "mean" or "std", but exclude "meanFreq", I determine the mean of these columns after grouping them into categories based on the "activity" type and "subject" number.

