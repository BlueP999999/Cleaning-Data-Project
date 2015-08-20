project<-function(){
    TESTSET<-read.table("./UCI HAR Dataset/test/X_test.txt")
    TESTLABEL<-read.table("./UCI HAR Dataset/test/y_test.txt")
    TESTWINDOW<-read.table("./UCI HAR Dataset/test/subject_test.txt")
    ######
    TRAININGSET<-read.table("./UCI HAR Dataset/train/X_train.txt")
    TRAININGLABEL<-read.table("./UCI HAR Dataset/train/y_train.txt")
    TRAININGWINDOW<-read.table("./UCI HAR Dataset/train/subject_train.txt")
    ### Create merged set
    COMBINEDTEST<-cbind(TESTSET,TESTLABEL,TESTWINDOW)
    COMBINEDTRAINING<-cbind(TRAININGSET,TRAININGLABEL,TRAININGWINDOW)
    NEWSET<-rbind(COMBINEDTEST,COMBINEDTRAINING)
    ###
    NAMES<-read.table("./UCI HAR Dataset/features.txt")[,2]
    levels(NAMES)<-c(levels(NAMES),"activity","subject")
    NAMES[length(NAMES)+1]<-"activity"
    NAMES[length(NAMES)+1]<-"subject"
    MEAN_OR_STD<-grepl("mean|std",NAMES)
    EXCLUDE<-grepl("meanFreq",NAMES)
    MEAN_OR_STD<-MEAN_OR_STD & !EXCLUDE
    MEAN_OR_STD[c(length(NAMES)-1,length(NAMES))]<-TRUE
    ###
    EXTRACTED_DATA<-NEWSET[,MEAN_OR_STD]
    ###
    NUM_COL<-ncol(EXTRACTED_DATA)
    EXTRACTED_DATA[,NUM_COL-1]<-factor(EXTRACTED_DATA[,NUM_COL-1])
    levels(EXTRACTED_DATA[,NUM_COL-1])<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS"
                                          ,"SITTING","STANDING","LAYING")
    ###
    EXTRACTED_NAMES<-NAMES[MEAN_OR_STD]
    names(EXTRACTED_DATA)<-EXTRACTED_NAMES
    NEW_DATA<-aggregate(EXTRACTED_DATA[,1:(NUM_COL-2)],
                        by=list(EXTRACTED_DATA$activity,
                                EXTRACTED_DATA$subject),mean)
    names(NEW_DATA)<-paste("MEAN[",names(NEW_DATA),"]",sep="")
    names(NEW_DATA)[1]<-"activity"
    names(NEW_DATA)[2]<-"subject"
    write.table(NEW_DATA,row.name=FALSE,file="./projectsubmit.txt")
}