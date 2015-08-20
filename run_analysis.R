project<-function(){
    ### Extract info from "test" sets
    TESTSET<-read.table("./UCI HAR Dataset/test/X_test.txt")
    TESTLABEL<-read.table("./UCI HAR Dataset/test/y_test.txt")
    TESTWINDOW<-read.table("./UCI HAR Dataset/test/subject_test.txt")
    ### Merging all info from "test" sets
    COMBINEDTEST<-cbind(TESTSET,TESTLABEL,TESTWINDOW)
    
    ### Extract info from "train" sets
    TRAININGSET<-read.table("./UCI HAR Dataset/train/X_train.txt")
    TRAININGLABEL<-read.table("./UCI HAR Dataset/train/y_train.txt")
    TRAININGWINDOW<-read.table("./UCI HAR Dataset/train/subject_train.txt")
    ### Merging all info from "train" sets
    COMBINEDTRAINING<-cbind(TRAININGSET,TRAININGLABEL,TRAININGWINDOW)
    
    ### Merge the "test" and "train" sets together.
    NEWSET<-rbind(COMBINEDTEST,COMBINEDTRAINING)
    
    ### Read all the column names
    NAMES<-read.table("./UCI HAR Dataset/features.txt")[,2]
    
    ### Manually input the names for the "activity" and "subject" column
    levels(NAMES)<-c(levels(NAMES),"activity","subject")
    NAMES[length(NAMES)+1]<-"activity"
    NAMES[length(NAMES)+1]<-"subject"
    
    ### Locate all columns with names including the phrase "mean" or "std"
    ### But exclude the phrease "meanFreq".
    INCLUDE<-grepl("mean|std",NAMES)
    EXCLUDE<-grepl("meanFreq",NAMES)
    MEAN_OR_STD<-INCLUDE & !EXCLUDE
    
    ### Manually include the "activity" and "subject" column
    MEAN_OR_STD[c(length(NAMES)-1,length(NAMES))]<-TRUE
    
    ### Extract our required data
    EXTRACTED_DATA<-NEWSET[,MEAN_OR_STD]
    
    ### Converting a numeric vector to a factor vector
    NUM_COL<-ncol(EXTRACTED_DATA)
    EXTRACTED_DATA[,NUM_COL-1]<-factor(EXTRACTED_DATA[,NUM_COL-1])
    
    ### Manually assigning the levels for this factor vector
    levels(EXTRACTED_DATA[,NUM_COL-1])<-c("WALKING","WALKING UPSTAIRS","WALKING DOWNSTAIRS"
                                          ,"SITTING","STANDING","LAYING")
    
    ### Assigning the column names
    EXTRACTED_NAMES<-NAMES[MEAN_OR_STD]
    names(EXTRACTED_DATA)<-EXTRACTED_NAMES
    
    ### Finding the mean of each observation, grouped by "activity" and "subject"
    NEW_DATA<-aggregate(EXTRACTED_DATA[,1:(NUM_COL-2)],
                        by=list(EXTRACTED_DATA$activity,
                                EXTRACTED_DATA$subject),mean)
    
    ### Reassigning the column name, because we are finding the mean of the mean, 
    ### and mean of the deviation.
    names(NEW_DATA)<-paste("MEAN[",names(NEW_DATA),"]",sep="")
    
    ### Manually reassign the "activity" and "subject" column name.
    names(NEW_DATA)[1]<-"activity"
    names(NEW_DATA)[2]<-"subject"
    
    ### Write final data into a txt file.
    write.table(NEW_DATA,row.name=FALSE,file="./projectsubmit.txt")
}