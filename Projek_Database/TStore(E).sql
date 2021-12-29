USE TStore

-- 2301903481 - David Taslim
-- 2301904143 - Vicky Chen
-- 2301861043 - Nicholas Anderson
-- 2301861516 - Raditya Fauzan Dwiantono 

-- Part E 
 
-- No 1 

SELECT [Transaction Count] = COUNT (PurchaseTransaction.PurchaseTransactionID), Staff.StaffName, Vendor.VendorName
FROM Staff JOIN PurchaseTransaction ON Staff.StaffID = PurchaseTransaction.StaffID
JOIN Vendor ON Vendor.VendorID = PurchaseTransaction.VendorID
WHERE Staff.StaffSalary BETWEEN 5000000 AND 10000000
GROUP BY Staff.StaffName, Vendor.VendorName
HAVING Vendor.VendorName LIKE '%o%' 

-- No 2

SELECT [SalesId] = SalesTransaction.SalesTransactionID, SalesTransaction.SalesDate, Customer.CustomerName, Customer.CustomerAddress
FROM SalesTransaction JOIN Customer ON SalesTransaction.CustomerID = Customer.CustomerID 
JOIN DetailSalesTransaction ON DetailSalesTransaction.SalesTransactionID = SalesTransaction.SalesTransactionID
JOIN Cloth ON Cloth.ClothID = DetailSalesTransaction.ClothID
WHERE DAY(SalesTransaction.SalesDate) = 15 AND ClothPrice > 150000
GROUP BY SalesTransaction.SalesTransactionID, SalesTransaction.SalesDate, Customer.CustomerName, Customer.CustomerAddress 

---No 3

SELECT [Month] = MONTH(GETDATE())-1, [Transaction Count] = COUNT(DetailSalesTransaction.SalesTransactionID), [Cloth Sold Count] = SUM(DetailSalesTransaction.Quantity)   
FROM SalesTransaction JOIN DetailSalesTransaction ON DetailSalesTransaction.SalesTransactionID = SalesTransaction.SalesTransactionID 
JOIN Cloth ON Cloth.ClothID = DetailSalesTransaction.ClothID 
JOIN Staff ON Staff.StaffID = SalesTransaction.StaffID 
WHERE Staff.StaffGender = 'FEMALE' AND Cloth.ClothPrice > 70000 
GROUP BY MONTH(SalesTransaction.SalesDate) 

-- No 4

SELECT [Brand Last Name] = RIGHT(rtrim(ClothBrand),CHARINDEX(' ', REVERSE(RTRIM(ClothBrand))+' ')-1) , [Maximum Cloth(s) Sold] = MAX(dst.Quantity) 
FROM Cloth c JOIN DetailSalesTransaction dst ON dst.ClothID = c.ClothID 
GROUP BY c.ClothBrand 
HAVING SUM(dst.Quantity) > 5 AND SUM(dst.Quantity) < 10 

-- No 5 

SELECT Cloth.ClothBrand, Cloth.ClothPrice, [Stock] = Cloth.ClothStock 
FROM Cloth 
JOIN (
	FROM Cloth JOIN DetailPurchaseTransaction ON Cloth.ClothID = DetailPurchaseTransaction.ClothID 
	JOIN PurchaseTransaction ON PurchaseTransaction.PurchaseTransactionID = DetailPurchaseTransaction.PurchaseTransactionID 
	JOIN Vendor ON Vendor.VendorID = PurchaseTransaction.VendorID 
	WHERE Vendor.VendorName LIKE 'Saad%' 
	GROUP BY Cloth.ClothPrice
	) as avgharga 
	on Cloth.ClothPrice = avgharga.ClothPrice 
	WHERE (Cloth.ClothPrice BETWEEN (avgharga.AveragePrice-35000) AND avgharga.AveragePrice) 
GROUP BY Cloth.ClothBrand, Cloth.ClothPrice, Cloth.ClothStock 

SELECT [Sales Date] = CONVERT(varchar, SalesTransaction.SalesDate, 101), ClothBrand , [Quantity] = DetailSalesTransaction.Quantity

SELECT 

SELECT [Vendor Id] =  RIGHT(Vendor.VendorID, 3), VendorName , [Clothes Bought] = CAST(SUM(DetailPurchaseTransaction.Quantity) AS VARCHAR) + ' piece(s)', [Vendor Phone] = REPLACE(VendorPhone, LEFT(VendorPhone,2), '+62')

-- No 9 

CREATE VIEW StoreSalesView
AS
SELECT [SalesId] = SalesTransaction.SalesTransactionID , Customer.CustomerName, Customer.CustomerPhone , [Cloth Average Price] = 'IDR ' + CAST(CAST(AVG(Cloth.ClothPrice) AS DECIMAL(10,2)) AS VARCHAR), [Sales Quantity] = CAST(SUM(DetailSalesTransaction.Quantity) AS VARCHAR) + ' piece(s)' 
FROM SalesTransaction  JOIN Customer  ON SalesTransaction.CustomerID = Customer.CustomerID
JOIN DetailSalesTransaction ON DetailSalesTransaction.SalesTransactionID  = SalesTransaction.SalesTransactionID
JOIN Cloth ON DetailSalesTransaction.ClothID = Cloth.ClothID 
GROUP BY SalesTransaction.SalesTransactionID , Customer.CustomerName, Customer.CustomerPhone
HAVING AVG(Cloth.ClothPrice) > 100000 AND SUM(DetailSalesTransaction.Quantity)> 4

SELECT *
FROM StoreSalesView 

-- No 10 

CREATE VIEW StorePurchaseView 
AS
SELECT [Purchase Month] = DATENAME(MONTH,PurchaseTransaction.PurchaseDate), [Minimum Purchase Quantity] = MIN(DetailPurchaseTransaction.Quantity), [Purchased Cloth Count] = CAST(COUNT(PurchaseTransaction.PurchaseTransactionID) AS INT)
FROM PurchaseTransaction JOIN DetailPurchaseTransaction ON DetailPurchaseTransaction.PurchaseTransactionID = PurchaseTransaction.PurchaseTransactionID
GROUP BY PurchaseTransaction.PurchaseDate
HAVING MIN(DetailPurchaseTransaction.Quantity) > 10 AND CAST(COUNT(PurchaseTransaction.PurchaseTransactionID) AS INT) > 1

SELECT  *
FROM StorePurchaseView