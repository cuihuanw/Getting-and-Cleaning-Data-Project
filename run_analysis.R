setwd("F:/CuiHuan/data Science/Course3_Getting_and_Cleaning_Data/project")

## 1.Merges the training and the test sets to create one data set.

#read data
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
#dim(X-train)  [1] 7352  561
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
#dim(X-test)  [1] 2947  561

y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")

subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")

# merge the training and test datasets 
combined_data<-rbind(X_train,X_test)
#dim(combine_data)  [1] 10299   561
combined_label<-rbind(y_train,y_test)
#dim(combine_data)  [1] 10299   1
combined_subject<-rbind(subject_train,subject_test)
#dim(combine_data)  [1] 10299   1

one_data<-cbind(combined_subject, combined_label, combined_data)
write.table(one_data, "merged_data.txt")  #write out the merged data


##2.Extracts only the measurements on the mean and standard deviation 
##for each measurement. 

features<-read.table("./UCI HAR Dataset/features.txt")

meanStd<-grep("mean\\(\\)|std\\(\\)", features[,2])
combined_data<-combined_data[,meanStd]
names(combined_data)<-gsub("\\(\\)", "", features[meanStd,2]) #remove the () 
#names(combined_data)<-gsub("-", "", names(combined_data)) #remove the '-' 
names(combined_data)<-gsub("mean", "Mean", names(combined_data))  # change 'm' to 'M'
names(combined_data)<-gsub("std", "Std", names(combined_data))  # change 's' to 'S'


##3.Uses descriptive activity names to name the activities in the data set

activity<-read.table("./UCI HAR Dataset/activity_labels.txt")
activity_label<-activity[combined_label[, 1], 2]
combined_label[, 1]<-activity_label
names(combined_label)<-"activity"
names(combined_subject)<-"subject"


##4.Appropriately labels the data set with descriptive variable names. 

clean_data<-cbind(combined_subject, combined_label, combined_data)
write.table(clean_data, "merged_Mean_Std_data.txt")  #write out the merged data


##5. creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.

subject_length<-length(table(combined_subject))
activity_length<-nrow(activity)
col_length<-ncol(clean_data)
result<-matrix(NA, nrow=subject_length*activity_length, ncol=col_length)
result<-as.data.frame(result)

colnames(result)<-colnames(clean_data)
row<-1
for(i in 1:subject_length){
      for(j in 1:activity_length){
            result[row, 1]<-sort(unique(combined_subject)[, 1])[i]
            result[row, 2]<-activity[j, 2]
            temp1<-i==clean_data$subject
            temp2<-activity[j,2]==clean_data$activity
            result[row, 3:col_length]<-colMeans(clean_data[temp1&temp2, 3:col_length])
            row<-row+1
      }
}  
            
head(result)
write.table(result, "tidy_data_with_ave.txt", row.name=FALSE)

