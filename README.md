# Getting and Cleaning Data Course Project

#### Background
Given is the the data in various files, the data set contains

1. Features- List of variable for which data was collected
2. Activities-	List of acitivities performed by volunteers
3. Test Data
	+ Test Data Set
	+ Test Data Labels
4. Train Data 
	+ Train Data Set
	+ Train Data Labels  

#### The thought process
1. Read all data files into R data frames
2. Combine Test data, test labels, and test subject into Test data frame
3. Combine Train data, train labels, and train subjects into Train data frame
4. Combine both Test and Train data sets into one big data frame
5. Only select mean and std columns
6. Summarise these columns to calculate mean based on subject and activity
7. Use tidy principles/operations to create final result
8. Export the final result into a text file

#### Detail Steps
* Read and process features file
	+ Read features file
	+ Since this will be used as a column header later, remove invalid characters
	+ Give readable header names

* Read and process Activity levels
	+ Read activity levels file
	+ Give readable header names 

* Read and process test data sets
	+ Read test subjects and give readable header name
	+ Read test activities and give readable header name
	+ Read test data set and give readable header name
	+ Join all test related values into one big dataframe

* Read and process train data sets
	+ Read train subjects and give readable header name
	+ Read train activities and give readable header name
	+ Read train data set and give readable header name
	+ Join all train related values into one big dataframe

* Combing both test and train data sets
* Load libraries, dplyr and tidyr, for data manipulation and to use tidy functions

* Process combined data to get desired data set 
	+ Get subset of data for mean and std along with Activity_ID and Subject
	+ Merge with activity level to get descriptive activity name
	+ With the merged data
	++ Group by acitivity (ID, Name) and Subject
  	++ Calculate mean (average) for each variable 
  	++ The variables are in column header so, list them as rows

* At this point we have we the desired data set; rite the final data set into a file