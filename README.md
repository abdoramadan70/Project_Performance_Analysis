# Project Performance Analysis

## Project Overview
This project analyzes the performance of 100 projects to identify project delays, financial performance patterns, and data quality issues.
The analysis was designed as a realistic business analysis workflow, starting with data preparation and validation and ending with dashboards and actionable recommendations.

## Business Questions

* How many projects are being analyzed?
* How many project phases are overdue?
* How many projects have at least one overdue phase?
* Which project phases experience the most overdue phases?
* Which projects have the highest number of overdue phases?
* Which projects experience the most severe average delays?
* What relationship exists between budget variance and profit?
* What data quality issues need attention?

## Data Preparation

The project uses two main datasets:

* `projects`
* `project_phases`

Data preparation included:

* Checking the structure and completeness of the data
* Identifying invalid and inconsistent values
* Calculating phase delays
* Creating an `Overdue_Phase` indicator
* Creating an `Overdue_Delay` measure
* Validating the final results after correcting the overdue-phase calculation

## Analysis

### Project Performance

* **Total Projects:** 100
* **Total Overdue Phases:** 62
* **Projects with Overdue Phases:** 26
* **Average Overdue Delay:** 107.1 days

### Overdue Phases by Phase

The final analysis identified the following number of overdue phases:

| Phase                   | Overdue Phases |
| ----------------------- | -------------: |
| Finishes                |             13 |
| Testing & Commissioning |             11 |
| Facade                  |             10 |
| Handover                |             10 |
| MEP Rough-In            |              7 |
| Superstructure          |              6 |
| Substructure            |              4 |
| Piling                  |              1 |
| Enabling Works          |              0 |
| Excavation & Shoring    |              0 |

### Financial Performance

The analysis of 100 projects shows a strong negative linear relationship between budget variance percentage and profit (**R² = 0.7383**).

Projects with higher budget variance tend to have lower profit in the analyzed data.

This finding shows an association between the two variables and does not establish that budget variance causes lower profit.

The Tableau trend-line analysis also produced a statistically significant relationship (**p-value < 0.0001**).

## Key Findings

1. **62 project phases were overdue** across the 100 analyzed projects.
2. **26 projects** had at least one overdue phase.
3. The average overdue delay was approximately **107.1 days**.
4. **Finishes** had the highest number of overdue phases, followed by **Testing & Commissioning**, **Facade**, and **Handover**.
5. Some projects experienced delays across multiple phases, indicating that delays can affect several stages of the same project.
6. Budget variance percentage and profit showed a strong negative linear relationship in the analyzed data.
7. Several data quality issues were identified and should be addressed before using the data for operational reporting.

## Data Quality Issues

The analysis identified several issues requiring attention:

* Invalid values in `actual_start`
* Invalid values in `actual_end`
* Negative values in `budget_variance_pct`
* Negative values in `profit`
* A data-type issue in `trn`
* Phone values beginning with `=`
* Encoding issues in `internal_notes`
* Encoding issues in `tags`

These issues should be investigated and corrected in the source system or during the data preparation process.

## Recommendations

Based on the analysis:

* Monitor the project phases with the highest number of overdue phases more closely.
* Investigate projects with repeated overdue phases to identify recurring delay patterns.
* Track budget variance regularly because higher variance is associated with lower profit in this dataset.
* Introduce data-quality validation rules for dates, financial fields, phone numbers, and text encoding.
* Review project performance regularly using consistent KPIs for delays and financial performance.

## Tableau Dashboards

The project includes three Tableau dashboards published as part of one Tableau Public workbook.

### 1. Project Performance Overview

This dashboard provides an overview of project volume, overdue phases, projects with overdue phases, average delay, and overdue phases by project phase.

![Project Performance Overview](dashboard_1_overview.png)

[View Project Performance Overview on Tableau Public](https://public.tableau.com/views/ProjectPerformanceOverview/Dashboard1?:language=en-US)

### 2. Delays Analysis

This dashboard focuses on projects with repeated overdue phases and the average severity of their delays.

![Delays Analysis](dashboard_2_delays.png)

[View Delays Analysis on Tableau Public](https://public.tableau.com/views/ProjectPerformanceOverview/Dashboard2?:language=en-US)

### 3. Financial Performance

This dashboard shows the relationship between budget variance percentage and profit using a scatter plot and a linear trend line.

![Financial Performance](dashboard_3_financial.png)

[View Financial Performance on Tableau Public](https://public.tableau.com/views/ProjectPerformanceOverview/FinancialPerformance?:language=en-US)


## Tools Used

* Microsoft Excel — Data preparation and analysis
* Tableau Public — Data visualization and dashboards
* GitHub — Project documentation and portfolio

## Project Structure

```text
Project_Performance_Analysis
│
├── projects.xlsx
├── project_phases.xlsx
├── Analysis
├── Tableau
└── Documentation
```

## Conclusion

This project demonstrates a complete data-analysis workflow from data preparation and validation to analysis, visualization, and business recommendations.

The analysis highlights project delay patterns, financial relationships, and data quality issues that can support better project monitoring and decision-making.
