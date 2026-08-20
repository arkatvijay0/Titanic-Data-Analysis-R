print("Hello! I am learning R.")

titanic <- read.csv("Titanic-Dataset.csv")

head(titanic)

tail(titanic)

dim(titanic)

names(titanic)

str(titanic)

summary(titanic)

colSums(is.na(titanic))

missing_values <- colSums(is.na(titanic))

missing_values

missing_percentage <- round(
  colSums(is.na(titanic)) / nrow(titanic) * 100,
  2
)

missing_percentage

# Create a copy of the original dataset
titanic_clean <- titanic

# Check the copy
dim(titanic_clean)

median_age <- median(titanic_clean$Age, na.rm = TRUE)

median_age

titanic_clean$Age[
  is.na(titanic_clean$Age)
] <- median_age

sum(is.na(titanic_clean$Age))

table(titanic_clean$Embarked)

mode_embarked <- names(
  sort(table(titanic_clean$Embarked), decreasing = TRUE)
)[1]

mode_embarked

titanic_clean$Embarked[
  is.na(titanic_clean$Embarked)
] <- mode_embarked

sum(is.na(titanic_clean$Embarked))

titanic_clean$Cabin[
  is.na(titanic_clean$Cabin)
] <- "Unknown"

sum(is.na(titanic_clean$Cabin))

colSums(is.na(titanic_clean))

dim(titanic_clean)


# Count duplicate rows
sum(duplicated(titanic_clean))

sum(duplicated(titanic_clean$PassengerId))

# ============================================
# OUTLIER DETECTION
# ============================================

# Boxplot for Age
boxplot(
  titanic_clean$Age,
  main = "Boxplot of Passenger Age",
  ylab = "Age",
  col = "lightblue"
)

Q1_Age <- quantile(titanic_clean$Age, 0.25)
Q3_Age <- quantile(titanic_clean$Age, 0.75)

IQR_Age <- Q3_Age - Q1_Age

Lower_Age <- Q1_Age - 1.5 * IQR_Age
Upper_Age <- Q3_Age + 1.5 * IQR_Age

Q1_Age
Q3_Age
IQR_Age
Lower_Age
Upper_Age

age_outliers <- titanic_clean$Age[
  titanic_clean$Age < Lower_Age |
    titanic_clean$Age > Upper_Age
]

length(age_outliers)

# Boxplot for Fare

boxplot(
  titanic_clean$Fare,
  main = "Boxplot of Passenger Fare",
  ylab = "Fare",
  col = "lightgreen"
)

Q1_Fare <- quantile(titanic_clean$Fare, 0.25)
Q3_Fare <- quantile(titanic_clean$Fare, 0.75)

IQR_Fare <- Q3_Fare - Q1_Fare

Lower_Fare <- Q1_Fare - 1.5 * IQR_Fare
Upper_Fare <- Q3_Fare + 1.5 * IQR_Fare

Q1_Fare
Q3_Fare
IQR_Fare
Lower_Fare
Upper_Fare

fare_outliers <- titanic_clean$Fare[
  titanic_clean$Fare < Lower_Fare |
    titanic_clean$Fare > Upper_Fare
]

length(fare_outliers)


# IQR OUTLIER CALCULATION - AGE

Q1_Age <- quantile(titanic_clean$Age, 0.25)
Q3_Age <- quantile(titanic_clean$Age, 0.75)

IQR_Age <- Q3_Age - Q1_Age

Lower_Age <- Q1_Age - 1.5 * IQR_Age
Upper_Age <- Q3_Age + 1.5 * IQR_Age

cat("Age Q1:", Q1_Age, "\n")
cat("Age Q3:", Q3_Age, "\n")
cat("Age IQR:", IQR_Age, "\n")
cat("Age Lower Limit:", Lower_Age, "\n")
cat("Age Upper Limit:", Upper_Age, "\n")

# Count Age outliers

age_outliers <- titanic_clean$Age[
  titanic_clean$Age < Lower_Age |
    titanic_clean$Age > Upper_Age
]

cat("Number of Age outliers:", length(age_outliers), "\n")

# ---- FARE ----
Q1_Fare <- quantile(titanic_clean$Fare, 0.25)
Q3_Fare <- quantile(titanic_clean$Fare, 0.75)

IQR_Fare <- Q3_Fare - Q1_Fare

Lower_Fare <- Q1_Fare - 1.5 * IQR_Fare
Upper_Fare <- Q3_Fare + 1.5 * IQR_Fare

cat("Fare Q1:", Q1_Fare, "\n")
cat("Fare Q3:", Q3_Fare, "\n")
cat("Fare IQR:", IQR_Fare, "\n")
cat("Fare Lower Limit:", Lower_Fare, "\n")
cat("Fare Upper Limit:", Upper_Fare, "\n")


# OUTLIER TREATMENT - IQR CAPPING FOR FARE
# Create a new cleaned Fare column
titanic_clean$Fare_Clean <- titanic_clean$Fare

# Apply upper and lower IQR limits
titanic_clean$Fare_Clean[
  titanic_clean$Fare_Clean > Upper_Fare
] <- Upper_Fare

titanic_clean$Fare_Clean[
  titanic_clean$Fare_Clean < Lower_Fare
] <- Lower_Fare

# Count Fare outliers

fare_outliers <- titanic_clean$Fare[
  titanic_clean$Fare < Lower_Fare |
    titanic_clean$Fare > Upper_Fare
]

cat("Number of Fare outliers:", length(fare_outliers), "\n")

summary(titanic_clean$Fare_Clean)

cat("Original maximum Fare:", max(titanic_clean$Fare), "\n")

cat("Cleaned maximum Fare:", max(titanic_clean$Fare_Clean), "\n")

boxplot(
  titanic_clean$Fare_Clean,
  main = "Boxplot of Fare After Outlier Treatment",
  ylab = "Cleaned Fare",
  col = "lightgreen"
)

# NORMALIZATION - Min-Max normalization for Age

age_min <- min(titanic_clean$Age)
age_max <- max(titanic_clean$Age)

titanic_clean$Age_Normalized <- (
  titanic_clean$Age - age_min
) / (
  age_max - age_min
)

summary(titanic_clean$Age_Normalized)

# Min-Max normalization for cleaned Fare

fare_min <- min(titanic_clean$Fare_Clean)
fare_max <- max(titanic_clean$Fare_Clean)

titanic_clean$Fare_Normalized <- (
  titanic_clean$Fare_Clean - fare_min
) / (
  fare_max - fare_min
)

summary(titanic_clean$Fare_Normalized)

range(titanic_clean$Age_Normalized)

range(titanic_clean$Fare_Normalized)

head(titanic_clean)

# CATEGORICAL ENCODING

# Check Sex categories
table(titanic_clean$Sex)

# Check Embarked categories
table(titanic_clean$Embarked)

titanic_clean$Sex_Encoded <- ifelse(
  titanic_clean$Sex == "male",
  1,
  0
)

table(
  titanic_clean$Sex,
  titanic_clean$Sex_Encoded
)

titanic_clean$Embarked_Encoded <- ifelse(
  titanic_clean$Embarked == "C",
  0,
  ifelse(
    titanic_clean$Embarked == "Q",
    1,
    2
  )
)

table(
  titanic_clean$Embarked,
  titanic_clean$Embarked_Encoded
)

head(
  titanic_clean[
    c(
      "Sex",
      "Sex_Encoded",
      "Embarked",
      "Embarked_Encoded"
    )
  ]
)

# EXPLORATORY DATA ANALYSIS - Survival counts

table(titanic_clean$Survived)

survival_percentage <- round(
  prop.table(table(titanic_clean$Survived)) * 100,
  2
)

survival_percentage

barplot(
  table(titanic_clean$Survived),
  names.arg = c("Did Not Survive", "Survived"),
  main = "Titanic Survival Distribution",
  xlab = "Survival Status",
  ylab = "Number of Passengers",
  col = c("tomato", "lightgreen")
)

gender_survival <- table(
  titanic_clean$Sex,
  titanic_clean$Survived
)

gender_survival

barplot(
  gender_survival,
  beside = TRUE,
  main = "Survival by Gender",
  xlab = "Gender",
  ylab = "Number of Passengers",
  col = c("tomato", "lightgreen"),
  legend.text = c("Did Not Survive", "Survived")
)

gender_survival_rate <- round(
  prop.table(gender_survival, 1) * 100,
  2
)

gender_survival_rate

# ============================================
# PASSENGER CLASS VS SURVIVAL
# ============================================

class_survival <- table(
  titanic_clean$Pclass,
  titanic_clean$Survived
)

class_survival

class_survival_rate <- round(
  prop.table(class_survival, 1) * 100,
  2
)

class_survival_rate

barplot(
  class_survival,
  beside = TRUE,
  main = "Survival by Passenger Class",
  xlab = "Passenger Class",
  ylab = "Number of Passengers",
  col = c("tomato", "lightgreen"),
  legend.text = c("Did Not Survive", "Survived")
)

# AGE DISTRIBUTION

hist(
  titanic_clean$Age,
  breaks = 20,
  main = "Distribution of Passenger Age",
  xlab = "Age",
  ylab = "Number of Passengers",
  col = "skyblue",
  border = "white"
)

summary(titanic_clean$Age)

class_survival

class_survival_rate

# PASSENGER CLASS VS SURVIVAL
class_survival <- table(
  titanic_clean$Pclass,
  titanic_clean$Survived
)

class_survival

class_survival_rate <- round(
  prop.table(class_survival, 1) * 100,
  2
)

class_survival_rate
barplot(
  class_survival_rate[, 2],
  names.arg = c("1st Class", "2nd Class", "3rd Class"),
  main = "Survival Rate by Passenger Class",
  xlab = "Passenger Class",
  ylab = "Survival Rate (%)",
  ylim = c(0, 100),
  col = "steelblue"
)

# AGE DISTRIBUTION
hist(
  titanic_clean$Age,
  main = "Distribution of Passenger Age",
  xlab = "Age",
  ylab = "Number of Passengers",
  col = "skyblue",
  border = "white"
)


# FARE DISTRIBUTION
hist(
  titanic_clean$Fare_Clean,
  main = "Distribution of Cleaned Passenger Fare",
  xlab = "Fare",
  ylab = "Number of Passengers",
  col = "lightgreen",
  border = "white"
)

# AGE VS FARE

plot(
  titanic_clean$Age,
  titanic_clean$Fare_Clean,
  main = "Age vs Cleaned Fare",
  xlab = "Age",
  ylab = "Cleaned Fare",
  pch = 19,
  col = "steelblue"
)

# CORRELATION ANALYSIS

correlation_data <- titanic_clean[
  c(
    "Survived",
    "Pclass",
    "Age",
    "SibSp",
    "Parch",
    "Fare_Clean"
  )
]

correlation_matrix <- cor(
  correlation_data,
  use = "complete.obs"
)

round(correlation_matrix, 2)

install.packages("corrplot")
library(corrplot)

corrplot(
  correlation_matrix,
  method = "number",
  type = "upper",
  tl.col = "black"
)

install.packages("corrplot")
library(corrplot)

# FINAL DESCRIPTIVE STATISTICS

summary(titanic_clean[
  c(
    "Survived",
    "Pclass",
    "Age",
    "SibSp",
    "Parch",
    "Fare_Clean",
    "Age_Normalized",
    "Fare_Normalized"
  )
])

# Mean values

cat("Mean Age:",
    round(mean(titanic_clean$Age, na.rm = TRUE), 2),
    "\n")

cat("Median Age:",
    round(median(titanic_clean$Age, na.rm = TRUE), 2),
    "\n")

cat("Mean Cleaned Fare:",
    round(mean(titanic_clean$Fare_Clean, na.rm = TRUE), 2),
    "\n")

cat("Median Cleaned Fare:",
    round(median(titanic_clean$Fare_Clean, na.rm = TRUE), 2),
    "\n")

# FINAL DATA QUALITY CHECK

# Number of rows and columns
dim(titanic_clean)

# Missing values
colSums(is.na(titanic_clean))

# Duplicate rows
sum(duplicated(titanic_clean))

summary(titanic_clean[
  c("Survived", "Pclass", "Age", "SibSp",
    "Parch", "Fare_Clean", "Age_Normalized",
    "Fare_Normalized")
])

dim(titanic_clean)

colSums(is.na(titanic_clean))

sum(duplicated(titanic_clean))

cat("Mean Age:", round(mean(titanic_clean$Age, na.rm = TRUE), 2), "\n")
cat("Median Age:", round(median(titanic_clean$Age, na.rm = TRUE), 2), "\n")
cat("Mean Cleaned Fare:", round(mean(titanic_clean$Fare_Clean, na.rm = TRUE), 2), "\n")
cat("Median Cleaned Fare:", round(median(titanic_clean$Fare_Clean, na.rm = TRUE), 2), "\n")

# SAVE CLEANED DATASET

write.csv(
  titanic_clean,
  "Titanic_Cleaned_Week1.csv",
  row.names = FALSE
)
