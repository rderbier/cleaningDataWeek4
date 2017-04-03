
# Code Book describing how to get and clean the data for the wearable computing study.

## Initial data 
Raw data is found at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Asumption is that this zip file is unziped in your R working directory.

## transformations steps and data created 

Data is provided as vectors of 561 data points in fixed files (16 chars) with no headers. Headers are provided by the features.txt file.

First we read all the information about the variables 

subject : ID of the tested person
activity : name of the activity
observation columsn have the name of the feature ( see features.txt file)  without special chars ( - ( ) ).

trainMeanAndStd : data frame containing the observations, subject and activity for the train data set
testMeanAndStd : data frame containing the observations, subject and activity for the test data set

allMeanAndStd : merge of the two sets. 

sumupByActivityAndSubject  : average of each variable for each activity and each subject.
 
