---
[![CI Pipeline](https://github.com/nogibjj/zihan_cloud_hosted_ipynb_week9/actions/workflows/cicd.yml/badge.svg)](https://github.com/nogibjj/zihan_cloud_hosted_ipynb_week9/actions/workflows/cicd.yml)
# Diamonds Dataset Analysis

This repository contains a data analysis of a diamonds dataset using Python. The analysis focuses on understanding the relationships between different features in the dataset and explores the distribution of diamond prices. 

## Dataset

The dataset used for this analysis is sourced from [University of Illinois WAF Discovery](https://waf.cs.illinois.edu/discovery/diamonds.csv) and includes information on diamond characteristics such as carat, cut, color, clarity, depth, table, price, and dimensions. 

## Project Structure

The project consists of the following key files:

- **`requirements.txt`**: Lists the dependencies needed for this project.
- **`Makefile`**: Defines commands to set up, format, lint, and test the project.
- **Notebook**: The code for the analysis is provided in a Jupyter notebook.
- **`README.md`**: Project documentation (this file).

## Installation

To set up this project, follow these steps:

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```
2. Install dependencies by running:
   ```bash
   make install
   ```

3. Set up Jupyter for notebook execution and testing:
   ```bash
   pip install jupyter nbval
   ```

## Analysis Overview

The analysis includes the following steps:

1. **Data Loading**:
   - Load the diamonds dataset into a pandas DataFrame for easy data manipulation.
   
2. **Missing Value Check**:
   - Identify if there are any missing values in the dataset.

3. **Descriptive Statistics**:
   - Calculate basic descriptive statistics for numerical columns to understand the distribution of data points.

4. **Correlation Analysis**:
   - Calculate the correlation matrix for numerical features to understand relationships between different variables.
   - Visualize the correlation matrix with a heatmap to interpret the relationships.

5. **Grouped Analysis**:
   - Calculate the mean price of diamonds based on their `cut` to explore how different cuts affect price.

6. **Price Distribution**:
   - Create a histogram of the `price` column to visualize the distribution of diamond prices.

## Code Execution

To run the analysis in a Jupyter notebook, execute each code block sequentially:

```python
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

# Load the dataset
df = pd.read_csv("https://waf.cs.illinois.edu/discovery/diamonds.csv")

# Check for missing values
print(df.isnull().sum())

# Calculate descriptive statistics
print(df.describe())

# Correlation Analysis
numerical_df = df.select_dtypes(include=np.number)  
correlation_matrix = numerical_df.corr()
print(correlation_matrix)

# Heatmap Visualization of Correlation Matrix
plt.figure(figsize=(12, 10))
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt=".2f")
plt.title('Correlation Matrix')
plt.show()

# Grouped Analysis by Cut
average_price_by_cut = df.groupby('cut')['price'].mean()
print(average_price_by_cut)

# Histogram of Price
plt.hist(df['price'], bins=20)
plt.xlabel('Price')
plt.ylabel('Frequency')
plt.title('Histogram of Price')
plt.show()
```

## Makefile Commands

The `Makefile` includes the following commands for streamlined setup and testing:

- `make install`: Install dependencies.
- `make format`: Format code with `black`.
- `make lint`: Lint code with `ruff`.
- `make test`: Run tests and notebook validation using `pytest` and `nbval`.

## Results

The results from this analysis provide insights into the following:

- The distribution and key statistics of diamond prices.
- How different cuts affect the average price.
- Relationships between numerical variables such as carat, depth, table, and price.

## License

This project is licensed under the MIT License.

--- 
