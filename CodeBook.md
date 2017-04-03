
#Code Book describing how to get and clean the data for the wearable computing study.

## Initial data 
Raw data is found at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Asumption is that this zip file is unziped in your R working directory.

## transformations steps 

Data is provided as vectors of 561 data points in fixed files (16 chars) with no headers. Headers are provided by the features.txt file.


read.fwf("UCI HAR Dataset/train/X_train.txt", widths=rep(16,561))
 
Extracts only the measurements on the mean and standard deviation for each measurement.
 
