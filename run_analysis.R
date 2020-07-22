library(tidyverse) #for using gsub
library(reshape2)  #for using melt and dcast


#downloading the dataset and unzip
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, './g&gd.zip', method="curl")

unzip('g&gd.zip')


#reading the datasets
features <- read.table('./UCI HAR Dataset/features.txt',col.names = c('No.','Feature'))
activities <- read.table('./UCI HAR Dataset/activity_labels.txt', col.names = c('No.','Activity'))

subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt', col.names = 'Subject')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt',col.names = 'Subject')

x_train <- read.table('./UCI HAR Dataset/train/X_train.txt', col.names = features$Feature)
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt', col.names = 'No.')
x_test <- read.table('./UCI HAR Dataset/test/X_test.txt', col.names = features$Feature)
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt', col.names = 'No.')

#making one final dataset
X <- rbind(x_train,x_test)
Y <- rbind(y_train,y_test)
Subject <- rbind(subject_train,subject_test)

Final_Data <- cbind(Subject,Y,X)

#selecting the desired columns
Tidy_Data <- Final_Data %>% select(Subject, No., contains('mean'), contains('std'))

#renaming the variables
names(Tidy_Data)[2] = 'Activities'
names(Tidy_Data) <- gsub('Acc','Accelerometer.',names(Tidy_Data))
names(Tidy_Data) <- gsub('^t','Time Domain.',names(Tidy_Data))
names(Tidy_Data) <- gsub('^f','Frequency Domain.',names(Tidy_Data))
names(Tidy_Data) <- gsub('Gyro','Gyroscope.',names(Tidy_Data))
names(Tidy_Data) <- gsub('Mag','Magnitude.',names(Tidy_Data))
names(Tidy_Data) <- gsub('Freq','frequency.',names(Tidy_Data))
names(Tidy_Data) <- gsub('BodyBody','Body.',names(Tidy_Data))
names(Tidy_Data) <- gsub('Body','Body.',names(Tidy_Data))
names(Tidy_Data) <- gsub('Jerk','Jerk.',names(Tidy_Data))
names(Tidy_Data) <- gsub('gravity','Gravity.',names(Tidy_Data))
names(Tidy_Data) <- gsub('Gravity','Gravity.',names(Tidy_Data))

#describing activity names
Tidy_Data$Activities <- activities[Tidy_Data$Activities,2]

#creating the second independent dataset
melteddata <- melt(Tidy_Data, id = c('Subject','Activities'))
tidydata <- dcast(melteddata, Subject+Activities~variable, mean)

#writing the dataset back into a text file
write.table(tidydata, './tidy_data.txt', row.names = FALSE)













