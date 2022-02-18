#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "l93nguye/06038417@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

SELECT * FROM Employer WHERE City = 'Toronto';
SELECT * FROM Employer WHERE EmployerID = 345678;
SELECT * FROM Employee WHERE Gender = 'Male';
SELECT * FROM Assignment WHERE AssignmentNo = 1;
SELECT * FROM PerformanceEvaluation WHERE Assessment = 96;
SELECT * FROM WorkingOn WHERE AssignmentNo = 2;

-- Employee
SELECT * FROM Employee WHERE  Age > 21 ORDER BY EMPLOYEEID ASC;
SELECT Gender, EmployeeType FROM   Employee WHERE  Gender = 'Male' AND  EmployeeType = 'Partime';
SELECT Gender, EmployeeType FROM   Employee WHERE   (Gender = 'Male'AND  EmployeeType = 'Partime') OR (Gender = 'Female' AND EmployeeType = 'Fulltime');
SELECT EmployeeID, EmployeeFirstName FROM   Employee WHERE  EmployeeFirstName <> 'Sarah';

-- Employer 
SELECT * FROM   Employer WHERE  StreetNo BETWEEN 1 AND 8;

-- PerformanceEvaluation 
SELECT DISTINCT EmployeeID FROM  performanceevaluation WHERE Assessment > 5 ORDER BY EmployeeID;
SELECT 'Average Bonus is ', AVG(Bonus) FROM PerformanceEvaluation;
SELECT MIN(Bonus), MAX(Bonus), AVG(Bonus), VARIANCE(Bonus), STDDEV(Bonus) FROM PerformanceEvaluation;
SELECT EmployerID, AVG(Bonus) FROM   PerformanceEvaluation GROUP BY EmployerID HAVING AVG(Bonus)> (SELECT  AVG(Bonus) FROM    PerformanceEvaluation);

-- Assignment
SELECT * FROM   Assignment WHERE  AssignmentName LIKE 'Data%' OR AssignmentName LIKE 'Invoice%';

-- WorkingOm
SELECT * FROM   WorkingOn WHERE  AssignmentName LIKE 'Invoice%';


CREATE VIEW FemaleEmployees AS
SELECT Employee.EmployeeFirstName, Employee.EmployeeLastName, Employee.Age, WorkingOn.AssignmentName
FROM Employee
FULL OUTER JOIN WorkingOn ON Employee.EmployeeID = WorkingOn.EmployeeID
WHERE Gender = 'Female';

CREATE VIEW TopPerformmane AS
SELECT Employee.EmployeeFirstName, Employee.EmployeeLastName, PerformanceEvaluation.WorkingHours, PerformanceEvaluation.Bonus
FROM PerformanceEvaluation
INNER JOIN Employee ON Employee.EmployeeID = PerformanceEvaluation.EmployeeID
WHERE Assessment > 5;

exit;
EOF