# 🚢 Titanic Data Analysis using R

## 📌 Project Overview

This project performs an end-to-end data analysis of the Titanic passenger dataset using R.

The project covers data cleaning, missing-value treatment, outlier detection and treatment, feature normalization, categorical encoding, exploratory data analysis, visualization, and correlation analysis.

## 🎯 Objectives

- Clean and preprocess Titanic passenger data
- Handle missing values
- Detect and treat outliers
- Normalize numerical variables
- Encode categorical variables
- Analyze passenger demographics
- Analyze survival patterns
- Study relationships between variables
- Generate meaningful visualizations

## 🛠️ Technologies Used

- R
- RStudio
- Base R
- CSV
- Data Visualization
- Exploratory Data Analysis

## 📂 Project Structure

Titanic-Data-Analysis-R/
│
├── data/
├── scripts/
├── images/
├── reports/
├── README.md
└── Week1_R_Project.Rproj

## 📊 Dataset

The dataset contains information about 891 Titanic passengers.

Important variables include:

- PassengerId
- Survived
- Pclass
- Name
- Sex
- Age
- SibSp
- Parch
- Ticket
- Fare
- Cabin
- Embarked

## 🧹 Data Cleaning

The following preprocessing steps were performed:

- Missing-value checking
- Age preprocessing
- Fare outlier detection
- Fare outlier treatment
- Min-Max normalization
- Categorical encoding
- Duplicate-row checking

## 📈 Key Results

### Passenger Statistics

- Total passengers: 891
- Mean age: 29.36 years
- Median age: 28 years
- Minimum age: 0.42 years
- Maximum age: 80 years

### Fare Analysis

- Mean cleaned fare: 24.05
- Median cleaned fare: 14.45
- Minimum cleaned fare: 0
- Maximum cleaned fare: 65.63

### Survival Analysis

- Did not survive: 549
- Survived: 342
- Overall survival rate: 38.38%

### Survival by Passenger Class

| Passenger Class | Survival Rate |
|---|---:|
| 1st Class | 62.96% |
| 2nd Class | 47.28% |
| 3rd Class | 24.24% |

## 🔍 Important Findings

1. First-class passengers had the highest survival rate.
2. Third-class passengers had the lowest survival rate.
3. Passenger class and fare showed a strong negative correlation of approximately -0.72.
4. Survival and cleaned fare showed a positive correlation of approximately 0.32.
5. The passenger age distribution was concentrated around the 20–40 age range.
6. Fare values contained significant high-value outliers before treatment.

## 📊 Visualizations

The project includes:

- Passenger age distribution
- Cleaned fare distribution
- Age vs cleaned fare scatter plot
- Age boxplot
- Fare boxplot
- Fare outlier treatment boxplot
- Survival rate by passenger class
- Correlation matrix

## ✅ Data Quality

After preprocessing:

- Missing values: 0
- Duplicate rows: 0
- Final observations: 891
- Final variables: 17

## 👨‍💻 Author

Vijay Kumar A G

M.Tech – Data Science
