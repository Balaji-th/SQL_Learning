-- https://github.com/bytebase/employee-sample-database/tree/main/mysql/dataset_small

Create TABLE [dbo].[Employee]
(
            [EmpId] [int] NULL,
            [EmpName] [varchar](30) NULL,
			[Departmant] [Varchar](30) NULL,
            [Salary] [int] NULL
);

INSERT INTO Employee VALUES
(10001,'Georgi','Human Resources',30000),
(10002,'Bezalel','Development',50000),
(10003,'Parto','Sales',12000),
(10004,'Chirstian','Research',40000),
(10005,'Kyoichi','Testing',26000),
(10006,'Anneke','Development',45000),
(10007,'Tzvetan','Testing',30000),
(10008,'Saniya','Research',36000),
(10009,'Sumant','Testing',32000),
(10010,'Duangkaew','Sales',20000),
(10011,'Mary','Development',50000),
(10012,'Patricio','Development',55000),
(10013,'Eberhardt','Sales',27000),
(10014,'Berni','Development',70000),
(10015,'Guoxiang','Development',52000),
(10016,'Kazuhito','Sales',25000),
(10017,'Cristinel','Development',55000),
(10018,'Kazuhide','Testing',30000),
(10019,'Lillian','Human Resources',45000),
(10020,'Mayuko','Research',56000);


SELECT * FROM Employee;