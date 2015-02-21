# Data Science
Data Science stuff for Coursera

## Data Cleaning Project

### Summary
This folder contains the run_analysis.R script for producing a tidy data set from the data in the UCI_HAR_Dataset data set.  These data are of the activity of 30 volunteers and contain data collected from the accelerometers from the Samsung Galaxy S smartphone. See the link for more details.... http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The final, tidy data set is written to a file - tidyData.txt

### Data Summary
The data set summarises six different actvities for thirty volunteers (referred to as subjects in the dataset).
The data include accelerometer and gyroscope data, in both XYZ co-ordinates and in Euclidean form.  The data include also frequency data from Fast Fourier Transforms.

For each actvity, the average mean and average standard deviation for each variable for each subject is presented.

The 6 actvities are 

*            WALKING
*   WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
*            SITTING
*           STANDING
*             LAYING

There are 30 subjects(volunteers), represented by numbers 1 through 30.

As such, the dataset comprises 180 observations of 66 variables.
Each record comprises the following fields...

* ActivityLabel           : Factor w/ 6 levels : "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"
* Subject                 : integer :  1..30
* tBodyAccmeanX : numeric : mean body acceleration, X direction, standard gravity units 'g'
* tBodyAccmeanY : numeric : mean body acceleration, Y direction, standard gravity units 'g'
* tBodyAccmeanZ : numeric : mean body acceleration, Z direction, standard gravity units 'g'
* tBodyAccstdX : numeric : standard deviation of body acceleration, X direction, standard gravity units 'g'
* tBodyAccstdY : numeric : standard deviation of body acceleration, Y direction, standard gravity units 'g'
* tBodyAccstdZ : numeric : standard deviation of body acceleration, Z direction, standard gravity units 'g'
* tGravityAccmeanX : numeric : mean gravity acceleration, X direction, standard gravity units 'g'
* tGravityAccmeanY : numeric : mean gravity acceleration, Y direction, standard gravity units 'g'
* tGravityAccmeanZ : numeric : mean gravity acceleration, Z direction, standard gravity units 'g'
* tGravityAccstdX : numeric : standard deviation of gravity acceleration, X direction, standard gravity units 'g'
* tGravityAccstdY : numeric : standard deviation of gravity acceleration, Y direction, standard gravity units 'g'
* tGravityAccstdZ : numeric : standard deviation of gravity acceleration, Z direction, standard gravity units 'g'
* tBodyAccJerkmeanX : numeric : mean body acceleration Jerk, X direction, standard gravity units 'g'
* tBodyAccJerkmeanY : numeric : mean body acceleration Jerk, Y direction, standard gravity units 'g'
* tBodyAccJerkmeanZ : numeric : mean body acceleration Jerk, Z direction, standard gravity units 'g'
* tBodyAccJerkstdX : numeric : standard deviation of body acceleration Jerk, X direction, standard gravity units 'g'
* tBodyAccJerkstdY : numeric : standard deviation of body acceleration Jerk, Y direction, standard gravity units 'g'
* tBodyAccJerkstdZ : numeric : standard deviation of body acceleration Jerk, Z direction, standard gravity units 'g'
* tBodyGyromeanX : numeric : mean gyro acceleration, X direction, radians/second
* tBodyGyromeanY : numeric : mean gyro acceleration, Y direction, radians/second
* tBodyGyromeanZ : numeric : mean gyro acceleration, Z direction, radians/second
* tBodyGyrostdX : numeric : standard deviation of gyro acceleration, X direction, radians/second
* tBodyGyrostdY : numeric : standard deviation of gyro acceleration, Y direction, radians/second
* tBodyGyrostdZ : numeric : standard deviation of gyro acceleration, Z direction, radians/second
* tBodyGyroJerkmeanX : numeric : mean gyro acceleration Jerk, X direction, radians/second
* tBodyGyroJerkmeanY : numeric : mean gyro acceleration Jerk, Y direction, radians/second
* tBodyGyroJerkmeanZ : numeric : mean gyro acceleration Jerk, Z direction, radians/second
* tBodyGyroJerkstdX : numeric : standard deviation of gyro acceleration Jerk, X direction, radians/second
* tBodyGyroJerkstdY : numeric : standard deviation of gyro acceleration Jerk, Y direction, radians/second
* tBodyGyroJerkstdZ : numeric : standard deviation of gyro acceleration Jerk, Z direction, radians/second
* tBodyAccMagmean : numeric : mean body acceleration, Euclidean norm, standard gravity units 'g'
* tBodyAccMagstd : numeric : standard deviation of body acceleration, Euclidean norm, standard gravity units 'g'
* tGravityAccMagmean : numeric : mean gravity acceleration, Euclidean norm, standard gravity units 'g'
* tGravityAccMagstd : numeric : standard deviation of gravity acceleration, Euclidean norm, standard gravity units 'g'
* tBodyAccJerkMagmean : numeric : mean body acceleration Jerk, Euclidean norm, standard gravity units 'g'
* tBodyAccJerkMagstd : numeric : standard deviation of body acceleration Jerk, Euclidean norm, standard gravity units 'g'
* tBodyGyroMagmean : numeric : mean gyro acceleration, Euclidean norm, radians/second
* tBodyGyroMagstd : numeric : standard deviation of gyro acceleration, Euclidean norm, radians/second
* tBodyGyroJerkMagmean : numeric : mean gyro acceleration Jerk, Euclidean norm, radians/second
* tBodyGyroJerkMagstd : numeric : standard deviation of gyro acceleration Jerk, Euclidean norm, radians/second
* fBodyAccmeanX : numeric : mean of Fast Fourier Transform of body acceleration, X direction, frequency in Hz
* fBodyAccmeanY : numeric : mean of Fast Fourier Transform of body acceleration, Y direction, frequency in Hz
* fBodyAccmeanZ : numeric : mean of Fast Fourier Transform of body acceleration, Z direction, frequency in Hz
* fBodyAccstdX : numeric : standard deviation of Fast Fourier Transform of body acceleration, X direction, frequency in Hz
* fBodyAccstdY : numeric : standard deviation of Fast Fourier Transform of body acceleration, Y direction, frequency in Hz
* fBodyAccstdZ : numeric : standard deviation of Fast Fourier Transform of body acceleration, Z direction, frequency in Hz
* fBodyAccJerkmeanX : numeric : mean of Fast Fourier Transform of body acceleration Jerk, X direction, frequency in Hz
* fBodyAccJerkmeanY : numeric : mean of Fast Fourier Transform of body acceleration Jerk, Y direction, frequency in Hz
* fBodyAccJerkmeanZ : numeric : mean of Fast Fourier Transform of body acceleration Jerk, Z direction, frequency in Hz
* fBodyAccJerkstdX : numeric : standard deviation of Fast Fourier Transform of body acceleration Jerk, X direction, frequency in Hz
* fBodyAccJerkstdY : numeric : standard deviation of Fast Fourier Transform of body acceleration Jerk, Y direction, frequency in Hz
* fBodyAccJerkstdZ : numeric : standard deviation of Fast Fourier Transform of body acceleration Jerk, Z direction, frequency in Hz
* fBodyGyromeanX : numeric : mean of Fast Fourier Transform of gyro acceleration, X direction, frequency in Hz
* fBodyGyromeanY : numeric : mean of Fast Fourier Transform of gyro acceleration, Y direction, frequency in Hz
* fBodyGyromeanZ : numeric : mean of Fast Fourier Transform of gyro acceleration, Z direction, frequency in Hz
* fBodyGyrostdX : numeric : standard deviation of Fast Fourier Transform of gyro acceleration, X direction, frequency in Hz
* fBodyGyrostdY : numeric : standard deviation of Fast Fourier Transform of gyro acceleration, Y direction, frequency in Hz
* fBodyGyrostdZ : numeric : standard deviation of Fast Fourier Transform of gyro acceleration, Z direction, frequency in Hz
* fBodyAccMagmean : numeric : mean of Fast Fourier Transform of body acceleration, Euclidean norm, frequency in Hz
* fBodyAccMagstd : numeric :  standard deviation of Fast Fourier Transform of body acceleration, Euclidean norm, frequency in Hz
* fBodyBodyAccJerkMagmean : numeric : mean of Fast Fourier Transform of body acceleration Jerk, Euclidean norm, frequency in Hz
* fBodyBodyAccJerkMagstd : numeric : standard deviation of Fast Fourier Transform of body acceleration Jerk, Euclidean norm, frequency in Hz
* fBodyBodyGyroMagmean : numeric : mean of Fast Fourier Transform of gyro acceleration, Euclidean norm, frequency in Hz
* fBodyBodyGyroMagstd : numeric : standard deviation of Fast Fourier Transform of gyro acceleration, Euclidean norm, frequency in Hz
* fBodyBodyGyroJerkMagmean: numeric  : mean of Fast Fourier Transform of gyro acceleration Jerk, Euclidean norm, frequency in Hz
* fBodyBodyGyroJerkMagstd : numeric : standard deviation of Fast Fourier Transform of gyro acceleration Jerk, Euclidean norm, frequency in Hz


==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 



### Processing steps in detail

Broadly, the script takes the following steps.

* Read in all data
* Merge data into one, master data set
* Extracts only the measurements on the mean and standard deviation for each variable
* Renames columns to be more useful, and converts activity IDs to meaningful character strings
* Creates a final data set with the average of each variable for each activity and each subject
* Additionally, the script rounds the variable values for presentability.
* Finally, some simple checks are made to confirm the data transformations are accurate.

#### Read in all data
The following data.frames are created...

* trainData       from 'train/X_train.txt': Training set.
* trainActivities from 'train/y_train.txt': Training actvities.
* trainSubjects   from 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* testData        from 'test/X_test.txt': Test set.
* testActivities  from 'train/y_train.txt': Training actvities.
* testSubjects    from 'test/subject_test.txt': As trainSubjects but for tests
* features        from 'features.txt': List of all features/variables.
* activityLabels  from 'activity_labels.txt': Links the class labels with their activity name.

The column names for the activities and subjects are set to "Activity" and "Subject" respectively.

####Merge the training and the test sets to create one data set
The columns for the Actvities and Subjects are merged first with their respective data set.
The two resulting data.frames are then merged, to create one, master data set.

Input data sets' dimensions...

* trainDataAll - 7352 x 563
* testDataAll  - 2947 x 563

Combined data set dimensions...

* allData      - 10299 x 563

####Extract only the measurements on the mean and standard deviation for each measurement

From features_info.txt, the means and standard deviations have a format

* mean(): Mean value
* std(): Standard deviation

These columns are extracted, and the column names set from the features data.frame. 
For readability, the '()' and '-' characters are removed.

####Use descriptive activity names to name the activities in the data set
The actvity numbers are replaced with their character string equivalents.

####create a second, independent tidy data set with the average of each variable for each activity and each subject
The master data.frame is reshaped with melt and dcast (from reshape2) to get the mean for each variable.
The data are rounded to four digits for presentability.

####Testing
Some simple data checks are preformed, comparing the means from the reshaped, tidy data set with the original datasets before any reshaping has taken place.

