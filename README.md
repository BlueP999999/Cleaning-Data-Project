# Cleaning-Data-Project

The R code does the following:

### Extract info from the "test" folder

The measurements file, activity label file, and subject number file should be stored (relative to the working directory) at "./UCI HAR Dataset/test/X_test.txt", "./UCI HAR Dataset/test/y_test.txt", and "./UCI HAR Dataset/test/subject_test.txt" respectively.

The "cbind" command will merge these data together.

### Extract info from the "train" folder

The measurements file, activity label file, and subject number file should be stored (relative to the working directory) at "./UCI HAR Dataset/train/X_train.txt", "./UCI HAR Dataset/train/y_train.txt", and "./UCI HAR Dataset/train/subject_train.txt" respectively.

The "cbind" command will merge these data together.

### Merging the "test" and "train" sets together.

This is done by "rbind" command.

The combined data is stored in "NEWSET".

### Read all the column names

The column names file should be located at "./UCI HAR Dataset/features.txt". 

The code also manually input the names for the "activity" and "subject" column

The column names is stored in "NAMES".

### Locate all columns with names including the phrase "mean" or "std", but exclude the phrease "meanFreq"

The code also manually include the "activity" and "subject" column.

This result is stored in "MEAN_OR_STD".

### Extract our required data

This result is stored in "EXTRACTED_DATA".

### Changing the contents of "activity" column.

This is done by converting a numeric factor into a factor vector using the "factor" command, and manually assigning the levels for this factor vector using the "levels" command.

### Assigning the column names

This step assigns the column names of the extracted columns. 

Changing the column names of "EXTRACTED_DATA" using "NAMES" and "MEAN_OR_STD".

### Finding the mean of each observation, grouped by "activity" and "subject"

This step uses the "aggregate" function.

The final result is stored in "FINAL_DATA"

### Reassigning the column name, because we are finding the mean of the mean, and mean of the deviation.

e.g. instead of displaying "tBodyAcc-mean()-X", we display "MEAN[tBodyAcc-mean()-X]".

Also, we manually reassign the "activity" and "subject" column name.

### Write final data into a txt file.

Using "write.table"