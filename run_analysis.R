
#################################################################################
##
##  Before running this script in RStudio, set working directory to the location 
##  of this source file:
##
##  - Session | Set Working Directory | To Source File Location

##  Include the required librarys

#install.packages("dplyr")
#install.packages("plyr")
#library(help=dplyr)
library(dplyr)
library(plyr)

#################################################################################
##
##  Step 0: Download and unzip the dataset, if necessary

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip <- "UCI HAR Dataset.zip"

if (!file.exists(zip)) {
  download.file(url, destfile=zip)
  unzip(zip, overwrite=TRUE)
}

#################################################################################
##
##  Step 1: Merge the training and test sets, by catenating rows of the test and 
##          training x, y, and subject files. It's important to catenate them
##          in the same order, train + test:
##
##  - Create the merged measurement set, X
##  - Create the merged activity id column, Y 
##  - Create the merged subject id column, subject
##  - Set the column name for the subject column
##
##  For the moment, we leave the data in these three structures. 
##  We will glue them together into a single data set in a later step.

x_train <- tbl_df(read.table("./UCI HAR Dataset/train/X_train.txt"))
x_test  <- tbl_df(read.table("./UCI HAR Dataset/test/X_test.txt"))
X <- rbind(x_train, x_test)
str(X)

y_train <- tbl_df(read.table("./UCI HAR Dataset/train/y_train.txt"))
y_test  <- tbl_df(read.table("./UCI HAR Dataset/test/y_test.txt"))
Y <- rbind(y_train, y_test)
str(Y)

subject_train <- tbl_df(read.table("./UCI HAR Dataset/train/subject_train.txt"))
subject_test  <- tbl_df(read.table("./UCI HAR Dataset/test/subject_test.txt"))
subject <- rbind(subject_train, subject_test)
str(subject)

colnames(subject) <- c('subject')

#################################################################################
##
##  Step 2: Extract only the measurements on the mean and standard deviation for each measurement
##
##  - Read the features file, which has a list of a column (feature) numbers and feature names
##  - Filter the feature/measurement names to get only those whose names match *std() or *mean() on the end
##  - Select only those columns from the measurement data X, saving the new, reduced measurement set as tidy_X
##  - Set the column names in the measurement table to the raw feature names.

features <- tbl_df(read.table("./UCI HAR Dataset/features.txt", 
                                col.names=c('feature_number', 'feature_name'),
                                stringsAsFactors=FALSE))

myfeatures <- filter(features, grepl("mean\\(\\)|std\\(\\)", feature_name, perl=TRUE))

tidy_X <- select(X, myfeatures$feature_number)
colnames(tidy_X) <- myfeatures$feature_name
str(tidy_X)

#################################################################################
##
##  Step 3: Use descriptive names for the activities in the data set 
##
##  - Use the activity descriptions given in the activity_labels.txt file
##  - Make a new activity column (tidy_Y) that has the activity label, rather than id, 
##    for each observation

activities <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                          col.names=c('activity_number', 'activity_name'),
                          stringsAsFactors=FALSE)

activity_labels <- tolower(activities$activity_name)

##  - For each row in the activity ID column, Y, look up the corresponding activity name/label
tidy_Y_as_list<- lapply(Y, function(activity_id) {activity_labels[activity_id]})

##  - Convert the column from a list to a 1-column table and name the column 'activity'
tidy_Y <- tbl_df(as.data.frame(tidy_Y_as_list, stringsAsFactors=FALSE))

colnames(tidy_Y) <- c('activity')
str(tidy_Y)


#################################################################################
##
##  Step 4: Label the data set with descriptive variable names
##
##  - Do a bunch of string substitutions to create tidy feature names 
##  - Make those tidy feature names the columns names in the tidy measurment table (tidy_X)

raw_colnames <- colnames(tidy_X)
str(raw_colnames)
raw_colnames

tidy_colnames <-
  gsub(' ', '',
    gsub(' Acc ', ' Accel ',
      gsub(' std', ' Stdev',
        gsub(' mean', ' Mean',
          gsub('^f ', 'freq ',
            gsub('^t ', 'time ',
              gsub('([A-Z])', ' \\1',
                gsub('-', ' ',
                  gsub("\\(\\)", "", 
                    gsub("BodyBody", "Body", 
                         raw_colnames
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
str(tidy_colnames)
sort(tidy_colnames)

colnames(tidy_X) <- tidy_colnames
str(tidy_X)


#################################################################################
##
##  Finally, Create a single tidy data set by added the activyt (Y) and subject
##  columns to the tidy measurements (tidythe Tack on the activity and subject 
##  columns to get a complete, tidy data set

tidy_data <- cbind(subject, tidy_Y, tidy_X)
str(tidy_data)


#################################################################################
##
##  Step 5 - For each subject, activity, compute mean of each measurement
##
##  - Use the group_by function to group the measurements by each (subject, activity)
##  - Use summarize_each to compute the mean of all the measurement columns for each group
##

by_subject_activity <- group_by(tidy_data, subject, activity)

tidy_summary <- summarise_each(by_subject_activity, funs(mean))
str(tidy_summary)


#################################################################################
##
##  Write both the ungrouped data and the group summary to csvs
##  Note, we will have to rename to a .txt before we upload tidy_summary to Coursera

write.table(tidy_data, file="tidy_data.csv", sep=",", row.names=FALSE)
write.table(tidy_summary, file="tidy_data_summary.csv", sep=",", row.names=FALSE)


#################################################################################
##
##  Example of reading in the final tidy summary

#my_tidy_summary <- read.csv("tidy_summary.csv", stringsAsFactors=FALSE)
#str(my_tidy_summary)
