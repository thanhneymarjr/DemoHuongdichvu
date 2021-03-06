USE [master]
GO
/****** Object:  Database [HocAspMVC]    Script Date: 14/07/2021 17:29:40 PM ******/
CREATE DATABASE [HocAspMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HocAspMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HocAspMVC.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HocAspMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HocAspMVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HocAspMVC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HocAspMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HocAspMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HocAspMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HocAspMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HocAspMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HocAspMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [HocAspMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HocAspMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HocAspMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HocAspMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HocAspMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HocAspMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HocAspMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HocAspMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HocAspMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HocAspMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HocAspMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HocAspMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HocAspMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HocAspMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HocAspMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HocAspMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HocAspMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HocAspMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HocAspMVC] SET  MULTI_USER 
GO
ALTER DATABASE [HocAspMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HocAspMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HocAspMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HocAspMVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HocAspMVC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HocAspMVC]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14/07/2021 17:29:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lop]    Script Date: 14/07/2021 17:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lop](
	[lop_id] [int] IDENTITY(1,1) NOT NULL,
	[TenLop] [nvarchar](50) NULL,
 CONSTRAINT [PK_lop] PRIMARY KEY CLUSTERED 
(
	[lop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 14/07/2021 17:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 14/07/2021 17:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)),
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 14/07/2021 17:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL CONSTRAINT [DF__products__name__239E4DCF]  DEFAULT (NULL),
	[cateid] [int] NULL CONSTRAINT [DF__products__id_typ__25869641]  DEFAULT (NULL),
	[unit_price] [decimal](18, 0) NULL CONSTRAINT [DF__products__unit_p__267ABA7A]  DEFAULT (NULL),
	[image] [nvarchar](255) NULL CONSTRAINT [DF__products__image__286302EC]  DEFAULT (NULL),
	[created_at] [datetime2](0) NULL CONSTRAINT [DF__products__create__2B3F6F97]  DEFAULT (getdate()),
	[updated_at] [datetime2](0) NULL CONSTRAINT [DF__products__update__2C3393D0]  DEFAULT (getdate()),
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 14/07/2021 17:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[sanpham_id] [int] NOT NULL,
	[tensp] [nvarchar](50) NULL,
 CONSTRAINT [PK_sanpham] PRIMARY KEY CLUSTERED 
(
	[sanpham_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sinhvien]    Script Date: 14/07/2021 17:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sinhvien](
	[sv_id] [int] IDENTITY(1,1) NOT NULL,
	[TenSV] [nvarchar](50) NULL,
	[ma_lop] [int] NULL,
 CONSTRAINT [PK_sinhvien] PRIMARY KEY CLUSTERED 
(
	[sv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 14/07/2021 17:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[GroupID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Photo] [nvarchar](255) NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 14/07/2021 17:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name]) VALUES (30, N'fdsfdsf 222')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (31, N'DSSAFDSAF sdfdgfd')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (32, N'ÀDSFDS11')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (36, N'ADASD')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (37, N'csdfds')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[lop] ON 

INSERT [dbo].[lop] ([lop_id], [TenLop]) VALUES (1, N'10A')
INSERT [dbo].[lop] ([lop_id], [TenLop]) VALUES (2, N'11A')
SET IDENTITY_INSERT [dbo].[lop] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (1, CAST(N'2021-07-14 16:20:53.627' AS DateTime), NULL, N'Nguyen Van A', N'987', N'BH', N'hk320202021@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (2, CAST(N'2021-07-14 16:47:00.013' AS DateTime), NULL, N'Nguyen Van A', N'987', N'BH', N'hk320202021@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (3, CAST(N'2021-07-14 16:54:44.697' AS DateTime), NULL, N'Nguyen Van A', N'987', N'BH', N'hk320202021@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (4, CAST(N'2021-07-14 16:59:42.323' AS DateTime), NULL, N'Nguyen Van A', N'987', N'BH', N'hk320202021@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (5, CAST(N'2021-07-14 17:14:52.820' AS DateTime), NULL, N'Nguyễn Văn A', N'987', N'BH', N'hk320202021@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (6, CAST(N'2021-07-14 17:18:06.567' AS DateTime), NULL, N'Nguyen Van A', N'23243999999', N'BH', N'hk320202021@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 2, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 3, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 4, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 5, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (1, 6, 2, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (2, 1, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (2, 4, 2, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (2, 5, 2, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (2, 6, 2, CAST(300000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (1, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (2, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-2.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (3, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-3.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (4, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-4.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (5, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-5.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (6, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (7, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (8, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (9, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (10, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (11, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (12, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (13, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (14, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (15, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
INSERT [dbo].[product] ([id], [name], [cateid], [unit_price], [image], [created_at], [updated_at]) VALUES (16, N'San pham 1', 30, CAST(300000 AS Decimal(18, 0)), N'm-product-1.jpg', CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2), CAST(N'2021-07-12 19:38:20.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[sinhvien] ON 

INSERT [dbo].[sinhvien] ([sv_id], [TenSV], [ma_lop]) VALUES (1, N'Nguyễn Văn A', 2)
INSERT [dbo].[sinhvien] ([sv_id], [TenSV], [ma_lop]) VALUES (2, N'Minh B1111', 2)
INSERT [dbo].[sinhvien] ([sv_id], [TenSV], [ma_lop]) VALUES (12, N'Xsdcsa', 1)
INSERT [dbo].[sinhvien] ([sv_id], [TenSV], [ma_lop]) VALUES (1002, N'fdsfsdfgfsdf', 2)
INSERT [dbo].[sinhvien] ([sv_id], [TenSV], [ma_lop]) VALUES (1003, N'fdsfsdfgfsdf 11133', 1)
INSERT [dbo].[sinhvien] ([sv_id], [TenSV], [ma_lop]) VALUES (1004, N'Nguyen Van A', 1)
INSERT [dbo].[sinhvien] ([sv_id], [TenSV], [ma_lop]) VALUES (1005, N'Nguyen Van B', 2)
INSERT [dbo].[sinhvien] ([sv_id], [TenSV], [ma_lop]) VALUES (1006, N'DASFSAFSEEWQ', 1)
SET IDENTITY_INSERT [dbo].[sinhvien] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Photo]) VALUES (113, N'a', N'a', 1, N'ee', N'ee.jpg')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Photo]) VALUES (115, N'b', N'b', 2, N'333', N'df.jpg')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Photo]) VALUES (118, N'sdfds', N'sdfsd', 1, N'dfsf', N'sdfds.jpg')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Photo]) VALUES (119, N'sfdsf', N'dfgdf', 1, N'sgfd', N'sfdsf.jpg')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Photo]) VALUES (120, N'sdfds', N'dsfds', 1, N'fdsfds', N'sdfds.jpg')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Photo]) VALUES (121, N'sss', N'sadsad', 1, N'đâs', N'sss.jpg')
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (1, N'ADMIN')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (2, N'USER')
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_product]
GO
ALTER TABLE [dbo].[sinhvien]  WITH CHECK ADD  CONSTRAINT [FK_sinhvien_lop] FOREIGN KEY([ma_lop])
REFERENCES [dbo].[lop] ([lop_id])
GO
ALTER TABLE [dbo].[sinhvien] CHECK CONSTRAINT [FK_sinhvien_lop]
GO
USE [master]
GO
ALTER DATABASE [HocAspMVC] SET  READ_WRITE 
GO
