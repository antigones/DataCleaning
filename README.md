DataCleaning
============

The public repository for the DataCleaning final project


Make It Work
============

- Download the dataset from this [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- Extract the sample dataset in a folder
- Put run_analysis.R in the "UCI HAR Dataset" folder
- Launch R Studio
- in RStudio set current working directory: setwd("your_path_to_uci_har_dataset_folder")
- in RStudio launch the script: source("run_analysis.R")
- the script produces the file "tidy.txt", containing the tidy dataset.

How It Works
============

The script:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 