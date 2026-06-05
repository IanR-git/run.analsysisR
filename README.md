Overview Coursera project

This git repository contains the files described for the Coursera Getting and Cleaning Data course project. The aim of the excercise is to collect, clean and prepare a dataset for analysis.

The data used in this project come from the Human Activity Recognition Using Smartphones Dataset collected using Samsung phones. 

The following files are included:
run_analysis.R
R script that performs the data cleaning and transformation process.
tidy_data.txt
Final tidy dataset containing descriptive statistics of each variable for each activity and each subject.
CodeBook.md
Describes the variables, data, and transformations performed to clean the dataset.
README.md
Explains the contents of the repository and how the analysis is performed.

Data Source
The dataset was obtained from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Analysis Steps
The script run_analysis.R performs the following operations:
Reads the training and test datasets.
Merges the training and test datasets into one dataset.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to replace activity identifiers.
Labels the dataset with descriptive variable names.
Creates a second independent tidy dataset containing the average of each variable for each activity and each subject.
Writes the final tidy dataset to tidy_data.txt.
Running the Script
Download and unzip the UCI HAR Dataset.
Place the run_analysis.R script in the working directory.
Set the working directory to the folder containing the dataset.

Run:
source("run_analysis.R")
The tidy dataset will be generated as tidy_data.txt.

The resulting tidy dataset contains:

One row for each combination of subject and activity.
The average of each selected measurement variable.
Descriptive variable names for improved readability.
