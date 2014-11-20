###Getting and cleaning data project
This repository holds the run_analysis.R script, the CodeBook.md and this Readme.md file.


####run_analysis.R
The run_analysis.R script performs the following tasks:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


####step by step information about the run_analysis.R process:
1. Loads plyr, data.table, and dyplyr
2. Sets the path for the UCI HAR Data set
3. Reads 8 text files in to R. 6 initially and 2 later.
4. Merges the data sets together to create one large data set.
5. Labels columns with variable names
6. Extracts mean and standard deviation data from the large data set, and forms a smaller data set.
7. Add descriptive labels to the mean and standard deviation data set.
8. Converts the variables to a more human readable format.
9. Aggregates and order the mean and standard deviation data set
10. Writes the new tidyData.txt to disk.


####CodeBook.md
The CodeBook contains information on the data's origins, the experiment, information on the raw data files, the Variables, the Transformations, as well as discussion on the guidelines for a tidy data set and how the tidyData.txt dataset meets those requirements. 


####tidyData.txt
This file is the tidy and clean end data product and has been uploaded to the coursera website.