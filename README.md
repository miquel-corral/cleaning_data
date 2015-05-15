# Getting and Cleaning Data Course Repo
## Files

This repository contains files for the peer assignment of the Getting and Cleaning Data Course.

* run_analysis.R --> R script to generate the tidy dataset according to the assignment
* CodeBook.md    --> data and processing description to get the tidy dataset from the raw data

## Assumptions

1. Files already downloaded and placed in the working directory (as exercise statement says nothing about the downloading and unzipping of the files, I considered that this is not part of the assignment). On the working directory they should exist the following files and folders:
    ./activity_labels.txt

    ./features.txt
    
    ./test/subject_test.txt
    
    ./test/X_test.txt
    
    ./test/y_test.txt
    
    ./train/subject_train.txt
    
    ./train/X_train.txt
    
    ./train/y_train.txt
    

  The run_analysis.R script placed and executed in the working directory generates the tidy dataset in a file called *tidy_dataset.txt* in the same directory.

2. Packages and libraries necessary for the proper execution of the script already installed and loaded, just as a matter or simplifying the script.

   The package necessary is dplyr that could be installed and loaded with the following instructions:

   > install.packages("dplyr")
   
   > library("dplyr")

## Note about the data used in the assignment

   The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

   [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
