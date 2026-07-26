### Exploratory Data Analysis (EDA) & Diagnostic Insights
---
## Project Overview
This repository contains the end-to-end Exploratory Data Analysis (EDA) and diagnostic pipeline for a 1,200-transaction e-commerce dataset. Moving beyond raw data sanitization, this project investigates underlying statistical distributions, identifies revenue-driving signals vs. system noise, evaluates non-linear and linear feature relationships, and translates mathematical outputs into executive business strategy.

---
## Problem Statement
- E-commerce operational datasets often contain noise, skewed metrics, and hidden customer behaviors. Without diagnostic analysis:
- Executive teams risk making strategic decisions based on skewed averages (e.g., mean order value inflated by rare bulk purchases).
- Valuable business signals (like VIP bulk buyers) might be mistakenly discarded as "outliers."
- Cross-selling and pricing leverage opportunities remain unexploited.
- This project addresses these challenges by systematically auditing transaction dynamics, uncovering key revenue levers, and establishing a robust statistical baseline for future predictive modeling.

---
### Tools & Skill Set
## Tools & Libraries
Language: Python 3.x  
Environment: Jupyter Notebook / Anaconda  
Data Manipulation: Pandas, NumPy  
Data Visualization: Matplotlib, Seaborn

---
## Applied Data Science & Analytical Skills  
**Univariate & Bivariate Analysis**: Calculating 5-number summaries, evaluating skewness, and mapping cross-feature dependencies.  
**Anomaly & Outlier Detection**: Utilizing Interquartile Range (IQR) and Z-Score techniques to isolate statistical anomalies.  
**Statistical Rigor**: Applying Pearson Correlation Coefficients (r) while observing confounding variables and avoiding the correlation vs. causation pitfall.  
**Business Analytics & Translation**: Applying the "So What?" test to convert statistical metrics into financial and operational recommendations.

---
## Analytical Mindset & Methodology
The project follows a structured, 4-phase exploratory analytics framework:
1. Baseline Cleaning  
   & Sanitization  

2. Univariate Profiling  
   & Skewness Check  

3. Anomaly & Bivariate Correlation Mapping  

4. Executive Strategy  
   & Recommendations  

---
**1. Data Sanitization:**  
   - Standardized text metrics by trimming leading/trailing whitespace across categorical columns.  
   - Imputed missing CouponCode entries with a standardized NO_COUPON flag to maintain dataset integrity.  
**2. Univariate Profiling & Distribution Analysis**:  
- Computed the 5-Number Summary (Min, Q1, Median, Q3, Max) alongside Mean, Standard Deviation, and Skewness across numerical features (Quantity, UnitPrice, ItemsInCart, TotalPrice).  
**3. Outlier Identification (Noise vs. Signal)**:  
Evaluated continuous metrics using two distinct outlier detection methodologies:  
 - IQR Method: Q1 - 1.5 * IQR and Q3 +1.5 * IQR (Robust against non-normal distributions).  
 - Z-Score Method: Points exceeding |Z| > 3 standard deviations from the mean.  
**4. Bivariate & Relationship Mapping**:  
- Computed a Pearson Correlation matrix and constructed correlation heatmaps to assess feature interactions.  

---
**Key Findings & Outcomes:**  
**1. Revenue Distribution (Right-Skewed Signal)**  
   - Total Dataset Revenue: $1,264,761.96 across 1,200 transactions.  
   - Skewness: TotalPrice exhibits a positive skewness of +0.89.  
   - Central Tendency:Mean Order Value: $1,053.97  
   - Median Order Value: $823.62  
   - Outcome: Reporting the Median ($823.62) provides the true operational baseline for typical customer spending, as the mean is elevated by high-value bulk purchases.  
   
**2. Outlier Analysis Results**
| Metric     |    Method  | Threshold / Bounds | Outlier Count | Classification |  
|------------|------------|--------------------|---------------|----------------|  
| TotalPrice | IQR Method |    > $3,330.41      |   8 Orders    | Signal (VIP Bulk Buyers)|    
| TotalPrice | Z-Score    | \∣Z\∣ >3 (>$3,513.54) |   0 Orders    | Hidden by inflated σ|     

Outcome: The 8 orders exceeding $3,330.41 represent legitimate high-quantity commercial purchases rather than system glitches. They were retained as high-value business signals.  

---
**3. Correlation & Feature Interactions**  
  - UnitPrice vs. TotalPrice (r = +0.72$): Strongest positive driver of total order value.  
   - Quantity vs. ItemsInCart (r = +0.65$): Customers making bulk quantity purchases of single items also add more distinct items to their cart.  
   - Quantity vs. TotalPrice (r = +0.62): Direct positive relationship with total transaction size.  
   - UnitPrice vs. Quantity (r = +0.01): Virtually neutral, indicating low price sensitivity—customers purchase high-ticket items without reducing purchase quantities.  

---
### Recommendations & Business Impact  
- Establish a VIP B2B Retention Track: Target the top 0.7% bulk buyers (> $3,300 order value) with specialized account management to protect high-margin recurring revenue.  
- Implement Cross-Selling Engines at Checkout: Capitalize on the r = +0.65 correlation between Quantity and ItemsInCart by deploying automated product recommendation modules ("Frequently Bought Together").  
- Promote High-Ticket Categories: Leverage low price sensitivity (r = +0.01) and strong price-to-revenue correlation (r = +0.72) by highlighting premium product lines (Chairs, Laptops, Printers) on landing pages to elevate Average Order Value (AOV).  

---
### Conclusion  
- This exploratory diagnostic analysis bridges data engineering baseline steps with strategic business intelligence.  
By identifying right-skewed revenue characteristics, isolating B2B bulk buying signals, and uncovering key pricing-quantity relationships, this project equips decision-makers with actionable, data-backed operational strategies.  

