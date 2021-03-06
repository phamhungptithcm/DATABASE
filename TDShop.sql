USE [TDShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/5/2018 11:48:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameVN] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2/5/2018 11:48:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [nvarchar](100) NOT NULL,
	[Sex] [bit] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](1000) NOT NULL,
	[Repply] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2/5/2018 11:48:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/5/2018 11:48:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/5/2018 11:48:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](50) NULL,
	[OrderDate] [date] NULL,
	[ShippedDate] [date] NULL,
	[ShipName] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[OrderStatusId] [int] NULL,
	[Notes] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](200) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 2/5/2018 11:48:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[NameVN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/5/2018 11:48:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)),
	[TechnicalParamId] [int] NOT NULL,
	[Discount] [float] NOT NULL CONSTRAINT [DF_Products_Discount]  DEFAULT (rand()),
	[UnitsInStock] [int] NOT NULL CONSTRAINT [DF_Products_UnitsInStock]  DEFAULT ((100)),
	[CategoryId] [int] NOT NULL,
	[SupplierId] [nvarchar](50) NOT NULL CONSTRAINT [DF_Products_SupplierId]  DEFAULT (N'AP'),
	[Image] [nvarchar](50) NOT NULL CONSTRAINT [DF_Products_Image]  DEFAULT (N'product.jpg'),
	[Available] [bit] NOT NULL CONSTRAINT [DF_Products_Available]  DEFAULT ((1)),
	[Special] [bit] NOT NULL CONSTRAINT [DF_Products_Special]  DEFAULT ((0)),
	[Latest] [bit] NOT NULL CONSTRAINT [DF_Products_Latest]  DEFAULT ((0)),
	[ProductDate] [date] NOT NULL CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()),
	[ViewCount] [int] NOT NULL CONSTRAINT [DF_Products_ViewCount]  DEFAULT ((0)),
	[Description] [nvarchar](3000) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2/5/2018 11:48:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Id] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Logo] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TechnicalParam]    Script Date: 2/5/2018 11:48:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechnicalParam](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CPU] [nvarchar](50) NULL,
	[Ram] [nvarchar](50) NULL,
	[Drive] [nvarchar](50) NULL,
	[Screen] [nvarchar](50) NULL,
	[ScreenCard] [nvarchar](50) NULL,
	[ConnectionPort] [nvarchar](50) NULL,
	[OperatingSystem] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
 CONSTRAINT [PK_TechnicalParam] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

GO
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (1, N'Điện thoại', N'Mobile')
GO
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (2, N'Máy tính bảng', N'Tablet')
GO
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (3, N'Máy tính xách tay', N'Laptop')
GO
INSERT [dbo].[Categories] ([Id], [NameVN], [Name]) VALUES (4, N'Phụ kiện', N'Accessories')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Phone], [Email], [Photo], [Activated], [Admin]) VALUES (N'Admin', N'admin', N'Amin', N'01234567890', N'phamhung.pitit@gmail.com', N'User.png', 1, 1)
GO
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Phone], [Email], [Photo], [Activated], [Admin]) VALUES (N'ALERT', N'1234', N'Alert Moreno', N'097345676', N'hungpham123454321@gmail.com', N'User.jpg', 1, 0)
GO
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Phone], [Email], [Photo], [Activated], [Admin]) VALUES (N'MESSI', N'1234', N'Lionel Messi', N'098475432', N'hungpham123454321@gmail.com', N'User.jpg', 1, 0)
GO
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Phone], [Email], [Photo], [Activated], [Admin]) VALUES (N'NEYMA', N'1234', N'Neyma Moreno', N'097345675', N'hungpham123454321@gmail.com', N'User.jpg', 0, 0)
GO
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Phone], [Email], [Photo], [Activated], [Admin]) VALUES (N'phamhung', N'1234', N'Phạm Hùng', N'01234567890', N'hungpham12344321@gmail.com', N'1517383433822-default.png', 1, 0)
GO
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Phone], [Email], [Photo], [Activated], [Admin]) VALUES (N'RONALDO', N'1234', N'Cristiano Ronaldo', N'01238964531', N'hungpham123454321@gmail.com', N'User.jpg', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 1, 1, 513, 1, 0.1)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (2, 2, 1, 513, 1, 0.01)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (3, 2, 2, 703, 1, 0.05)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 3, 2, 703, 1, 0.05)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (5, 4, 1, 513, 1, 0.1)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [ShippedDate], [ShipName], [Amount], [OrderStatusId], [Notes], [ShipAddress]) VALUES (1, N'phamhung', CAST(N'1996-07-04' AS Date), CAST(N'2017-12-06' AS Date), N'Nguyễn Văn A', 513, 1, N'Giao ngày thứ 7 hoặc chủ nhật', N'Quảng Bình,Ba Đồn,Số 1,Quang Trung,154')
GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [ShippedDate], [ShipName], [Amount], [OrderStatusId], [Notes], [ShipAddress]) VALUES (2, N'MESSI', CAST(N'1996-07-05' AS Date), CAST(N'2017-12-06' AS Date), N'Nguyễn Bình', 1216, 2, N'ABC', N'Hồ Chí Minh,Quận 9,Hiệp Phú,Man Thiện,97')
GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [ShippedDate], [ShipName], [Amount], [OrderStatusId], [Notes], [ShipAddress]) VALUES (3, N'RONALDO', CAST(N'1996-07-08' AS Date), CAST(N'2017-12-06' AS Date), N'Nguyễn Bình', 703, 3, N'XYZ', N'Hồ Chí Minh,Thủ Đức,Linh Tây,Kha Vạn Cân,486')
GO
INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [ShippedDate], [ShipName], [Amount], [OrderStatusId], [Notes], [ShipAddress]) VALUES (4, N'ALERT', CAST(N'1996-07-09' AS Date), CAST(N'2017-12-06' AS Date), N'Nguyễn Văn A', 513, 4, N'Không giao buổi sáng', N'Huế,Vĩnh Ninh,ABC,Hà Nội,5')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatuses] ON 

GO
INSERT [dbo].[OrderStatuses] ([Id], [Name], [NameVN]) VALUES (1, N'Not yes contact', N'Chưa xử lý')
GO
INSERT [dbo].[OrderStatuses] ([Id], [Name], [NameVN]) VALUES (2, N'Contacted', N'Đã liên hệ')
GO
INSERT [dbo].[OrderStatuses] ([Id], [Name], [NameVN]) VALUES (3, N'Shipping', N'Đang vận chuyển')
GO
INSERT [dbo].[OrderStatuses] ([Id], [Name], [NameVN]) VALUES (4, N'Shipped', N'Đã hoàn thành')
GO
INSERT [dbo].[OrderStatuses] ([Id], [Name], [NameVN]) VALUES (5, N'Canceled', N'Đã hủy')
GO
SET IDENTITY_INSERT [dbo].[OrderStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (1, N'iPhone X 256GB', 1568, 1, 0.15, 1568, 1, N'AP', N'iphone-x-256gb.png', 1, 1, 1, CAST(N'2017-09-12' AS Date), 149, N'iPhone X được Apple ra mắt ngày 12/9 vừa rồi đánh dấu chặng đường 10 năm lần đầu tiên iPhone ra đời. Sau một thời gian, giá iPhone X cũng được công bố. iPhone X mang trên mình thiết kế hoàn toàn mới với màn hình Super Retina viền cực mỏng và trang bị nhiều công nghệ hiện đại như nhận diện khuôn mặt Face ID, sạc pin nhanh và sạc không dây cùng khả năng chống nước bụi cao cấp.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (2, N'Acer Nitro 5 AN515-51-51UM', 703, 2, 0.08, 703, 3, N'AC', N'Acer-Nitro-5-AN515-51-51UM.jpg', 1, 0, 0, CAST(N'2017-01-12' AS Date), 13, N'Acer Nitro 5 là một chiếc laptop giải trí thuộc phân khúc tầm trung với giá từ 20 triệu, sở hữu cấu hình khá tốt với màn hình 15,6" IPS, tùy chọn Intel Core i5 hoặc i7 4 nhân thế hệ Kaby Lake và trang bị vi xử lý đồ họa rời Nvidia GeForce GTX 1050 đủ mạnh để chúng ta có thể chơi được nhiều tựa game. Phiên bản mình sẽ cùng anh em mổ xẻ trong bài này là Nitro 5 A515-51 chạy Core i5-7300HQ và GTX 1050 2 GB.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (3, N'iPhone 8 Plus 256GB', 2250, 1, 0, 2250, 1, N'AP', N'iphone-8-plus-256gb.png', 1, 1, 1, CAST(N'2017-08-15' AS Date), 8, N'iPhone 8 Plus là bản nâng cấp nhẹ của chiếc iPhone 7 Plus đã ra mắt trước đó với cấu hình mạnh mẽ cùng camera có nhiều cải tiến.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (4, N'iPhone 8 256GB', 999, 1, 0, 999, 1, N'AP', N'iphone-8-256gb.png', 0, 1, 1, CAST(N'2017-08-15' AS Date), 6, N'')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (5, N'iPhone 7 Plus 256GB', 899, 1, 0.05, 899, 1, N'AP', N'iphone-7-plus-256gb.png', 1, 1, 0, CAST(N'2016-09-12' AS Date), 9, N'Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (6, N'iPhone 7 256GB', 679, 1, 0.1, 679, 1, N'AP', N'iphone-7-256gb.png', 1, 0, 0, CAST(N'2016-09-12' AS Date), 2, N'iPhone 7 256 GB mang trên mình thiết kế quen thuộc từ thời iPhone 6, máy được trang bị bộ nhớ lưu trữ lớn, khả năng chống nước cao cấp, dàn loa stereo cho âm thanh hay và cấu hình cực mạnh.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (7, N'iPhone 6s 128GB', 599, 1, 0.15, 599, 1, N'AP', N'iphone-6s-128gb.png', 1, 0, 0, CAST(N'2015-09-12' AS Date), 32, N'iPhone 6s xứng đáng là phiên bản nâng cấp hoàn hảo từ iPhone 6 với nhiều tính năng mới hấp dẫn.
Camera được cải tiến
iPhone 6s được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6), camera có tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (8, N'iPhone 6s Plus 32GB', 622, 1, 0.05, 622, 1, N'AP', N'iphone-6s-plus-32gb.png', 1, 0, 0, CAST(N'2015-09-12' AS Date), 58, N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.
Camera được cải tiến
iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (9, N'iPhone 6 32GB', 412, 1, 0, 412, 1, N'AP', N'iphone-6-32gb.png', 1, 0, 0, CAST(N'2014-09-12' AS Date), 29, N'Đặc điểm nổi bật của iPhone 6 32GB

Tìm hiểu thêm
Tìm hiểu thêm
Bộ sản phẩm chuẩn: Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp, Cây lấy sim

iPhone 6 là một trong những smartphone được yêu thích nhất của Apple. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất "Hot".')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (10, N'iPhone 5S 16GB', 241, 1, 0, 241, 1, N'AP', N'iphone-5s-16gb.png', 1, 0, 0, CAST(N'2013-09-12' AS Date), 222, N'Thiết kế sang trọng, gia công tỉ mỉ, tích hợp cảm biến vân tay cao cấp hơn, camera cho hình ảnh đẹp và sáng hơn.
Sang trọng trong thiết kế
Thiết kế được giữ nguyên so với phiên bản đầu là iPhone 5, các đường cắt kim loại được gia công tỉ mỉ, sáng bóng nhìn rất đẹp mắt, máy có 3 màu là Xám đậm, Vàng đồng và màu Bạc.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (11, N'Samsung Galaxy Note 8', 2299, 1, 0, 2299, 1, N'SA', N'samsung-galaxy-note8.png', 1, 1, 1, CAST(N'2017-08-22' AS Date), 3, N'Galaxy Note 8 là niềm hy vọng vực lại dòng Note danh tiếng của Samsung với diện mạo nam tính, sang trọng. Trang bị camera kép xóa phông thời thượng, màn hình vô cực như trên S8 Plus, bút Spen với nhiều tính năng mới và nhiều công nghệ được Samsung ưu ái đem lên Note 8.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (12, N'Samsung Galaxy S8 Plus', 999, 1, 0.05, 999, 1, N'SA', N'samsung-galaxy-s8-plus.png', 1, 1, 1, CAST(N'2017-04-06' AS Date), 6, N'Galaxy S8 và S8 Plus hiện đang là chuẩn mực smartphone về thiết kế trong tương lai. Sau nhiều ngày được sử dụng, mình xin chia sẻ những cảm nhận chi tiết nhất về chiếc Galaxy S8 Plus - thiết bị đang có doanh số đặt hàng khủng nhất hiện tại.
Trải nghiệm màn hình lớn, chứ không phải là một thiết bị kích thước lớn
Năm nay, các nhà sản xuất Hàn Quốc như LG và Samsung đã đi tiên phong với màn hình tỉ lệ 18:9 hay 18,5:9, tối ưu hết mức viền màn hình. Và Galaxy S8 Plus cũng vậy, người dùng sẽ có một trải nghiệm màn hình lớn chứ không phải là một thiết bị kích thước lớn.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (13, N'Samsung Galaxy S8', 879, 1, 0, 879, 1, N'SA', N'samsung-galaxy-s8.png', 1, 1, 1, CAST(N'2017-04-06' AS Date), 7, N'Galaxy S8 là siêu phẩm mới nhất được Samsung ra mắt vào ngày 06/04 với thiết kế nhỏ gọn hoàn toàn mới, màn hình vô cực viền siêu mỏng.
Phía trước là màn hình 5.8 inch độ phân giải QHD+ 2960 x 1440 pixels, tỉ lệ 18,5:9 cùng màn hình cạnh căng tràn. Sử dụng công nghệ Super AMOLED cho khả năng hiển thị tươi tắn, độ sáng tuyệt vời.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (17, N'Samsung Galaxy A7 (2017)', 365, 1, 0.1, 365, 1, N'SA', N'samsung-galaxy-a7-2017.png', 1, 0, 1, CAST(N'2017-04-22' AS Date), 17, N'Samsung Galaxy A7 (2017) tạo bước đột phá cho dòng A với thiết kế sang trọng và đẳng cấp, cấu hình mạnh mẽ, nhiều tiện ích cao cấp.Sang trọng, tinh tế: Galaxy A7 (2017) là sự kết hợp hài hoà của kim loại cao cấp và 2 mặt kính cong kế thừa từ thiết kế của smartphone cao cấp Galaxy S7. Các phím tăng giảm âm lượng được thiết kế tỉ mỉ nằm gọn bên cạnh trên bên trái.Màn hình Super AMOLED, 5.7 inch, độ phân giải 2280 x 1920 pixels hiển thị sắc nét. Mặt kính cong 2.5D thời thượng, thao tác chạm lướt sẽ thoải mái và mượt mà hơn.Hiệu năng mạnh mẽ: Cấu hình Exynos 7880 với tốc độ 1.9 GHz cho trải nghiệm lướt web, chơi game khá tốt.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (18, N'Samsung Galaxy J7+', 399, 1, 0.2, 399, 1, N'SA', N'samsung-galaxy-j7-plus.png', 1, 0, 0, CAST(N'2016-11-15' AS Date), 47, N'Samsung Galaxy J7+ là dòng smartphone tầm trung nhưng được trang bị camera kép có khả năng chụp ảnh xóa phông chân dung cùng thiết kế đẹp và hiệu năng mạnh mẽ.
Thiết kế cao cấp
Samsung Galaxy J7+ tiếp tục được sử dụng thiết kế nguyên khối từ kim loại như các dòng cao cấp, mang lại vẻ đẹp sang trọng cũng như bền bỉ nhất.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (19, N'Samsung Galaxy A5 (2017)', 319, 1, 0, 319, 1, N'SA', N'samsung-galaxy-a5-2017.png', 1, 0, 0, CAST(N'2017-05-22' AS Date), 26, N'Đẳng cấp, sang trọng, dẫn đầu xu thế là những từ ngữ chuẩn xác để miêu tả về điện thoại Samsung Galaxy A5(2017).
Tinh tế, cao cấp từ thiết kế:
Samsung Galaxy A5 (2017) mang trên mình vẻ ngoài kế thừa từ siêu phẩm Galaxy S7, sự hài hoà của kim loại cao cấp và 2 mặt kính cong tạo ra một thiết kế sang trọng, tinh tế, toát lên giá trị của sản phẩm và người sử dụng.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (21, N'Samsung Galaxy J7 Prime', 249, 1, 0, 249, 1, N'SA', N'samsung-galaxy-j7-prime.png', 1, 0, 0, CAST(N'2015-06-12' AS Date), 56, N'Galaxy J7 Prime xứng đáng là cái tên hàng đầu trong danh sách chọn smartphone phổ thông của giới trẻ khi nhận được nhiều đánh giá tích cực về thiết kế, thời lượng pin lâu dài và camera chụp hình chất lượng tốt.
Thiết kế thời thượng
Vẻ ngoài của Galaxy J7 Prime hết sức trẻ trung nhờ sự kết hợp giữa lớp vỏ kim loại sang trọng, mặt kính cường lực Gorilla Glass 4 được vát cong 2.5D ở các cạnh.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (23, N'Samsung Galaxy J2 Pro', 178, 1, 0.1, 178, 1, N'SA', N'samsung-galaxy-j2-pro-2018.png', 1, 0, 0, CAST(N'2015-08-22' AS Date), 2, N'Đem đến nhiều lựa chọn cho người tiêu dùng hơn, dòng sản phẩm chuẩn bị ra mắt của Samsung là Samsung J2 Pro 2018 sở hữu thiết kế ánh kim thời thượng, đường nét thanh lịch, dù chỉ ở phân khúc giá rẻ.
Thiết kế thanh lịch
Samsung Galaxy J2 Pro  có chất liệu chủ đạo bằng nhựa, nhờ màu sắc ánh kim thời thượng, khung viền chắc chắn, 4 góc bo tròn, vát nhẹ phía lưng khiến cho máy có thiết kế thanh lịch hơn so với các dòng máy khác cùng phân khúc.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (24, N'Samsung Galaxy J3 LTE', 112, 1, 0, 112, 1, N'SA', N'samsung-galaxy-j3-lte-hero.png', 1, 0, 0, CAST(N'2013-04-22' AS Date), 3, N'Samsung Galaxy J3 LTE với thiết kế gọn gàng cùng kết nối 4G tốc độ cao.
Thiết kế gọn nhẹ
Máy sở hữu thiết kế quen thuộc của Samsung cho các dòng điện thoại phổ thông với các góc cạnh được bo tròn mềm mại mang lại cảm giác cầm nắm thoải mái.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (25, N'Samsung Galaxy J2 Prime', 99, 1, 0, 99, 1, N'SA', N'samsung-galaxy-j2-prime.png', 1, 0, 0, CAST(N'2014-11-19' AS Date), 2, N'Samsung tiếp tục trình làng mẫu smartphone giá rẻ mới với tên gọi Samsung Galaxy J2 Prime mang nhiều cải tiến đáng giá như kết nối 4G.
Thiết kế nhỏ gọn
Samsung Galaxy J2 Prime  sở hữu thiết kế mỏng gọn cùng các đường bo góc khiến chiếc điện thoại này vừa vặn trong lòng bàn tay, cho phép bạn cầm giữ một cách dễ dàng và thoải mái.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (27, N'Sony Xperia XZ Premium', 799, 1, 0, 799, 1, N'SO', N'sony-xperia-xz-premium.png', 1, 1, 1, CAST(N'2017-08-17' AS Date), 27, N'Sony Xperia XZ Premium là flagship của Sony trong năm 2017 với vẻ ngoài hào nhoáng, màn hình cao cấp cũng nhiều trang bị hàng đầu khác.
Thiết kế đậm chất Sony
Sony Xperia XZ Premium vẫn mang trong mình phong cách thiết kế tương tự đàn anh XZ. Điểm nhấn lớn nhất của máy chính là mặt lưng được làm từ kính cường lực Corning Gorilla Glass 5 sáng bóng và nổi bật.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (30, N'Sony Xperia XZ Dual', 489, 1, 0.05, 489, 1, N'SO', N'sony-xperia-xz.png', 1, 0, 0, CAST(N'2015-05-06' AS Date), 23, N'Sony Xperia XZ với thiết kế cực đẹp, cùng camera chất lượng hơn, nhiều tính năng tiện ích hơn.
Thiết kế sang trọng
Cải tiến hơn so với thiết kế truyền thống của dòng Xperia, Sony Xperia XZ mang trên mình diện mạo mới - đẹp hơn, sang trọng hơn. ')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (31, N'Điện thoại Sony Xperia XA1 Ultra', 415, 1, 0, 415, 1, N'SA', N'sony-xa1-ultra.png', 1, 0, 0, CAST(N'2015-11-22' AS Date), 18, N'Kế nhiệm sự thành công của phablet không viền Sony Xperia XA Ultra thì Sony giới thiệu phiên bản XA1 Ultra với nhiều cải tiến đáng giá.
Thiết kế quyến rũ
Sony XA1 Ultra vẫn sở hữu cho mình phong cách thiết kế edge-to-edge với viền bezel siêu mỏng và "sexy".')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (34, N'Sony Xperia L1', 176, 1, 0.1, 176, 1, N'SO', N'sony-xperia-l1-400.png', 1, 0, 0, CAST(N'2014-12-19' AS Date), 25, N'Sony Xperia L1 với mức giá phù hợp với nhiều người dùng cùng thiết kế đẹp mắt không thua kém các sản phẩm cao cấp.
Thiết kế sang trọng
Xperia L1 có khung vỏ bằng nhựa, các cạnh bo tròn trong khi cạnh trên và dưới phẳng. Nhìn chung thiết kế khá thanh mảnh và lịch lãm, mặt sau của máy được gia công toàn bộ bằng nhựa polycarbonate.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (35, N'OPPO F3 Plus', 489, 1, 0.1, 489, 1, N'OP', N'oppo-f3-plus-1.png', 1, 1, 1, CAST(N'2017-04-26' AS Date), 4, N'Sau sự thành công của OPPO F1 Plus, OPPO F3 Plus đang được người dùng quan tâm yêu thích với cụm camera selfie kép, công nghệ chụp thiếu sáng đỉnh cao, cấu hình mạnh mẽ và tất nhiên đó là thiết kế nguyên khối quá ư là sang trọng.
Thiết kế quen thuộc
OPPO F3 Plus vẫn sẽ mang trong mình phong cách thiết kế quen thuộc của OPPO trong thời gian gần đây với mặt lưng cùng các góc cạnh bo cong mềm mại.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (36, N'OPPO F5 6GB', 457, 1, 0, 457, 1, N'OP', N'oppo-f5-6gb-a-2.png', 1, 0, 1, CAST(N'2017-11-28' AS Date), 0, N'OPPO F5 6GB là phiên bản nâng cấp cấu hình của chiếc OPPO F5, chuyên gia selfie làm đẹp thông minh và màn hình tràn viền tuyệt đẹp.
Thiết kế tuyệt đẹp tràn viền
OPPO F5 6 GB khởi đầu xu hướng màn hình tràn viền trên dòng điện thoại OPPO với các cạnh máy ở mặt trước được làm mỏng, gọn cho trải nghiệm sử dụng hoàn toàn mới và khác biệt so với phong cách truyền thống.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (38, N'OPPO F5 Youth', 299, 1, 0, 299, 1, N'OP', N'oppo-f5-youth.png', 1, 0, 0, CAST(N'2015-08-15' AS Date), 24, N'OPPO F5 Youth, phiên bản giá rẻ của chuyên gia selfie, màn hình tràn cạnh OPPO F5 với thiết kế và tính năng hoàn toàn tương đương nhưng thông số cấu mình phần cứng kém hơn một chút.
Thiết kế nguyên khối, màn hình tràn viền
OPPO F5 Youth mang trong mình thiết kế nguyên khối toàn phần với mặt lưng liền mạch cho vẻ đẹp sang trọng và tối giản tinh tế. Phiên bản này không có các đường anten chạy dọc trên đỉnh và đáy máy như OPPO F5.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (39, N'OPPO F3 Lite (A57)', 199, 1, 0, 199, 1, N'OP', N'oppo-a57.png', 1, 0, 0, CAST(N'2016-11-20' AS Date), 23, N'OPPO A57 là phiên bản rút gọn của Oppo F1s có mức giá dễ chịu hơn nhưng vẫn cho những trải nghiệm gần như tương đương.
Thiết kế lịch lãm, sang trọng 
OPPO A57 có thiết kế tương tự như người đàn anh với vẻ sang trọng, các góc cạnh được bo cong mềm mại cho cảm giác cầm nắm thoải mái.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (40, N'OPPO A83', 178, 1, 0.1, 178, 1, N'OP', N'oppo-a83.png', 1, 0, 1, CAST(N'2017-12-26' AS Date), 5, N'OPPO A83 là chiếc smartphone dòng A đầu tiên sở hữu cho mình màn hình tràn viền và cùng với đó là camera với khả năng làm đẹp bằng AI nổi tiếng của OPPO.
Thiết kế thon gọn
Với xu thế màn hình 18:9 của năm 2017 thì máy sở hữu một thân hình "thon thả" với các góc cạnh được bo tròn mềm mại.

')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (50, N'OPPO A71', 178, 1, 0, 178, 1, N'OP', N'oppo-a71.png', 1, 0, 1, CAST(N'2017-09-08' AS Date), 12, N'OPPO A71 là bản nâng cấp mạnh mẽ của chiếc OPPO A39 đã ra mắt trước đó và hứa hẹn sẽ lại là một sản phẩm mang về nhiều thành công cho OPPO trong năm 2017.
Thiết kế đẹp mắt
Mặc dù vẫn chỉ được làm từ chất liệu nhựa nhưng OPPO A71 được hoàn thiện khá chắc chắn và liền mạch.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (51, N'OPPO A71 (2018)', 199, 1, 0, 199, 1, N'OP', N'oppo-a71-2018.png', 1, 1, 1, CAST(N'2018-01-09' AS Date), 2, N'OPPO A71 (2018) là bản nâng cấp mạnh mẽ của chiếc OPPO A71 (2017) đã ra mắt trước đó và hứa hẹn sẽ lại là một sản phẩm mang về nhiều thành công cho OPPO trong năm 2017.
Thiết kế đẹp mắt
Mặc dù vẫn chỉ được làm từ chất liệu nhựa nhưng OPPO A71 được hoàn thiện khá chắc chắn và liền mạch.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (52, N'OPPO A37 (A37fw)', 129, 1, 0, 129, 1, N'OP', N'oppo-a37-a37fwhero.png', 1, 0, 0, CAST(N'2014-09-27' AS Date), 12, N'OPPO A37fw là phiên bản nâng cấp của A37 với băng tần 4G LTE Cat6 cao hơn giúp người dùng sử dụng 4G với tốc độ nhanh hơn, A37fw còn được người dùng yêu thích với camera selfie ảo diệu cùng mức giá bán phải chăng.
Thiết kế bắt mắt
Thiết kế là điểm cải tiến lớn trên OPPO A37fw so với các thế hệ OPPO Neo 5 và Neo 7 đi trước, vẫn được làm từ nhựa nhưng OPPO A37fw đã chắc chắn và thời trang hơn các đàn anh của mình rất nhiều.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (53, N'HTC U11 Plus', 899, 1, 0, 899, 1, N'HT', N'htc-u11-plus.png', 1, 1, 1, CAST(N'2017-11-02' AS Date), 14, N'HTC U11 Plus là bản nâng cấp của chiếc HTC U11 ra mắt trước đó với màn hình tỉ lệ 18:9 theo xu thế mà vẫn tích hợp được công nghệ bóp viền máy Edge Screen.
Thiết kế quen thuộc
U11 Plus vẫn đi theo tư duy thiết kế như U11 nhưng HTC cũng biết tạo điểm nhấn bằng việc trong suốt hoá, mờ ảo mặt lưng kính để các bạn thấy được linh kiện bên trong máy.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (54, N'HTC U11', 799, 1, 0, 799, 1, N'HT', N'htc-u11.png', 1, 1, 1, CAST(N'2017-11-02' AS Date), 17, N'HTC U11 là smartphone cao cấp nhất của HTC trong năm 2017 với nhiều nâng cấp tập trung vào trải nghiệm người dùng thú vị so với model tiền nhiệm.
Thiết kế khác biệt
HTC U11 mang một thiết kế hoàn toàn khác biệt với các smartphone đang có mặt trên thị trường. Máy sở hữu cho mình một mặt lưng bằng kính bóng loáng, bo cong mềm mại cho cảm giác cầm nắm thoải mái.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (55, N'HTC U Ultra Sapphire', 699, 1, 0, 699, 1, N'HT', N'htc-u-ultra-sapphire.png', 1, 1, 0, CAST(N'2017-01-12' AS Date), 23, N'HTC U Ultra Sapphia đánh dấu sự trở lại của HTC với triết lý thiết kế mới, đẹp hơn - sang trọng - bóng bẩy hơn và đặc biệt gắn bó hơn với người dùng hơn thông qua trợ lý ảo HTC Sense Companion.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (56, N'HTC U Play', 399, 1, 0.1, 399, 1, N'HT', N'htc-u-play.png', 1, 1, 0, CAST(N'2017-02-09' AS Date), 35, N'HTC U Play đánh dấu sự trở lại của HTC ở phân khúc tầm trung với triết lý thiết kế mới: đẹp hơn - sang trọng hơn - bóng bẩy hơn, ngoài ra trải nghiệm người dùng được nâng cấp thông qua trợ lý ảo HTC Sense Companion.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (57, N'HTC Desire 10 Pro', 268, 1, 0, 268, 1, N'HT', N'htc-desire-10-pro.png', 1, 0, 0, CAST(N'2016-09-20' AS Date), 35, N'HTC Desire 22 Pro là smartphone tầm trung mới của HTC với thiết kế trẻ trung năng động, cấu hình mạnh mẽ với RAM 4 GB và bộ nhớ trong 64 GB hứa hẹn sẽ đem lại trải nghiệm tuyệt vời cho người dùng.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (58, N'HTC 10 evo', 179, 1, 0, 179, 1, N'HT', N'htc-10-evo.png', 1, 0, 0, CAST(N'2017-06-15' AS Date), 12, N'HTC 22 evo mang lại cho bạn trải nghiệm về thiết kế, những trang bị cao cấp của một chiếc flagship đến từ HTC nhưng với mức giá chưa tới một nửa.
Thiết kế của HTC 22
Đúng như tên gọi HTC 22 evo thì thiết kế của máy khá giống với người tiền nhiệm HTC 22, khác biệt duy nhất nằm ở mặt lưng khi máy được làm phẳng chứ không vát cong như chiếc HTC 22.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (59, N'HTC One A9s', 153, 1, 0, 153, 1, N'HT', N'htc-one-a9s.png', 1, 0, 0, CAST(N'2016-09-01' AS Date), 43, N'Mẫu smartphone tầm trung mới nhất của HTC là One A9s vừa được nhà sản xuất Đài Loan ra mắt tại triển lãm IFA 2016 với nhiều điểm nâng cấp mạnh mẽ.
Thiết kế sang trọng
One A9s là bản nâng cấp của One A9 của HTC khi ra mắt cách đây 1 năm. Vì là bản nâng cấp nên ngoại hình của One A9s không có nhiều khác biệt so với đàn anh.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (60, N'HTC One ME', 153, 1, 0, 153, 1, N'HT', N'htc-one-me9-global.png', 1, 0, 0, CAST(N'2016-06-11' AS Date), 12, N'HTC One ME là một thiết bị thuộc phân khúc tầm trung của HTC với điểm nhấn là thiết kế cao cấp cùng màn hình có độ phân giải lên tới 2K.HTC One ME mang trong mình thiết kế cao cấp của HTC trên các dòng One với điểm nhấn là cặp loa BoomSound đối xứng trên dưới. Tuy nhiên điều đáng tiếc là One ME chỉ được làm từ nhựa chứ không phải kim loại cứng cáp như trên One M7 hay M8.
Các góc cạnh của One ME được bo cong mềm mại đem lại cho người dùng cảm giác cầm nắm tốt hơn và phần mặt lưng cũng được bo cong về 2 bên giúp chiếc One ME ôm tay hơn trong quá trình sử dụng.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (61, N'ASUS Zenfone Max Plus M1 - ZB570TL', 224, 1, 0.1, 224, 1, N'AS', N'asus-zenfone-max-m1-plus.png', 1, 1, 1, CAST(N'2017-12-24' AS Date), 23, N'Zenfone Max Plus M1 là chiếc smartphone theo xu thế màn hình viền mỏng đầu tiên của ASUS. Với ưu điểm thiết kế đẹp, pin lớn truyền thống dòng Zenfone Max, camera kép và mức giá tầm trung cực kì hấp dẫn và đáng sở hữu.
Thiết kế mới đẹp mắt
ASUS chọn dòng smartphone pin khủng của mình để ứng dụng xu hướng thiết kế viền mỏng đang trở thành trào lưu hiện nay. Dù vậy Zenfone Max Plus M1 cũng có kích thước mỏng và nhỏ gọn, màn hình 5.7 inch nhưng máy chỉ gọn gàng tương đương một chiếc smartphone 5.2 inch hiện nay.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (62, N'Asus Zenfone 4 Max Pro ZC554KL', 179, 1, 0, 179, 1, N'AS', N'asus-zenfone-4-max-pro.png', 1, 1, 0, CAST(N'2017-09-16' AS Date), 12, N'Asus ZenFone 4 Max Pro là sản phẩm có mức giá rẻ nhất được Asus giới thiệu trong sự kiện vào tháng 8 vừa rồi, ưu điểm lớn nhất của máy chính là viên pin dung lượng khủng cùng bộ đôi camera kép ấn tượng.
Thiết kế quen thuộc
ZenFone 4 Max Pro sở hữu thiết kế khá quen thuộc của Asus với các góc cạnh được bo tròn cho cảm giác thoải mái khi cầm nắm, đặc biệt không có cảm giác trơn trượt khi cầm tay và không sợ dính dấu vân tay')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (64, N'Asus Zenfone Live ZB501KL', 119, 1, 0.15, 119, 1, N'AS', N'asus-zenfone-live.png', 1, 1, 0, CAST(N'2017-02-22' AS Date), 13, N'Vào tháng 2, Asus chính thức giới thiệu chiếc Zenfone Live với  thiết kế sang trẻ trung cùng nhiều tính năng hấp dẫn ở camera trước phục vụ nhu cầu live stream ngày càng nhiều trên facebook.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (65, N'Asus Zenfone 2 Go ZB500KG', 99, 1, 0.1, 99, 1, N'AS', N'asus-zenfone-2-go.png', 1, 0, 0, CAST(N'2015-09-20' AS Date), 24, N'Asus ZenFone 2 Go ZB500KG là bản nâng cấp đáng giá của ZenFone Go ZB452KG về camera và dung lượng pin, thiết kế quen thuộc được nhiều người yêu thích của ZenFone vẫn được giữ nguyên.
Thiết kế trên quen thuộc và đặc trưng của ZenFone qua nhiều phiên bản vẫn được giữ nguyên, và trên ZenFone 2 Go ta vẫn cảm nhận được sự chắc chắn, ôm tay và thoải mái khi cầm nắm. Tuy nhiên viền màn hình khá dày vẫn là một điểm trừ với thiết kế này.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (66, N'Huawei P10', 799, 1, 0, 799, 1, N'HU', N'huawei-p10-1.jpg', 1, 1, 1, CAST(N'2017-11-12' AS Date), 15, N'Được Huawei giới thiệu tại MWC 2017, Huawei P22 được đánh giá sở hữu ngoại quen thuộc từ người tiền nhiệm. Tuy nhiên, Huawei P22 vẫn có những điểm nổi bật khác trong thiết kế của mình, đồng thời máy được nâng cấp hơn về hiệu năng, camera và nhiều tính năng ấn tượng khác đang chờ bạn khám phá.
Huawei P22 sở hữu thiết kế đơn giản, nhỏ gọn
Về mặt thiết kế, Huawei P22 vẫn mang những nét thiết kế đặc trưng quen thuộc trên thế hệ P9. Tuy nhiên, Huawei P22 đã được chau chuốt hơn về ngoại hình, các góc cạnh được bo tròn hơn mang lại trải nghiệm cầm nắm tốt hơn trước, các chi tiết được thiết kế cẩn thận, tỉ mỉ kết hợp cùng tông màu sang trọng đem đến cho máy một vẻ ngoài bắt mắt.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (68, N'Huawei Y7 Prime', 231, 1, 0, 231, 1, N'HU', N'huawei-y7-prime.png', 1, 0, 0, CAST(N'2016-09-12' AS Date), 32, N'Huawei đã chính thức giới thiệu đến người dùng điện thoại mới mang tên Y7 Prime, mẫu smartphone kế nhiệm của Y6 Prime được ra mắt vào năm ngoái.
Thiết kế cao cấp
Thiết kế của chiếc Y7 Prime được thừa hưởng nhiều nét từ người đàn anh GR5 2016 với mặt lưng được làm hoàn toàn bằng kim loại, khung máy được gia công tỉ mỉ.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (69, N'Huawei Y5 2017', 99, 1, 0.1, 99, 1, N'HU', N'huawei-y5-2017.png', 1, 0, 0, CAST(N'2017-02-20' AS Date), 23, N'Huawei Y5 2017 là phiên bản nâng cấp của Y5 II với cấu hình mạnh mẽ hơn, pin dung lượng cao dùng lâu hơn và thiết kế đẹp mắt, cứng cáp hơn.
Thiết kế trẻ trung, cứng cáp
Huawei Y5 2017 mang trên mình thiết kế nhỏ gọn, trẻ trung, với mặt lưng làm từ nhựa nhưng không có cảm giác ọp ẹp mà rất chắc chắn.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (70, N'Huawei Y3 2017', 69, 1, 0, 69, 1, N'HU', N'huawei-y3-2017.png', 1, 0, 0, CAST(N'2017-02-22' AS Date), 23, N'Huawei Y3 2017 là thiết bị mới được Huawei cho ra mắt để thay thế cho chiếc Huawei Y3 đã ra mắt từ năm ngoái với một thiết kế mới mẻ cùng giá bán hấp dẫn.
Thiết kế tương tự những chiếc Galaxy
Vẻ bề ngoài thì chiếc Huawei Y3 2017 trông khá giống với các smartphone giá rẻ thuộc dòng Galaxy của Samsung.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (72, N'iPad Wifi Cellular 128GB', 709, 1, 0.1, 709, 2, N'AP', N'ipad-wifi-cellular-128gb-2017.png', 1, 1, 0, CAST(N'2017-02-22' AS Date), 54, N'Dòng máy tính bảng iPad 9.7 inch NEW (2017) mới của Apple sở hữu cho mình cấu hình mạnh mẽ cùng mức giá bán rất hấp dẫn.
Thiết kế sang trọng
Với chất liệu kim loại nguyên khối sang trọng, các chi tiết được gia công tỉ mỉ, tinh xảo khiến iPad đến nay vẫn được rất nhiều người yêu thích với vẻ ngoài cuốn hút của nó.

')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (73, N'iPad Wifi Cellular 32GB', 699, 1, 0, 699, 2, N'AP', N'ipad-wifi-32gb-2017.png', 1, 0, 0, CAST(N'2017-02-22' AS Date), 45, N'Dòng máy tính bảng iPad Wifi Cellular 32GB (2017) mới của Apple sở hữu cho mình cấu hình mạnh mẽ cùng mức giá bán rất hấp dẫn.
Thiết kế sang trọng
Với chất liệu kim loại nguyên khối sang trọng, các chi tiết được gia công tỉ mỉ, tinh xảo khiến iPad đến nay vẫn được rất nhiều người yêu thích với vẻ ngoài cuốn hút của nó.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (74, N'iPad Mini 4 Wifi 128GB', 499, 1, 0, 499, 2, N'AP', N'ipad-mini-4-wifi-128gb.png', 1, 0, 0, CAST(N'2016-02-20' AS Date), 54, N'iPad Mini 4 Wifi 128GB cho bạn thêm sự lựa chọn với bộ nhớ trong dung lượng lớn thoải mái cài đặt game và ứng dụng.
Thiết kế sang chảnh từng chi tiết
Được gia công tỉ mỉ và thiết kế gọn gàng, iPad Mini 4 nổi bật nét sang chảnh với hợp kim nhôm mát tay, chắc chắn.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (75, N'iPad Wifi 128GB', 489, 1, 0, 489, 2, N'AP', N'ipad-wifi-128gb-2017.png', 1, 0, 0, CAST(N'2016-09-20' AS Date), 43, N'iPad Wifi 128GB (2017) là một bản nâng cấp nhẹ của chiếc iPad Air 2 đã ra mắt từ năm 2014 với một số thay đổi về ngoại hình và cấu hình được nâng cấp mạnh mẽ hơn.
Thiết kế sang trọng
iPad vẫn là một trong những mẫu máy tính bảng được rất nhiều người ưa chuộng bởi vẻ ngoài sang trọng và thời trang. Chất liệu kim loại cùng logo Apple đặc trưng khó lẫn lộn với các tablet khác.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (76, N'iPad Wifi 128GB (2017) ', 399, 1, 0, 399, 2, N'AP', N'ipad-wifi-128gb-2017.png', 1, 0, 0, CAST(N'2017-02-22' AS Date), 54, N'iPad Wifi 32GB (2017) là một bản nâng cấp nhẹ của chiếc iPad Air 2 đã ra mắt từ năm 2014 với một số thay đổi về ngoại hình và cấu hình được nâng cấp mạnh mẽ hơn.
Thiết kế sang trọng
iPad vẫn là một trong những mẫu máy tính bảng được rất nhiều người ưa chuộng bởi vẻ ngoài sang trọng và thời trang. Chất liệu kim loại cùng logo Apple đặc trưng khó lẫn lộn với các tablet khác.

')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (77, N'Samsung Galaxy Book 10.6 inch', 999, 1, 0, 999, 2, N'SA', N'samsung-galaxy-book-106-inch.png', 1, 1, 1, CAST(N'2017-11-20' AS Date), 34, N'Samsung Galaxy Book 22.6 inch là mẫu tablet 2 trong 1 chạy trên nền tảng Windows 22 nhưng vẫn sở hữu cho mình cây bút Spen thần thánh.
Thiết kế quen thuộc
Nhìn từ bên ngoài thì chiếc Samsung Galaxy Book không có quá nhiều sự khác biệt so với các tablet 2 trong 1 đang có mặt trên thị trường. Máy được gia công khá tốt, các chi tiết được hoàn thiện với độ chính xác cao.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (78, N'Samsung Galaxy Tab A6 10.1 Spen', 319, 1, 0.15, 319, 2, N'AP', N'samsung-galaxy-tab-a6-101-spen.png', 1, 0, 0, CAST(N'2017-02-22' AS Date), 22, N'Tiếp nối sự thành công của chiếc Samsung Galaxy Tab A thì mới đây Samsung đã giới thiệu phiên bản cải tiến là chiếc Galaxy Tab A6 22.1 với nhiều nâng cấp đáng giá về cấu hình và thiết kế.
Thiết kế chưa đổi mới, ấn tượng với vỏ nhựa nhám
Là dòng máy trong phân khúc tầm trung, Samsung Galaxy Tab A6 22.1 Spen được thiết kế với vỏ nhựa nhám nhẹ cùng các góc bo tròn cho cảm giác chắc chắn, không bám vân tay khi cầm.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (79, N'Samsung Galaxy Tab A 8.0 (2017)', 299, 1, 0.15, 299, 2, N'SA', N'samsung-galaxy-tab-a-80-2017.png', 1, 0, 0, CAST(N'2017-05-20' AS Date), 3, N'Samsung Galaxy Tab A 8.0 (2017) mới có màn hình tỉ lệ 4:3 với không gian hiển thị rộng thông minh cho người dùng.
Màn hình rộng hiển thị thông tin trọn vẹn
Với cách bố trí chiều ngang và dọc theo tỉ lệ 4:3 thông minh, những thông tin bạn đọc trên một trang web hay tài liệu được hiển thị nhiều và trọn vẹn trong một khung hình hơn.
Máy sử dụng công nghệ hiển thị PLS TFT, độ phân giải 1280 x 800 pixels cho hình ảnh hiển thị chi tiết, giúp bạn thoải mái lướt web hay xem phim phụ đề mà không mỏi mắt.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (80, N'Samsung Galaxy Tab E 9.6', 199, 1, 0.1, 199, 2, N'SA', N'samsung-galaxy-tab-e-96-sm.png', 1, 0, 0, CAST(N'2016-09-20' AS Date), 32, N'Samsung Galaxy Tab E 9.6 là một sự lựa chọn cho bạn thích một chiếc máy có màn hình lớn để giải trí thoải mái hơn nhưng cấu hình không quá thấp.
Thiết kế với mặt lưng đẹp
Màn hình 9,6” rộng rãi khiến cho thân máy khá to, không thể cầm thoải mái với 1 tay khi sử dụng. Thân máy mỏng chỉ 8.5mm cá tính.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (81, N'Samsung Galaxy Tab A6 7.0"', 175, 1, 0, 175, 2, N'SA', N'samsung-galaxy-tab-a6-101-spen.png', 1, 0, 0, CAST(N'2015-09-20' AS Date), 45, N'Samsung Galaxy Tab A6 7.0 với thiết kế vẫn mang vẻ truyền thống và cấu hình tốt, khả năng hiển thị cải thiện, cùng kết nối 4G.
Thiết kế truyền thống, sang trọng
Chiếc tablet này được thay đổi đôi chút so với người tiền nhiệm là Tab A 8.0 với cạnh viền được bo thêm 1 đường cong nhô lên, tạo điểm nhấn khác biệt.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (82, N'Huawei MediaPad M3 8.0', 299, 1, 0.15, 299, 2, N'HU', N'huawei-mediapad-m3.png', 1, 1, 1, CAST(N'2017-11-22' AS Date), 22, N'Huawei MediaPad M3 8.0 là mẫu máy tính bảng chủ lực của Huawei trong năm 2017 với điểm nhấn là cấu hình mạnh mẽ cùng hệ thống âm thanh được đầu tư kỹ lưỡng.
Thiết kế mỏng đẹp
Huawei MediaPad M3 có một thiết kế khá đẹp, nguyên khối cứng cáp và cực kì chắc chắn.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (83, N'Huawei MediaPad T3 10', 199, 1, 0, 199, 2, N'HU', N'huawei-mediapad-t3-10-inch.png', 1, 0, 0, CAST(N'2017-05-15' AS Date), 23, N'Huawei MediaPad T3 22 (2017) là chiếc máy tính bảng với màn hình kích thước lớn cùng khe cắm sim tiện lợi giúp người dùng có thể nghe gọi như một chiếc smartphone.
Thiết kế mỏng, đẹp
Về tổng thể, máy nổi bật với phần khung viền kim loại sang trọng, kết hợp màu sắc hiện đại cho cảm giác khá thanh lịch, nhẹ nhàng.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (84, N'Huawei MediaPad T3 8.0', 176, 1, 0.15, 176, 2, N'HU', N'huawei-mediapad-t3-70-2017.jpg', 1, 0, 0, CAST(N'2017-01-20' AS Date), 12, N'Huawei MediaPad T3 8.0 là một chiếc máy tính bảng giá rẻ đến từ Huawei sở hữu rất nhiều ưu điểm đáng giá, nổi trội nhất là cấu hình rất tốt trong phân khúc.
Thiết kế sang trọng
Huawei MediaPad T3 8.0 là một thiết bị hiếm hoi trong phân khúc máy tính bảng giá 4 triệu sở hữu cho mình thiết kế khung viền kim loại chắc chắn và đẹp mắt.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (85, N'Huawei MediaPad T1 8.0', 129, 1, 0, 129, 2, N'HU', N'huawei-mediapad-t1-80.png', 1, 0, 0, CAST(N'2015-04-20' AS Date), 34, N'Huawei MediaPad T1 8.0 mang lại không gian giải trí với màn hình lớn, cấu hình khá ổn trong tầm giá.
Giải trí thoải mái hơn với màn hình to
Với màn hình to 8 inch, không gian được mở rộng hơn để bạn sử dụng thoải mái, máy sử dụng thêm tấm nền IPS nhằm giúp tăng góc nhìn rộng xung quanh.

')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (86, N'Huawei MediaPad T1-701u', 99, 1, 0.05, 99, 2, N'HU', N'huawei-mediapad-t1-701u.png', 1, 0, 0, CAST(N'2015-02-20' AS Date), 24, N'Huawei MediaPad T1-701u là sự lựa chọn giá rẻ của một chiếc tablet có đầy đủ các tính năng như một chiếc điện thoại, giải trí với màn hình to.
Thiết kế cứng cáp với chất liệu nhôm
Mặc dù là sản phẩm giá rẻ nhưng MediaPad T1-701u vẫn được hoàn thiện với mặt lưng tạo sự cứng cáp cho máy, khi cầm tay cũng mát tay thích hơn.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (87, N'Huawei MediaPad T3 7.0', 99, 1, 0.15, 99, 2, N'HU', N'huawei-mediapad-t3-70-2017.jpg', 1, 0, 1, CAST(N'2017-08-15' AS Date), 12, N'Huawei MediaPad T3 7.0 (2017) là một chiếc máy tính bảng giá rẻ đến từ Huawei sở hữu rất nhiều ưu điểm đáng giá.
Thiết kế đơn giản
Máy sở hữu thiết kế khá quen thuộc và thường thấy của những chiếc máy tính bảng giá rẻ với chất liệu nhựa cùng khung viền bo cong ở các góc.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (89, N'Macbook Pro i5 2.3GHz/8GB/256GB', 1989, 2, 0.1, 1989, 3, N'AP', N'apple-macbook-pro-mpxt2sa-a-i5-7360u.jpg', 1, 1, 1, CAST(N'2017-09-22' AS Date), 12, N'Apple Macbook Pro MPXT2SA/A i5 7360U là dòng sản phẩm đẳng cấp, sang trọng với thiết kế kim loại nguyên khối, chip i5 thế hệ thứ 7 và dùng ổ SSD mang lại nhiều tính năng tiện ích cho người dùng.Macbook Pro MPXT2SA/A i5 7360U được trang bị lớp vỏ nhôm nguyên khối Unibody rất đẹp và chắc chắn. Thiết kế mỏng, nhẹ ấn tượng, chỉ mỏng 1,49 cm và trọng lượng là 1,37 kg rất tiện lợi khi di chuyển.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (90, N'Macbook 12" 8GB/512GB', 1699, 2, 0, 1699, 3, N'AP', N'apple-macbook-12-mlh82.jpg', 1, 0, 0, CAST(N'2017-01-20' AS Date), 12, N'Apple Macbook 12" MLH82 là chiếc laptop có thiết kế nhỏ gọn, kiểu dáng sang trọng và thời thượng. Cùng với một màn hình siêu sắc nét, cấu hình nổi bật và nhiều tính năng độc đáo đến từ nhà sản xuất Apple danh tiếng.Máy có thiết kế kim loại nguyên khối chắc chắn, sang trọng và tinh tế. Do được làm bằng chất lượng nhôm nên máy chỉ nhẹ 0.9 kg và có độ mỏng chỉ 13.1 mm.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (92, N'Macbook 12" 1.2GHz/8GB/512GB', 1699, 2, 0, 1699, 3, N'AP', N'apple-macbook-12-mlhf2.jpg', 1, 0, 0, CAST(N'2016-09-20' AS Date), 23, N'Vẫn duy trì thiết kế cực kỳ quyến rũ của mình Apple Macbook 12 inch năm 2016 được cải tiến thêm về hiệu năng với chip xử lý Core M của Intel đem đến hiệu năng vượt trội hơn.
')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (93, N'Macbook 12"1.2GHz/8GB/512GB', 1699, 2, 0.15, 1699, 3, N'AP', N'apple-macbook-12-mmgm2.jpg', 1, 0, 0, CAST(N'2016-04-12' AS Date), 32, N'Apple Macbook 12 inch MMGM2 là phiên bản 2016 được nâng cấp đôi chút so với bản 2015, có RAM lớn, ổ SSD tốc độ cao, chip xử lý mới và tốt.
Thiết kế cao cấp
Apple Macbook 12 inch MMGM2 sở hữu thân hình lý tưởng nhờ chất liệu nhôm nguyên khối được gia công bằng bàn tay tuyệt vời của các kỹ sư đến từ Apple. Thân máy mỏng chỉ 13.1 mm và nhẹ chỉ 0,9 kg.
Thiết bị có màu vàng hồng rất cuốn hút, trên thân máy chỉ có một cổng kết nối USB C và một jack âm thanh 3.5 mm.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (95, N'Macbook Air i5 1.8GHz/8GB/256GB', 1199, 2, 0, 1199, 3, N'AP', N'apple-macbook-air-mqd42sa.jpg', 1, 1, 0, CAST(N'2017-01-15' AS Date), 34, N'Macbook Air MQD42SA/A i5 5350U với thiết kế vỏ nhôm nguyên khối Unibody rất đẹp, chắc chắn và sang trọng. Máy siêu mỏng và siêu nhẹ, hiệu năng ổn định mượt mà, thời lượng pin cực lâu, phục vụ tốt cho nhu cầu làm việc lẫn giải trí.
Thiết kế siêu mỏng và nhẹ
Với thiết kế đặc trưng của dòng MacBook Air, phiên bản này chỉ mỏng 1.7 cm và trọng lượng là 1.35 kg, rất tiện lợi và dễ dàng để bạn luôn mang theo bên mình. Logo quả táo Apple phát sáng tạo nên đặc trưng riêng khác biệt.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (96, N'Macbook Air i5 1.6GHz/8GB/256GB', 2299, 2, 0.1, 2299, 3, N'AP', N'apple-macbook-air-2015.jpg', 1, 0, 0, CAST(N'2015-08-15' AS Date), 23, N'Apple Macbook Air 2015 i5 5250/8 GB/256 GB với thiết kế gần như hoàn hảo, hiệu năng mượt mà, phiên bản Macbook Air 2015 13.3 inch sẽ còn tối ưu hơn khi được trang bị card đồ họa tích hợp Intel HD Graphics 6000, RAM 8 GB mạnh mẽ, ổ cứng SSD 256 GB chất lượng và bộ vi xử lý mới từ Intel.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (97, N'Macbook Air i5 1.8GHz/8GB/128GB', 999, 2, 0.15, 999, 3, N'AP', N'apple-macbook-air-mqd32sa.jpg', 1, 0, 0, CAST(N'2017-02-22' AS Date), 23, N'Macbook Air MQD32SA/A i5 5350U với thiết kế vỏ nhôm nguyên khối Unibody rất đẹp, chắc chắn và sang trọng. Máy siêu mỏng và siêu nhẹ, hiệu năng ổn định mượt mà, thời lượng pin cực lâu, phục vụ tốt cho nhu cầu làm việc lẫn giải trí.
Thiết kế siêu mỏng và nhẹ
Với thiết kế đặc trưng của dòng MacBook Air, phiên bản này chỉ mỏng 1.7 cm và trọng lượng là 1.35 kg, rất tiện lợi và dễ dàng để bạn luôn mang theo bên mình.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (98, N'Macbook Pro i5 2.3GHz/8GB/128GB', 1499, 2, 0.05, 1499, 3, N'AP', N'apple-macbook-pro-mpxr2sa-a.jpg', 1, 0, 1, CAST(N'2017-08-15' AS Date), 17, N'Apple Macbook Pro MPXR2SA/A i5 là dòng sản phẩm cao cấp với thiết kế kim loại nguyên khối, chip i5 thế hệ thứ 7 và dùng ổ SSD dung lượng 128 GB mang đến sự bền bỉ và mạnh mẽ khi sử dụng.
Thiết kế đặc trưng Unibody từ Apple
Laptop Apple Macbook Pro MPXR2SA/A i5 được trang bị lớp vỏ nhôm nguyên khối Unibody rất đẹp và chắc chắn. Thiết kế mỏng, nhẹ và cực gọn gàng chỉ 1.49 cm, trọng lượng là 1.37 kg rất tiện lợi khi di chuyển.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (99, N'Dell Inspiron i7 7700HQ', 1299, 2, 0.1, 1299, 3, N'DE', N'dell-inspiron7567-i7b.png', 1, 0, 1, CAST(N'2017-08-15' AS Date), 27, N'Dell Inspiron 7567B i7 7700HQ là sản phẩm cao cấp thuộc phân khúc Gaming (laptop chuyên chơi game). Dell Inspiron 7567B sở hữu những đặc điểm rất nổi bật như: Card rời NVIDIA GeForce GTX 2250Ti, màn hình 4K, ổ cứng HDD 1 TB và SSD 128 GB,...')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (110, N'Dell Inspiron 7567A i7 7700HQ', 1199, 2, 0, 1199, 3, N'DE', N'dell-inspiron7567-i7a.jpg', 1, 1, 0, CAST(N'2017-01-20' AS Date), 12, N'Dell Inspiron 7567 i7 7700HQ là dòng sản phẩm cao cấp của hãng, có thế mạnh nâng cao về cấu hình và hiệu suất hoạt động. Đồng thời cũng được Dell ưu ái thiết kế cho một ngoại hình rất hầm hố, mang hơi hướng "Tàu vũ trụ" trong các phim giả tưởng.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (111, N'Dell Inspiron 7373 i7 8550U', 2299, 2, 0.15, 2299, 3, N'DE', N'dell-inspiron-7373-i7-8550u.jpg', 1, 0, 1, CAST(N'2018-01-18' AS Date), 12, N'Dell Inspiron 7373 i7 8550U có thiết kế nhỏ gọn và sang trọng với chất liệu nhôm nguyên khối đồng màu trên toàn thân máy, các cạnh viền với nét cắt kim cương và bo tròn làm cho tổng thể máy càng trở nên tinh tế hơn.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (112, N'Dell Inspiron 7460 i5 7200U', 989, 2, 0.1, 989, 3, N'DE', N'dell-inspiron-7460-n4i5259w.png', 1, 0, 0, CAST(N'2017-02-15' AS Date), 24, N'Dell Inspiron 7460 ngoài thiết kế vỏ kim loại sang trọng thì còn được nâng cấp với cấu hình rất mạnh, tạo sự thoải mái trong xử lý công việc hay giải trí của bạnTích hợp core thế hệ thứ 7 mới nhất. Với vi xử lý thế hệ thứ 7 core i5 Kaby Lake, máy đảm bảo hiệu năng chạy vô cùng mượt mà và nhẹ nhàng, tốc độ CPU 2.5 GHz và bạn có thể đẩy lên tối đa 3.1 GHz với công nghệ Turbo Boost RAM sẵn 4 GB và có thể nâng cấp lên tối đa 16 GB.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (113, N'Dell Vostro 3568 i7 7500U', 799, 2, 0, 799, 3, N'DE', N'dell-vostro-3568-i7-7500u.png', 1, 0, 0, CAST(N'2016-11-20' AS Date), 54, N'Dell Vostro 3568 i7 7500U có cấu hình rất mạnh cùng tính năng cảm biến vân tay giúp bảo vệ máy bạn tốt hơn.Sự lựa chọn hàng đầu để chiến game thoải mái
Với cấu hình cực mạnh là core i7 Kaby Lake sẽ giúp máy vận hành mượt mà hơn, không xảy ra hiện tượng giật lag.
RAM 4 GB và có thể nâng lên tối đa 16 GB, ổ cứng lưu trữ HDD 1 TB (~2224 GB).')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (114, N'Dell Vostro 3568 i5 7200U', 659, 2, 0.1, 659, 3, N'DE', N'dell-vostro-3568-i5-7200u.png', 1, 0, 0, CAST(N'2016-11-20' AS Date), 12, N'Dell Vostro 3568 i5 7200U tích hợp chip xử lý core i5 thế hệ thứ 7 mới nhất KabyLake cùng card đồ họa rời AMD 2 GB.Chip xử lý core i5 thế hệ mới nhất hiện nay
Bằng việc trang bị chip xử lý thế hệ mới core i5 KabyLake sẽ giúp máy có hiệu suất hoạt động mạnh mẽ hơn, hiệu quả và cho khả năng tiết kiệm năng lượng rất tốt')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (115, N'Dell Vostro 5568 i5 7200U', 669, 2, 0, 669, 3, N'DE', N'dell-vostro-5568-077m52.png', 1, 0, 0, CAST(N'2017-01-22' AS Date), 32, N'Dell Vostro 5568 i5 7200U là phiên bản với màn hình lớn hơn 15.6 inch so với Vostro 5468 cùng một cấu hình mạnh mẽ bên trong.Thoải mái chiến game cùng công việc
Được tích hợp chip xử lý core i5 Kaby Lake, tốc độ CPU 2.5 GHz và có thể tăng tốc lên tối đa 3.1 GHz nhờ tính năng Turbo Boost.
RAM 4 GB và có thể nâng lên tối đa 16 GB, đặc biệt ổ cứng lưu trữ HDD lên đến 1 TB không gian lưu trữ thoải mái.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (116, N'Dell Inspiron 5468 i5 7200U', 631, 2, 0.15, 631, 3, N'DE', N'dell-inspiron-5468-i5-7200u.jpg', 1, 0, 0, CAST(N'2016-09-20' AS Date), 12, N'Dell Inspiron 5468 i5 7200U là chiếc laptop tập trung vào khả năng xử lý hình ảnh đồ họa 3D cho game thủ hay những người làm công việc thiết kế.
Tích hợp card đồ họa rời xử lý hình ảnh AMD Radeon R7 M440
Cùng với đó vi xử lý core i5 thuộc thế hệ thứ 7 KabyLake mới nhất với nhiều cải tiến giúp máy chạy nhanh nhạy hơn hẳn nhưng vẫn tiết kiệm năng lượng.
Điểm chính của máy chính là card đồ họa rời AMD Radeon R7 M440 sử dụng riêng dung lượng RAM nên cho khả năng xử lý tốt hơn hẳn so với card tích hợp.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (117, N'Dell Inspiron 5567 i5 7200U', 651, 2, 0, 651, 3, N'DE', N'dell-inspiron-5567-i5-7200u.png', 1, 0, 0, CAST(N'2015-12-20' AS Date), 14, N'Dell Inspiron 5567 i5 7200U là phiên bản nâng cấp với RAM 4 GB cùng card màn hình rời AMD hỗ trợ lên đến 2 GB, là chiếc laptop thích hợp dành cho việc giải trí.
Máy có thể chơi được những game nào?
Với vi xử lý Intel Core i5 Kaby Lake, xung nhịp 2.50 Ghz khá tốt cùng với ổ cứng lưu trữ HDD 1 TB, máy đáp ứng đầy đủ nhu cầu về xem phim, chơi game.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (119, N'Dell Vostro 3468 i5 7200U', 599, 2, 0.05, 599, 3, N'DE', N'dell-vostro-3468-i5-7200u.png', 1, 0, 0, CAST(N'2017-02-22' AS Date), 34, N'Dell Vostro 3468 i5 7200U là phiên bản rút gọn được trang bị chip xử lý thế hệ mới nhất, bảo mật vân tay cùng ổ cứng HDD lên đến 1 TB.Thoải mái chiến game cùng công việc
Được tích hợp chip xử lý core i5 KabyLake, tốc độ CPU 2.5 GHz và có thể tăng tốc lên tối đa 3.1 GHz nhờ tính năng Turbo Boost.
Hướng dẫn bạn cách cài đặt Turbo Boost dễ hiểu nhất.
RAM 4 GB và có thể nâng lên tối đa 16 GB, đặc biệt ổ cứng lưu trữ HDD lên đến 1 TB không gian lưu trữ thoải mái.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (120, N'Dell Vostro 3468 i3 7100U', 499, 2, 0, 499, 3, N'DE', N'dell-vostro-3468-i3-7100u.png', 1, 0, 0, CAST(N'2017-02-22' AS Date), 12, N'Dell Vostro 3468 i3 7220U là phiên bản rút gọn cấu hình cơ bản nhất nhưng vẫn được trang bị chip xử lý thế hệ mới nhất, bảo mật vân tay cùng ổ cứng HDD lên đến 1 TB.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (121, N'Dell Inspiron 3467 i3 7100U', 489, 2, 0, 489, 3, N'DE', N'dell-inspiron-3467-i3.png', 1, 0, 0, CAST(N'2015-09-07' AS Date), 12, N'Laptop Dell Inspiron 3467 trang bị vi xử lý Core i3 thế hệ thứ 7 đem lại hiệu suất làm việc mạnh hơn các thế hệ trước đây, tích hợp với Ram 4 GB và có thể hỗ trợ nâng cấp tối đa 8 GB giúp máy vận hành mượt mà các nhu cầu khác nhau.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (122, N'Dell Inspiron 3567 i3 6006U', 495, 2, 0.1, 495, 3, N'DE', N'dell-inspiron-3567-i3-6006u.png', 1, 0, 0, CAST(N'2015-09-20' AS Date), 54, N'Dell Inspiron 3567 màu sắc sang trọng  hướng đến các đối tượng doanh nhân, học sinh, sinh viên.
Vỏ được làm bằng nhựa nhám bao bọc giúp cho máy hạn chế được bụi bẩn, trầy xước cũng như chịu va chạm tốt trong quá trình sử dụng. Máy có trọng lượng tương đối nhẹ, vì vậy chúng ta có thể mang theo bên mình khi làm việc ngoài các không gian khác.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (123, N'MSI GL62M 7RDX i7 7700HQ', 2299, 2, 0, 2299, 3, N'MS', N'msi-gl62m-7rdx-i7-7700hq-1815vn.jpg', 1, 0, 1, CAST(N'2018-01-18' AS Date), 0, N'MSI GL62M 7RDX i7 7700HQ là dòng sản phẩm cao cấp chuyên chơi game ra đời nhằm phục vụ cho các game thủ. Với thiết kế hầm hố đẹp mắt tích hợp bộ tản nhiệt tốt, được trang bị một cấu hình khủng Intel Core i7 và card rời NVIDIA GTX 2250, dường như laptop MSI GL62M 7RDX i7 7700HQ thách thức mọi trò chơi.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (124, N'MSI GP62M 7REX-1884XVN/i7-7700HQ', 1299, 2, 0, 1299, 3, N'MS', N'MSI GP62MVR 7RFX-893XVN (I7-7700HQ).png', 1, 0, 1, CAST(N'2018-01-19' AS Date), 0, N'MSI GP62M 7REX 1884XVN tiên phong là dòng máy chơi game phi thường, mang đến cho mọi game thủ sự hài lòng. Là một huyền thoại về dòng máy gaming, MSI luôn muốn duy trì truyền thống của mình, và luôn mang đến những tính năng chơi game mới và độc đáo nhất, đáp ứng mọi mong muốn của game thủ.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (125, N'MSI GV72 7RD 874XVN ', 2299, 2, 0, 2299, 3, N'MS', N'MSI GV72 7RD-874XVN (I7-7700HQ).jpg', 1, 0, 1, CAST(N'2017-11-22' AS Date), 22, N'SI GV72 7RD 874XVN là dòng laptop dành cho game thủ tầm trung của MSI, kinh tế và đủ sức cày các tựa game đình đám hiện giờ, với hiệu năng không hề tệ. Máy sử dụng vi xử lý Core i7 7700HQ, card màn hình GTX2250 4GB, 8GB DDR4 2400Hz, ổ lưu trữ HDD 1TB, và một màn hình FullHD 17.3” wideview 94%NTSC, Anti-glare.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (126, N'MSI GV62 7RE 2443XVN ', 1229, 2, 0, 1229, 3, N'MS', N'MSI GV72 7RE-1424XVN (I7-7700HQ).jpg', 1, 0, 0, CAST(N'2015-05-22' AS Date), 2, N'MSI GV62 7RE 2443XVN là dòng laptop dành cho game thủ tầm trung của MSI, kinh tế và đủ sức cày các tựa game đình đám hiện giờ, với hiệu năng không hề tệ. Máy sử dụng vi xử lý Core i7 7700HQ, card màn hình GTX2250Ti 4GB, 8GB DDR4 2400Hz, ổ lưu trữ HDD 1TB, và một màn hình FullHD 15.6” wideview 94%NTSC, Anti-glare.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (127, N'Asus Hero GL503VM i7 7700HQ', 2499, 2, 0, 2499, 3, N'AS', N'asusgl503vm-i7-7700hq.jpg', 1, 1, 0, CAST(N'2017-05-05' AS Date), 22, N'Asus Gaming GL522VM i7 7700HQ là dòng sản phẩm laptop chơi game khủng có thiết kế hầm hố và đậm chất "game thủ" riêng biệt. Máy trang bị cấu hình mạnh, âm thanh vòm sống động giúp mang cảm giác trải nghiệm tuyệt vời, đắm chìm trong các trò chơi.
Thiết kế cực ngầu
Asus GL522VM i7 7700HQ mang phong cách mạnh mẽ và thân hình hầm hố, vì vậy nên máy nặng 2.3 kg và dày 23 mm, vỏ nhựa và mặt lưng vân nổi còn có logo ROG mang phong cách rất riêng so với những sản phẩm Gaming khác.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (128, N'Asus FX503VD i7 7700HQ', 1199, 2, 0, 1199, 3, N'AS', N'asus-fx503vd-i7-7700hq-e4119t.jpg', 1, 0, 1, CAST(N'2018-01-19' AS Date), 0, N'Laptop Asus FX522VD là mẫu máy tính xách tay chuyên chơi game và làm thiết kế đồ họa. Máy sử dụng Windows 22 bản quyền, được tích hợp vi xử lý Intel thế hệ 7 mã 7700HQ và card đồ họa Nvidia GeForce GTX2250 cực mạnh.
Hiệu năng tuyệt vời
Asus FX522VD được trang bị chip Intel Kabylake Refresh Core i7 7700HQ 2.80 GHz sẽ giúp máy hoạt động mượt mà mọi tác vụ, không gặp hiện tượng giật lag với cách sử dụng như bình thường. Cùng với RAM DDR4 8 GB và ổ cứng lưu trữ HDD 1 TB + SSD M.2 128 GB giúp nâng cao cấu hình, thoải mái lưu trữ dữ liệu và đạt hiệu quả cao khi sử dụng.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (129, N'Asus UX430UA i5 8250U', 2299, 2, 0, 2299, 3, N'AS', N'asus-ux430ua-i5-8250u-gv334t.jpg', 1, 0, 1, CAST(N'2018-01-19' AS Date), 0, N'Asus UX430UA là mẫu máy tính kết hợp giữa sự mỏng nhẹ - thời trang và một cấu hình mạnh mẽ. Đây là lựa chọn hoàn hảo cho nhiều nhu cầu sử dụng của người dùng.
Thiết kế sang trọng – đẳng cấp
Với ngoại hình bắt mắt, Asus UX430UA có thiết kế thuộc dòng Ultrabook mỏng 15.9 mm nhẹ 1.3 kg mang một vẻ đẹp rất sang trọng. Phù hợp cho những ai thường hay di chuyển nhiều dễ dàng mang theo để sử dụng mọi lúc, mọi nơi.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (130, N'Asus X510UQ i7 8550U', 899, 2, 0, 899, 3, N'AS', N'asus-x510uq-i7-8550u-br641t.jpg', 1, 0, 1, CAST(N'2018-01-19' AS Date), 0, N'Tiếp tục nâng cấp cấu hình từ mẫu laptop "Mỏng nhẹ - Thời trang" kết hợp "Đồ họa - Kỹ thuật" Asus X522UQ i5 8250U, mẫu Asus X522UQ i7 8550U ra đời mang đến sự lựa chọn hoàn hảo hơn cho người dùng.
Thiết kế bình cũ - rượu mới
Về ngoại hình Asus X522UQ i7 không khác gì so với người em Asus X522UQ i5, cũng có thiết kế đơn giản, không quá góc cạnh nhưng mang một vẻ đẹp rất sang trọng. Máy có trọng lượng 1.5 kg và mỏng 19.4 mm mà thôi, rất dễ dàng mang theo mọi nơi.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (131, N'Asus UX510UX i5 7200U', 899, 2, 0, 899, 3, N'AS', N'asus-ux510ux-i5-7200u-4tb-1gb-4gb-950m-win10.png', 1, 0, 0, CAST(N'2016-01-19' AS Date), 0, N'Asus UX522UX i5 7200U là dòng sản phẩm có thế mạnh về thiết kế, ngoại hình. UX522UX i5 7200U thuộc phân khúc cao cấp nên được Asus ưu ái gắn cho sản phẩm này một cấu hình mới, khỏe để đáp ứng hầu hết các nhu cầu khi sử dụng máy. 
Thiết kế siêu đẹp, nhẹ đạt đẳng cấp
Asus UX522UX được thiết kế đặc biệt mỏng và nhẹ, máy chỉ dày 19.9 mm. Vỏ máy được làm từ chất liệu kim loại, vân tròn đồng tâm trên bề mặt giúp máy trở nên sang trọng và thanh lịch hơn. Trọng lượng của máy 2 kg nên cũng rất tiện lợi, thoải mái khi di chuyển.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (132, N'Asus S510UQ i5 8250U', 789, 2, 0.15, 789, 3, N'AS', N'asus-s510uq-i5-8250u-bq475t.jpg', 1, 0, 0, CAST(N'2015-09-20' AS Date), 16, N'Asus S522UQ i5 8250U thuộc phân khúc laptop mỏng nhẹ - thời trang với thiết kế kết hợp chất liệu kim loại, kiểu dáng bắt mắt. Máy còn trang bị cấu hình khá mạnh có thể sử dụng được các phần mềm về đồ họa hoặc chơi game ở mức độ cơ bản.
Thiết kế hiện đại, cao cấp
Asus S522UQ i5 8250U có thiết kế nắp lưng bằng kim loại thể hiện sự sang trọng cùng với một kiểu dáng gọn gàng, tinh tế. Máy mỏng chỉ 17.9 mm và có trọng lượng 1.5 kg nên rất dễ dàng di chuyển mọi lúc, mọi nơi để sử dụng.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (133, N'Asus X510UQ i5 8250U', 699, 2, 0, 699, 3, N'AS', N'asus-x510uq-i5-8250u-br63.jpg', 1, 0, 0, CAST(N'2015-09-20' AS Date), 15, N'Asus X522UQ i5 8250U là mẫu laptop có định hướng phân khúc "Mỏng nhẹ - Thời trang" và cũng có thể dùng "Đồ họa - Kỹ thuật" được luôn. Máy có thiết kế hiện đại và được trang bị cấu hình Intel thế hệ thứ 8 cho khả năng tiết kiệm điện tốt.
Thiết kế máy hiện đại, tinh tế
Asus X522UQ có thiết kế đơn giản, không quá góc cạnh nhưng mang một vẻ đẹp rất sang trọng, cao cấp. Máy có trọng lượng 1.5 kg cùng độ dày 19.4 mm mà thôi, rất phù hợp với người dùng thường xuyên mang máy di chuyển nhiều.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (135, N'Asus TP203NAH N4200', 469, 2, 0, 469, 3, N'AS', N'asus-tp203nah-n4200-bp052t.jpg', 1, 0, 0, CAST(N'2016-11-20' AS Date), 2, N'Asus TP220NAH là một chiếc laptop giá rẻ với màn hình cảm ứng xoay lật tiện lợi hướng đến những người có nhu cầu sử dụng một thiết bị với nhiều mục đích khác nhau.
Cấu hình phù hợp cho công việc nhẹ nhàng
Máy sử dụng chip Pentium N4200 tốc độ CPU 1.1 GHz và có thể đạt tốc độ lên tối đa 2.5 GHz để giúp máy vận hành hiệu quả hơn.
Máy có RAM sẵn 4 GB, ổ cứng HDD 500 GB để lưu trữ dữ liệu.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (136, N'Asus TP410UA i3 7100U', 526, 2, 0, 526, 3, N'AS', N'asus-tp410ua-i3-7100u-ec250t.jpg', 1, 0, 1, CAST(N'2017-08-15' AS Date), 6, N'Asus TP422UA i3 7220U là một kiểu máy tính lai có thiết kế đẹp, tiện lợi và nhiều tính năng nổi trội cùng một mức giá vừa phải. Đây sẽ là sự lựa chọn rất tuyệt vời cho người dùng cần nhiều thao tác tích hợp trong một thiết bị nhỏ gọn.
Thiết kế, kiểu dáng tùy cơ ứng biến
Đầu tiên Asus TP422UA có kiểu thiết kế kim loại rất là đẹp như các cạnh máy cong và bo tròn, màu sắc nhã nhặn, nhẹ nhàng dựa trên thiết kế vuông vức, nhìn rất sang trọng. Máy chỉ có trọng lượng là 1.6 kg nên bạn có thể dễ dàng mang theo để sử dụng mọi lúc, mọi nơi.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (137, N'Acer Swift SF315 51 530V i5 8250U', 705, 2, 0, 705, 3, N'AC', N'acer-swift-sf315-51-530v-i5-8250u.jpg', 1, 0, 0, CAST(N'2016-09-20' AS Date), 9, N'Acer Swift SF315 51 530V được trang bị vi xử lý Intel Core i5 Kabylake Refresh mới nhất (thế hệ thứ 8). Máy có thiết kế đơn giản, hiện đại đi cùng một cấu hình mạnh và nhiều công nghệ mới được tích hợp.
Thiết kế đơn giản, hiện đại?
Acer Swift SF315 51 530V có thiết kế đơn giản vì nó ít góc cạnh và hiện đại, sang trọng khi được trang bị bộ vỏ chất liệu kim loại. Máy có kích thước khá gọn với độ dày 18.8 mm cùng trọng lượng là 2 kg, vì vậy việc di chuyển máy đến nơi này nơi kia cũng không quá khó khăn.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (138, N'Acer Aspire E5 575G 73J8 i7 7500U', 579, 2, 0, 579, 3, N'AC', N'acer-aspire-e5-575g-73j8-i7-7500u.jpg', 1, 0, 0, CAST(N'2017-02-22' AS Date), 31, N'Acer Aspire E5 575G 73J8​ là phiên bản có chip xử lý i7 thế hệ thứ 7 mới nhất, là sự lựa chọn cho các bạn cần một chiếc máy mạnh mẽ và nhanh nhạy.
Core i7 thế hệ mới
Việc tích hợp vi xử lý mạnh nhất và mới nhất của thế hệ thứ 7 giúp máy đảm đương rất tốt các công việc hay giải trí của bạn một cách tốt nhất.
CPU 2.7 GHz và có thể đẩy máy tăng tốc CPU lên tới 3.5 GHz để máy làm việc nhanh hơn. Ổ cứng HDD 500 GB, RAM sẵn 4 GB và có thể nâng cấp lên tối đa 16 GB.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (139, N'Acer Swift SF314 32EX i3 7100U', 468, 2, 0, 468, 3, N'AC', N'acer-swift-sf314-32ex-i3-7100u.jpg', 1, 0, 0, CAST(N'2015-01-20' AS Date), 15, N'Laptop Acer Swift SF314 32EX là một sản phẩm có thiết kế sang trọng với vỏ kim loại chắc chắn, bảo mật vân tay, cùng màn hình Full HD sắc nét.
Cấu hình tốt giúp xử lý tốt các công việc hằng ngày
Được tích hợp vi xử lý Core i3 Kaby Lake, tốc độ 2.4 Ghz cùng với RAM 4 GB, đặc biệt với ổ SSD 128 GB giúp máy hoạt động nhanh chóng và bảo mật dữ liệu tốt hơn.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (140, N'Acer Aspire A515 51G 52ZS i5 7200U', 456, 2, 0, 456, 3, N'AC', N'acer-aspire-a515-51g-52zs-i5-7200u.jpg', 1, 0, 1, CAST(N'2017-11-16' AS Date), 5, N'Acer Aspire A515 51G 52ZS tiếp tục là bản nâng cấp với card đồ họa rời, core i5 thế hệ 7 và một màn hình Full HD.
Đáp ứng nhu cầu học tập làm việc của bạn
Máy vẫn giữ nguyên các chip xử lý mạnh của phiên bản Aspire A315 51 52AB như core i5 thế hệ thứ 7, đảm bảo máy hoạt động ổn định và nhanh nhạy.
Máy tích hợp ổ cứng HDD 500 GB, RAM sẵn 4 GB và có thể nâng cấp lên tối đa 8 GB khi bạn muốn nâng cấp máy.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (141, N'Acer Spin 3 SP314 51 39WK i3 7130U', 439, 2, 0.15, 439, 3, N'AC', N'acer-spin-3-sp314-51-39wk-i3-7130u.png', 1, 0, 0, CAST(N'2017-02-22' AS Date), 4, N'Acer Spin 3 SP314 51 39WK là mẫu máy tính có thiên hướng thiết kế về thời trang và sự linh hoạt, tiện lợi vượt trội. Máy nhỏ gọn, màn hình cảm ứng và có thể biến đổi nhiều hình dạng phù hợp với các nhu cầu sử dụng.
Thiết kế, kiểu dáng tùy cơ ứng biến
Acer Spin 3 có kiểu thiết kế vỏ nhựa, các cạnh máy cong và bo tròn nhẹ nhàng dựa trên tổng thể thiết kế vuông vức, nhìn rất sang trọng. Máy chỉ có độ dày 20.8 mm, trọng lượng 1.7 kg nên bạn có thể dễ dàng mang theo để sử dụng mọi lúc, mọi nơi.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (142, N'Acer Aspire A315 51 52AB i5 7200U', 419, 2, 0, 419, 3, N'AC', N'acer-aspire-a315-51-52ab-i5-7200u.jpg', 1, 0, 0, CAST(N'2016-07-20' AS Date), 17, N'Acer Aspire A315 51 52AB là phiên bản sử dụng core i5 thế hệ thứ 7, màn hình hiển thị sắc nét với công nghệ Full HD.
Đáp ứng nhu cầu học tập làm việc của bạn
Việc tích hợp vi xử lý core i5 thế hệ thứ 7 mới nhất hiện nay giúp máy đảm đương tốt các ứng dụng nặng của bạn như Adobe, phần mềm lập trình...
CPU 2.5 GHz và có thể đẩy máy tăng tốc CPU lên tới 3.1 GHz để máy làm việc nhanh hơn. Ổ cứng HDD 500 GB, RAM sẵn 4 GB và có thể nâng cấp lên tối đa 8 GB')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (143, N'Acer Aspire A315 51 31X0 i3 6006U', 399, 2, 0, 399, 3, N'AC', N'acer-aspire-a315-51-31x0-i3-6006u.jpg', 1, 0, 0, CAST(N'2016-07-20' AS Date), 15, N'Acer Aspire A315 51 31X0 là phiên bản sử dụng core i3 thế hệ thứ 6 phù hợp nhu cầu học tập của học sinh, sinh viên, màn hình hiển thị sắc nét với công nghệ Full HD.
Phù hợp với các nhu cầu sử dụng làm việc cơ bản
Máy sử dụng chip xử lý core i3 thế hệ thứ 6 giúp máy đảm đương tốt các tác vụ hằng ngày của bạn như nhập liệu trên các phần mềm office, phù hợp với giới văn phòng, giáo viên hay học sinh...
Máy có RAM 4 GB và có thể nâng cấp lên tối đa 8 GB để máy hoạt động nhanh hơn.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (144, N'Acer Nitro 5 AN515 51 739L i7 7700HQ', 2289, 2, 0, 2289, 3, N'AC', N'acer-nitro-5-an515-51-739l-i7-7700hq.jpg', 1, 1, 1, CAST(N'2017-12-20' AS Date), 19, N'Acer Nitro 5 AN515 là sản phẩm có kiểu dáng hầm hố đặc thù của dòng laptop Gaming, với nhiều góc cạnh và với 2 tông màu chính đỏ và đen càng làm tăng độ mạnh mẽ, chất ngầu cho máy.
Thu hút từ cái nhìn đầu tiên
Với vẻ ngoài đậm chất Gaming, cực ngầu với hai tông màu đỏ đen đồng nhất, mặt trước nắp gập được thiết kế dạng vân xước dọc rất tinh tế. Máy có độ dày là 26.75 mm và cân nặng 2.7 kg, viền màn hình dày và chắc chắn.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (145, N'Polymer 15000mAh Sony CP-S15-BC', 2289, 3, 0, 2289, 4, N'SO', N'sac-du-phong-polymer-15000mah-sony.jpg', 1, 1, 0, CAST(N'2017-12-20' AS Date), 21, N'Pin sạc dự phòng Polymer Sony CP-S15-BC ULA tuy có dung lượng rất lớn nhưng kiểu dáng vẫn nhỏ gọn.Dung lượng pin cao cho nhiều lần sạc
Sạc đầy được cho điện thoại và máy tính bảng có dung lượng dưới 13.000 mAh.
Lưu ý: Trong quá trình sạc pin sẽ bị hao hụt khoảng 30% dung lượng.')
GO
INSERT [dbo].[Products] ([Id], [Name], [UnitPrice], [TechnicalParamId], [Discount], [UnitsInStock], [CategoryId], [SupplierId], [Image], [Available], [Special], [Latest], [ProductDate], [ViewCount], [Description]) VALUES (1167, N'Polymer 8700mAh Sony CP-V9/BC ULA
', 19, 3, 0, 19, 4, N'SO', N'sacduphongpolymer8700mah.jpg', 1, 0, 0, CAST(N'2018-01-23' AS Date), 2, N'Pin sạc dự phòng Polymer Sony CP-V9/BC ULA có thiết kế vuông vức truyền thống.Tích hợp công nghệ Hybrid Gel cho tuổi thọ sạc hơn 1000 lần.Dung lượng pin cao cho nhiều lần sạc
Sạc đầy được cho điện thoại và máy tính bảng có dung lượng dưới 7.000 mAh.

Lưu ý: Trong quá trình sạc pin sẽ bị hao hụt khoảng 30% dung lượng.')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Suppliers] ([Id], [CompanyName], [Logo], [Email], [Phone]) VALUES (N'AC', N'Acer', N'acer.jpg', N'acer@gmail.com', N'0918456982')
GO
INSERT [dbo].[Suppliers] ([Id], [CompanyName], [Logo], [Email], [Phone]) VALUES (N'AP', N'Apple', N'apple.jpg', N'apple@yahoo.com', N'0987345876')
GO
INSERT [dbo].[Suppliers] ([Id], [CompanyName], [Logo], [Email], [Phone]) VALUES (N'AS', N'Asus', N'asus.jpg', N'asus@gmail.com', N'0913745789')
GO
INSERT [dbo].[Suppliers] ([Id], [CompanyName], [Logo], [Email], [Phone]) VALUES (N'DE', N'Dell', N'dell.jpg', N'dell@yahoo.com', N'0987345871')
GO
INSERT [dbo].[Suppliers] ([Id], [CompanyName], [Logo], [Email], [Phone]) VALUES (N'HT', N'HTC', N'htc.jpg', N'htc@yahoo.com', N'0913745780')
GO
INSERT [dbo].[Suppliers] ([Id], [CompanyName], [Logo], [Email], [Phone]) VALUES (N'HU', N'Huawei', N'huawei.jpg', N'huawei@gmail.com', N'0987456874')
GO
INSERT [dbo].[Suppliers] ([Id], [CompanyName], [Logo], [Email], [Phone]) VALUES (N'MS', N'MSI', N'msi.jpg', N'msi@gmail.com', N'0913745783')
GO
INSERT [dbo].[Suppliers] ([Id], [CompanyName], [Logo], [Email], [Phone]) VALUES (N'OP', N'OPPO', N'oppo.jpg', N'oppo@yahoo.com', N'0915745780')
GO
INSERT [dbo].[Suppliers] ([Id], [CompanyName], [Logo], [Email], [Phone]) VALUES (N'SA', N'SamSung', N'samsung.jpg', N'samsung@gmail.com', N'0918456987')
GO
INSERT [dbo].[Suppliers] ([Id], [CompanyName], [Logo], [Email], [Phone]) VALUES (N'SO', N'Sony', N'sony.jpg', N'sony@gmail.com', N'0987456876')
GO
SET IDENTITY_INSERT [dbo].[TechnicalParam] ON 

GO
INSERT [dbo].[TechnicalParam] ([Id], [CPU], [Ram], [Drive], [Screen], [ScreenCard], [ConnectionPort], [OperatingSystem], [Size]) VALUES (1, N'Apple A11 Bionic 6 nhân', N'3 GB', N'256 GB', N'OLED, 5.8", Super Retina', N'Apple GPU 3 nhân', N'Cổng sạc Lightning', N'iOS 11', N'Dài 143.6 mm - Ngang 70.9 mm - Dày 7.7 mm')
GO
INSERT [dbo].[TechnicalParam] ([Id], [CPU], [Ram], [Drive], [Screen], [ScreenCard], [ConnectionPort], [OperatingSystem], [Size]) VALUES (2, N'Intel, Core i5', N'8 GB, DDR4', N'	SSD + HDD , 128 GB + 1 TB', N'	15.6 inchs, 1920 x 1080 Pixels', N'	NVIDIA GeForce GTX 1050, Card rời', N'	LAN : GigaLANWIFI : 802.11 2x2 AC/B', N'	LINUX (Endless OS)', N'	390 x 266 x 26.75 mm')
GO
INSERT [dbo].[TechnicalParam] ([Id], [CPU], [Ram], [Drive], [Screen], [ScreenCard], [ConnectionPort], [OperatingSystem], [Size]) VALUES (3, N'63%', N'Có', N'13 - 14 giờ (dùng Adapter 1A)', N'5V - 1.5A Max', N'Pin Polymer', N'5V – 2.4A', N'5V - 1.5A', N'Dài 13.3 cm - ngang 7.6 cm - dày 2.39 cm')
GO
SET IDENTITY_INSERT [dbo].[TechnicalParam] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatuses] FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatuses] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatuses]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_TechnicalParam] FOREIGN KEY([TechnicalParamId])
REFERENCES [dbo].[TechnicalParam] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_TechnicalParam]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mức giảm giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng tồn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'UnitsInStock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã nhà cung cấp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'SupplierId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hàng đặc biệt?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Special'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hàng mới?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Latest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ProductDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products'
GO
