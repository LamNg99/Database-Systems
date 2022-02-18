#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "l93nguye/06038417@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

CREATE TABLE Employer(
    EmployerID      NUMBER NOT NULL,                                       
    EmployerName    VARCHAR2(50) NOT NULL,     
    StreetNo        NUMBER CHECK (StreetNo BETWEEN 1 AND 9999),
    StreetName      VARCHAR2(25) NOT NULL,
    City            VARCHAR2(25) NOT NULL,
    Province        VARCHAR2(2) NOT NULL,
    PostalCode      VARCHAR2(10) NOT NULL,           
    PRIMARY KEY     (EmployerID)
);

CREATE TABLE Employee(
    EmployeeID          NUMBER NOT NULL,            
    EmployeeFirstName   VARCHAR2(25) NOT NULL,
    EmployeeLastName    VARCHAR2(25) NOT NULL,
    Age                 NUMBER CHECK (Age BETWEEN 18 AND 70),
    Gender              VARCHAR2(25) NOT NULL,
    SIN                 NUMBER NOT NULL,            
    EmployeeType        VARCHAR2(25) NOT NULL,
    Rate                DECIMAL CHECK (Rate >= 14.35),
    EmployerID          NUMBER,
    PRIMARY KEY         (EmployeeID, SIN),
    FOREIGN KEY         (EmployerID) REFERENCES Employer(EmployerID)
);

CREATE TABLE Assignment(
    AssignmentNo            NUMBER NOT NULL,       
    AssignmentName          VARCHAR2(50) NOT NULL,
    AssignmentDescription   VARCHAR2(255),
    StartDate               DATE NOT NULL,
    EmployerID              NUMBER,
    EmployeeID              NUMBER,
    SIN                     NUMBER,
    PRIMARY KEY             (AssignmentNo, AssignmentName),
    FOREIGN KEY             (EmployeeID, SIN) REFERENCES Employee,
    FOREIGN KEY             (EmployerID) REFERENCES Employer
);

CREATE TABLE PerformanceEvaluation(
    WorkingHours        NUMBER CHECK (WorkingHours BETWEEN 1 AND 100),
    Assessment          CHAR NOT NULL,
    Bonus               NUMBER,
    EmployerID          NUMBER,
    EmployeeID          NUMBER,
    SIN                 NUMBER,
    PRIMARY KEY         (Assessment),
    FOREIGN KEY         (EmployerID) REFERENCES Employer,
    FOREIGN KEY         (EmployeeID, SIN) REFERENCES Employee
);

CREATE TABLE WorkingOn(
    EmployeeID          NUMBER,
    SIN                 NUMBER,
    AssignmentNo        NUMBER,
    AssignmentName      VARCHAR2(50),
    PRIMARY KEY         (EmployeeID, SIN, AssignmentNo, AssignmentName),
    FOREIGN KEY         (EmployeeID, SIN) REFERENCES Employee,
    FOREIGN KEY         (AssignmentNo, AssignmentName) REFERENCES Assignment
);
exit;
EOF

