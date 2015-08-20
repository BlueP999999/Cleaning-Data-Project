# Codebook for Cleaning Data Project

## Variables

The first column represents the activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The second column represents the test subject (subject number 1~30)

The remaining columns are those columns whose column name includes the phrase "mean()" or "std()". However, note that we need to exclude variables names that include "meanFreq()" and "gravityMean"


## Data

The numeric data (excluding the "activity" and "subject" column) represents the mean of many measurements of those variables. e.g. The "MEAN[tBodyAcc-mean()-X]" variable represents the mean of (tBodyAcc-mean()-X) over many measurements in our original data (i.e. mean of the means). Similarly, the "MEAN[tBodyAcc-std()]" variable represents the mean of (tBodyAcc-std()-X) over many measurements in our original data (i.e. mean of the standard deviations)

## Work done