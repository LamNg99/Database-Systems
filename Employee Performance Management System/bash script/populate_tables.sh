#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "l93nguye/06038417@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

-- insert some values
-- 3 employers 
INSERT INTO Employer VALUES (345678, '',8, 'Eglinton Avenue', 'Toronto','ON','T5H 7U8');
INSERT INTO Employer VALUES (123456, 'Jessica Lynn',6, 'Dundas Avenue', 'Toronto','ON','U9A HY8');
INSERT INTO Employer VALUES (768532, 'Adam Lee',9, 'Sterling Avenue', 'Toronto','ON','T7H 9U2');

-- 5 employees 
INSERT INTO Employee VALUES (34567, 'Sarah', 'Mills',28,'Female',572873619,'Fulltime',19.25,'345678');
INSERT INTO Employee VALUES (29473, 'Steven', 'Santos',22,'Male',874835802,'Partime',18.25,'123456');
INSERT INTO Employee VALUES (19723, 'Millie', 'Brown',22,'Female',902367280,'Fulltime',16.15,'345678');
INSERT INTO Employee VALUES (98424, 'Mike', 'James',29,'Male',673231619,'Partime',20.25,'768532');
INSERT INTO Employee VALUES (23480, 'Stephanie', 'Joseph',21,'Female',931341482,'Fulltime',15.25,NULL);

-- There are 10 assignments, represents many employees working on many assignments. Each employee works on 2 assignments. 
INSERT INTO Assignment VALUES (1, 'Data pull', 'Pulling data into Excel','2021-12-01',345678,34567,572873619);
INSERT INTO Assignment VALUES (2, 'Data analyze', 'Analze data in PBI','2021-12-02',123456,29473,874835802);
INSERT INTO Assignment VALUES (3, 'Data pipeline', 'Build a data pipeline in Azure','2021-12-03',345678,19723,902367280);
INSERT INTO Assignment VALUES (4, 'Excel extraction', 'Use automation scripts to extract data in Excel','2021-12-04',768532,98424,673231619);
INSERT INTO Assignment VALUES (5, 'SAP extraction', 'Pull data from the SAP systems','2021-12-05',NULL,23480,931341482);

INSERT INTO Assignment VALUES (6, 'Invoice pull', 'Pulling invoice data into Excel','2021-12-06',345678,34567,572873619);
INSERT INTO Assignment VALUES (7, 'Invoice analyze', 'Analze invoice data in PBI','2021-12-07',123456,29473,874835802);
INSERT INTO Assignment VALUES (8, 'Invoice pipeline', 'Build an invoice data pipeline in Azure','2021-12-08',345678,19723,902367280);
INSERT INTO Assignment VALUES (9, 'Invoice extraction', 'Use automation scripts to extract invoice data in Excel','2021-12-09',768532,98424,673231619);
INSERT INTO Assignment VALUES (10, 'Invoice segmentation', 'Segment invoice data','2021-12-10',NULL,23480,931341482);

-- Each employee has 2 evaluations, represents one to many 
INSERT INTO PerformanceEvaluation VALUES (90,96,960,345678, ,572873619);
INSERT INTO PerformanceEvaluation VALUES (50,72,720,345678,34567,572873619);
INSERT INTO PerformanceEvaluation VALUES (20,76,760,123456,29473,874835802);
INSERT INTO PerformanceEvaluation VALUES (30,86,860,123456,29473,874835802);
INSERT INTO PerformanceEvaluation VALUES (10,79,790,345678,19723,902367280);
INSERT INTO PerformanceEvaluation VALUES (32,98,980,345678,19723,902367280);
INSERT INTO PerformanceEvaluation VALUES (80,81,810,768532,98424,673231619);
INSERT INTO PerformanceEvaluation VALUES (30,82,820,768532,98424,673231619);
INSERT INTO PerformanceEvaluation VALUES (27,66,660,NULL,23480,931341482);
INSERT INTO PerformanceEvaluation VALUES (90,99,990,NULL,23480,931341482);

-- many employees work on many Assignments. each employees work on 2
INSERT INTO WorkingOn VALUES (34567,572873619,1,'Data pull');
INSERT INTO WorkingOn VALUES (29473,874835802,2,'Data analyze');
INSERT INTO WorkingOn VALUES (19723,902367280,3,'Data pipeline');
INSERT INTO WorkingOn VALUES (98424,673231619,4,'Excel Extraction');
INSERT INTO WorkingOn VALUES (23480,931341482,5,'SAP Extraction');
INSERT INTO WorkingOn VALUES (34567,572873619,6,'Invoice pull');
INSERT INTO WorkingOn VALUES (29473,874835802,7,'Invoice analyze');
INSERT INTO WorkingOn VALUES (19723,902367280,8,'Invoice pipeline');
INSERT INTO WorkingOn VALUES (98424,673231619,9,'Invoice Extraction');
INSERT INTO WorkingOn VALUES (23480,931341482,10,'Invoice Segmentation');

exit;
EOF
