## A function which solves the course project

loadAndMergeData <- function()
{

  ## Set the working directory. On your machine it will likely be different.

  setwd("/home/matthew/GettingAndCleaningDataHomework/")


  ## Read the tables.
  ## After I wrote this for the first time, I realized that I did not need any sets other than the x training set. 
  ##Still, it felt gross to get rid of all that typing, so I just commented the others out.
  
  print("Loading training data sets")
  xTrainingSet <<- read.table("UCI HAR Dataset/train/X_train.txt")
  yTrainingSet <<- read.table("UCI HAR Dataset/train/y_train.txt")
  subjectTrain <<- read.table("UCI HAR Dataset/train/subject_train.txt")
  #bodyAccXTrain <<- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
  #bodyAccYTrain <<- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
  #bodyAccZTrain <<- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
  #bodyGyroXTrain <<- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
  #bodyGyroYTrain <<- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
  #bodyGyroZTrain <<- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
  #bodyTotalAccXTrain <<- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
  #bodyTotalAccYTrain <<- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
  #bodyTotalAccZTrain <<- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
  
  print("Loading testing data sets")
  xTestSet <<- read.table("UCI HAR Dataset/test/X_test.txt")
  yTestSet <<- read.table("UCI HAR Dataset/test/y_test.txt")
  subjectTest <<- read.table("UCI HAR Dataset/test/subject_test.txt")
  #bodyAccXTest <<- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
  #bodyAccYTest <<- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
  #bodyAccZTest <<- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
  #bodyGyroXTest <<- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
  #bodyGyroYTest <<- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
  #bodyGyroZTest <<- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
  #bodyTotalAccXTest <<- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
  #bodyTotalAccYTest <<- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
  #bodyTotalAccZTest <<- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
  
  print("Data set loading completed")
  print("Merging data")
  xSet <<- rbind(xTrainingSet, xTestSet)
  ySet <<- rbind(yTrainingSet, yTestSet)
  subjectSet <<- rbind(subjectTrain, subjectTest)
  #bodyAccXSet <<- merge(bodyAccXTrain, bodyAccXTest, all=TRUE)
  #bodyAccYSet <<- merge(bodyAccYTrain, bodyAccYTest, all=TRUE)
  #bodyAccZSet <<- merge(bodyAccZTrain, bodyAccZTest, all=TRUE)
  #bodyGyroXSet <<- merge(bodyGyroXTrain, bodyGyroXTest, all=TRUE)
  #bodyGyroYSet <<- merge(bodyGyroYTrain, bodyGyroYTest, all=TRUE)
  #bodyGyroZSet <<- merge(bodyGyroZTrain, bodyGyroZTest, all=TRUE)
  #bodyTotalAccXSet <<- merge(bodyTotalAccXTrain, bodyTotalAccXTest, all=TRUE)
  #bodyTotalAccYSet <<- merge(bodyTotalAccYTrain, bodyTotalAccYTest, all=TRUE)
  #bodyTotalAccZSet <<- merge(bodyTotalAccZTrain, bodyTotalAccZTest, all=TRUE)
  print("Merge Complete")

}


getFeatures <- function()
{

  ## Load the column names. Read table picks up a column of row numbers, and a column of names. We only want the names.
  
  features <<- read.table("UCI HAR Dataset/features.txt")
  features <<- features[,2]


  ## Assign names to the columns of the data
  
  names(xSet) <<- features

}


cleanData <- function()
{

featuresLogical <<- grepl("mean\\(+|std\\(+", features)
filteredXSet <<- xSet[,featuresLogical]
colnames(ySet) <<- "Label"
colnames(subjectSet) <<- "Subject"

returnMe <<- cbind(ySet,subjectSet,filteredXSet)

#write tidy data to file
write.table(returnMe, file="tidyData.txt", row.names=FALSE)

}

runAll <- function()
{
loadAndMergeData()
getFeatures()
cleanData()
}

runAll()