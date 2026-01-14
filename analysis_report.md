# Motion Capture Data Analysis Report

## Dataset Overview

- **Total Trials**: 588
- **Unique Subjects**: 138
- **Average Trials per Subject**: 4.3

### Gender Distribution
gender
female    308
male      280

### Health Condition Distribution
condition
healthy    588

---

## Summary Statistics

|       |    Age |   Height (m) |   Body Mass (kg) |   Walking Speed (m/s) |
|:------|-------:|-------------:|-----------------:|----------------------:|
| count | 588    |       588    |           588    |                588    |
| mean  |  50.4  |         1.69 |            74.54 |                  1.21 |
| std   |  19.69 |         0.1  |            15.03 |                  0.17 |
| min   |  21    |         1.42 |            48    |                  0.8  |
| 25%   |  32.75 |         1.6  |            65    |                  1.1  |
| 50%   |  50    |         1.68 |            72.5  |                  1.19 |
| 75%   |  66    |         1.76 |            82    |                  1.3  |
| max   |  86    |         1.92 |           157    |                  1.79 |

---

## Visualizations

### 1. Age Distribution
![Age Distribution](age_distribution.png)

**Description**: Histogram showing the distribution of subject ages with 5-year intervals. Includes statistical markers for mean (red dashed line), median (cyan dashed line), and quartiles Q1/Q3 (cyan dotted lines). The statistics box shows mean (μ), standard deviation (σ), and median values.

---

### 2. Height Distribution
![Height Distribution](height_distribution.png)

**Description**: Distribution of subject heights measured in meters with 0.05m intervals. Statistical annotations help identify the central tendency and spread of height measurements across the dataset.

---

### 3. Body Mass Distribution
![Body Mass Distribution](weight_distribution.png)

**Description**: Histogram of subject body mass in kilograms with 5kg intervals. Statistical overlays show mean, median, and quartile markers to understand the distribution of participant weights.

---

### 4. Gender Distribution
![Gender Distribution](gender_distribution.png)

**Description**: Pie chart displaying the proportion of subjects by gender. Each slice shows the percentage distribution, providing clear insight into the gender composition of the dataset.

---

### 5. Age Group Distribution
![Age Group Distribution](age_group_distribution.png)

**Description**: Pie chart categorizing subjects into three age groups: Young (<30 years), Middle Age (30-50 years), and Old (>50 years). This provides a high-level view of the age demographics in the study.

---

### 6. Walking Speed Distribution
![Walking Speed Distribution](walking_speed_distribution.png)

**Description**: Distribution of average walking speeds (mean of left and right foot speeds) with 0.1 m/s intervals. Statistical markers indicate the typical walking speeds and variability across all trials.

---

## Correlation Analysis

### 7. Age vs Walking Speed
![Age vs Walking Speed](age_vs_walking_speed.png)

**Description**: Scatter plot examining the relationship between subject age and walking speed with a linear trend line (red dashed). The correlation coefficient in the top-left indicates the strength and direction of the relationship. A negative correlation suggests walking speed decreases with age, consistent with biomechanical research.

---

### 8. Height vs Body Mass
![Height vs Weight](height_vs_weight.png)

**Description**: Correlation between subject height and body mass with trend line analysis. This relationship is typically positive, as taller individuals tend to have greater body mass. The correlation coefficient quantifies this relationship.

---

### 9. Age vs Height
![Age vs Height](age_vs_height.png)

**Description**: Relationship between age and height. This can reveal whether the dataset includes participants across different life stages or shows age-related changes in measured height.

---

### 10. BMI vs Walking Speed
![BMI vs Walking Speed](bmi_vs_walking_speed.png)

**Description**: Correlation between Body Mass Index (BMI) and walking speed. The scatter plot and trend line help identify whether body composition affects gait velocity, with the correlation coefficient indicating the strength of this relationship.

---

## Key Findings

### Age and Walking Speed
- **Correlation coefficient**: -0.293
- Interpretation: Negative correlation suggests walking speed decreases with age

### Height and Body Mass
- **Correlation coefficient**: 0.551
- Interpretation: Strong positive correlation is expected for anthropometric measurements

### BMI and Walking Speed
- **Correlation coefficient**: -0.198
- Interpretation: BMI shows weak or no correlation with walking speed

---

*Report generated automatically from 588 motion capture trials*
