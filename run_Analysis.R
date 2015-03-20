## Read tables into R
##read features
features <- read.table("./UCI HAR Dataset/features.txt")

##since this will be used as a column header later, remove invalid characters
##preserving original names for future reference, just in case
features <- data.frame(features, make.names(features$V2, unique=T))

##naming header for ease of use
names(features) <- c("Position", "Original_Name", "Valid_New_Name")

##read activity levels
activyLevels <- read.table("./UCI HAR Dataset/activity_labels.txt")
##name variables
names(activyLevels) = c("Activity_ID", "Activity_Name")


##read test data
##read test subjects
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

##name the variables 
names(testSubject) = c("Subject")

##read test activities
testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")

##name the variables
names(testActivity) = c("Activity_ID")

##read test data set
testReading <- read.table("./UCI HAR Dataset/test/X_test.txt")

##name variable for testReading
names(testReading) = features$Valid_New_Name

##join all values into one big datafram
testReading <- cbind(testSubject, testActivity, testReading)



##read train data
##read train subjects
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

##name the variable
names(trainSubject) <- c("Subject")

##read train activities
trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")

##name the variable
names(trainActivity) <- c("Activity_ID")

##read train data set
trainReading <- read.table("./UCI HAR Dataset/train/X_train.txt")

##name variables fro trainReading
names(trainReading) <- features$Valid_New_Name

#Join all values into one big datagram
trainReading <- cbind(trainSubject, trainActivity, trainReading)


##finally combing both test and train data sets
combinedData <- rbind(testReading, trainReading)


##load library for data manipulation and to use tidy functions
library(dplyr)
library(tidyr)

##get subset of data for mean and std along with Activity_ID and Subject
dataSubSet <- select(combinedData, Activity_ID, Subject, contains(".mean."), contains(".std."))

##merge with activity level to get descriptive activity name
mergedData <- merge(activyLevels, dataSubSet)


##starting with merged data
finalData <- mergedData %>%
  ##group by acitivity (ID, Name) and Subject
  group_by(Activity_ID, Activity_Name, Subject) %>%
  ##calculate mean (average) for each variable 
  summarise_each(funs(mean)) %>%
  ##since the variables are in column header, list them as rows
  gather(Measurement, Mean_Value, -Activity_ID, -Activity_Name, -Subject)

##now write the finalData set into a file
write.table(finalData, "Tidy_Data.txt", row.names=F)

##End of Analysis
