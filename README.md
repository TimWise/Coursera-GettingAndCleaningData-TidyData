Course project for Getting and Cleaning Data on Coursera
=====================

This is an example of how to collect, work with, and clean a raw data 
set, creating a tidy data set that can be used for further analysis.

The raw data is a set of measurements from the accelerometers in smart phones
that was collected while test subjects did various activity, e.g., walking, 
running, lying down, etc. In it's current form, the raw data is a set of files 
that is difficult to use for analysis.

The goal of this project is to merge the files and normalize the data into 
a single, tidy file.

The files in this repository are:
* README.md - this file, describing how the analysis script works 
* codebook.md - the code book describing the variables in the tidy data set
* run_analysis.R - the R script to download the raw data, convert, and 
create the tidy data from the raw data
* tidydata.csv - the final tidy data set

The raw data
=====================
The raw data is a set of data files. The best way to understand the relationship 
between the files is with a picture. (This is from 
[David's project FAQ](https://class.coursera.org/getdata-008/forum/thread?thread_id=24)
thread on the course discussion forum.)
![alt text](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png "The Raw Data")

The raw data file includes:
* X_train.txt, X_test.txt - These are the measurement files, broken into a two sets, probably for a machine learning exercise, 
one is a set for training a model, and another is a set for testing the model. For our analysis, we want to catentate the two into a single measurement set.
The measurement files does not have a column header line, nor does it identify test subject and the activity they were doing. That information 
is contained in the other files.
* features.txt - The names of the columns in the measurement files.
In our analysis, we create tidy column names and use them to create named columns in our data set and and column headers in our output file.
* subject_train.txt, subject_test.txt - The test subject identifier. In our analysis, this will become a column in the tidy data set.
Each row in the subject file corresponse to a row in the measurement file.
* Y_train.txt, Y_test.tx - The identifier of the activity that the test subject is doing at the time of the measurement. In our analysis, this will become a column in the tidy data set.
* activity_labels.txt - Map an activity identifer to a textual description, e.g. walking, running, lying down, etc.

How the analysis script works
=====================
In this analysis, we glued the multiple raw files into single data set in the following way:
* Merge the training and test sets, including the measurements, subject id, and activity id, into a single data set
* Selected (project, in SQL terms) a subset of the measurement columns. The select columns are described in the [code book](https://github.com/TimWise/tidydata/blob/master/codebook.md)
* Replace the activity ID with the descriptive nnames in the activity_labels.txt file
* Construct descriptive column names for the data set
* Summarizes the measurements, reporting the average of the measurements for each activity a test subject did. See the code book for more information.
* Write the tidy data set to an output file

Example of how to read in the tidy data set
=====================
After running the script, the tidy data summary created by by the script can be read in with the following code:
>	tidy_summary <- read.csv("tidy_data_summary.csv", stringsAsFactors=FALSE)

