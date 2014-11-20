###CodeBook
(Please read down to the end for a discussion on the guidelines for tidy data and how the tidyData.txt dataset meets these requirements)

This CodeBook provides information about the variable, the data and work that has been performaed
on to achieve the tidyData.txt file. 

####The Data's Origins
The raw data was collected from the accelerometers and gyroscopes from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

####The Experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

####The Original Dataset Files
-README.txt: A readme file was provided with the original dataset.

-features_info.txt: Shows information about the variables used on the feature vector.

-features.txt: List of all features.

-activity_labels.txt: Links the class labels with their activity name.

-train/X_train.txt: Training set.

-train/y_train.txt: Training labels.

-test/X_test.txt: Test set.

-test/y_test.txt: Test labels.

-train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

-In addition there are supplmentary files such as the inertia file which havent been directly included in analysis however are available for further analysis.

####The Variables
In the tidyData file there are 68 variables. The Variables have a naming convention that incorporates 3 to 5 data points for each. For example, each variable will begin by referencing time (e.g. timeBodyAccelerometer-mean()-X) or frequency (e.g. frequencyBodyAccelerometer-mean()-X). The next data point to the naming convention is Body or Gravity, these are used to differentiate the acceleration signals. Another key component of the variable naming convention is the device which is was recorded on such as Gyroscope or Accelerometer. The body linear acceleration and angular velocity were derived in time to obtain Jerk signals. In addition, some of the variables recorded the magnitude and this is denoted in the variable name. X, Y, and Z are used to denote 3-axial signals in the X, Y and Z directions, and we have a "mean"" for the mean reading and a "std"" for the standard deviation.

####Transformations
The run_analysis script transformed the data in the following ways:

1. Merged the training and the test sets to create one data set.

2. Extracted only the measurements on the mean and standard deviation for each measurement.

3. Used descriptive activity names to name the activities in the data set.

4. Appropriately labeled the data set with descriptive variable names.

5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.

####Key Guidelines of Tidy Data, and how the tidyData data set satisfies there requirements.
1. Each variable you measure should be in one column. - Although the narrow format is equally acceptable, to satisfy this requirement I have used the wide format to allow each variable to be in one column.
2. Each different observation of that variable should be in a different row. - Each observation has been allotted a different row in the tidyData data set. 
3. There should be one table for each "kind" of variable. - This requirement is less applicable to the project, however should be noted for future projects. 
4. If you have multiple tables, they should include a column in the table that allows them to be linked. - Yes, this is important for any work with databases, however this project is just focused on the one tidyData final product. It is very relevant for the raw data set of course.
5. Include a row at the top of each file with variable names. - The tidyData set has a row at the top with variables names which would facilitate further analysis of the data in the next step.
6. Make variable names human readable AgeAtDiagnosis instead of AgeDx. - The variable names in the tidyData set have been expanded from the original feature descriptions to human readable names for ease of use in the next stage. 
In general data should be saved in one file per table. - Yes it is one table now, so its on one file.

####References
A great deal of the information mentioned above comes from the Getting and Cleaning Data course notes, especially the information on tidy data sets.