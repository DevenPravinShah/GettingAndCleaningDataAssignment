# This script is for assignment project for the Getting and Cleaning Data project.
#
# It uses "dplyr" package. You will need to install and load it before running this script.
#
# It used the data set provided in the assignment description. When I download and unzip the file,
# it expands all the data in "UCI HAR Dataset" folder. I preserved the sub-folders and all the files
# as per the original data organization of the downloaded data.
#
# This script should run from the "UCI HAR Dataset" folder.
#
# It saves tidy data in the filename "tidyDataSet.txt"
# I wrote this script using R Studio.
# I set working directory to where the folder "UCI HAR DataSet" folder is on my iMac.
#
# ---------------------------------------------------
#
# STEP ONE: Read feature list and activity names
#
features_list <- read.table("features.txt", col.names = c("no","features"))
activity <- read.table("activity_labels.txt", col.names = c("label", "activity"))
#
#
# STEP TWO: Read test dataset and combine into one dataframe
#
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
x_test <- read.table("test/X_test.txt", col.names = features_list$features)
y_test <- read.table("test/Y_test.txt", col.names = "label")
y_test_label <- left_join(y_test, activity, by = "label")

tidy_test <- cbind(subject_test, y_test_label, x_test)
tidy_test <- select(tidy_test, -label)
#
# -------------------------------------------------
# 
# STEP THREE: Read train dataset
#
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
x_train <- read.table("train/X_train.txt", col.names = features_list$features)
y_train <- read.table("train/Y_train.txt", col.names = "label")
y_train_label <- left_join(y_train, activity, by = "label")

tidy_train <- cbind(subject_train, y_train_label, x_train)
tidy_train <- select(tidy_train, -label)
#
# ------------------------------------------------
# 
# STEP FOUR: combine test and train data set
#
tidy_set <- rbind(tidy_test, tidy_train)
#
# ------------------------------------------------
#
# STEP FIVE: Extract mean and standard deviation
#
tidy_mean_std <- select(tidy_set, contains("mean"), contains("std"))
#
# ------------------------------------------------
#
# STEP SIX: Averaging all variable by each subject each activity
#
tidy_mean_std$subject <- as.factor(tidy_set$subject)
tidy_mean_std$activity <- as.factor(tidy_set$activity)

tidy_avg <- tidy_mean_std %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
#
# ------------------------------------------------
#
# STEP SEVEN: Save tidy data in the file, name it "tidyDataSet.txt"
#
write.table(tidy_avg, "./tidyDataSet.txt", row.name=FALSE)
#
# 


