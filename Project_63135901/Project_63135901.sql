﻿CREATE DATABASE PROJECT_63135901
USE PROJECT_63135901
CREATE TABLE Roles (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(250),
    RoleDescription NVARCHAR(255)
);
CREATE TABLE Shippers (
    ShipperID INT IDENTITY(1,1) PRIMARY KEY,
    ShipperName NVARCHAR(250),
    Phone VARCHAR(20),
    Company NVARCHAR(250),
    ShipDate DATETIME
);
CREATE TABLE TransactionStatus (
    TransactStatusID INT IDENTITY(1,1) PRIMARY KEY,
    TransStatus NVARCHAR(50),
    TransactDescription NVARCHAR(255)
);
CREATE TABLE Accounts (
    AccountID INT IDENTITY(1,1) PRIMARY KEY,
    Phone VARCHAR(20),
    Email NVARCHAR(150),
    AccPassword NVARCHAR(50),
    Salt NCHAR(6),
    Active BIT NOT NULL,
    Fullname NVARCHAR(100),
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID),
    LastLogin DATETIME,
    CreateDate DATETIME
);
CREATE TABLE Categories (
    CatID INT IDENTITY(1,1) PRIMARY KEY,
    CatName NVARCHAR(250),
    CatDescription NVARCHAR(255),
    ParentID INT,
    Levels INT,
    Ordering INT,
    Publish BIT NOT NULL,
    Thumb NVARCHAR(250),
    Title NVARCHAR(250),
    Alias NVARCHAR(250),
    MetaDesc NVARCHAR(250),
    MetaKey NVARCHAR(250),
    Cover NVARCHAR(255),
    ShcemaMarkup NVARCHAR(255)
);
CREATE TABLE Locations (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    LocationName NVARCHAR(50),
    LocationType NVARCHAR(50),
    Slug NVARCHAR(50),
    NameWithType NVARCHAR(100),
    PathWithType NVARCHAR(255),
    ParentCode INT,
    Levels INT
);
CREATE TABLE Customers (
    CustomersID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100),
    Birthday DATETIME,
    Avatar NVARCHAR(255),
    CusAddress NVARCHAR(255),
    Email NVARCHAR(150),
    Phone VARCHAR(20),
    LocationID INT FOREIGN KEY REFERENCES Locations(LocationID),
    District NVARCHAR(150),
    Ward NVARCHAR(150),
    CreateDate DATETIME,
    AccPassword NVARCHAR(50),
    Salt NCHAR(6),
    LastLogin DATETIME,
    Active BIT NOT NULL
);
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomersID INT FOREIGN KEY REFERENCES Customers(CustomersID),
	LocationID INT FOREIGN KEY REFERENCES Locations(LocationID),
	District NVARCHAR(150),
	Ward NVARCHAR(150),
	CusAddress NVARCHAR(255), 
    OrderDate DATETIME,
    ShipDate DATETIME,
    TransactStatusID INT FOREIGN KEY REFERENCES TransactionStatus(TransactStatusID),
    Deleted BIT,
    Paid BIT,
    PaymentDate DATETIME,
    PaymentID INT,
	TotalMoney DECIMAL(10,2),
    Note NVARCHAR(255)
);
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(250),
    ShortDescription NVARCHAR(250),
    ProductDescription NVARCHAR(255),
    CatID INT FOREIGN KEY REFERENCES Categories(CatID),
    Price INT,
    Discount DECIMAL(10,2),
    Thumb NVARCHAR(255),
    Video NVARCHAR(255),
    DateCreated DATETIME,
    DateModified DATETIME,
    BestSellers BIT NOT NULL,
    HomeFlag BIT NOT NULL,
    Active BIT NOT NULL,
    Tags NVARCHAR(255),
    Title NVARCHAR(250),
    Alias NVARCHAR(250),
    MetaDesc NVARCHAR(250),
    MetaKey NVARCHAR(250),
    UnitsInStock INT
);
CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    OrderNumber INT,
	Price INT,
    Quantity INT,
    Discount DECIMAL(10,2),
    Total DECIMAL(10,2),
    ShipDate DATETIME
);
CREATE TABLE Pages (
    PagesID INT IDENTITY(1,1) PRIMARY KEY,
    PageName NVARCHAR(250),
    Contents NVARCHAR(255),
    Thumb NVARCHAR(255),
    Published BIT NOT NULL,
    Title NVARCHAR(250),
    MetaDesc NVARCHAR(250),
    MetaKey NVARCHAR(250),
    Alias NVARCHAR(250),
    CreatedDate DATETIME,
    Ordering INT
);



INSERT INTO Roles (RoleName, RoleDescription) VALUES
('Admin', 'Administrator Role'),
('Manager', 'Manager Role'),
('Cashier', 'Cashier Role'),
('Chef', 'Chef Role'),
('Waiter', 'Waiter Role'),
('Customer', 'Customer Role'),
('Delivery Driver', 'Delivery Driver Role'),
('Supervisor', 'Supervisor Role'),
('Accountant', 'Accountant Role'),
('Marketing', 'Marketing Role'),
('HR Manager', 'HR Manager Role'),
('Security', 'Security Role'),
('Vendor', 'Vendor Role'),
('Sous Chef', 'Sous Chef Role'),
('Bartender', 'Bartender Role'),
('Host/Hostess', 'Host/Hostess Role'),
('Dishwasher', 'Dishwasher Role'),
('Busser', 'Busser Role'),
('Sommelier', 'Sommelier Role'),
('Line Cook', 'Line Cook Role'),
('Pastry Chef', 'Pastry Chef Role'),
('Barista', 'Barista Role'),
('Prep Cook', 'Prep Cook Role'),
('Food Runner', 'Food Runner Role'),
('Expeditor', 'Expeditor Role'),
('Food Critic', 'Food Critic Role'),
('Host/Hostess Supervisor', 'Host/Hostess Supervisor Role'),
('Sous Bartender', 'Sous Bartender Role'),
('Head Chef', 'Head Chef Role'),
('General Manager', 'General Manager Role');

INSERT INTO TransactionStatus (TransStatus, TransactDescription) VALUES
(N'Đã thanh toán', N'Đơn hàng đã được thanh toán'),
(N'Chưa thanh toán', N'Đơn hàng chưa được thanh toán'),
(N'Đang giao hàng', N'Đơn hàng đang được giao'),
(N'Đã giao thành công', N'Đơn hàng đã được giao'),
(N'Đã hủy', N'Đơn hàng đã bị hủy');

INSERT INTO Accounts (Phone, Email, AccPassword, Salt, Active, Fullname, RoleID, LastLogin, CreateDate) VALUES 
('555-6622', 'user1@example.com', 'mc4WNlVXJF', 'eeVTW2', '1', 'User 1', '5', '2023-08-30 16:11:47', '2023-02-28 16:11:47'),
('555-5119', 'user2@example.com', '0oAHPeGRET', 'BXo3H3', '1', 'User 2', '3', '2022-12-06 16:11:47', '2022-12-26 16:11:47'),
('555-9363', 'user5@example.com', 'Cni8GcltKW', 'ukXe2l', '0', 'User 5', '5', '2022-11-28 16:11:47', '2023-03-23 16:11:47'),
('555-1649', 'user6@example.com', 'rnhUCdh6Vq', 'RMQG35', '1', 'User 6', '2', '2023-09-12 16:11:47', '2023-03-07 16:11:47'),
('555-4125', 'user7@example.com', 'BpD8qWzUa1', 'lO0R5K', '1', 'User 7', '4', '2023-08-20 16:11:47', '2023-08-07 16:11:47'),
('555-8361', 'user8@example.com', 'HQi05BnV1f', 'X0h6eV', '1', 'User 8', '2', '2023-04-30 16:11:47', '2023-08-17 16:11:47'),
('555-2241', 'user9@example.com', 'SadoNfejF7', 'UhxsKt', '1', 'User 9', '1', '2023-07-09 16:11:47', '2023-04-29 16:11:47'),
('555-5640', 'user10@example.com', 'LVt22hvdju', 'u62zar', '0', 'User 10', '3', '2023-06-14 16:11:47', '2023-05-29 16:11:47'),
('555-3245', 'user11@example.com', '6RnHLm3h6K', '4CRsnw', '0', 'User 11', '1', '2023-04-01 16:11:47', '2023-11-18 16:11:47'),
('555-2152', 'user12@example.com', 'zrBNdEg8x8', 'i8gsfy', '1', 'User 12', '1', '2023-01-21 16:11:47', '2023-03-15 16:11:47'),
('555-3704', 'user13@example.com', 'Ls251upYnr', 'lZK3mj', '0', 'User 13', '1', '2022-12-29 16:11:47', '2022-12-02 16:11:47'),
('555-7098', 'user14@example.com', 'b4mospyAZ3', 'KnqzVw', '0', 'User 14', '3', '2023-10-04 16:11:47', '2023-10-28 16:11:47'),
('555-4242', 'user15@example.com', 'wHg5IS0lgr', 'pNIXL4', '0', 'User 15', '3', '2023-01-04 16:11:47', '2022-12-26 16:11:47'),
('555-9695', 'user16@example.com', 'FGOeyzc6kO', 'tozRaq', '1', 'User 16', '4', '2023-07-30 16:11:47', '2023-06-06 16:11:47'),
('555-2851', 'user17@example.com', 'yxA3T0WnOF', 'cdXxHw', '0', 'User 17', '1', '2023-03-29 16:11:47', '2023-01-09 16:11:47'),
('555-3060', 'user18@example.com', 'UoTqvAVRQD', '5tZVJ7', '0', 'User 18', '3', '2023-04-16 16:11:47', '2023-06-30 16:11:47'),
('555-7510', 'user19@example.com', '5cvRReZkAp', '0lRqdN', '1', 'User 19', '1', '2023-10-11 16:11:47', '2023-11-13 16:11:47'),
('555-2207', 'user20@example.com', 'i4FUjP2dFj', '8QExGQ', '0', 'User 20', '1', '2023-10-09 16:11:47', '2023-01-14 16:11:47'),
('555-5615', 'user21@example.com', 'lAXQNxRYE2', 'iiO5tb', '0', 'User 21', '5', '2023-03-23 16:11:47', '2022-12-04 16:11:47'),
('555-2641', 'user22@example.com', 'lt8DWtknzI', 'l7GSbM', '0', 'User 22', '4', '2023-09-26 16:11:47', '2022-12-30 16:11:47'),
('555-2929', 'user23@example.com', 'koIkgz0hEf', 'jnCgJn', '0', 'User 23', '4', '2023-05-18 16:11:47', '2023-07-05 16:11:47'),
('555-7156', 'user24@example.com', 'DEUHfEI50b', 'VA9hcN', '1', 'User 24', '3', '2023-07-07 16:11:47', '2023-11-17 16:11:47'),
('555-8565', 'user25@example.com', 'zNP4GsVU4O', 'LevbQc', '0', 'User 25', '2', '2023-03-31 16:11:47', '2023-03-31 16:11:47'),
('555-2781', 'user26@example.com', 'WLRMrYXqRd', 'fQk0Gk', '0', 'User 26', '5', '2023-09-14 16:11:47', '2023-04-20 16:11:47'),
('555-1975', 'user27@example.com', 'ho4PqSMYsY', 'pODSh0', '0', 'User 27', '3', '2023-11-05 16:11:47', '2023-09-28 16:11:47'), 
('555-5398', 'user28@example.com', 'z6uG6anq7s', 'u1NIZ2', '0', 'User 28', '4', '2023-01-14 16:11:47', '2023-11-14 16:11:47'),
('555-1644', 'user29@example.com', 'enPLPO2J2C', 'dV4gOr', '0', 'User 29', '2', '2023-04-15 16:11:47', '2023-07-31 16:11:47'),
('555-6848', 'user30@example.com', 'Boe383fXqz', 'IorzGS', '1', 'User 30', '3', '2023-04-16 16:11:47', '2023-03-26 16:11:47');

INSERT INTO Categories (CatName, CatDescription, ParentID, Levels, Ordering, Publish, Thumb, Title, Alias, MetaDesc, MetaKey, Cover) VALUES 
(N'Bàn phím cơ', N'Bàn phím cơ', '2', '1', '1', '0', 'keyboard_thumb.png', N'Bàn phím cơ', 'ban-phim-co', 'ban phim co', 'ban phim co', 'cover1.jpg'),
('Kit', N'Khung xương của bàn phím', NULL, '1', '2', '1', 'kit_thumb.png', 'Kit', 'kit', 'kit', 'kit', 'cover2.jpg'),
(N'Bàn phím giả cơ', N'Bàn phím giả cơ', NULL, '1', '3', '1', 'membrane_thumb.png', N'Bàn phím giả cơ', 'ban-phim-gia-co', 'ban phim gia co', 'ban phim gia co', 'cover3.jpg'),
('Keycap', N'Nút bàn phím', NULL, '2', '4', '0', 'keycap_thumb.png', N'Keycap', 'keycap', 'keycap', 'keycap', 'cover4.jpg'),
(N'Phụ kiện', N'Phụ kiện', '5', '1', '5', '0', 'accessory_thumb.png', N'Phụ kiện', 'phu-kien', 'phu kien', 'phu kien', 'cover5.jpg'),
('Switch', N'Phím switch', '4', '2', '6', '0', 'switch_thumb.png', 'Switch', 'switch', 'switch', 'switch', 'cover6.jpg'),
('Stab', 'Stab', '2', '2', '7', '0', 'stab_thumb.png', 'stab', 'Stab', 'Stab', 'Stab', 'cover7.jpg');

INSERT INTO Locations (LocationName, LocationType, Slug, NameWithType, PathWithType, ParentCode, Levels) VALUES
(N'TP.Hồ Chí Minh', N'Thành phố', 'tp-ho-chi-minh', N'Thành phố Hồ Chí Minh', N'Tỉnh/Thành', NULL, 1),
(N'Bình Chánh', N'Huyện', 'binh-chanh', N'Huyện Bình Chánh', N'Quận/Huyện', 1, 2),
(N'Phú Tây', N'Xã', 'phu-tay', N'Xã Phú Tây', N'Phường/Xã', 2, 3),
(N'Bình Hưng', N'Xã', 'binh_hung', N'Xã Bình Hưng', N'Phường/Xã', 2, 3),
(N'1', N'Quận', '1', N'Quận 1', N'Quận/Huyện', 1, 2),
(N'Bến Nghé', N'Phường', 'ben-nghe', N'Phường Bến Nghé', N'Phường/Xã', 5, 3),
(N'Tân Định', N'Phường', 'tan-dinh', N'Phường Tân Định', N'Phường/Xã', 5, 3),
(N'Gò Vấp', N'Quận', 'go-vap', N'Quận Gò Vấp', N'Quận/Huyện', 1, 2),
(N'10', N'Phường', '10', N'Phường 10', N'Phường/Xã', 8, 3),
(N'14', N'Phường', '14', N'Phường 14', N'Phường/Xã', 8, 3),
-- Nha Trang
(N'TP. Nha Trang', N'Thành phố', 'tp-nha-trang', N'Thành phố Nha Trang', N'Tỉnh/Thành', 40, 2),
(N'Vĩnh Hòa', N'Phường', 'vinh-hoa', N'Phường Vĩnh Hòa', N'Phường/Xã', 11, 3),
(N'Vĩnh Hải', N'Phường', 'vinh-hai', N'Phường Vĩnh Hải', N'Phường/Xã', 11, 3),
(N'Vĩnh Phước', N'Phường', 'vinh-phuoc', N'Phường Vĩnh Phước', N'Phường/Xã', 11, 3),
(N'Ngọc Hiệp', N'Phường', 'ngoc-hiep', N'Phường Ngọc Hiệp', N'Phường/Xã', 11, 3),
(N'Vĩnh Thọ', N'Phường', 'vinh-tho', N'Phường Vĩnh Thọ', N'Phường/Xã', 11, 3),
(N'Xương Huân', N'Phường', 'xuong-huan', N'Phường Xương Huân', N'Phường/Xã', 11, 3),
(N'Vạn Thắng', N'Phường', 'van-thang', N'Phường Vạn Thắng', N'Phường/Xã', 11, 3),
(N'Vạn Thạnh', N'Phường', 'van-thanh', N'Phường Vạn Thạnh', N'Phường/Xã', 11, 3),
(N'Phương Sài', N'Phường', 'phuong-sai', N'Phường Phương Sài', N'Phường/Xã', 11, 3),
(N'Phương Sơn', N'Phường', 'phuong-son', N'Phường Phương Sơn', N'Phường/Xã', 11, 3),
(N'Phước Hải', N'Phường', 'phuoc-hai', N'Phường Phước Hải', N'Phường/Xã', 11, 3),
(N'Phước Tân', N'Phường', 'phuoc-tan', N'Phường Phước Tân', N'Phường/Xã', 11, 3),
(N'Lộc Thọ', N'Phường', 'loc-tho', N'Phường Lộc Thọ', N'Phường/Xã', 11, 3),
(N'Phước Tiến', N'Phường', 'phuoc-tien', N'Phường Phước Tiến', N'Phường/Xã', 11, 3),
(N'Tân Lập', N'Phường', 'tan-lap', N'Phường Tân Lập', N'Phường/Xã', 11, 3),
(N'Phước Hòa', N'Phường', 'phuoc-hoa', N'Phường Phước Hòa', N'Phường/Xã', 11, 3),
(N'Vĩnh Nguyên', N'Phường', 'vinh-nguyen', N'Phường Vĩnh Nguyên', N'Phường/Xã', 11, 3),
(N'Phước Long', N'Phường', 'phuoc-long', N'Phường Phước Long', N'Phường/Xã', 11, 3),
(N'Vĩnh Trường', N'Phường', 'vinh-truong', N'Phường Vĩnh Trường', N'Phường/Xã', 11, 3),
(N'Phước Đồng', N'Phường', 'phuoc-dong', N'Phường Phước Đồng', N'Phường/Xã', 11, 3),
-- Danh sách các xã
(N'Vĩnh Lương', N'Xã', 'vinh-luong', N'Xã Vĩnh Lương', N'Phường/Xã', 11, 3),
(N'Vĩnh Phương', N'Xã', 'vinh-phuong', N'Xã Vĩnh Phương', N'Phường/Xã', 11, 3),
(N'Vĩnh Ngọc', N'Xã', 'vinh-ngoc', N'Xã Vĩnh Ngọc', N'Phường/Xã', 11, 3),
(N'Vĩnh Thạnh', N'Xã', 'vinh-thanh', N'Xã Vĩnh Thạnh', N'Phường/Xã', 11, 3),
(N'Vĩnh Trung', N'Xã', 'vinh-trung', N'Xã Vĩnh Trung', N'Phường/Xã', 11, 3),
(N'Vĩnh Hiệp', N'Xã', 'vinh-hiep', N'Xã Vĩnh Hiệp', N'Phường/Xã', 11, 3),
(N'Vĩnh Thái', N'Xã', 'vinh-thai', N'Xã Vĩnh Thái', N'Phường/Xã', 11, 3),
(N'Phước Đồng', N'Xã', 'phuoc-dong-xa', N'Xã Phước Đồng', N'Phường/Xã', 11, 3),
(N'Khánh Hòa', N'Tỉnh', 'khanh-hoa', N'Tỉnh Khánh Hòa', N'Tỉnh/Thành', NULL, 1);

INSERT INTO Customers (FullName, Birthday, Avatar, CusAddress, Email, Phone, LocationID, District, Ward, CreateDate, AccPassword, Salt, LastLogin, Active) VALUES 
 ('Customer 1', '2023-04-19 16:11:47', 'avatar1.jpg', '1 Example Street', 'customer1@example.com', '555-6249', '6', 'District 2', 'Ward 1', '2023-09-17 16:11:47', 'dqpZQ0TuoW', 'LrRaaw', '2023-09-14 16:11:47', '0'),
 ('Customer 2', '2023-09-29 16:11:47', 'avatar2.jpg', '2 Example Street', 'customer2@example.com', '555-8305', '3', 'District 7', 'Ward 8', '2023-02-05 16:11:47', 'KcRy1LfCA2', 'IFQRig', '2023-08-30 16:11:47', '0'),
 ('Customer 3', '2023-03-15 16:11:47', 'avatar3.jpg', '3 Example Street', 'customer3@example.com', '555-2707', '3', 'District 3', 'Ward 2', '2023-01-03 16:11:47', 'G3BdRTa7ui', '0emRzt', '2023-08-15 16:11:47', '1'),
 ('Customer 4', '2023-06-20 16:11:47', 'avatar4.jpg', '4 Example Street', 'customer4@example.com', '555-3643', '7', 'District 7', 'Ward 8', '2023-11-12 16:11:47', 'j3vLqWuUlw', 'hrMbbb', '2023-07-21 16:11:47', '1'),
 ('Customer 5', '2023-05-25 16:11:47', 'avatar5.jpg', '5 Example Street', 'customer5@example.com', '555-2618', '6', 'District 8', 'Ward 5', '2023-11-14 16:11:47', 'z3ChpRcJAW', 'eKMyhE', '2023-01-25 16:11:47', '0'),
 ('Customer 6', '2023-01-16 16:11:47', 'avatar6.jpg', '6 Example Street', 'customer6@example.com', '555-7672', '7', 'District 4', 'Ward 9', '2023-07-11 16:11:47', 'l8IQvM2zRH', 'DjhKO9', '2023-09-30 16:11:47', '0'),
 ('Customer 7', '2023-10-25 16:11:47', 'avatar7.jpg', '7 Example Street', 'customer7@example.com', '555-2460', '6', 'District 7', 'Ward 9', '2023-07-11 16:11:47', 'YMt0WSe5WI', 'pMYqw7', '2023-01-28 16:11:47', '0'),
 ('Customer 8', '2023-01-20 16:11:47', 'avatar8.jpg', '8 Example Street', 'customer8@example.com', '555-7720', '3', 'District 8', 'Ward 3', '2023-04-13 16:11:47', 'zhqHhAhlbt', '36Bp1M', '2023-03-16 16:11:47', '0'),
 ('Customer 9', '2023-09-10 16:11:47', 'avatar9.jpg', '9 Example Street', 'customer9@example.com', '555-6082', '3', 'District 2', 'Ward 7', '2023-05-12 16:11:47', 'rgzrmjI26n', 'LtdZUZ', '2023-06-29 16:11:47', '1'),
 ('Customer 10', '2022-12-22 16:11:47', 'avatar10.jpg', '10 Example Street', 'customer10@example.com', '555-8464', '6', 'District 6', 'Ward 9', '2023-07-22 16:11:47', 'hsk5KcG8xF', 'ed5t3M', '2023-11-09 16:11:47', '0'),
 ('Customer 11', '2022-12-18 16:11:47', 'avatar11.jpg', '11 Example Street', 'customer11@example.com', '555-9547', '7', 'District 2', 'Ward 7', '2023-08-05 16:11:47', 'GCwAnYI5yg', 'MUN1mr', '2023-04-01 16:11:47', '0'),
 ('Customer 12', '2023-06-03 16:11:47', 'avatar12.jpg', '12 Example Street', 'customer12@example.com', '555-7252', '10', 'District 5', 'Ward 9', '2023-04-14 16:11:47', '7dB58YQ551', 'nODSJq', '2023-10-27 16:11:47', '1'),
 ('Customer 13', '2023-05-07 16:11:47', 'avatar13.jpg', '13 Example Street', 'customer13@example.com', '555-8337', '7', 'District 5', 'Ward 5', '2023-02-27 16:11:47', 'yvNnr0V2MY', '53LdSZ', '2023-03-12 16:11:47', '1'),
 ('Customer 14', '2023-07-22 16:11:47', 'avatar14.jpg', '14 Example Street', 'customer14@example.com', '555-8058', '9', 'District 5', 'Ward 2', '2023-03-30 16:11:47', '11NG2iz7Fi', 'fQPJWY', '2023-08-24 16:11:47', '1'),
 ('Customer 15', '2023-10-09 16:11:47', 'avatar15.jpg', '15 Example Street', 'customer15@example.com', '555-4451', '10', 'District 4', 'Ward 9', '2023-03-19 16:11:47', 'Mll1yJvO7k', 'q6Kvo5', '2023-06-04 16:11:47', '1'),
 ('Customer 16', '2023-02-22 16:11:47', 'avatar16.jpg', '16 Example Street', 'customer16@example.com', '555-9938', '1', 'District 4', 'Ward 3', '2023-04-20 16:11:47', 'aH5kLMrDYB', 'dFyfMx', '2023-01-04 16:11:47', '1'),
 ('Customer 17', '2023-01-30 16:11:47', 'avatar17.jpg', '17 Example Street', 'customer17@example.com', '555-1609', '8', 'District 3', 'Ward 6', '2023-07-03 16:11:47', 'wXhzLz3sWo', 'VAb0hB', '2023-10-09 16:11:47', '0'),
 ('Customer 18', '2023-07-27 16:11:47', 'avatar18.jpg', '18 Example Street', 'customer18@example.com', '555-9582', '3', 'District 5', 'Ward 9', '2023-06-03 16:11:47', 'KFAyPqqj9y', 'lCR9Ra', '2023-09-09 16:11:47', '0'),
 ('Customer 19', '2023-04-28 16:11:47', 'avatar19.jpg', '19 Example Street', 'customer19@example.com', '555-8052', '4', 'District 5', 'Ward 2', '2023-11-03 16:11:47', 'PjVhHBIRHd', 'X3JtUH', '2023-05-26 16:11:47', '0'),
 ('Customer 20', '2022-12-23 16:11:47', 'avatar20.jpg', '20 Example Street', 'customer20@example.com', '555-8178', '2', 'District 3', 'Ward 1', '2023-07-08 16:11:47', 'xFqyfj5PhM', 'ZrHGeP', '2023-10-25 16:11:47', '1'),
 ('Customer 21', '2023-02-08 16:11:47', 'avatar21.jpg', '21 Example Street', 'customer21@example.com', '555-8867', '6', 'District 4', 'Ward 2', '2023-07-18 16:11:47', 'b7qkErE4NW', 'DjcKB9', '2023-02-20 16:11:47', '1'),
 ('Customer 22', '2023-04-28 16:11:47', 'avatar22.jpg', '22 Example Street', 'customer22@example.com', '555-3254', '4', 'District 5', 'Ward 8', '2023-04-29 16:11:47', 'w5sAsVC0vK', 'ODbJWj', '2023-01-06 16:11:47', '0'),
 ('Customer 23', '2023-03-13 16:11:47', 'avatar23.jpg', '23 Example Street', 'customer23@example.com', '555-1850', '9', 'District 5', 'Ward 5', '2023-02-10 16:11:47', 'edOrFlZVNr', 'FmCCt9', '2023-02-10 16:11:47', '0'),
 ('Customer 24', '2023-08-21 16:11:47', 'avatar24.jpg', '24 Example Street', 'customer24@example.com', '555-3965', '5', 'District 4', 'Ward 9', '2023-11-18 16:11:47', 'z5UEig6HL7', '7IPJjy', '2023-06-04 16:11:47', '0'),
 ('Customer 25', '2023-02-22 16:11:47', 'avatar25.jpg', '25 Example Street', 'customer25@example.com', '555-5142', '2', 'District 3', 'Ward 3', '2023-08-06 16:11:47', 'aMWshYwnJW', '5g5eYI', '2023-01-28 16:11:47', '1'),
 ('Customer 26', '2023-07-10 16:11:47', 'avatar26.jpg', '26 Example Street', 'customer26@example.com', '555-1914', '1', 'District 7', 'Ward 2', '2023-01-25 16:11:47', 'm0qyBg58VD', '5bXDxD', '2023-06-18 16:11:47', '0'),
 ('Customer 27', '2023-09-22 16:11:47', 'avatar27.jpg', '27 Example Street', 'customer27@example.com', '555-8143', '4', 'District 1', 'Ward 6', '2023-11-22 16:11:47', 'yVsIJKYeQx', '1EEfvT', '2023-08-14 16:11:47', '0'),
 ('Customer 28', '2023-03-02 16:11:47', 'avatar28.jpg', '28 Example Street', 'customer28@example.com', '555-7333', '5', 'District 2', 'Ward 10', '2023-03-26 16:11:47', 'g1xvAyHjla', 'EzvY1M', '2023-04-06 16:11:47', '0'),
 ('Customer 29', '2023-06-27 16:11:47', 'avatar29.jpg', '29 Example Street', 'customer29@example.com', '555-6077', '9', 'District 4', 'Ward 6', '2023-03-14 16:11:47', 'S1hsGHpffe', 'n91Aam', '2023-07-25 16:11:47', '0'),
 ('Customer 30', '2023-05-17 16:11:47', 'avatar30.jpg', '30 Example Street', 'customer30@example.com', '555-2223', '4', 'District 2', 'Ward 2', '2023-06-06 16:11:47', 'MKNfUD2nOB', '7U8PpM', '2023-10-09 16:11:47', '0');

INSERT INTO Products (ProductName, ShortDescription, ProductDescription, CatID, Price, Discount, Thumb, Video, DateCreated, DateModified, BestSellers, HomeFlag, Active, Tags, Title, Alias, MetaDesc, MetaKey, UnitsInStock) VALUES 
('AKKO 3068B Black Pink', N'Bàn phím AKKO 3068B Black Pink', 'Bàn phím cơ AKKO 3068B Black Pink (Bluetooth 5.0 / Wireless 2.4Ghz / Hotswap / Foam tiêu âm / AKKO CS Jelly sw)', '1', '1970000', '0.13', 'akko3068Bblackpink.png', 'video1.mp4', '2023-09-19 16:11:47', '2023-02-27 16:11:47', '1', '1', '0', 'Tag1', 'AKKO 3068B Black Pink', 'akko-3068b-black-pink', 'AKKO 3068B Black Pink', 'AKKO 3068B Black Pink', '29'),
('AKKO 3068B World Tour Tokyo R2', N'Bàn phím AKKO 3068B World Tour Tokyo R2', N'Bàn phím cơ AKKO 3068B World Tour Tokyo R2 (Bluetooth 5.0 / Wireless 2.4Ghz / Hotswap / Foam tiêu âm / AKKO CS Jelly sw)', '1', '1890000', '0.18', 'akko3068bworldtourtokyor2.png', 'video2.mp4', '2023-01-08 16:11:47', '2023-07-09 16:11:47', '0', '1', '1', 'Tag2', 'AKKO 3068B World Tour Tokyo R2', 'akko-3068b-world-tour', 'akko 3068b world tour', 'akko 3068b world tour', '87'),
('LANGTU GK65', N'Bàn phím LANGTU GK65', N'Bàn Phím Cơ Không Dây LANGTU GK65 HOTSWAP GoldenSwitch - Hỗ trợ 3 chế độ kết nối', '1', '700000', '0.11', 'langtugk65.png', 'video3.mp4', '2023-11-18 16:11:47', '2023-03-03 16:11:47', '0', '1', '0', 'Tag3', 'Langtu GK65', 'langtu-gk65', 'langtu gk65', 'langtu-gk65', '90'),
('MF34 RBG', N'Bàn phím numpad MF34 RBG', N'Bàn phím custom numpad MF34 RBG, hot swap, keymap VIA', '1', '450000', '0.27', 'mf34rbg.png', 'video4.mp4', '2023-02-25 16:11:47', '2023-06-30 16:11:47', '0', '1', '0', 'Tag4', 'MF34 RBG', 'mf34-rbg-brown-bread', 'MF34 RBG', 'MF34 RBG', '48'),
('E-DRA EK368L Alpha', N'Bàn phím cơ không dây E-DRA EK368L Alpha', N'Bàn phím cơ không dây E-DRA EK368L Alpha', '1', '350000', '0.36', 'edraek368lalpha.png', 'video5.mp4', '2023-10-11 16:11:47', '2023-03-31 16:11:47', '0', '1', '1', 'Tag5', 'E-DRA EK368L Alpha', 'e-dra-ek368l-alpha', 'E-DRA EK368L Alpha', 'E-DRA EK368L Alpha', '37'),
('AKKO 3087 RF Dragon Ball Z - Goku', N'Bàn phím SAKKO 3087 RF Dragon Ball Z - Goku', N'Bàn phím cơ không dây AKKO 3087 RF Dragon Ball Z - Goku (AKKO switch v3 - Cream Yellow)', '1', '1600000', '0.25', 'akko3087rfdragonballz.jpg', 'video6.mp4', '2023-03-07 16:11:47', '2022-12-10 16:11:47', '0', '1', '0', 'Tag6', 'AKKO 3087 RF Dragon Ball Z - Goku', 'akko-3087-rf-dragon-ball-z-goku', 'AKKO 3087 RF Dragon Ball Z - Goku', 'AKKO 3087 RF Dragon Ball Z - Goku', '72'),
('AKKO Designer Studio – MOD005', N'Kit AKKO Designer Studio – MOD005', N'Kit bàn phím cơ AKKO Designer Studio – MOD005 (Hotswap 5 pin / RGB / Foam tiêu âm / Gasket Mount)', '2', '2490000', '0.15', 'akkodesignerstudiomod005.png', 'video7.mp4', '2023-07-30 16:11:47', '2023-01-13 16:11:47', '1', '1', '1', 'Tag7', 'AKKO Designer Studio – MOD005', 'akko-designer-studio-mod005', 'Kit AKKO Designer Studio – MOD005', 'Kit AKKO Designer Studio – MOD005', '92'),
('Keycool Y84 LED', 'Kit Keycool Y84 LED', N'Kit bàn phím cơ Keycool Y84 led viền Bluetooth 5.0, Type C, Wireless 2.4g, hot swap RGB', '2', '1799000', '0.03', 'keycooly84led.png', 'video8.mp4', '2023-01-03 16:11:47', '2023-10-17 16:11:47', '1', '0', '0', 'Tag8', 'Keycool Y84 led', 'keycool-y84-led', 'Keycool Y84 led', 'Keycool Y84 led', '46'),
('Custom ABM066', 'KIT custom ABM066', N'KIT custom ABM066 | Alice layout | 3 modes | Keycap VIA | Mạch xuôi | Pin 3000mah | Màn hình GIF | Núm xoay', '2', '1099000', '0.32', 'kitcustomabm066.png', 'video9.mp4', '2022-12-01 16:11:47', '2023-05-15 16:11:47', '0', '1', '1', 'Tag9', 'KIT custom ABM066', 'kit-custom-abm066', 'KIT custom ABM066', 'KIT custom ABM066', '64'),
('DAGK 40%', 'Kit DAGK 40%', N'Kit bàn phím cơ DAGK 40% nhôm, bluetooth, wireless 2.4g, type C', '2', '1699000', '0.24', 'dagk40.png', 'video10.mp4', '2023-02-17 16:11:47', '2022-12-25 16:11:47', '0', '1', '0', 'Tag10', 'DAGK 40%', 'dagk-40%', 'DAGK 40%', 'DAGK 40%', '23'),
('Zuoya GMK87', 'Kit Zuoya GMK87', N'KIT Zuoya GMK87 | 3 mode kết nối | Led RGB | Màn hình led | Núm xoay | Bàn phím cơ mạch xuôi', '2', '1100000', '0.19', 'zuoyagmk87.png', 'video11.mp4', '2023-08-08 16:11:47', '2023-02-28 16:11:47', '0', '1', '0', 'Tag11', 'Zuoya GMK87', 'zuoya-gmk87-', 'Zuoya GMK87', 'Zuoya GMK87', '73'),
('Record Alice', 'Kit Record Alice', 'Record Alice Keyboard Kit', '2', '950000', '0.14', 'recordalice.png', 'video12.mp4', '2023-10-03 16:11:47', '2023-01-17 16:11:47', '0', '0', '1', 'Tag12', 'Record Alice Keyboard Kit', 'record-alice-keyboard-kit', 'Record Alice Keyboard Kit', 'Record Alice Keyboard Kit', '50'),
('Shark67', 'Kit Shark67', N'Kit bàn phím cơ Shark67 nhôm CNC kết nối không dây 3 chế độ', '2', '2450000', '0.48', 'shark67.png', 'video13.mp4', '2023-02-13 16:11:47', '2023-02-06 16:11:47', '0', '1', '0', 'Tag13', 'Shark67', 'shark67', 'Shark67', 'Shark67', '95'),
('Redragon S101-K - White', N'Bàn phím Gaming giả cơ Redragon S101-K - White', N'Bàn phím Gaming giả cơ Redragon S101-K - White', '3', '11', '0.03', 'redragons101kwite.png', 'video14.mp4', '2022-12-21 16:11:47', '2023-09-16 16:11:47', '0', '0', '1', 'Tag14', 'Redragon S101-K - White', 'redragon-s101-k-white', 'Redragon S101-K - White', 'Redragon S101-K - White', '3'),
('G21', N'Bàn phím giả cơ gaming G21', N'Bàn phím giả cơ gaming G21 với đèn Led 7 màu chuyên dùng cho máy tính PC', '3', '44', '0.05', 'g21.jpg', 'video15.mp4', '2023-06-17 16:11:47', '2023-11-11 16:11:47', '1', '0', '0', 'Tag15', 'G21', 'g21', 'G21', 'G21', '84'),
('Blue Cow', 'Keycap Blue Cow', N'Keycap Cho Bàn Phím Cơ Blue Cow MOA Profile 142 Phím', '4', '400000', '0.0', 'bluecow.png', 'video16.mp4', '2023-05-15 16:11:47', '2023-10-10 16:11:47', '0', '0', '1', 'Tag16', 'Keycap Blue Cow', 'keycap-blue-cow', 'Keycap Blue Cow', 'Keycap Blue Cow', '89'),
('Cherry DAGK Black Gold', 'Keycap Cherry DAGK Black Gold', N'Keycap Cho Bàn Phím Cơ Cherry DAGK Black Gold 126 Phím', '4', '470000', '0.46', 'cherrydagkblackgold.png', 'video17.mp4', '2023-07-24 16:11:47', '2022-12-14 16:11:47', '0', '1', '0', 'Tag17', 'Cherry DAGK Black Gold', 'cherry-dagk-black-gold', 'Cherry DAGK Black Gold', 'Cherry DAGK Black Gold', '56'),
('GMK Samurai Blue', 'Keycap GMK Samurai Blue', N'Keycap Cho Bàn Phím Cơ GMK Samurai Blue Thick PBT Cherry Profile 126 Phím', '4', '510000', '0.33', 'gmksamuraiblue.png', 'video18.mp4', '2023-06-24 16:11:47', '2023-03-14 16:11:47', '0', '0', '0', 'Tag18', 'Keycap GMK Samurai Blue', 'keycap-gmk-samurai-blue', 'Keycap GMK Samurai Blue', 'Keycap GMK Samurai Blue', '41'),
('Keycap Puller', N'Dụng cụ nhổ keycap', N'Dụng cụ nhổ keycap', '5', '15000', '0.12', 'keycappuller.png', 'video19.mp4', '2023-01-23 16:11:47', '2023-10-04 16:11:47', '1', '0', '0', 'Tag19', 'Keycap Puller', 'keycap-puller', 'Keycap Puller', 'Keycap Puller', '76'),
('Switch Puller', N'Dụng cụ nhổ switch', N'Dụng cụ nhổ switch', '5', '15000', '0.06', 'switchpuller.jpg', 'video20.mp4', '2023-02-03 16:11:47', '2023-03-31 16:11:47', '1', '0', '1', 'Tag20', 'Switch Puller', 'switch-puller', 'Switch Puller', 'Switch Puller', '39'),
(N'Hộp đựng switch hoặc keycap', N'Hộp đựng switch hoặc keycap', N'Hộp đựng switch hoặc keycap', '5', '40000', '0.02', 'box.png', 'video21.mp4', '2023-10-15 16:11:47', '2023-04-26 16:11:47', '0', '1', '0', 'Tag21', 'Hộp đựng switch hoặc keycap', 'hop-dung-switch-hoac-keycap', 'Hộp đựng switch hoặc keycap', 'Hộp đựng switch hoặc keycap', '52'),
('Gateron milky yellow pro', 'Switch Gateron milky yellow pro', N'Gateron milky yellow pro - switch linear 50g âm trầm 5 pin cho bàn phím cơ - switch gateron milky yellow pro', '6', '7000', '0.43', 'gateronmilkyyellow.png', 'video22.mp4', '2023-11-15 16:11:47', '2023-03-17 16:11:47', '1', '0', '1', 'Tag22', 'Gateron milky yellow', 'gateron-milky-yellow', 'Gateron milky yellow', 'Gateron milky yellow', '2000'),
('Fantasy Virus', 'Switch Fantasy Virus', N'Switch Fantasy Virus Tactile 58g công tắc bàn phím Switch Virus 5 pin lò xo đôi 2 đoạn', '6', '4000', '0.28', 'fantasyvirus.jpg', 'video23.mp4', '2023-07-27 16:11:47', '2023-07-09 16:11:47', '1', '1', '0', 'Tag23', 'Switch Fantasy Virus', 'switch-fantasy-virus', 'Switch Fantasy Virus', 'Switch Fantasy Virus', '675'),
('Outemu Silent Lime Peach', 'Switch Outemu Silent Lime Peach', N'Switch Outemu Silent Lime Peach Gray White Yellow công tắc bàn phím Switch Silent yên tĩnh không tiếng', '6', '6000', '0.46', 'outemusilent.jpg', 'video24.mp4', '2022-12-26 16:11:47', '2023-10-24 16:11:47', '0', '0', '0', 'Tag24', 'Switch Outemu Silent Lime Peach', 'switch-outemu-silent-lime-peach', 'Switch Outemu Silent Lime Peach', 'Switch Outemu Silent Lime Peach', '400'),
('Gateron Oil King', 'Switch Gateron Oil King', N'Gateron Oil King Switch Linear Switch Công Tắc Bàn Phím Cơ', '6', '23', '0.33', 'gateronoilking.png', 'video25.mp4', '2023-08-12 16:11:48', '2023-06-22 16:11:48', '0', '0', '1', 'Tag25', N'Gateron Oil King Switch Linear Switch Công Tắc Bàn Phím Cơ', 'gateron-oil-linear-switch', N'Gateron Oil King Switch Linear Switch Công Tắc Bàn Phím Cơ', 'Gateron Oil King Switch Linear Switch', '256'),
('Deep Sea Ocean', 'Switch Deep Sea Ocean', N'[SWITCH IM LẶNG] Silent switch Deep Sea Ocean BOX, WHALE ISLET BOX V2 Silent Linear cao cấp', '6', '11000', '0.37', 'deepseaocean.png', 'video26.mp4', '2023-08-14 16:11:48', '2022-12-15 16:11:48', '0', '0', '1', 'Tag26', 'Switch Deep Sea Ocean', 'switch-deep-sea-ocean', 'Switch Deep Sea Ocean', 'Switch Deep Sea Ocean', '400'),
('Stab Owlab V3', N'Thanh Stab Cân Bằng Owlab V3', N'Thông tin chi tiết:
- Thiết kế lỗ wire khít, kèm theo Bandaid và vòng đệm.
- Wire: 4 thanh 2u, 1 thanh 6.25u hoặc 1 thanh 7u
- Housing và Slider: 5 cặp (10 chiếc) mỗi loại.', '7', '380000', '0.33', 'owlabv3.png', 'video27.mp4', '2023-04-23 16:11:48', '2022-12-20 16:11:48', '1', '0', '0', 'Tag27', 'Stab Owlab V3', 'stab-owlab-v3', 'Stab Owlab V3', 'Stab Owlab V3', '100'),
('Cherry Genuine', 'Cherry Genuine Stabilizer Plate mount', N'Thanh cân bằng bàn phím cơ - Cherry Genuine Stabilizer Plate mount - Screw in - Size TKL', '7', '120000', '0.23', 'cherrygenuine.png', 'video28.mp4', '2023-05-30 16:11:48', '2023-08-29 16:11:48', '0', '0', '1', 'Tag28', 'Cherry Genuine Stabilizer Plate mount', 'cherry-genuine-stabilizer', 'Cherry Genuine Stabilizer Plate mount', 'Cherry Genuine Stabilizer Plate mount', '31'),
(N'Wire mạ vàng Kelowna', N'Wire mạ vàng Kelowna - Thanh cân bằng cho stab bàn phím cơ', N'Wire mạ vàng Kelowna - Thanh cân bằng cho stab bàn phím cơ', '7', '10000', '0.43', 'wirevang.png', 'video29.mp4', '2023-05-22 16:11:48', '2023-01-23 16:11:48', '1', '1', '1', 'Tag29', N'Wire mạ vàng Kelowna', 'wire-ma-vang-kelowna', N'Wire mạ vàng Kelowna', N'Wire mạ vàng Kelowna', '109'),
('Stab Foam Poron', N'Bộ Stab Foam Poron cho Stab Stabilizer', N'Bộ Stab Foam Poron cho Stab Stabilizer bàn phím cơ Foam wire stab Foam Stab Plate Mount | Đệm Stab Đệm Wire Holee Mod', '7', '35000', '0.33', 'stabfoamporon.png', 'video30.mp4', '2023-08-12 16:11:48', '2023-05-16 16:11:48', '1', '1', '0', 'Tag30', N'Bộ Stab Foam Poron cho Stab Stabilizer', 'stab-foam-poron', N'Bộ Stab Foam Poron cho Stab Stabilizer', N'Bộ Stab Foam Poron cho Stab Stabilizer', '92');




SET IDENTITY_INSERT Roles ON
SET IDENTITY_INSERT Shippers ON
SET IDENTITY_INSERT TransactionStatus ON
SET IDENTITY_INSERT Categories ON
SET IDENTITY_INSERT Locations ON
SET IDENTITY_INSERT Customers ON
SET IDENTITY_INSERT Orders ON
SET IDENTITY_INSERT Products ON
SET IDENTITY_INSERT OrderDetails ON
SET IDENTITY_INSERT Pages ON