#    Merges the training and the test sets to create one data set.
#    Extracts only the measurements on the mean and standard deviation for each measurement.
#    Uses descriptive activity names to name the activities in the data set
#    Appropriately labels the data set with descriptive variable names.
#    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# exercise-1:
# y -> activity, x -> data, subj -> subject
# read all files
test.y <- read.table("UCIHARDataset/test/y_test.txt", col.names="label")
test.subj <- read.table("UCIHARDataset/test/subject_test.txt", col.names="subject")
test.x <- read.table("UCIHARDataset/test/X_test.txt")

train.y <- read.table("UCIHARDataset/train/y_train.txt", col.names="label")
train.subj <- read.table("UCIHARDataset/train/subject_train.txt", col.names="subject")
train.x <- read.table("UCIHARDataset/train/X_train.txt")

# put it together in the format of: subjects, labels, everything else
data <- rbind(cbind(test.subj, test.y, test.x),
              cbind(train.subj, train.y, train.x))



# exercise -2
# extract mean and std
features <- read.table("UCIHARDataset/features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
# retain mean and standard deviation only
features.ms <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

data.ms <- data[, c(1, 2, features.ms$V1+2)]


# exercise -3
# descriptive activity names 
labels <- read.table("UCIHARDataset/activity_labels.txt", stringsAsFactors=FALSE)
# replace labels in data with label names
data.ms$label <- labels[data.ms$label, 2]


# exercise 4
# Appropriately labels the data set with descriptive variable names.
# first make a list of the current column names and feature names
good.colnames <- c("subject", "label", features.ms$V2)
# then tidy that list
# by removing every non-alphabetic character and converting to lowercase
good.colnames <- tolower(gsub("[^[:alpha:]]", "", good.colnames))
# then use the list as column names for data
colnames(data.ms) <- good.colnames

# exercise 5
# find the mean for each combination of subject and label
aggr.data <- aggregate(data.ms[, 3:ncol(data.ms)],
                       by=list(subject = data.ms$subject, 
                               label = data.ms$label),
                       mean)

# write the data for course upload
write.table(format(aggr.data, scientific=T), "TidyData.txt",
row.names=FALSE, col.names=FALSE, quote=2)

