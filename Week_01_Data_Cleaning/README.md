# Week 01: Data Integrity & Cleaning Pipeline

## Overview
This week focused on **Data Integrity and Preparation**—the foundational 80% phase of data analytics. The objective was to audit, sanitize, and standardize a raw ecommerce dataset containing 1,200 records to achieve a **0% Error Rate** on key data quality metrics.

---

## Tools & Technologies Used
* **Python 3.x**
* **Pandas & NumPy** (Data wrangling & missing value handling)
* **Jupyter Notebook** (Interactive code execution & documentation)
* **GitHub** (Version control & project tracking)

---

## Key Data Operations Executed
1. **Deduplication Audit (CR001):** Scanned 1,200 unique records; confirmed zero duplicate transaction IDs (`OrderID`).
2. **Missing Value Imputation (CR002):** Resolved 309 missing categorical entries in `CouponCode` by imputing `'NO_COUPON'`, preserving 100% of data records without resorting to destructive listwise deletion.
3. **Date Standardization (CR003):** Formatted all timestamp values into the strict **ISO 8601 (`YYYY-MM-DD`)** standard.
4. **Whitespace Scrubbing (CR004):** Cleaned trailing and leading hidden whitespaces across all text/string features to ensure string query consistency.

---

## Key Results & Artifacts
* **0% Error Rate** achieved on Unique Identifiers and Date Formats.
* **100% Data Preservation:** All 1,200 orders and $1,264,761.96 in revenue data preserved.
* **Artifacts Generated:**
  * `Cleaned_Dataset_Project1.csv` (Sanitized dataset)
  * `Change_Log_Project1.csv` (Audit log documenting all transformations)
  * `01_Data_Cleaning_and_Preparation.ipynb` (Reproducible cleaning script)
