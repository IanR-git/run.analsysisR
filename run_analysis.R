# Load package
library(dplyr)
# check working directory
getwd()
# check that you have the required files
list.files()
# Read the data files
features <- read.table("UCI HAR Dataset/features.txt",
                       stringsAsFactors = FALSE)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              stringsAsFactors = FALSE)
# Create new training dataset
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Create new test dataset 
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Assign feature names
names(x_train) <- features$V2
names(x_test) <- features$V2

# Merge the two create datasets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Combine into one data set
merged_data <- cbind(subject_data, y_data, x_data)
names(merged_data)[1:2] <- c("subject", "activity")

# Extract mean and standard deviation measurements
mean_std <- merged_data %>%
  select(subject,
         activity,
         matches("mean\\(\\)|std\\(\\)"))

# Rename using descriptive labels
activity_labels$V2 <- gsub("_", " ", activity_labels$V2)

mean_std$activity <- factor(
  mean_std$activity,
  levels = activity_labels$V1,
  labels = activity_labels$V2
)

# Clean variable names
names(mean_std) <- names(mean_std) %>%
  gsub("^t", "Time", .) %>%
  gsub("^f", "Frequency", .) %>%
  gsub("Acc", "Accelerometer", .) %>%
  gsub("Gyro", "Gyroscope", .) %>%
  gsub("Mag", "Magnitude", .) %>%
  gsub("BodyBody", "Body", .)

# Create tidy data set with averages
tidy_data <- mean_std %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

# Write output
write.table(
  tidy_data,
  file = "tidy_data.txt",
  row.names = FALSE
)