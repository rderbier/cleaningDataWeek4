## get features names
features<-read.csv("UCI HAR Dataset/features.txt",sep=" ",header=FALSE)
fnames<-features[,2]
## set column names
names(train)<-fnames
## find features for mean and std
selectedColumns<-grep (".*(-mean|-std).*",fnames,,value=TRUE)
## read activity lookup
activityLookup<-read.table("UCI HAR Dataset/activity_labels.txt",quote="\"", header=FALSE, sep=" ")

## read the train data
train<-read.fwf("UCI HAR Dataset/train/X_train.txt", widths=rep(16,561))

## keep only our columns for mean and std information
trainMeanAndStd=train[,selectedColumns]
## clean names
names(trainMeanAndStd)<-gsub("-","",names(trainMeanAndStd))
names(trainMeanAndStd)<-gsub("\\(\\)","",names(trainMeanAndStd))

## add subject 
subjects<-read.csv("UCI HAR Dataset/train/subject_train.txt",quote="\"", header=FALSE,row.names=c(‘subject’))
trainMeanAndStd<-cbind(trainMeanAndStd,subjects)

## add activity
activityLookup<-read.table("UCI HAR Dataset/activity_labels.txt",quote="\"", header=FALSE, sep=" ")
activities<-merge(activities,activityLookup)
names(activities)<-c('activityID','activity')
trainMeanAndStd<-cbind(trainMeanAndStd,activities[,"activity"])

## same ogic for test
test<-read.fwf("UCI HAR Dataset/test/X_test.txt", widths=rep(16,561))
## keep only our columns for mean and std information
testMeanAndStd=test[,selectedColumns]
## clean names
names(testMeanAndStd)<-gsub("-","",names(testMeanAndStd))
names(testMeanAndStd)<-gsub("\\(\\)","",names(testMeanAndStd))

## add subject 
subjects<-read.csv("UCI HAR Dataset/test/subject_test.txt",quote="\"", header=FALSE,row.names=c(‘subject’))
testMeanAndStd<-cbind(testMeanAndStd,subjects)

activities<-read.csv("UCI HAR Dataset/test/y_test.txt",quote="\"", header=FALSE)

activities<-merge(activities,activityLookup)
names(activities)<-c('activityID','activity')
testMeanAndStd<-cbind(testMeanAndStd,activity=activities[,"activity"])
