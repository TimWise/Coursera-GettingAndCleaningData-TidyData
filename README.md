## Course project for Getting and Cleaning Data on Coursera

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
* run\_analysis.R - the R script to download the raw data, convert, and 
create the tidy data from the raw data

### The raw data

The raw data is a set of data files. The best way to understand the relationship 
between the files is with a picture. (This is from 
[David's project FAQ](https://class.coursera.org/getdata-008/forum/thread?thread_id=24)
thread on the course discussion forum.)
![alt text](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png "The Raw Data")

The raw data file includes:

* X\_train.txt, X\_test.txt - These are the measurement files, broken into a two sets, probably for a machine learning exercise, 
one is a set for training a model, and another is a set for testing the model. In our analysis, we want to concatenate the two into a single measurement set.
The measurement files does not have a column header line, nor does it identify test subject and the activity they were doing. That information 
is contained in the other files.
* features.txt - The names of the columns in the measurement files.
In our analysis, we create tidy column names and use them to create named columns in our data set and and column headers in our output file.
* subject\_train.txt, subject\_test.txt - The test subject identifier. In our analysis, this will become a column in the tidy data set.
Each row in the subject file correspond to a row in the measurement file.
* Y\_train.txt, Y\_test.tx - The identifier of the activity that the test subject is doing at the time of the measurement. In our analysis, this will become a column in the tidy data set.
* activity\_labels.txt - Map an activity identifier to a textual description, e.g. walking, running, lying down, etc.

### The analysis

In this analysis, we glued the multiple raw files into single data set in the following way:

1. Merge the training and test sets, including the measurements, subject id, and activity id, into a single data set
1. Selected (or project in SQL terms) a subset of the measurement columns. 
1. Replace the activity ID with the descriptive names in the activity\_labels.txt file
1. Construct descriptive column names for the data set
1. Summarize the measurements, reporting the average measurement for each activity a test subject did.
1. Write the tidy data set to tidy\_data\_summary.csv

See the comments in the analysis script for the details of how the tidy, output file is created.

The [code book](https://github.com/TimWise/tidydata/blob/master/codebook.md) describes the output file in more detail.

### How to use the analysis script

Prerequisites before running the analysis script:

* You might need to install required packages, if your R environment does not have them, or uncomment the install.package lines in the script.
* The analysis script will download the raw data, if it doesn't already exist. You need to be connected otherwise the download will fail.
* After opening run_analysis.R in RStudio, it is best to set the working directory to where the source file lives. Do
	- Session | Set Working Directory | To Source File Location

To run the script, :

* Open **run\_analysis.R** a in RStudio, 
* Set the working directory
* Select the entire script body, and 
* Run it

The output file of the script, named **tidy\_data\_summary.csv**, will be created in the working directory.

There is another files created, tidy\_data.csv, that is similar, but the measurements have not been summarized (averaged). This second file was used to verify the summarized data set.

### Example of how to read in the tidy data set

After running the script, the tidy data summary created by by the script can be read in with the following code:
>	tidy\_summary <- read.csv("tidy\_data\_summary.csv", stringsAsFactors=FALSE)

###	Future enhancements

List of enhancements to be considered:

* Make required package installations automatic, if needed. Use require() instead of library()
* Make 'missing datafile' error more robust.
* Consider using full words in measurement names
*
