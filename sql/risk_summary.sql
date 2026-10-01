-- Risk Summary
-- Purpose: Count projects in each risk category.

WITH Project_Risk AS (
  SELECT
    A.project_id,
    SUM(A.Overdue_Phase) AS Overdue_Phases,
    AVG(NULLIF(A.Overdue_Delay, 0)) AS Average_Overdue_Delay,

    CASE
      WHEN SUM(A.Overdue_Phase) = 0 THEN 'No Risk'
      WHEN SUM(A.Overdue_Phase) BETWEEN 1 AND 2 THEN 'Low'
      WHEN SUM(A.Overdue_Phase) BETWEEN 3 AND 4 THEN 'Medium'
      WHEN SUM(A.Overdue_Phase) >= 5 THEN 'High'
    END AS Risk_Level

  FROM `project-e48f5d78-a5e7-45de-a67.Project_Performance_Analysis.project_phases` AS A

  JOIN `project-e48f5d78-a5e7-45de-a67.Project_Performance_Analysis.projects` AS B
    ON A.project_id = B.project_id

  GROUP BY A.project_id
)

SELECT
  Risk_Level,
  COUNT(*) AS Number_of_Projects
FROM Project_Risk
GROUP BY Risk_Level
ORDER BY
  CASE Risk_Level
    WHEN 'High' THEN 1
    WHEN 'Medium' THEN 2
    WHEN 'Low' THEN 3
    WHEN 'No Risk' THEN 4
  END;
