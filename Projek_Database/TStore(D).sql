USE TStore

-- 2301903481 - David Taslim
-- 2301904143 - Vicky Chen
-- 2301861043 - Nicholas Anderson
-- 2301861516 - Raditya Fauzan Dwiantono

-- Kita akan melakukan simulasi dimana, kami akan merekrut Staff baru di perusahaan kami sehingga kami perlu untuk menginsert data dari Staff baru tersebut.

INSERT INTO Staff VALUES ('ST011', 'Edgar', 'Taman Surtya', '081258954863' , 'MALE' , 'Edgar.pro@gmail.com', 5500000)

-- Karena penjualan mulai ada perkembangan kami juga memutuskan untuk menambahkan vendor kami, demi mempercepat pemasokan barang kami.

INSERT INTO Vendor VALUES ('VE011', 'Wollem', 'Permata Palem', '082155912353', 'Wollemm2@yahoo.com')

-- Kebetulan Vendor baru kami memiliki Batik yang bagus, sehigga kami memutuskan untuk mengambil Batik tersebut.
-- Karena Batik merupakan kategori baru, kami perlu menambahkannya ke dalam database kami.

INSERT INTO Category VALUES ('CA011', 'Batik')

-- Serta menbahkannya ke dalam table sebagai produk cloth kami, beserta rinciannya

INSERT INTO Cloth VALUES ('CL016', 'KERISS' , 200000, 'CA011', 15)

-- Sehingga hal ini pastinya akan memambah transaksi kami, sehingga ini kan menjadi tugas pertama dan tanggung jawab staff baru kami atas transaksi ini.
-- Dengan memasukkan detail - detail apa saja pada transaksi tersebut.

INSERT INTO PurchaseTransaction VALUES ('PU016', 'ST011', 'VE011', '2020-12-01 15:14:00')
INSERT INTO PurchaseTransaction VALUES ('PU017', 'ST002', 'VE005', '2020-09-12 06:13:04')
INSERT INTO PurchaseTransaction VALUES ('PU018', 'ST004', 'VE002', '2020-07-29 11:14:05')
INSERT INTO PurchaseTransaction VALUES ('PU019', 'ST001', 'VE004', '2020-08-01 16:18:03')
INSERT INTO PurchaseTransaction VALUES ('PU020', 'ST003', 'VE003', '2020-05-15 13:11:10')
INSERT INTO PurchaseTransaction VALUES ('PU021', 'ST006', 'VE008', '2020-06-26 10:40:04')
INSERT INTO PurchaseTransaction VALUES ('PU022', 'ST007', 'VE006', '2020-09-19 16:55:24')
INSERT INTO PurchaseTransaction VALUES ('PU023', 'ST009', 'VE001', '2020-04-02 12:32:06')
INSERT INTO PurchaseTransaction VALUES ('PU024', 'ST008', 'VE005', '2020-01-18 14:37:55')
INSERT INTO PurchaseTransaction VALUES ('PU025', 'ST004', 'VE007', '2020-02-10 23:43:20')

SELECT * FROM PurchaseTransaction

INSERT INTO DetailPurchaseTransaction VALUES ('PU016','CL001',15)
INSERT INTO DetailPurchaseTransaction VALUES ('PU017','CL001',2)
INSERT INTO DetailPurchaseTransaction VALUES ('PU018','CL003',6)
INSERT INTO DetailPurchaseTransaction VALUES ('PU019','CL004',20)
INSERT INTO DetailPurchaseTransaction VALUES ('PU020','CL005',5)
INSERT INTO DetailPurchaseTransaction VALUES ('PU021','CL005',12)
INSERT INTO DetailPurchaseTransaction VALUES ('PU022','CL006',24)
INSERT INTO DetailPurchaseTransaction VALUES ('PU023','CL007',10)
INSERT INTO DetailPurchaseTransaction VALUES ('PU024','CL009',24)
INSERT INTO DetailPurchaseTransaction VALUES ('PU025','CL010',14)

SELECT * FROM DetailPurchaseTransaction 

-- Lalu Besoknya, salah satu sales kami mempunyai Customer baru. Sehingga Staff baru kami perlu menambahkan data dari Customer tersebut ke dalam database perusahaan kami.

INSERT INTO Customer VALUES ('CU011', 'Aries', 'Jalan Zodiak', '081259314856', 'MALE', 'zodiak.aries@gmail.com')

-- Dimana Customer ini akan membeli Batik yang baru saja kami stok, dengan quantity sebanyak 10 buah. Sehingga sudah menjadi tugas Staff baru tersebut untuk mendatakan transaksi ini.

INSERT INTO SalesTransaction VALUES ('SA017', 'ST011', 'CU011', '2020-12-10 01:10:11')
INSERT INTO SalesTransaction VALUES ('SA018', 'ST009', 'CU001', '2020-11-30 02:30:01')
INSERT INTO SalesTransaction VALUES ('SA019', 'ST007', 'CU003', '2020-03-24 12:11:11')
INSERT INTO SalesTransaction VALUES ('SA020', 'ST002', 'CU002', '2020-11-12 08:17:11')
INSERT INTO SalesTransaction VALUES ('SA021', 'ST005', 'CU009', '2020-10-19 12:12:12')
INSERT INTO SalesTransaction VALUES ('SA022', 'ST008', 'CU007', '2020-12-01 10:09:08')
INSERT INTO SalesTransaction VALUES ('SA023', 'ST001', 'CU006', '2020-08-17 13:12:11')
INSERT INTO SalesTransaction VALUES ('SA024', 'ST006', 'CU001', '2020-11-11 15:16:17')
INSERT INTO SalesTransaction VALUES ('SA025', 'ST004', 'CU005', '2020-04-23 19:20:21')
INSERT INTO SalesTransaction VALUES ('SA026', 'ST010', 'CU010', '2020-02-10 21:23:25')

SELECT * FROM SalesTransaction

INSERT INTO DetailSalesTransaction VALUES ('SA017','CL011',8)
INSERT INTO DetailSalesTransaction VALUES ('SA018','CL005',12)
INSERT INTO DetailSalesTransaction VALUES ('SA019','CL004',10)
INSERT INTO DetailSalesTransaction VALUES ('SA020','CL003',10)
INSERT INTO DetailSalesTransaction VALUES ('SA021','CL002',9)
INSERT INTO DetailSalesTransaction VALUES ('SA022','CL001',4)
INSERT INTO DetailSalesTransaction VALUES ('SA023','CL010',7)
INSERT INTO DetailSalesTransaction VALUES ('SA024','CL006',5)
INSERT INTO DetailSalesTransaction VALUES ('SA025','CL007',2)
INSERT INTO DetailSalesTransaction VALUES ('SA026','CL008',13)

SELECT * FROM DetailSalesTransaction

-- Otomatis, staff baru kami harus memotong stok yang ada pada table Cloth kami.

UPDATE Cloth
set ClothStock = ClothStock - 10
where ClothID = 'CL016' 

Select * from Cloth





