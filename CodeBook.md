#CodeBook

This code book describes the data used in this course project.

##The data source
original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

original description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 
##Oveview
30 volunteers performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

##The data  
The data set includes the following files:

'features.txt': List of all 561 features.

'activity_labels.txt': Links the class labels with their activity name. (WALKING: 1, WALKING_UPSTAIRS: 2, WALKING_DOWNSTAIRS:3, SITTING:4, STANDING:5, LAYING:6)

'train/X_train.txt': Training set. 7352 observations of the 561 features, for 21 of the 30 volunteers

'train/y_train.txt': Training labels. A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

'train/subject_train.txt': Training subject.  A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.

'test/X_test.txt': Test set. 2947 observations of the 561 features, for 9 of the 30 volunteers.

'test/y_test.txt': Test labels. A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

'test/subject_test.txt': Test subject. A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.

#####More information can be found at 'README.txt' and 'features_info.txt'.


####The data files in the "Inertial Signals" folders were ignored in this analysis.

##Steps for this analysis

1. All of the relevant data files were read into data frames, appropriate column headers were added, and the training and test sets were combined together to create one data set 'merged_data.txt'(~66000KB). 
2. Extracts only the measurements on the mean and standard deviation for each measurement. A data set 'merged_Mean_Std_data.txt'(~8200KB) including the  measurements on the mean and standard deviation is created. 
3. Uses descriptive activity names to name the activities in the data set.
4. A tidy data set was created containing the mean of each feature for each subject and each activity. Thus, subject #1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 66 features for that subject/activity combination. Since there are 30 subjects, there are a total of 180 rows.
5. The tidy data set was output as'tidy_data_with_ave.txt' (~220 KB).
