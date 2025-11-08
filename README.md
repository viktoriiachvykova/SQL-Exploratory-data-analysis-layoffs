## Objective
To analyze the cleaned data and identify:

- Which companies, countries, and industries had the largest layoffs
- Trends over time (monthly and yearly)
- Rolling totals to visualize the evolution of layoffs
- Outliers and interesting observations

## Key SQL Concepts Used

- GROUP BY, ORDER BY, LIMIT
- Aggregate functions: SUM(), MAX(), MIN()
- CTE (Common Table Expressions)
- Window functions: DENSE_RANK(), OVER (ORDER BY ...)
- Substring operations for date grouping

## Example Insights

- Companies with the most layoffs: Amazon, Meta, Google
- Industries most affected: Tech, Retail, Finance
- Largest single layoffs: Quibi and BritishVolt
- Layoffs peaked in 2023 based on rolling monthly totals

## Tools

- SQL (MySQL)
- Cleaned dataset from Project 1
- GitHub for version control
