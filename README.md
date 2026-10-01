# Project Performance Analysis

## Project Overview

This project analyzes the performance of 100 projects to identify project delays, financial performance patterns, project risk levels, and data quality issues.

The analysis was designed as a realistic business analysis workflow, starting with data preparation and validation and ending with SQL analysis, dashboards, and actionable recommendations.

## Business Questions

* How many projects are being analyzed?
* How many project phases are overdue?
* How many projects have at least one overdue phase?
* Which project phases experience the most overdue phases?
* Which projects have the highest number of overdue phases?
* Which projects experience the most severe average delays?
* How can projects be classified based on overdue phases?
* What is the distribution of projects across risk levels?
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

### Project Risk Analysis

SQL was used to combine the project and project-phase data, aggregate overdue phases at the project level, calculate average overdue delay, and classify projects into risk levels.

Risk levels were based on the number of overdue phases:

| Risk Level | Overdue Phases | Number of Projects |
| ---------- | -------------: | -----------------: |
| High       |             5+ |                  1 |
| Medium     |            3–4 |                 12 |
| Low        |            1–2 |                 13 |
| No Risk    |              0 |                 74 |

This classification resulted in:

* **100 total projects**
* **26 projects at risk**
* **1 high-risk project**
* **74 projects with no overdue phases**

The risk classification is based only on the number of overdue phases. Average overdue delay was analyzed separately as an additional severity metric.

### Financial Performance

The analysis of 100 projects shows a strong negative linear relationship between budget variance percentage and profit (**R² = 0.7383**).

Projects with higher budget variance tend to have lower profit in the analyzed data.

This finding shows an association between the two variables and does not establish that budget variance causes lower profit.

The Tableau trend-line analysis also produced a statistically significant relationship (**p-value < 0.0001**).

## SQL Analysis

SQL was used to perform project-level risk analysis in Google BigQuery.

The SQL analysis included:

* Joining `projects` and `project_phases`
* Aggregating overdue phases by project
* Calculating average overdue delay
* Classifying projects into risk levels
* Summarizing the number of projects in each risk category

The SQL queries are available in the `sql` folder:

* `project_risk_analysis.sql`
* `risk_summary.sql`

## Key Findings

1. **62 project phases were overdue** across the 100 analyzed projects.
2. **26 projects** had at least one overdue phase.
3. The average overdue delay was approximately **107.1 days** across overdue phases.
4. **Finishes** had the highest number of overdue phases, followed by **Testing & Commissioning**, **Facade**, and **Handover**.
5. Some projects experienced delays across multiple phases, indicating that delays can affect several stages of the same project.
6. **26 projects** were classified as having at least some level of risk based on overdue-phase count.
7. Only **1 project** was classified as high risk under the defined risk classification.
8. Budget variance percentage and profit showed a strong negative linear relationship in the analyzed data.
9. Several data quality issues were identified and should be addressed before using the data for operational reporting.

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
* Use the project risk classification to prioritize projects for further review.
* Review high-risk projects and projects with repeated overdue phases in more detail.
* Track budget variance regularly because higher variance is associated with lower profit in this dataset.
* Introduce data-quality validation rules for dates, financial fields, phone numbers, and text encoding.
* Review project performance regularly using consistent KPIs for delays, risk, and financial performance.

## Tableau Dashboards

The project includes four Tableau dashboards published as part of one Tableau Public workbook.

### 1. Project Performance Overview

This dashboard provides an overview of project volume, overdue phases, projects with overdue phases, average delay, and overdue phases by project phase.

![Project Performance Overview](Screenshot%202026-10-01%20040241.png)

[View Project Performance Overview on Tableau Public](https://public.tableau.com/views/ProjectPerformanceOverview/Dashboard1?:language=en-US)

### 2. Delays Analysis

This dashboard focuses on projects with repeated overdue phases and the average severity of their delays.

![Delays Analysis](Screenshot%202026-10-01%20040302.png)

[View Delays Analysis on Tableau Public](https://public.tableau.com/views/ProjectPerformanceOverview/Dashboard2?:language=en-US)

### 3. Financial Performance

This dashboard shows the relationship between budget variance percentage and profit using a scatter plot and a linear trend line.

![Financial Performance](Screenshot%202026-10-01%20040316.png)

[View Financial Performance on Tableau Public](https://public.tableau.com/views/ProjectPerformanceOverview/FinancialPerformance?:language=en-US)

### 4. Project Risk Snapshot

This dashboard provides a high-level view of project risk levels and overdue phases.

![Project Risk Snapshot](Screenshot%202026-10-02%20003609.png)

[View Project Risk Snapshot on Tableau Public](https://public.tableau.com/views/RGE/ProjectRiskSnapshot?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
It includes:

* Total Projects
* Projects at Risk
* High Risk Projects
* Average Delay per At-Risk Project
* Project risk bubbles based on overdue-phase count
* Risk distribution across projects

The risk dashboard uses the SQL-generated project risk analysis to provide a consolidated view of project risk.

## Tools Used

* **Microsoft Excel** — Data preparation and analysis
* **Google BigQuery / SQL** — Project risk analysis, aggregation, and risk classification
* **Tableau Public** — Data visualization and dashboards
* **GitHub** — Project documentation and portfolio

## Conclusion

This project demonstrates a complete data-analysis workflow from data preparation and validation to SQL analysis, visualization, and business recommendations.

The analysis highlights project delay patterns, project risk levels, financial relationships, and data quality issues that can support better project monitoring and decision-making.
