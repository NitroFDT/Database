CREATE DATABASE AdvanceSQL;

CREATE TABLE Employee(
	ID CHAR(10) PRIMARY KEY,
	[Name] VARCHAR(255),
	[Age] VARCHAR(255),
	Gender VARCHAR(255),
	Department VARCHAR(255)
)

INSERT INTO Employee VALUES ('2018020501','Alvaro', '24', 'Male', 'Accounting')
INSERT INTO Employee VALUES ('2018020502','Kath', '23', 'Female', 'Informatics')
INSERT INTO Employee VALUES ('2018020503','Steve', '22', 'Male', 'Finance')
INSERT INTO Employee VALUES ('2018020504','Nina', '25', 'Female', 'Accounting')
INSERT INTO Employee VALUES ('2018020505','Bruce', '21', 'Male', 'Informatics')

-- Cursor
DECLARE @Name VARCHAR(255), @age INT, @department VARCHAR(255)
DECLARE allEmployee CURSOR
FOR 
	SELECT Name, Age, Department
	FROM Employee
OPEN allEmployee
	FETCH NEXT FROM allEmployee INTO @Name, @age, @department
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @Name + ' ' + CAST(@age AS VARCHAR) + ' years old from ' +@department + ' division'
		FETCH NEXT FROM allEmployee INTO @Name, @age, @department
	END
CLOSE allEmployee
DEALLOCATE allEmployee

-- Store Procedure
-- 1
CREATE PROCEDURE viewEmployee @department VARCHAR(255)
AS
	SELECT *
	FROM Employee
	WHERE Department = @department

execute viewEmployee 'Accounting'

-- 2
CREATE PROCEDURE updateEmployee @age INT
AS
	IF EXISTS (SELECT *
				FROM Employee
				WHERE Age = @age)
	BEGIN
		UPDATE Employee
		SET [Name] = 'Mark', Age = 27
		WHERE Age = @age
		PRINT 'Update Data Success!!'
	END
	ELSE
		PRINT 'No Employee Available!!'

execute updateEmployee 25

-- Trigger
CREATE Trigger triggerEmployee
ON Employee
AFTER INSERT
AS
BEGIN
	IF EXISTS(SELECT *
				FROM Employee
				WHERE Department = 'Finance')
	BEGIN
		DELETE FROM Employee
		WHERE Department = 'Finance'
		PRINT 'Employee Deleted!!'
	END
	ELSE
		PRINT 'No Employee Available!!'
END

INSERT INTO Employee VALUES ('2018020506', 'Nina', '20', 'Female', 'Accounting')