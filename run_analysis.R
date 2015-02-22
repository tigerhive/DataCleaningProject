# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each 
#   measurement. 
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

library(data.table)
library(reshape2)
library(plyr)

# Read in all data
# ================
#
# trainData       = 'train/X_train.txt': Training set.
# trainActivities = 'train/y_train.txt': Training actvities.
# trainSubjects   = 'train/subject_train.txt': Each row identifies the subject 
#                    who performed the activity for each window sample. Its 
#                    range is from 1 to 30. 
# testData        = 'test/X_test.txt': Test set.
# testActivities  = 'train/y_train.txt': Training actvities.
# testSubjects    = 'test/subject_test.txt': As trainSubjects but for tests
# features        = 'features.txt': List of all features/variables.
# activityLabels  = 'activity_labels.txt': Links the class labels with their 
#                    activity name.

trainData <- read.table("UCI_HAR_Dataset/train/X_train.txt")
trainActivities <- read.table("UCI_HAR_Dataset/train/y_train.txt")
trainSubjects <- read.table("UCI_HAR_Dataset/train/subject_train.txt")

testData <- read.table("UCI_HAR_Dataset/test/X_test.txt")
testActvities <- read.table("UCI_HAR_Dataset/test/y_test.txt")
testSubjects <- read.table("UCI_HAR_Dataset/test/subject_test.txt")

features <- read.table("UCI_HAR_Dataset/features.txt")
activityLabels <- read.table("UCI_HAR_Dataset/activity_labels.txt")

# Set the column names for the activities and subjects.
colnames(trainActivities)<-c("Activity")
colnames(testActvities)<-c("Activity")
colnames(trainSubjects)<-c("Subject")
colnames(testSubjects)<-c("Subject")

# Step 1
# ======
# Merge the training and the test sets to create one data set.

# Add the actvity and subject columns to the data, as the last columns
trainDataAll<-cbind(trainData,trainActivities)
trainDataAll<-cbind(trainDataAll,trainSubjects)

testDataAll<-cbind(testData,testActvities)
testDataAll<-cbind(testDataAll,testSubjects)

# Check the sizes.  Should have ...
# dim(trainDataAll)
# 7352 x 563
# dim(testDataAll)
# 2947 x 563
dim(trainDataAll)
dim(testDataAll)

# Check we still have activities fully populated for all subjects.
table(trainDataAll$Activity,trainDataAll$Subject)
table(testDataAll$Activity,testDataAll$Subject)

# Merge the two data sets to one, master data set
allData<-rbind(testDataAll,trainDataAll)
# Check the size - should now be 10299 x 562 - and the summary of
# Activity and Subject data
dim(allData)
table(allData$Activity,allData$Subject)

allActivities<-rbind(testActvities,trainActivities)
table(allActivities)

# Step 2
# ======
# Extract only the measurements on the mean and standard deviation for each 
# measurement. 

# From features_info.txt, the means and standard deviations have a format
# mean(): Mean value
# std(): Standard deviation

# Create vectors for the positions of the columns containing '*mean()*'
# and '*std()*'.
# 
meanCols<-grep("std()",features$V2,fixed=TRUE)
stdCols<-grep("mean()",features$V2,fixed=TRUE)

# Combine and sort the vectors, and place in a data.frame
colsPositions<-data.frame(ColumnNames=sort(c(meanCols,stdCols)))

# Merge with the 'features' data set to get the actual names back!
meanAndStdCols<-merge(x=features,y=colsPositions,by.x="V1",by.y="ColumnNames")
meanAndStdCols<-transform(meanAndStdCols, V1 = as.numeric(V1))
meanAndStdCols<-transform(meanAndStdCols, V2 = as.character(V2))
# Get rid of those wretched '()'!
meanAndStdCols$V2<-gsub("()","",meanAndStdCols$V2,fixed=TRUE)
meanAndStdCols$V2<-gsub("-","",meanAndStdCols$V2,fixed=TRUE)
# Add Activity and Subject as the last columns.
meanAndStdCols<-rbind(meanAndStdCols,c(562,"Activity"))
meanAndStdCols<-rbind(meanAndStdCols,c(563,"Subject"))

meanAndStdCols<-transform(meanAndStdCols, V1 = as.numeric(V1))
colnames(meanAndStdCols)<-c("ColumnPositon","ColumnName")

# Now select only those columns ...
meanAndStdData<-allData[,meanAndStdCols$ColumnPositon]
# ...and rename the columns
colnames(meanAndStdData)<-(meanAndStdCols$ColumnName)

dim(meanAndStdData)
table(meanAndStdData$Activity,meanAndStdData$Subject)

# Step 3
# ======
# Use descriptive activity names to name the activities in the data set

allDataWithActivities<-merge(meanAndStdData,activityLabels,by.x="Activity",by.y="V1")
colnames(allDataWithActivities)[69]<-c("ActivityLabel")
table(allDataWithActivities$Activity,allDataWithActivities$Subject)

allDataWithActivities<-arrange(allDataWithActivities,Activity,Subject)

# Step 4
# ======
# Appropriately label the data set with descriptive variable names.
# Hmmm - already done...

# Step 5
# ======
# From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

tidyDataCols<-c("ActivityLabel","Subject")
tidyDataVars<-meanAndStdCols$ColumnName[1:66];
tidyDataM<-melt(allDataWithActivities,id=tidyDataCols,measure.vars=tidyDataVars)
tidyData<-dcast(tidyDataM,ActivityLabel+Subject~variable,mean)

# Round the data to 4 digits, so that it looks better for the submission
double_columns <- sapply(tidyData, typeof) == 'double'
tidyData[double_columns]<-round(tidyData[double_columns], 4)

# Write the data to a file
write.table(tidyData, file="tidyData.txt",row.name=FALSE)


# TESTING
# =======
# Let's do some data checks, by comparing with the original datasets...

tSub<-1    # This subject is in the training data set
aNum<-1    # Activity to test - get the text equivalent
aText<-as.character(activityLabels[activityLabels$V1==aNum,][,2])
vTest<-10  # Variable to test - get the column position and text
vNum<-meanAndStdCols[vTest,][,1]
vText<-meanAndStdCols[vTest,][,2]

# These should give the same results!!
mean(trainDataAll[trainDataAll$Subject==tSub & trainDataAll$Activity==aNum,vNum])
tidyData[tidyData$Subject==tSub & tidyData$Activity==aText,vText]

tSub<-2 # This subject is in the test dataset
aNum<-4
vTest<-20
aText<-as.character(activityLabels[activityLabels$V1==aNum,][,2])
vNum<-meanAndStdCols[vTest,][,1]
vText<-meanAndStdCols[vTest,][,2]

# These should give the same results!!
mean(testDataAll[testDataAll$Subject==tSub & testDataAll$Activity==aNum,vNum])
tidyData[tidyData$Subject==tSub & tidyData$Activity==aText,vText]

# Summarising the data
unique(tidyData$ActivityLabel)
unique(tidyData$Subject)
str(tidyData)
