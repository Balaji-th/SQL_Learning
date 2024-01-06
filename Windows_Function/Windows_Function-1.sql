-- Refrence: https://learn.microsoft.com/en-us/sql/t-sql/functions/functions?view=sql-server-ver16

SELECT * FROM dbo.Employee;

-- Find Max salary for Each department
SELECT Department, MAX(Salary) AS Max_Salary 
FROM dbo.Employee
GROUP BY Department;

-- Find add column of Highest_Salary to all employees
SELECT *, MAX(Salary) OVER() AS Highest_Salary 
FROM dbo.Employee;

-- Find add column of Highest_Salary to all employees of Department
SELECT *, MAX(Salary) OVER(Partition By Department) AS Highest_Salary 
FROM dbo.Employee;


-- Find Row_Number to all employees
SELECT *, ROW_NUMBER() OVER(Order By EmpId) AS Row_Num
FROM dbo.Employee;

-- Find Row Number to all employees in Each Department
SELECT *, ROW_NUMBER() OVER(Partition By Department Order By EmpId) AS Row_Num
FROM dbo.Employee;

-- From Above Query filter RowNum Having Less than 3
SELECT * 
FROM (SELECT *, ROW_NUMBER() OVER(Partition By Department Order By EmpId) AS Row_Num
	  FROM dbo.Employee) AS e
WHERE e.Row_Num < 3;

-- Add Rank to all employees depend on Salary
SELECT *, RANK() OVER(Order By Salary) AS Row_Num
FROM dbo.Employee;

-- Add Rank to all employees in Each Department depend on Salary
SELECT *, RANK() OVER(Partition By Department Order By Salary DESC) AS Rank_Num
FROM dbo.Employee;

-- Fetch the top 3 employess Each Department depend on Salary
SELECT * 
FROM (SELECT *, RANK() OVER(Partition By Department Order By Salary DESC) AS Rank_Num
	  FROM dbo.Employee) AS e
WHERE e.Rank_Num < 4;

-- Add Rank to all employees depend on Salary (With continues Rank_Num)
SELECT *, DENSE_RANK() OVER(Order By Salary) AS Row_Num
FROM dbo.Employee;

-- Add Rank to all employees in Each Department depend on Salary (With continues Rank_Num)
SELECT *, DENSE_RANK() OVER(Partition By Department Order By Salary DESC) AS Rank_Num
FROM dbo.Employee;

-- Fetch the top 3 employess Each Department depend on Salary
SELECT * 
FROM (SELECT *, DENSE_RANK() OVER(Partition By Department Order By Salary DESC) AS Rank_Num
	  FROM dbo.Employee) AS e
WHERE e.Rank_Num < 4;

--- COMPARE ROW_NUMBER, RANK AND DENSE_RANK
SELECT *,
	ROW_NUMBER() OVER(Partition By Department Order By Salary DESC) AS Row_Num,
	RANK() OVER(Partition By Department Order By Salary DESC) AS Rank_Num,
	DENSE_RANK() OVER(Partition By Department Order By Salary DESC) AS Rank_Num
FROM dbo.Employee


-- Compare Salary of each Employee with Previous Employee
SELECT *, LAG(Salary,1,0) OVER(Order By EmpId) AS Pre_Salary
FROM dbo.Employee;

-- Compare Salary of each Employee with Previous Employee of Each Department
SELECT *, LAG(Salary,1,0) OVER(Partition BY Department Order By EmpId) AS Pre_Salary
FROM dbo.Employee;

-- Compare Salary of each Employee with Previous 2nd Employee of Each Department
SELECT *, LAG(Salary,2,0) OVER(Partition BY Department Order By EmpId) AS Pre_Salary
FROM dbo.Employee;

-- Compare Salary of each Employee with Next Employee of Each Department
SELECT *, LEAD(Salary,1,0) OVER(Order By EmpId) AS Pre_Salary
FROM dbo.Employee;

-- Compare Salary of each Employee with Next Employee of Each Department
SELECT *, LEAD(Salary,1,0) OVER(Partition BY Department Order By EmpId) AS Pre_Salary
FROM dbo.Employee;

-- Compare Salary of each Employee with NEXT 2nd Employee of Each Department
SELECT *, LEAD(Salary,2,0) OVER(Partition BY Department Order By EmpId) AS Pre_Salary
FROM dbo.Employee;




