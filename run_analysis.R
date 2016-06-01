#Import needed libraries
library(reshape2)
library(plyr)
library(dplyr)


#Read datasets into memory
#Assumes all datasets in working directory or "Test" and "train"
#subfolders as appropriate
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")


#Merge test and train datasets into a combined X and a combined Y
combined_x <- rbind(x_train, x_test)
combined_y <- rbind(y_train, y_test)
combined_subjects <- rbind(subject_train,subject_test)

#Give combined_x column labels as features table
features[,2] <- as.character(features[,2])
names(combined_x) <- features[,2]

# combine Subjects, Y, and X tables into a single table
combined_sub_y_x <- cbind(combined_subjects, combined_y, combined_x)
names(activity_labels) <- c("Activity_ID","Activity")

# Give new table appropriate names
names(combined_sub_y_x)[2] <- "Activity_ID"
names(combined_sub_y_x)[1] <- "Subject"

# Add descxriptive activity names into new table
merged <- join(combined_sub_y_x, activity_labels, by="Activity_ID")

#remove unnneeded columns (not mean or std)
merged <- merged[,grep("Subject|Activity|*[Mm]ean*|*[Ss]td*", names(merged))]

# swap activity and activity ID columns
tempAct <- merged$Activity_ID
merged$Activity_ID <- merged$Activity
merged$Activity <- tempAct
names(merged)[89] <- "ActivityID"
names(merged)[2] <- "Activity"
merged <- merged[,-89]

# Group by Subject and Activity and provide mean data for each
grouped <- group_by(merged, Subject,Activity)
summarized <- summarize_each(grouped, funs(mean))
write.table(summarized, row.names = F, file="summarized_data.txt")