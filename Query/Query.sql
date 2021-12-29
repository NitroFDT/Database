GO
CREATE DATABASE BarbellShop

GO
USE BarbellShop

CREATE TABLE MsStaff(
	StaffId CHAR(5) PRIMARY KEY CHECK(StaffId LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50),
	StaffGender VARCHAR(10),
	StaffSalary INT
)

CREATE TABLE MsBarbell(
	BarbellId CHAR(5) PRIMARY KEY CHECK(BarbellId LIKE 'BL[0-9][0-9][0-9]'),
	BarbellBrand VARCHAR(50),
	BarbellWeight INT,
	BarbellPrice INT
)

CREATE TABLE MsCustomer(
	CustomerId CHAR(5) PRIMARY KEY CHECK(CustomerId LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50),
	CustomerGender VARCHAR(10),
	CustomerPhone VARCHAR(15),
	CustomerAddress VARCHAR(100)
)

CREATE TABLE TransactionHeader(
	TransactionId CHAR(5) PRIMARY KEY CHECK(TransactionId LIKE 'TR[0-9][0-9][0-9]'),
	StaffId CHAR(5) REFERENCES MsStaff(StaffId),
	CustomerId CHAR(5) REFERENCES MsCustomer(CustomerId),
	TransactionDate DATE
)

CREATE TABLE TransactionDetail(
	TransactionId CHAR(5) FOREIGN KEY REFERENCES TransactionHeader(TransactionId),
	BarbellId CHAR(5) FOREIGN KEY REFERENCES MsBarbell(BarbellId),
	Quantity INT,
	PRIMARY KEY(TransactionId, BarbellId)
)

INSERT INTO MsStaff VALUES('ST001', 'Andi', 'Male', 2000000)
INSERT INTO MsStaff VALUES('ST002', 'Dodi', 'Male', 35000000)
INSERT INTO MsStaff VALUES('ST003', 'Monica', 'Female', 3000000)
INSERT INTO MsStaff VALUES('ST004', 'Satria', 'Male', 2000000)
INSERT INTO MsStaff VALUES('ST005', 'Shinta', 'Female', 2500000)
INSERT INTO MsStaff VALUES('ST006', 'Ardi', 'Male', 2000000)
INSERT INTO MsStaff VALUES('ST007', 'Cody', 'Male', 4000000)

INSERT INTO MsBarbell VALUES('BL001', 'Kettlar', 10, 500000)
INSERT INTO MsBarbell VALUES('BL002', 'Vinylor', 10, 475000)
INSERT INTO MsBarbell VALUES('BL003', 'Kettlar', 5, 275000)
INSERT INTO MsBarbell VALUES('BL004', 'Vinylor', 2, 185000)
INSERT INTO MsBarbell VALUES('BL005', 'Stamino', 10, 575000)
INSERT INTO MsBarbell VALUES('BL006', 'Kettlar', 20, 1050000)

INSERT INTO MsCustomer VALUES('CU001', 'Nicky Hendrik Sen', 'Male', '0812333333333', 'Palmerah Street No. 58')
INSERT INTO MsCustomer VALUES('CU002', 'Alfan Orlando', 'Male', '0823948323932', 'Apple Street No. 2')
INSERT INTO MsCustomer VALUES('CU003', 'Jenifer', 'Female', '0812333555333', 'Big Mango Street No. 20')
INSERT INTO MsCustomer VALUES('CU004', 'GenCyc', 'Male', '0810302011943', 'Coconut Ivory Street No. 24')
INSERT INTO MsCustomer VALUES('CU005', 'Susanti', 'Female', '0812333333333', 'Daan Mogot Street No. 5')
INSERT INTO MsCustomer VALUES('CU006', 'Connor Murphy Zach', 'Male', '0899384722222', 'Orange Street No. 51')

INSERT INTO TransactionHeader VALUES('TR001', 'ST002', 'CU001', '03-26-2020')
INSERT INTO TransactionHeader VALUES('TR002', 'ST001', 'CU003', '02-22-2020')
INSERT INTO TransactionHeader VALUES('TR003', 'ST005', 'CU002', '03-24-2020')
INSERT INTO TransactionHeader VALUES('TR004', 'ST006', 'CU006', '03-23-2020')
INSERT INTO TransactionHeader VALUES('TR005', 'ST007', 'CU005', '02-26-2020')
INSERT INTO TransactionHeader VALUES('TR006', 'ST004', 'CU004', '02-28-2020')
INSERT INTO TransactionHeader VALUES('TR007', 'ST003', 'CU001', '01-30-2020')
INSERT INTO TransactionHeader VALUES('TR008', 'ST001', 'CU006', '01-25-2020')
INSERT INTO TransactionHeader VALUES('TR009', 'ST004', 'CU002', '01-21-2020')
INSERT INTO TransactionHeader VALUES('TR010', 'ST007', 'CU003', '12-31-2019')

INSERT INTO TransactionDetail VALUES('TR001', 'BL001', 2)
INSERT INTO TransactionDetail VALUES('TR001', 'BL002', 2)
INSERT INTO TransactionDetail VALUES('TR001', 'BL005', 4)
INSERT INTO TransactionDetail VALUES('TR001', 'BL006', 1)
INSERT INTO TransactionDetail VALUES('TR002', 'BL001', 2)
INSERT INTO TransactionDetail VALUES('TR003', 'BL003', 3)
INSERT INTO TransactionDetail VALUES('TR003', 'BL002', 4)
INSERT INTO TransactionDetail VALUES('TR004', 'BL004', 1)
INSERT INTO TransactionDetail VALUES('TR004', 'BL001', 2)
INSERT INTO TransactionDetail VALUES('TR005', 'BL004', 1)
INSERT INTO TransactionDetail VALUES('TR006', 'BL002', 2)
INSERT INTO TransactionDetail VALUES('TR006', 'BL003', 1)
INSERT INTO TransactionDetail VALUES('TR006', 'BL001', 2)
INSERT INTO TransactionDetail VALUES('TR007', 'BL002', 1)
INSERT INTO TransactionDetail VALUES('TR008', 'BL001', 4)
INSERT INTO TransactionDetail VALUES('TR008', 'BL006', 1)
INSERT INTO TransactionDetail VALUES('TR009', 'BL006', 3)
INSERT INTO TransactionDetail VALUES('TR010', 'BL005', 1)

-- 1
SELECT *
FROM MsCustomer
WHERE len(CustomerName) >= 10

-- 2
SELECT CustomerName,
		[Day of Transaction] = DATENAME(WEEKDAY, TransactionDate)
FROM MsCustomer ms JOIN TransactionHeader th ON ms.CustomerId = th.CustomerId 

-- 3
SELECT [Total Transaction] = COUNT(StaffId)
FROM TransactionHeader
WHERE DATENAME(MONTH, TransactionDate) < 'March' AND YEAR (TransactionDate) <= 2020

--4
SELECT [MONTH] = DATENAME(MONTH, TransactionDate),
		[Total Barbells Sold] = SUM(Quantity),
		[Average Barbells Sold] = AVG(Quantity)
FROM TransactionHeader th JOIN TransactionDetail td ON th.TransactionId = td.TransactionId JOIN MsBarbell mb ON td.BarbellId = mb.BarbellId
WHERE DATENAME(MONTH,TransactionDate) = 'February' AND YEAR(TransactionDate) = '2020'
GROUP BY DATENAME(MONTH,TransactionDate)

UNION

SELECT [MONTH] = DATENAME(MONTH, TransactionDate),
		[Total Barbells Sold] = SUM(Quantity),
		[Average Barbells Sold] = AVG(Quantity)
FROM TransactionHeader th JOIN TransactionDetail td ON th.TransactionId = td.TransactionId JOIN MsBarbell mb ON td.BarbellId = mb.BarbellId
WHERE DATENAME(MONTH,TransactionDate) = 'March' AND YEAR(TransactionDate) = '2020'
GROUP BY DATENAME(MONTH,TransactionDate)

--5
SELECT [Customer Initial] = SUBSTRING(CustomerName,1,1),
	[Total] = CAST(COUNT(BarbellBrand)AS VARCHAR) + ' barbell(s)'
FROM MsCustomer ms JOIN TransactionHeader th ON ms.CustomerId = th.CustomerId JOIN TransactionDetail td ON td.TransactionId = th.TransactionId JOIN MsBarbell mb ON td.BarbellId = mb.BarbellId
WHERE CustomerGender = 'Male' AND (mb.BarbellWeight = 10 OR mb.BarbellWeight = 20)
GROUP BY CustomerName

--6
SELECT CustomerName = REVERSE(SUBSTRING(REVERSE(CustomerName),1,CHARINDEX(' ',REVERSE(CustomerName),1))),
		[Money Spent] = SUM(BarbellWeight * BarbellPrice)
FROM MsCustomer ms JOIN TransactionHeader th ON ms.CustomerId = th.CustomerId JOIN TransactionDetail td ON th.TransactionId = td.TransactionId JOIN MsBarbell mb ON mb.BarbellId = td.BarbellId 
JOIN (SELECT [Average] = AVG(BarbellWeight * BarbellPrice)
		FROM MsBarbell mb
	) as alias ON mb.BarbellId = td.BarbellId
GROUP BY ms.CustomerName, alias.Average
HAVING SUM(BarbellWeight * BarbellPrice) > alias.Average

-- 7
CREATE VIEW ViewCustomerInformation AS
SELECT CustomerName = UPPER(CustomerName),
		CustomerGender,
		CustomerPhone = STUFF(CustomerPhone,1,2,'+62'),
		CustomerAddress
FROM MsCustomer

SELECT *
FROM ViewCustomerInformation

-- 8
CREATE VIEW ViewBarbellBrandTotalWeight AS
SELECT BarbellBrand,
		[Total Weight] = CAST(SUM(BarbellWeight)AS VARCHAR) + ' kg(s)'
FROM MsBarbell
GROUP BY BarbellBrand
HAVING SUM(BarbellWeight) >= 10

SELECT *
FROM ViewBarbellBrandTotalWeight
ORDER BY [Total Weight] DESC

-- 9
ALTER TABLE MsStaff
ADD StaffAddress VARCHAR(100)
ALTER TABLE MsStaff
ADD CONSTRAINT adrs CHECK(StaffAddress LIKE '%Street%')

-- 10
UPDATE MsStaff
SET StaffSalary = (StaffSalary*0.1) + StaffSalary

SELECT *
FROM MsStaff