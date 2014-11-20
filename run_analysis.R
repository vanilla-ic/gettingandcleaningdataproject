#Load packages
library(plyr)
library(data.table)
library(dplyr)

#Read files
path <- "/Users/iancross/Desktop/coursera/getdata/UCI HAR Dataset"
subjectTrain <- read.table(file.path(path, "train", "subject_train.txt")) 
subjectTest <- read.table(file.path(path, "test", "subject_test.txt")) 
yTrain <- read.table(file.path(path, "train", "y_train.txt")) 
yTest <- read.table(file.path(path, "test", "y_test.txt")) 
xTrain <- read.table(file.path(path, "train", "X_train.txt")) 
xTest <- read.table(file.path(path, "test", "X_test.txt")) 

#1. Merges the training and the test sets to create one data set
trainingData1 <- cbind(xTrain, subjectTrain)
trainingData <- cbind(trainingData1, yTrain) 
testData1 <- cbind(xTest, subjectTest)
testData <- cbind(testData1, yTest)
allData <- rbind(trainingData, testData)

#Read labels and Variables in and add them to the data
features <- read.table(file.path(path, "features.txt"))
colnames(features) <- c("VariableID", "Variable")
activityLabels <- read.table(file.path(path, "activity_labels.txt"))
colnames(activityLabels) = c("ActivityID", "Activity")
labels <- features$Variable
names(allData) <- labels
names(allData)[562] <- "Subject"
names(allData)[563] <- "ActivityID"

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
meanStd <- allData[grep("mean\\(\\)|std\\(\\)|Subject|ActivityID", names(allData))]


# 3.Uses descriptive activity names to name the activities in the data set
meanStd <- join(meanStd, activityLabels, by = "ActivityID", match = "first")

# 4.Appropriately labels the data set with descriptive variable names.

names(meanStd)<-gsub("BodyBody", "Body", names(meanStd))
names(meanStd)<-gsub("^t", "time", names(meanStd))
names(meanStd)<-gsub("^f", "frequency", names(meanStd))
names(meanStd)<-gsub("Acc", "Accelerometer", names(meanStd))
names(meanStd)<-gsub("Gyro", "Gyroscope", names(meanStd))
names(meanStd)<-gsub("Mag", "Magnitude", names(meanStd))

meanStd <- meanStd[,-1]

#5 From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.
tidyData = ddply(meanStd, c("Subject","Activity"), numcolwise(mean))
tidyData<-aggregate(. ~Subject + Activity, tidyData, mean)
tidyData<-tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "tidyData.txt", row.name=FALSE)