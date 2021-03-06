
## Getting And Cleaning Data - Course Project

* This is the peer graded project for Getting and Cleaning Data

* A full description of the dataset is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* The script provided, run_analysis.R does the following 
  + downloads the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  + reads the datasets X_train, X_yest, y_train, y_test, subject_train, subject_test and features and activities.
  + merge all the datasets into one.
  + extracts only the measurements on the mean and standard deviation for each measurement.
  + activities code replaced by their descriptive names
  + final dataset (which can be found in the repo under the name 'tidy_data.txt') is created which contains the average of each variable for each activity and subject.
  