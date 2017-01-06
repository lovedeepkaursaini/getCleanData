# Getting and cleaning data course project

to prepare tidy data that can be used for later analysis. 

# about run_analysis.R

create run_analysis.R that does the following.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Read the data from "UCIHARDataset" folder that is downloaded from " https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "

1) read test and training data from files given inside test and train folders.
2) combine the files to a data-set in form of subjects, labels and other data.
3) read features.txt and extract only mean and std features.
4) data.ms, a new dataset ctreated with subjects, labels and extracted features.
5) read activity_labels.txt, and replace label-numbers with label-names.
6) create a colmn list with "subject", "label" and "feature"
7) remove all non-alphanum chars and convert to lower case, apply these names to data frame
8) create new data frame that avg over each variable for each activity and each subject.
9) write this to .txt file.
