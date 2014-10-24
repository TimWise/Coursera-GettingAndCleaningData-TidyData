
## The Raw Data
The rawest data in this project was collected from the accelerometers and gyroscopes in Samsung Galaxy S smartphones 
while test subjects performed six activities (standing, sitting, walking, etc.) 

A full description of that rawest data collected from those experiments is available at the 
[UCI Machine Learning Respository](http://archive.ics.uci.edu/ml/index.html):
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

## The Input Data
The input data for the project is slightly processed to make it easier to load into R. 
The data was downloaded from the Coursera website:
 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

There on several key points in understanding the measurment values:

- The raw measurements have an X, Y, and Z component.
- A gyroscope records angular velocity.
- An accelerometer records linear acceleration.
- The linear acceleration was separated into body acceleration and **gravitational acceleration components.
- Body acceleration and angular velocity were derived (using calculus) to compute jerk signals. Jerk is the rate of change of acceleration.
- All of these signals were summarized for a given time period to produce further measures, including minimum, maximum, 
standard deviation, and mean.
- The x, y, and z components

## The Output Data of this Project
The output data of this project is a single csv file that follows the principles of a [tidy data set](http://vita.had.co.nz/papers/tidy-data.pdf).

In the output data:

- Only the mean and standard deviation measures were selected from the input data, 
i.e., only those raw features names included the strings 'mean()' or 'std()'
- And most importantly the data has been summarized: 
	- Each measurement was averaged to report a single, mean value for a person doing an activity.

The shape of the output data is wide. There is a row for each (subject, activity) pair and a column for each measurement. There is exactly 1 measurement value for each (subject, activity) pair.

The columns of the output data are:

- subject - an integer identifying the person being measured
- activity - a categorical field with the values:
	- laying 
	- sitting
	- standing
	- walking
	- walking_upstairs
	- walking_downstairs
- 66 measurement columns - each measurement is continuous value. Values have been normalized and bounded within [-1,1]

The columns names of the measurement columns are similar to the raw columns names, with the following changes:

- Columns names are entirely alpha-numeric so that they are valid R identifiers. (Parenthesis, hyphens, spaces, etc. have been removed.)
- Some abbreviations have been changed (hopefully) for readability:
	- t and f are expanded to time and freq
	- Acc and std are now Accel and Stdev
- Camel case is used since measurement names are long and include many components

The component abbreviations used in measurement names include:

- time | freq
- Body | Gravity
- Accel | Gyro
- Jerk | Mag | JerkMag
- Mean | Stdev
- X | Y | Z

The list of measurements columns is:

- freqBodyAccelJerkMagMean  
- freqBodyAccelJerkMagStdev 
- freqBodyAccelJerkMeanX    
- freqBodyAccelJerkMeanY   
- freqBodyAccelJerkMeanZ    
- freqBodyAccelJerkStdevX  
- freqBodyAccelJerkStdevY  
- freqBodyAccelJerkStdevZ  
- freqBodyAccelMagMean     
- freqBodyAccelMagStdev    
- freqBodyAccelMeanX       
- freqBodyAccelMeanY       
- freqBodyAccelMeanZ       
- freqBodyAccelStdevX      
- freqBodyAccelStdevY      
- freqBodyAccelStdevZ      
- freqBodyGyroJerkMagMean  
- freqBodyGyroJerkMagStdev 
- freqBodyGyroMagMean      
- freqBodyGyroMagStdev     
- freqBodyGyroMeanX        
- freqBodyGyroMeanY        
- freqBodyGyroMeanZ        
- freqBodyGyroStdevX       
- freqBodyGyroStdevY       
- freqBodyGyroStdevZ       
- timeBodyAccelJerkMagMean 
- timeBodyAccelJerkMagStdev
- timeBodyAccelJerkMeanX   
- timeBodyAccelJerkMeanY   
- timeBodyAccelJerkMeanZ   
- timeBodyAccelJerkStdevX  
- timeBodyAccelJerkStdevY  
- timeBodyAccelJerkStdevZ  
- timeBodyAccelMagMean     
- timeBodyAccelMagStdev    
- timeBodyAccelMeanX       
- timeBodyAccelMeanY       
- timeBodyAccelMeanZ       
- timeBodyAccelStdevX      
- timeBodyAccelStdevY      
- timeBodyAccelStdevZ      
- timeBodyGyroJerkMagMean  
- timeBodyGyroJerkMagStdev 
- timeBodyGyroJerkMeanX    
- timeBodyGyroJerkMeanY    
- timeBodyGyroJerkMeanZ    
- timeBodyGyroJerkStdevX   
- timeBodyGyroJerkStdevY   
- timeBodyGyroJerkStdevZ   
- timeBodyGyroMagMean      
- timeBodyGyroMagStdev     
- timeBodyGyroMeanX        
- timeBodyGyroMeanY        
- timeBodyGyroMeanZ        
- timeBodyGyroStdevX       
- timeBodyGyroStdevY       
- timeBodyGyroStdevZ       
- timeGravityAccelMagMean  
- timeGravityAccelMagStdev 
- timeGravityAccelMeanX    
- timeGravityAccelMeanY    
- timeGravityAccelMeanZ    
- timeGravityAccelStdevX   
- timeGravityAccelStdevY   
- timeGravityAccelStdevZ 
