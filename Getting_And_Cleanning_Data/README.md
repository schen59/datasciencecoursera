# How the script works
* The script reads the training and testing data sets together with the feature information, subject information and activity label information to construct a tidy dataset which has the related activity labels and subject labels and it filters out the needed variables for the tidy dataset
* It averages each variables by subject and activity by using dplyr library

# How to run the script
* Make sure __run_anylasis.R__ file is sit in a directory where __UCI HAR Dataset__ is avaiable
* ```source("run_anylasis.R")```
* ```analysis()```
* __result.txt__ will be generated with the dataset

# Variable names
All the value of variable is an average by subject and activity from the original data sets. 

* __subject__: subject for the data point
* __activity_label__: activity label 
* __tBodyAcc-mean()-X__: mean of body accerlation along X for each subject/activity
* __tBodyAcc-mean()-Y__: mean of body accerlation along Y for each subject/activity
* __tBodyAcc-mean()-Z__: mean of body accerlation along Z for each subject/activity
* __tBodyAcc-std()-X__: mean of body accerlation std along X for each subject/activity
* __tBodyAcc-std()-Y__: mean of body accerlation std along Y for each subject/activity
* __tBodyAcc-std()-Z__: mean of body accerlation std along Z for each subject/activity
* __tGravityAcc-mean()-X__: mean of gravity accerlation along X for each subject/activity
* __tGravityAcc-mean()-Y__: mean of gravity accerlation along Y for each subject/activity
* __tGravityAcc-mean()-Z__: mean of gravity accerlation along Z for each subject/activity
* __tGravityAcc-std()-X__: mean of gravity accerlation std along X for each subject/activity
* __tGravityAcc-std()-Y__: mean of gravity accerlation std along Y for each subject/activity
* __tGravityAcc-std()-Z__: mean of gravity accerlation std along Z for each subject/activity
* __tBodyAccJerk-mean()-X__: mean of body accerlation jerk along X for each subject/activity
* __tBodyAccJerk-mean()-Y__: mean of body accerlation jerk along Y for each subject/activity
* __tBodyAccJerk-mean()-Z__: mean of body accerlation jerk along Z for each subject/activity
* __tBodyAccJerk-std()-X__: mean of body accerlation jerk std along X for each subject/activity
* __tBodyAccJerk-std()-Y__: mean of body accerlation jerk std along Y for each subject/activity
* __tBodyAccJerk-std()-Z__: mean of body accerlation jerk std along Z for each subject/activity
* __tBodyGyro-mean()-X__: mean of body gyro along X for each subject/activity
* __tBodyGyro-mean()-Y__: mean of body gyro along Y for each subject/activity
* __tBodyGyro-mean()-Z__: mean of body gyro along Z for each subject/activity
* __tBodyGyro-std()-X__: mean of body gyro std along X for each subject/activity
* __tBodyGyro-std()-Y__: mean of body gyro std along Y for each subject/activity
* __tBodyGyro-std()-Z__: mean of body gyro std along Z for each subject/activity
* __tBodyGyroJerk-mean()-X__: mean of body gyro jer along X for each subject/activity
* __tBodyGyroJerk-mean()-Y__: mean of body gyro jer along Y for each subject/activity
* __tBodyGyroJerk-mean()-Z__: mean of body gyro jer along Z for each subject/activity
* __tBodyGyroJerk-std()-X__: mean of body gyro jerk std along X for each subject/activity
* __tBodyGyroJerk-std()-Y__: mean of body gyro jerk std along Y for each subject/activity
* __tBodyGyroJerk-std()-Z__: mean of body gyro jerk std along Z for each subject/activity
* __tBodyAccMag-mean()__: mean of body accerlation magnitude for each subject/activity
* __tBodyAccMag-std()__: mean of body accerlation magnitude std for each subject/activity
* __tGravityAccMag-mean()__: mean of gravity accerlation magnitude for each subject/activity
* __tGravityAccMag-std()__: mean of gravity accerlation magnitude std for each subject/activity
* __tBodyAccJerkMag-mean(): mean of body accerlation jerk magnitude for each subject/activity
* __tBodyAccJerkMag-std()__: mean of body accerlation jerk magnitude std for each subject/activity
* __tBodyGyroMag-mean()__: mean of body gyro magnitude for each subject/activity
* __tBodyGyroMag-std()__: mean of body gyro magnitude std for each subject/activity
* __tBodyGyroJerkMag-mean__: mean of body gyro jerk magnitude for each subject/activity
* __tBodyGyroJerkMag-std()__: mean of body gyro jerk magnitude for each subject/activity
* __fBodyAcc-mean()-X__: mean of FFT body acceration along X for each subject/activity
* __fBodyAcc-mean()-Y__: mean of FFT body acceration along Y for each subject/activity
* __fBodyAcc-mean()-Z__: mean of FFT body acceration along Z for each subject/activity
* __fBodyAcc-std()-X__: mean of FFT body acceration std along X for each subject/activity
* __fBodyAcc-std()-Y__: mean of FFT body acceration std along Y for each subject/activity
* __fBodyAcc-std()-Z__: mean of FFT body acceration std along Z for each subject/activity
* __fBodyAccJerk-mean()-X__: mean of FFT body acceration jerk along X for each subject/activity
* __fBodyAccJerk-mean()-Y__: mean of FFT body acceration jerk along Y for each subject/activity
* __fBodyAccJerk-mean()-Z__: mean of FFT body acceration jerk along Z for each subject/activity
* __fBodyAccJerk-std()-X__: mean of FFT body acceration jerk std along X for each subject/activity
* __fBodyAccJerk-std()-Y__: mean of FFT body acceration jerk std along Y for each subject/activity
* __fBodyAccJerk-std()-Z__: mean of FFT body acceration jerk std along Z for each subject/activity
* __fBodyGyro-mean()-X__: mean of FFT body gyro along X for each subject/activity
* __fBodyGyro-mean()-Y__: mean of FFT body gyro along Y for each subject/activity
* __fBodyGyro-mean()-Z__: mean of FFT body gyro along Z for each subject/activity
* __fBodyGyro-std()-X__: mean of FFT body gyro std along X for each subject/activity
* __fBodyGyro-std()-Y__: mean of FFT body gyro std along Y for each subject/activity
* __fBodyGyro-std()-Z__: mean of FFT body gyro std along Z for each subject/activity
* __fBodyAccMag-mean()__: mean of FFT body acceration magnitude for each subject/activity
* __fBodyAccMag-std()__: mean of FFT body acceration magnitude std for each subject/activity
* __fBodyBodyAccJerkMag-mean()__: mean FFT body acceration jerk magnitude for each subject/activity
* __fBodyBodyAccJerkMag-std()__: mean of FFT body acceration jerk magnitude std for each subject/activity
* __fBodyBodyGyroMag-mean()__: mean of FFT body gyro magnitude for each subject/activity
* __fBodyBodyGyroMag-std()__: mean of FFt body gyro magnitude std for each subject/activity
* __fBodyBodyGyroJerkMag-mean()__: mean of body gyro jerk magnitude for each subject/activity
* __fBodyBodyGyroJerkMag-std()__: mean of body gyro jerk magnitude std for each subject/activity