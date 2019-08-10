analysis <- function() {
  library("dplyr")
  trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
  trainY <- read.table("./UCI HAR Dataset/train/Y_train.txt")
  testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
  testY <- read.table("./UCI HAR Dataset/test/Y_test.txt")
  subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  subject <- rbind(subjectTrain, subjectTest)
  colnames(subject) <- c("subject")
  features <- read.table("./UCI HAR Dataset/features.txt")
  activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
  # assign column names from the feature file
  colnames(trainX) <- as.character(features[, 2])
  colnames(trainY) <- c("activity_label")
  colnames(testX) <- as.character(features[, 2])
  colnames(testY) <- c("activity_label")
  xData <- rbind(trainX, testX)
  yData <- rbind(trainY, testY)
  # get all columns with mean and std
  cols <- grepl("-mean\\(\\)|-std\\(\\)", colnames(xData))
  newdata <- xData[, cols]
  newdata <- cbind(newdata, yData)
  newdata <- cbind(newdata, subject)
  newdata$activity_label <- as.character(activities[newdata[, "activity_label"], "V2"])
  # group by subject and activity and mean each column
  r <- data %>% group_by(subject, activity_label) %>% summarise_all(funs(mean))
  write.table(r, file = "./result.txt", row.names = FALSE)
}