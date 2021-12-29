CREATE DATABASE TStore  
USE TStore

-- 2301903481 - David Taslim
-- 2301904143 - Vicky Chen
-- 2301861043 - Nicholas Anderson
-- 2301861516 - Raditya Fauzan Dwiantono

--Bagian B :
CREATE TABLE Category(
	CategoryID		CHAR(5) PRIMARY KEY CHECK (CategoryID LIKE 'CA[0-9][0-9][0-9]'),
	CategoryName	VARCHAR(50)
)

CREATE TABLE Cloth( 
	ClothID		CHAR(5) PRIMARY KEY CHECK(ClothID  LIKE 'CL[0-9][0-9][0-9]'),
	ClothBrand	VARCHAR(100) CHECK(LEN(ClothBrand) > 5 ),
	ClothPrice	NUMERIC(11,2) CHECK (ClothPrice >= 20000),
	CategoryID	CHAR(5),
	ClothStock	INT,
	FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID)
)

CREATE TABLE Vendor(
	VendorID		CHAR(5) PRIMARY KEY CHECK (VendorID LIKE  'VE[0-9][0-9][0-9]'),
	VendorName		VARCHAR(50),
	VendorAddress	VARCHAR(255),
	VendorPhone		VARCHAR(13) CHECK (VendorPhone LIKE '08%'),
	VendorEmail		VARCHAR(100)
)

CREATE TABLE Staff(
	StaffID			CHAR(5) PRIMARY KEY CHECK (StaffID LIKE  'ST[0-9][0-9][0-9]'),
	StaffName		VARCHAR(50),
	StaffAddress	VARCHAR(255),
	StaffPhone		VARCHAR(13) CHECK (StaffPhone LIKE '08%'),
	StaffGender		VARCHAR(10),
	StaffEmail		VARCHAR(100),
	StaffSalary		NUMERIC(11,2) CHECK (StaffSalary >= 3000000)
)

CREATE TABLE Customer(
	CustomerID		CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE  'CU[0-9][0-9][0-9]'),
	CustomerName	VARCHAR(50),
	CustomerAddress	VARCHAR(255),
	CustomerPhone	VARCHAR(13) CHECK (CustomerPhone LIKE '08%'),
	CustomerGender	VARCHAR(10),
	CustomerEmail	VARCHAR(100)
)

CREATE TABLE PurchaseTransaction( 
	PurchaseTransactionID			CHAR(5) PRIMARY KEY CHECK(PurchaseTransactionID LIKE 'PU[0-9][0-9][0-9]'),
	StaffID				CHAR(5),
	VendorID			CHAR(5),
	PurchaseDate		DATETIME CHECK(PurchaseDate < DATEADD(HOUR, -1, GETDATE())) ,
	FOREIGN KEY(StaffID) REFERENCES Staff(StaffID),
	FOREIGN KEY(VendorID) REFERENCES Vendor(VendorID)
)

CREATE TABLE SalesTransaction(
	SalesTransactionID	CHAR(5) PRIMARY KEY CHECK(SalesTransactionID LIKE 'SA[0-9][0-9][0-9]'),
	StaffID				CHAR(5),
	CustomerID			CHAR(5),
	SalesDate			DATETIME CHECK(SalesDate < DATEADD(HOUR, -1, GETDATE())) ,
	FOREIGN KEY(StaffID) REFERENCES Staff(StaffID),
	FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
)

CREATE TABLE DetailPurchaseTransaction(
	PurchaseTransactionID	CHAR(5),
	ClothID					CHAR(5),
	Quantity				INT
	PRIMARY KEY(PurchaseTransactionID, ClothID),
	FOREIGN KEY(PurchaseTransactionID) REFERENCES PurchaseTransaction(PurchaseTransactionID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY(ClothID) REFERENCES Cloth(ClothID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)

CREATE TABLE DetailSalesTransaction(
	SalesTransactionID	CHAR(5),
	ClothID				CHAR(5),
	Quantity			INT
	PRIMARY KEY(SalesTransactionID, ClothID),
	FOREIGN KEY(SalesTransactionID) REFERENCES SalesTransaction(SalesTransactionID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY(ClothID) REFERENCES Cloth(ClothID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
)