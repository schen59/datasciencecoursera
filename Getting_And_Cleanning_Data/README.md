# How the script works
* The script reads the training and testing data sets together with the feature information, subject information and activity label information to construct a tidy dataset which has the related activity labels and subject labels and it filters out the needed variables for the tidy dataset
* It averages each variables by subject and activity by using dplyr library

# How to run the script
* Make sure __run_anylasis.R__ file is sit in a directory where __UCI HAR Dataset__ is avaiable
* ```source("run_anylasis.R")```
* ```analysis()```
* __result.txt__ will be generated with the dataset

