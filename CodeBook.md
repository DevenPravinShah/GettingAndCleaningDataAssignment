Variables Description

Data read from project data files. For description of each data files, refer to README in the project folder.
My run_analysis.R has split code in SEVEN steps. I am describing in this variables added in each step.

STEP ONE
feature_list - names of features read from features.txt file
activity - list of activities read from activity_labels.txt file


STEP TWO
subject_test - info read from "./text/subject_test.txt" file
x_test - data read from "./text/X_test.txt" file
y_test - data read from "./text/Y_test.txt" file

y_test_label - match y_test labels with corresponding activities
tidy_test - binding test subject, test activity and test set


STEP THREE
subject_train - info read from "./train/subject_train.txt"
x_train - data read from "train/X_train.txt"
y_train - data read from "train/Y_train.txt"

y_train_label - match y_train labels with corresponding activities
tidy_train - binding train subject, train activity and train set

STEP FOUR
tidy_set - merged test set and train set

STEP FIVE
tidy_mean_std - data set with only measurements on the mean and standard deviation for each measurement

STEP SIX
tidy_avg - independent tidy data set with the average of each variable for each activity and each subject.

STEP SEVEN
No variables used in this step.
