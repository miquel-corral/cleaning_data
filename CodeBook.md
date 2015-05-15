# CodeBook for the course assignment

This CodeBook is intended to describe the data and the processing done to achieve the results of the course assignment

## Raw data

The data used in this assignment represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

**Acknowledgment:** Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

### Files and folders comprising the .zip file downloaded from the link above.

- 'README.txt': this file describes the experiments and measurements done, as well as the structure of the data contained in the .zip file

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train' and 'test' folders contain files and folders for train and test datasets originated for two different groups of subjects in the experiment. Their descriptions are equivalent:

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Data files to use in the assignment

To achieve the result of the assignment the data files used are:

* features.txt              --> to get the measurement variable names
* activity_labels.txt       --> to get the activities names
* /test/subject_test.txt    --> to get the users that originated the measurements of the test dataset
* /test/X_test.txt          --> to get the measurements of the test dataset
* /test/y_test.txt          --> to get the activities measured in the test dataset
* /train/subject_train.txt  --> to get the users that originated the measurements of the train dataset
* /train/X_train.txt        --> to get the measurements of the train dataset
* /train/y_train.txt        --> to get the activities measured in the train dataset

So, the files included into the test/Inertial Signals/ and train/Inertial Signals were discarded because as described in the experiment the data contained is processed and summarized to generate the chosen files.

## The processing of data

1. First step was to load different datasets and analyze them to see the possibilities of merging them, and actually merge them. At the same time we started to apply some additional processing to obtain a merged dataset neater than the originals:
  1. Merge subjects
  2. Merge activities and set activities description names from the activities descriptions file (setting the names could have been done later, but I found easier to do it at this step)
  3. Merge measurements and features names according to the features descriptions file.
  4. Merge the three previous dataset to get all variables together.

2. Second step was subset the previous dataset with all measurements to get a subset with the measurements related to mean and standard deviation. This was done according to the variable column names that were loaded from the features file.

3. Third step was to set human readable names to the measurement variables according to the detailed descriptions given in the file 'features_info.txt'.

4. Fourth and last step was the generation of a tidy dataset with the average of each variable for each activity and subject. This was done through the functions available in the dplyr package. 

All this processing is coded and described in comments in the run_analysis.R script. The result of the execution of the script is saved into a file named 'my_tidy_dataset.txt'

## The tidy dataset

The result dataset, according to the assignment statement, is a dataset containing the average of each variable for each activity and subject. It has 35 obs. of 81 variables.

The first variable correspond to subjects identifies that are ranged from 1 to 30.

The second variable correspond to the 6 activities that are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

The rest of the variables are, for each subject and activity, the average or standard deviation of the measurements done upon the frequency and time signals of the accelerometer (acceleration signal) and gyroscope (gravity signal) of the smartphones carried by the subjects while executing the different activities.

Each column name describe if the measurements are of frequency or time, if the measurements are of the gravity or the body acceleration, from the accelerometer or the gyroscope and if it they are mean or standard deviation.

Acceleration measurements are in standard gravitational units 'g'.
The angular velocity measurements from the gyroscope are in radians/second.
