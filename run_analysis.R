## get features names
features<-readLines("UCI HAR Dataset/features.txt")
## use the whole line including the number as some labels are duplicates !
## clean names
fnames<-gsub("[(,), ]","",features)


## find features for mean and std

## read activity lookup
activityLookup<-read_delim("UCI HAR Dataset/activity_labels.txt",quote="\"",  col_names=c("activityID","activityName"), delim=" ", col_types="cc")

## read the train data

train<-read_fwf("UCI HAR Dataset/train/X_train.txt", fwf_widths(rep(16,561)))
## set column names
names(train)<-fnames

## keep only our columns for mean and std information
trainMeanAndStd<-select(train,matches("(.)*(-mean|-std)(.)*"))


## add activity
activities<-read_table("UCI HAR Dataset/train/y_train.txt", col_names = "activityID", col_types="c")
activities<-left_join(activities,activityLookup,by="activityID")
trainMeanAndStd<-bind_cols(activities,trainMeanAndStd);
## add subject 
subjects<-read_table("UCI HAR Dataset/train/subject_train.txt", col_names = "subject", col_types="c")
trainMeanAndStd<-bind_cols(subjects,trainMeanAndStd);



## same logic for test
test<-read_fwf("UCI HAR Dataset/test/X_test.txt", fwf_widths(rep(16,561)))
## set column names
names(test)<-fnames
## keep only our columns for mean and std information
testMeanAndStd<-select(test,matches("(.)*(-mean|-std)(.)*"))

## add activity
activities<-read_table("UCI HAR Dataset/test/y_test.txt", col_names = "activityID", col_types="c")
activities<-left_join(activities,activityLookup,by="activityID")
testMeanAndStd<-bind_cols(activities,testMeanAndStd);
## add subject 
subjects<-read_table("UCI HAR Dataset/test/subject_test.txt",col_names = "subject", col_types="c")
testMeanAndStd<-bind_cols(subjects,testMeanAndStd);


## merge all rows

allMeanAndStd<-bind_rows(trainMeanAndStd,testMeanAndStd)

## create summary data mean of measures group by activity name and then by subject
summaryData <- allMeanAndStd %>% group_by(activityName,subject) %>% summarize_each(funs(mean))


