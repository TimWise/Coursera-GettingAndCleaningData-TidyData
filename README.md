Course project for Getting and Cleaning Data on Coursera
=====================

This project is an example of how to collect, work with, and clean a raw data 
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

Example of how to read in the tidy data set
=====================
The tidy data can easily be read in with the following code:
>	tidydata <- read.csv(...)

