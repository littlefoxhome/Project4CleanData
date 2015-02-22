# task 1: Merges the training and the test sets to create one data set.

data_subject_test  <- read.table('test/subject_test.txt')
data_subject_train <- read.table('train/subject_train.txt')
data_subject_merged <- rbind(data_subject_test, data_subject_train)

data_X_test  <- read.table('test/X_test.txt')
data_X_train <- read.table('train/X_train.txt')
data_X_merged <- rbind(data_X_test, data_X_train)

data_Y_test  <- read.table('test/Y_test.txt')
data_Y_train <- read.table('train/Y_train.txt')
data_Y_merged <- rbind(data_Y_test, data_Y_train)

merged_tidy_data <- cbind(data_subject_merged, data_X_merged, data_Y_merged)

# task 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table('features.txt')
index_mean_std <- grep("mean\\(\\)|std\\(\\)",features[,2])
features_mean_std <- features[index_mean_std,2]
data_X_merged <- data_X_merged[,index_mean_std]
names(data_X_merged) <- features[index_mean_std,2]


# task 3: Uses descriptive activity names to name the activities in the data set
activity <- read.table('activity_labels.txt')
data_Y_merged[,1] <- activity[data_Y_merged[,1], 2]
names(data_Y_merged) <- "activity"

# task 4: Appropriately labels the data set with descriptive variable names.  

names(data_subject_merged) <- "subject"
names(data_X_merged) <- gsub("\\(|\\)", "", names(data_X_merged))
merged_tidy_data <- cbind(data_subject_merged, data_X_merged, data_Y_merged)
write.table(merged_tidy_data, "merged_tidy_data.txt")

# task 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subject_set <- unique(data_subject_merged)
activity_set <- activity[,2]
length_var  <- dim(data_X_merged)[2]

table_rowindex <- 1
tidy_data2nd <- merged_tidy_data[seq(1,length(activity_set)*dim(subject_set)[1]),]
subject_set <- as.vector(as.matrix(subject_set))
for(activity_index in activity_set)
{
  for(subject_index in subject_set)
  {
    tidy_data2nd[table_rowindex,1] <- subject_index
    select_index <- which(merged_tidy_data[,1]==subject_index & merged_tidy_data[,2+length_var]==activity_index)
    tidy_data2nd[table_rowindex,seq(2,1+length_var)] <- colMeans(merged_tidy_data[select_index,seq(2,1+length_var)])
    tidy_data2nd[table_rowindex,length_var+2] <- activity_index
    table_rowindex <- table_rowindex + 1
  }
}

write.table(tidy_data2nd, "merged_tidy_2nddata.txt",row.name=FALSE)