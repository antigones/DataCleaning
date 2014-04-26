# 1. Merges the training and the test sets to create one data set.
x_train <- read.csv("train/X_train.txt", header = FALSE, sep = "")
x_test <- read.csv("test/X_test.txt", header = FALSE, sep = "")

y_train <- read.csv("train/y_train.txt", header = FALSE, sep = "")
y_test <- read.csv("test/y_test.txt", header = FALSE, sep = "")

subject_train <- read.csv("train/subject_train.txt",header = FALSE, sep = "")
subject_test <- read.csv("test/subject_test.txt", header = FALSE, sep = "")

activity_labels <- read.csv("activity_labels.txt", header = FALSE, sep = "")


x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)


feature_set <- read.csv("features.txt", header= FALSE, sep = "")
features <- feature_set$V2

names(x) <- features


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
purged_x_cols <- names(x)[grep(".*mean\\(\\)|.*std\\(\\)", names(x))]
x_purged <- x[,purged_x_cols]


# 3. Uses descriptive activity names to name the activities in the data set

colnames(activity_labels)[1] <- "activity_type"
colnames(activity_labels)[2] <- "activity"

#Append activity column

x_with_activities <- cbind(x_purged, y)
colnames(x_with_activities)[67] <- "activity_type"

#append subjects column

x_with_subjects <- cbind(x_with_activities, subject)
colnames(x_with_subjects)[68] <- "subject"

# 4. Appropriately labels the data set with descriptive activity names. 
merged <- merge(x_with_subjects, activity_labels)

# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(reshape2)
molten = melt(merged, id = c("activity_type", "activity", "subject"))
melt = dcast(molten, formula = activity_type + activity + subject ~ variable,mean)

tidy <- melt[,2:69]
write.table(tidy, "tidy.txt", row.names = FALSE)