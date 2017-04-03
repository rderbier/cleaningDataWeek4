
#Code Book describing how to get and clean the data for the wearable computing study.

## Initial data 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## transformations steps 

data is provided as vectors of 561 data points in fixed files (16 chars) with no headers. Headers are provided by the features.txt file.


 baccxtrain=read.fwf("/Users/rderbier/Downloads/UCI HAR Dataset/train/X_train.txt", widths=rep(16,561))
 
