  ---------------------------MEDIUM------------------------------------
--You are a Database Engineer at TalentTree Inc., an enterprise HR analytics
--platform that stores employee data, including their reporting relationships.
--The company maintains a centralized Employee relation that holds: Each
--employee's ID, name, department, and manager ID (who is also an
--employee in the same table).
--Your task is to generate a report that maps employees to their respective
--managers, showing:
 --.The employee's name and department
 --.Their manager's name and department (if applicable)
--- This will help the HR department visualize the internal reporting
----hierarchy
  
  
  
  CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT NULL 
);


ALTER TABLE Employee
ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmpID);


INSERT INTO Employee (EmpID, EmpName, Department, ManagerID)
VALUES
(1, 'JAY', 'HR', NULL),       
(2, 'shankar', 'Finance', 1),
(3, 'kumar', 'IT', 1),
(4, 'ram', 'Finance', 2),
(5, 'lakshman', 'IT', 3),
(6, 'hanuman', 'HR', 1);

SELECT 
E.EmpName AS [EmployeeName], 
E.Department AS [EmployeeDept], 
M.EmpName AS [Manager Name], 
M.Department AS [ManagerDept]
FROM Employee AS E
JOIN Employee AS M 
ON E.ManagerId = M.EmpID;
--------------------------------------HARD----------------------------------
--To write SQL queries that retrieve requested Net Present Value (NPV) data by performing conditional
 --joins on multiple columns (ID and YEAR) across two related tables, and to handle missing data using 
 --appropriate SQL functions.
 CREATE TABLE YEARS_TBL(
 ID INT,
 YEAR INT,
 NPV INT
)
INSERT INTO YEARS_TBL(ID, YEAR, NPV) 
VALUES
(1,2018,100),
(7,2020,30),
(13,2019,40),
(1,2019,113),
(2,2008,121),
(3,2002,12),
(11,2020,99),
(7,2019,0);

CREATE TABLE QUERIES_TBL(
ID INT,
YEAR INT
);
INSERT INTO QUERIES_TBL(ID, YEAR) 
VALUES
(1,2019),
(2,2008),
(3,2009),
(7,2018),
(7,2019),
(7,2020),
(13,2019);

SELECT Q.*,ISNULL(Y.NPV,0) AS [NPV]
FROM
YEARS_TBL AS Y
RIGHT OUTER JOIN
QUERIES_TBL AS Q
ON 
Y.ID = Q.ID 
AND
Y.YEAR = Q.YEAR


