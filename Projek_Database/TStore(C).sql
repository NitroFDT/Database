USE TStore

-- 2301903481 - David Taslim
-- 2301904143 - Vicky Chen
-- 2301861043 - Nicholas Anderson
-- 2301861516 - Raditya Fauzan Dwiantono

-- Part C

/*
1. Master : customer, staff,vendor,category
2. Transaction : PurchaseTransaction,SalesTransaction, cloth
3. Detail : detailpurchase, detailsales
*/

-----MASTER : customer, staff,vendor,category
INSERT INTO Staff VALUES ('ST001', 'David Taslim', 'Jalan Dempo', '081278122410' , 'MALE' , 'david@gmail.com', 9000000)
INSERT INTO Staff VALUES ('ST002', 'Nicholas Anderson', 'Jalan Merak', '081278122412' , 'MALE' , 'nicholas@gmail.com', 5500000)
INSERT INTO Staff VALUES ('ST003', 'Raditya F', 'Jalan Biru', '081278122413' , 'MALE' , 'raditya@gmail.com', 3000000)
INSERT INTO Staff VALUES ('ST004', 'Vicky Chen', 'Jalan Tamsis', '081278122415' , 'FEMALE' , 'vicky@gmail.com', 7000000)
INSERT INTO Staff VALUES ('ST005', 'Tzuyu', 'Jalan Raya', '081278122416' , 'FEMALE' , 'tzuyu@gmail.com', 8500000)
INSERT INTO Staff VALUES ('ST006', 'Bambang', 'Jalan Sutoyo', '081278122418' , 'MALE' , 'bambang@gmail.com', 4100000)
INSERT INTO Staff VALUES ('ST007', 'Evander', 'Jalan Kolonel', '081278122419' , 'MALE' , 'evander@gmail.com', 52000000)
INSERT INTO Staff VALUES ('ST008', 'Budi', 'Jalan Lemabang', '081278122421' , 'MALE' , 'budi@gmail.com', 6000000)
INSERT INTO Staff VALUES ('ST009', 'Ana Putri', 'Jalan Daan Mogot', '081278122423' , 'FEMALE' , 'ana@gmail.com', 5000000)
INSERT INTO Staff VALUES ('ST010', 'Karina', 'Jalan Citra', '081278122424' , 'FEMALE' , 'karina@gmail.com', 4500000)

SELECT *
FROM Staff

INSERT INTO Customer VALUES ('CU001','James Jonathan','Jalan Hijau', '081276765410','MALE', 'james@gmail.com')
INSERT INTO Customer VALUES ('CU002', 'Anna Smith', 'Jalan Biru', '081276765411', 'FEMALE', 'anna@gmail.com')
INSERT INTO Customer VALUES ('CU003', 'Jennie Jung', 'Jalan Merah', '081276765412', 'FEMALE', 'jennie@gmail.com')
INSERT INTO Customer VALUES ('CU004', 'Tony Hemsworth', 'Jalan Jingga', '081276765413', 'MALE', 'Tony@gmail.com')
INSERT INTO Customer VALUES ('CU005', 'Aurel Kate', 'Jalan Mawar', '081276765414', 'FEMALE', 'aurel@gmail.com')
INSERT INTO Customer VALUES ('CU006', 'Febby Poulsen', 'Jalan Melati', '081276765415', 'FEMALE', 'febby@gmail.com')
INSERT INTO Customer VALUES ('CU007', 'Stephanie Rose', 'Jalan Pelangi', '081276765416', 'FEMALE', 'stephanie@gmail.com')
INSERT INTO Customer VALUES ('CU008', 'George Hamilton', 'Jalan Awan', '081276765417', 'MALE', 'george@gmail.com')
INSERT INTO Customer VALUES ('CU009', 'Alvaro Stark', 'Jalan Emas', '081276765418', 'MALE', 'alvaro@gmail.com')
INSERT INTO Customer VALUES ('CU010', 'Lionel Jr', 'Jalan Perak', '081276765419', 'MALE', 'lionel@gmail.com')

SELECT *
FROM Customer

INSERT INTO Vendor VALUES ('VE001', 'Giovano', 'Jalan Rambang', '082142154289', 'giovano@gmail.com')
INSERT INTO Vendor VALUES ('VE002', 'Jono', 'Jalan Kertapati', '082142154290', 'jono@gmail.com')
INSERT INTO Vendor VALUES ('VE003', 'Lovin', 'Jalan Sentosa', '082142154291','lovin@gmail.com')
INSERT INTO Vendor VALUES ('VE004', 'Rianto', 'Jalan Mamba', '082142154292',  'rianto@gmail.com')
INSERT INTO Vendor VALUES ('VE005', 'Winwin', 'Jalan Bukit', '082142154293','Winwin@gmail.com')
INSERT INTO Vendor VALUES ('VE006', 'Juna', 'Jalan Sekip', '082142154294',  'Juna@gmail.com')
INSERT INTO Vendor VALUES ('VE007', 'Roma', 'Jalan Kalideres', '082142154296', 'Roma@gmail.com')
INSERT INTO Vendor VALUES ('VE008', 'Saad Sofian', 'Jalan Pluit', '082142154295', 'sofian@gmail.com')
INSERT INTO Vendor VALUES ('VE009', 'Saad Jisoo', 'Jalan Kota', '082142154299', 'jisoo@gmail.com')
INSERT INTO Vendor VALUES ('VE010', 'Minho', 'Jalan Gangnam', '082142154211', 'minho@gmail.com')

SELECT *
FROM Vendor

INSERT INTO Category VALUES ('CA001', 'Kaos')
INSERT INTO Category VALUES ('CA002', 'Celana')
INSERT INTO Category VALUES ('CA003', 'Jaket')
INSERT INTO Category VALUES ('CA004', 'Hoodie')
INSERT INTO Category VALUES ('CA005', 'Jeans')
INSERT INTO Category VALUES ('CA006', 'Kemeja')
INSERT INTO Category VALUES ('CA007', 'Dress')
INSERT INTO Category VALUES ('CA008', 'Rok')
INSERT INTO Category VALUES ('CA009', 'Sweater')
INSERT INTO Category VALUES ('CA010', 'Boxer')

SELECT *
FROM Category

-- Transaction : PurchaseTransaction,SalesTransaction, cloth

INSERT INTO Cloth VALUES ('CL001', 'CHANNEL' , 1500000, 'CA008', 14)
INSERT INTO Cloth VALUES ('CL002', 'HERMES' , 900000, 'CA001', 7)
INSERT INTO Cloth VALUES ('CL003', 'CHRISTIAN DIOR' , 1100000, 'CA004', 15)
INSERT INTO Cloth VALUES ('CL004', 'ARMANI' , 800000, 'CA009', 4)
INSERT INTO Cloth VALUES ('CL005', 'DISTRO' , 50000, 'CA007', 6)
INSERT INTO Cloth VALUES ('CL006', 'UNIQLO' , 70000, 'CA002', 3)
INSERT INTO Cloth VALUES ('CL007', 'LOUIS VUITTON' , 120000, 'CA003', 1)
INSERT INTO Cloth VALUES ('CL008', 'BALENCIAGA' , 130000, 'CA003', 9)
INSERT INTO Cloth VALUES ('CL009', 'ADIDAS' , 100000, 'CA003', 4)
INSERT INTO Cloth VALUES ('CL010', 'WRANGLER' , 150000, 'CA005', 5)
INSERT INTO Cloth VALUES ('CL011', 'GIORDANO' , 110000, 'CA006', 2)
INSERT INTO Cloth VALUES ('CL012', 'CALVIN KLEIN' , 100000, 'CA010', 10)
INSERT INTO Cloth VALUES ('CL013', 'TOMMY HILFIGER' , 200000, 'CA001', 8)
INSERT INTO Cloth VALUES ('CL014', 'VERSACE' , 350000, 'CA004', 9)
INSERT INTO Cloth VALUES ('CL015', 'SUPREME' , 400000, 'CA003', 16)

SELECT *  
FROM Cloth

INSERT INTO PurchaseTransaction VALUES ('PU001', 'ST001', 'VE002', '2020-12-08 10:40:27')
INSERT INTO PurchaseTransaction VALUES ('PU002', 'ST002', 'VE001', '2020-12-06 14:15:03')
INSERT INTO PurchaseTransaction VALUES ('PU003', 'ST004', 'VE005', '2020-12-05 07:45:55')
INSERT INTO PurchaseTransaction VALUES ('PU004', 'ST006', 'VE003', '2020-12-04 08:00:02')
INSERT INTO PurchaseTransaction VALUES ('PU005', 'ST008', 'VE007', '2020-12-03 11:35:22')
INSERT INTO PurchaseTransaction VALUES ('PU006', 'ST010', 'VE010', '2020-12-02 12:30:19')
INSERT INTO PurchaseTransaction VALUES ('PU007', 'ST003', 'VE009', '2020-12-01 17:49:11')
INSERT INTO PurchaseTransaction VALUES ('PU008', 'ST005', 'VE004', '2020-12-02 23:22:15')
INSERT INTO PurchaseTransaction VALUES ('PU009', 'ST007', 'VE008', '2020-12-06 16:59:33')
INSERT INTO PurchaseTransaction VALUES ('PU010', 'ST009', 'VE006', '2020-11-28 19:12:54')
INSERT INTO PurchaseTransaction VALUES ('PU011', 'ST003', 'VE009', '2020-11-15 11:43:09')
INSERT INTO PurchaseTransaction VALUES ('PU012', 'ST005', 'VE010', '2020-04-03 20:18:25')
INSERT INTO PurchaseTransaction VALUES ('PU013', 'ST002', 'VE001', '2020-04-02 23:00:43')
INSERT INTO PurchaseTransaction VALUES ('PU014', 'ST008', 'VE002', '2020-12-01 09:43:21')
INSERT INTO PurchaseTransaction VALUES ('PU015', 'ST007', 'VE008', '2020-12-07 14:12:48')

SELECT *
FROM PurchaseTransaction


INSERT INTO SalesTransaction VALUES ('SA001', 'ST010', 'CU002', '2020-12-06 05:10:43')
INSERT INTO SalesTransaction VALUES ('SA002', 'ST008', 'CU001', '2020-12-05 10:43:05')
INSERT INTO SalesTransaction VALUES ('SA003', 'ST006', 'CU005', '2020-12-04 13:30:49')
INSERT INTO SalesTransaction VALUES ('SA004', 'ST005', 'CU003', '2020-12-03 16:45:08')
INSERT INTO SalesTransaction VALUES ('SA005', 'ST003', 'CU007', '2020-05-01 19:00:34')
INSERT INTO SalesTransaction VALUES ('SA006', 'ST002', 'CU010', '2020-12-03 22:35:28')
INSERT INTO SalesTransaction VALUES ('SA007', 'ST001', 'CU009', '2020-12-04 00:12:03')
INSERT INTO SalesTransaction VALUES ('SA008', 'ST004', 'CU004', '2020-05-02 19:39:13')
INSERT INTO SalesTransaction VALUES ('SA009', 'ST007', 'CU008', '2020-12-07 21:56:55')
INSERT INTO SalesTransaction VALUES ('SA010', 'ST009', 'CU006', '2020-11-15 11:53:11')
INSERT INTO SalesTransaction VALUES ('SA011', 'ST003', 'CU009', '2020-05-29 12:12:12')
INSERT INTO SalesTransaction VALUES ('SA012', 'ST006', 'CU010', '2020-04-02 16:17:18')
INSERT INTO SalesTransaction VALUES ('SA013', 'ST002', 'CU001', '2020-04-07 21:18:03')
INSERT INTO SalesTransaction VALUES ('SA014', 'ST001', 'CU002', '2020-03-15 21:19:07')
INSERT INTO SalesTransaction VALUES ('SA015', 'ST009', 'CU008', '2020-12-02 20:01:10')
INSERT INTO SalesTransaction VALUES ('SA016', 'ST003', 'CU009', '2020-08-15 20:20:20')

SELECT *
FROM SalesTransaction

--3. Detail : detailpurchase, detailsales

INSERT INTO DetailPurchaseTransaction VALUES ('PU001','CL001',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU001','CL002',7)
INSERT INTO DetailPurchaseTransaction VALUES ('PU002','CL005',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU002','CL007',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU003','CL003',12)
INSERT INTO DetailPurchaseTransaction VALUES ('PU003','CL006',15)
INSERT INTO DetailPurchaseTransaction VALUES ('PU004','CL004',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU004','CL008',13)
INSERT INTO DetailPurchaseTransaction VALUES ('PU005','CL009',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU005','CL010',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU006','CL003',13)
INSERT INTO DetailPurchaseTransaction VALUES ('PU007','CL005',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU008','CL008',12)
INSERT INTO DetailPurchaseTransaction VALUES ('PU008','CL012',15)
INSERT INTO DetailPurchaseTransaction VALUES ('PU009','CL014',15)
INSERT INTO DetailPurchaseTransaction VALUES ('PU009','CL015',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU010','CL011',15)
INSERT INTO DetailPurchaseTransaction VALUES ('PU010','CL001',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU011','CL012',15)
INSERT INTO DetailPurchaseTransaction VALUES ('PU012','CL002',8)
INSERT INTO DetailPurchaseTransaction VALUES ('PU013','CL013',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU014','CL013',15)
INSERT INTO DetailPurchaseTransaction VALUES ('PU014','CL015',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU014','CL005',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU015','CL009',10)

SELECT *
FROM DetailPurchaseTransaction

INSERT INTO DetailSalesTransaction VALUES ('SA001','CL002',4)
INSERT INTO DetailSalesTransaction VALUES ('SA001','CL004',3)
INSERT INTO DetailSalesTransaction VALUES ('SA002','CL006',6)
INSERT INTO DetailSalesTransaction VALUES ('SA002','CL008',8)
INSERT INTO DetailSalesTransaction VALUES ('SA003','CL010',5)
INSERT INTO DetailSalesTransaction VALUES ('SA003','CL012',10)
INSERT INTO DetailSalesTransaction VALUES ('SA004','CL014',6)
INSERT INTO DetailSalesTransaction VALUES ('SA004','CL015',4)
INSERT INTO DetailSalesTransaction VALUES ('SA005','CL001',6)
INSERT INTO DetailSalesTransaction VALUES ('SA005','CL003',5)
INSERT INTO DetailSalesTransaction VALUES ('SA006','CL005',12)
INSERT INTO DetailSalesTransaction VALUES ('SA006','CL007',4)
INSERT INTO DetailSalesTransaction VALUES ('SA006','CL009',8)
INSERT INTO DetailSalesTransaction VALUES ('SA007','CL011',7)
INSERT INTO DetailSalesTransaction VALUES ('SA007','CL013',3)
INSERT INTO DetailSalesTransaction VALUES ('SA008','CL002',4)
INSERT INTO DetailSalesTransaction VALUES ('SA008','CL004',3)
INSERT INTO DetailSalesTransaction VALUES ('SA009','CL011',6)
INSERT INTO DetailSalesTransaction VALUES ('SA009','CL012',10)
INSERT INTO DetailSalesTransaction VALUES ('SA010','CL013',4)
INSERT INTO DetailSalesTransaction VALUES ('SA011','CL006',6)
INSERT INTO DetailSalesTransaction VALUES ('SA012','CL008',8)
INSERT INTO DetailSalesTransaction VALUES ('SA013','CL009',8)
INSERT INTO DetailSalesTransaction VALUES ('SA014','CL003',5)
INSERT INTO DetailSalesTransaction VALUES ('SA015','CL005',12)
INSERT INTO DetailSalesTransaction VALUES ('SA016','CL008',9)


SELECT *
FROM DetailSalesTransaction
