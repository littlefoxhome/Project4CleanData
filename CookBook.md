Cook Book
==========================================

Data soruce: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Script to process the data is titled 'run_analysis.R'. The Script does the following.
- Merges '/test/subject_test.txt' and '/test/subject_train.txt' to a data farme named 'data_subject_merged' (10299 observations and 1 variable); Merges '/test/X_test.txt' and '/test/X_train.txt' to a data frame named 'data_X_merged'  (10299 observations and 561 variables); Merges '/test/Y_test.txt' and '/test/Y_train.txt' to a data frame named 'data_Y_merged' (10299 observations and 1 variable); Merges data farmes 'data_subject_merged', 'data_X_merged', and 'data_Y_merged' to one data frame 'merged_tidy_data' (10299 observations and 3 variables).

- Extracts only the measurements on the mean and standard deviation for each measurement by using pattern matching. The index of elements matching the pattern (mean() and std()) is firstly obtianed (denoted by 'index_mean_std'). The measurments on the mean and standard is then extracted (denoted by 'data_X_merged'). The resultant data frame has 10299 observations and 66 variables. 

- Uses descriptive activity names to name the activities in the data set. Six activities are obtained by reading 'activity_labels.txt' and actitivies in the data set is named by descriptive activities.

- Underscores and brackets () are removed from all feature names. Descrptive variable names, such as 'tBodyAcc-mean-X' has been appropriately used to label the data.

- A second, independent tidy data set with the average of each variable for each activity and each subject is created. They are 30 different subjects and 6 activities. Two for-loop is used, one corresponds the subject and another corresponds the activity. For each iteration in the double for-loop, 'colMeans' is used to obtain the averge for each variable. The obtained data frame is denoted by 'tidy_data2nd' which has 180 observations and 68 variables.
