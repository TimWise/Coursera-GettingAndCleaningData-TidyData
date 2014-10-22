Course project for Getting and Cleaning Data on Coursera
=====================

This is an example of how to collect, work with, and clean a raw data 
set, creating a tidy data set that can be used for further analysis.

The raw data is a set of measurements from the accelerometers in smart phones
that was collected while test subjects did various activity, e.g., walking, 
running, lying down, etc. In it's current form, the raw data is a set of files 
that is difficult to use for analysis in R.

The goal of this project is to merge the files and normalize the data into 
a single, tidy file.

The files in this repository are:
* README.md - this file, describing how the analysis script works 
* codebook.md - the code book describing the variables in the tidy data set
* run_analysis.R - the R script to download the raw data, convert, and 
create the tidy data from the raw data
* tidydata.csv - the final tidy data set

How the analysis script works
=====================
##	The raw data
The raw data is a set of data files. The best way to understand the relationship 
between the files is with a picture. (This is from 
[David's project FAQ](https://class.coursera.org/getdata-008/forum/thread?thread_id=24)
thread on the course discussion forum.)
![alt text](https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png "The Raw Data")

Example of how to read in the tidy data set
=====================
The tidy data can easily be read in with the following code:
>	tidydata <- read.csv(...)

