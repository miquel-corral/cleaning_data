#########################################
#
# Exercise statement
#
#########################################
#
# You should create one R script called run_analysis.R that does the following. 
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
#
# From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.
#
######################################### 
#
# Assumptions
# 
#########################################
#
# 1. Files already downloaded and placed in the working directory (as exercise statement says nothing 
#    about the downloading and unzipping of the files, I considered that this is not part of the assignment).
#    On the working directory they should exist the following files and folders:
#    ./activity_labels.txt
#    ./features.txt
#    ./test/subject_test.txt
#    ./test/X_test.txt
#    ./test/y_test.txt
#    ./train/subject_train.txt
#    ./train/X_train.txt
#    ./train/y_train.txt
#
# 2. Packages and libraries necessary for the proper execution of the script already installed and loaded,
#    just as a matter or simplifying the script.
# 
#    The pakage necessary is dplyr that could be installed and loaded with the following instructions:
#
#    install.packages("dplyr")
#    library("dplyr")
#
############################################
#
# 0. load and inspect different datasets
#
test_subject <- read.table("./test/subject_test.txt")     # 2947 obs. 1 variable
test_x <- read.table("./test/X_test.txt")                 # 2947 obs. 561 variables
test_y <- read.table("./test/y_test.txt")                 # 2947 obs. 1 variable
#
train_subject <- read.table("./train/subject_train.txt")  # 7352 obs. 1 variable
train_x <- read.table("./train/X_train.txt")              # 7352 obs. 561 variables 
train_y <- read.table("./train/y_train.txt")              # 7352 obs. 1 variable
#
features <- read.table("./features.txt")                  # 561 obs. 2 variables
activity_labels <- read.table("./activity_labels.txt")    # 6 obs. 2 variables
#
# 1. merge test and train datasets
#
#    merge subjects
subject <- rbind(test_subject, train_subject)             
colnames(subject) <- "subject"
#
#    merge labels and set activities names from activities description dataset
activity <- rbind(test_y, train_y)  
colnames(activity) <- "activity"
activity <- merge(activity, activity_labels, by=1)[,2]
#
#    merge data and set column names from features description dataset
data <- rbind(test_x, train_x)                            
colnames(data) <- features[, 2]
#
#    put together in a single dataset
my_dataset <- cbind(subject, activity, data)
#
# 2. only mean and standard deviation measurements (feature names used to get them)
#
search <- grep("-mean|-std", colnames(my_dataset))
my_short_dataset <- my_dataset[,c(1,2,search)]
#
# 3. Uses descriptive activity names to name the activities in the data set
#
#    This was achieved in step 1 using activities description file
#
# 4. Appropriately labels the data set with descriptive variable names. 
#
#    In step 1 we loaded variable names according features file. Now we make some string treatment
#    to set human readable variable names according to the feature descriptions in feature_info.txt file
#
names(my_short_dataset)<-gsub("^t", "time", names(my_short_dataset))
names(my_short_dataset)<-gsub("^f", "frequency", names(my_short_dataset))
names(my_short_dataset)<-gsub("Acc", "Accelerometer", names(my_short_dataset))
names(my_short_dataset)<-gsub("Gyro", "Gyroscope", names(my_short_dataset))
names(my_short_dataset)<-gsub("Mag", "Magnitude", names(my_short_dataset))
names(my_short_dataset)<-gsub("BodyBody", "Body", names(my_short_dataset))
#
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.
#
my_tidy_dataset <- my_short_dataset %>% group_by(subject, activity) %>% summarise_each(funs(mean)) %>% arrange(subject, activity)
#
#  Save the final dataset
#
write.table(my_tidy_dataset, file="./my_tidy_dataset.txt")



