# Instructions 
 1. In order to correctly run this script, the following files must be availble in your current working directory
activity_labels.txt
features.txt
train/X_train.txt
train/y_train.txt
test/X_test.txt
test/y_test.txt
train/subject_train.txt
test/subject_test.txt
#H4 These files can be downloaded from the following location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Execute script run_analysis.R and see resulting dataset titled "summarized_data.txt"


# The run_analysis.R script does the following:
 1. Combined the test and training datasets 'train/X_train.txt' and 'test/X_test.txt' into a single table
 2. Combined the test and training activity labels datasets 'train/y_train.txt' and 'test/y_test.txt'into a single table
 3. Combined the test and training activity subject datasets  'train/subject_train.txt' and 'test/subject_test.txt'into a single table
 4. Merging the resulting combined tables (X,Y, and subject) into a single table including the combined test and training activitities, corresponding labels, and subject details
 5. The table resulting from step 4 was then joined with the activity_labels dataset to provide a textual description of the activity being performed in each step
 6.  The column names for each variable in the table resulting from step 5 was then updated to match the corresponding features described in the features.txt dataset
 7.  Grouping the resulting table from steps 1-6 by subject and activity and the average of all measurements for these groupings was then calculated
 8.  The dataset generated in step 8 was then output to a table named "summarized_data.txt"


System Details
The original analysis was done using R version 3.2.3 on a Windows machine