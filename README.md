#"Getting and Cleaning Data" Course Project

This project is to read the "Human Activity Recognition Using Smartphones" Data Set, clean the data set and create a tidy data set.

###Before running the run_analysis.R script,
1.download the zip file from  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2.Unzip the file, you will get folder of "UCI HAR Dataset"

3.Put the "UCI HAR Dataset" and the run_analysis.R script in the same working directory.

###Once the above steps are done, we can run the run_analysis.R.

###The R scripts will generate three data sets:
1."merged_data.txt" which merges the training and the test sets to create one data set. 

2. "merged_Mean_Std_data.txt" which extracts only the measurements on the mean and standard deviation for each measurement from the "merged_data.txt".

2."tidy_data_with_ave.txt"  which is a tidy data set with the average of each variable for each activity and each subject.    
    