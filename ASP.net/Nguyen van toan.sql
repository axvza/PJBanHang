USE [master]
GO
/****** Object:  Database [Wedsidebanhang]    Script Date: 26/04/2022 7:27:22 SA ******/
CREATE DATABASE [Wedsidebanhang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Category_2119110347', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Category_2119110347.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Category_2119110347_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Category_2119110347_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Wedsidebanhang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wedsidebanhang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wedsidebanhang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wedsidebanhang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wedsidebanhang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Wedsidebanhang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wedsidebanhang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET RECOVERY FULL 
GO
ALTER DATABASE [Wedsidebanhang] SET  MULTI_USER 
GO
ALTER DATABASE [Wedsidebanhang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wedsidebanhang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wedsidebanhang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wedsidebanhang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Wedsidebanhang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Wedsidebanhang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Wedsidebanhang', N'ON'
GO
ALTER DATABASE [Wedsidebanhang] SET QUERY_STORE = OFF
GO
USE [Wedsidebanhang]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 26/04/2022 7:27:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdateOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26/04/2022 7:27:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 26/04/2022 7:27:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[Price] [float] NULL,
	[Status] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 26/04/2022 7:27:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26/04/2022 7:27:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[FullDescription] [nvarchar](100) NULL,
	[Price] [float] NULL,
	[PriceDiscount] [float] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdateOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26/04/2022 7:27:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc], [Deleted]) VALUES (2, N'Samsung', N'y-nghia-logo-cua-samsung_20220424011823.jpg', N'samsung', 1, 2, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc], [Deleted]) VALUES (3, N'Acer', N'Acer_3D_logo_and_slogan_20220424011712.jpg', N'acer', 1, 3, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc], [Deleted]) VALUES (4, N'Hàng tàu', N'white-t-shirt-mockup_125540-617_20220424011336.jpg', N'hangtau', 1, 4, NULL, NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc], [Deleted]) VALUES (5, N'Apple', N'iphone6_20220418013127.jpg', N'apple', 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Điện thoại ', N'iphone8_20220424011923.jpg                                                                          ', N'dien-thoai', 1, 1, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Máy tính', N'laptop_20220424011914.jpg                                                                           ', N'may-tinh-xach-tay', 1, 2, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Máy tính bảng', N'Ipad_20220424011905.jpg                                                                             ', N'may-tinh-bang', 1, 3, 0, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Phụ kiện ', N'opdtiphone11_20220424011854.jpg                                                                     ', N'phu-kien', 1, 4, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Price], [Status], [CreatedOnUtc]) VALUES (4, N'DonHang20220424115214', 1, NULL, 1, CAST(N'2022-04-24T11:52:14.727' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Price], [Status], [CreatedOnUtc]) VALUES (5, N'DonHang20220424155749', 1, NULL, 1, CAST(N'2022-04-24T15:57:49.663' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 3, 6, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (4, 4, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 5, 1, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (1, N'Iphone 6', N'iphone6.jpg                                                                                         ', 1, N'mô tả ngắn gọn về iphone 6', N'mô tả đầy đủ', 1500000, 1200000, 1, N'iphone6', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (2, N'Iphone 7', N'iphone7.jpg                                                                                         ', 1, N'mô tả ngắn', N'mô tả đầy đủ', 2000000, 1800000, 1, N'iphone7', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (3, N'Iphone 8', N'iphone8.jpg                                                                                         ', 1, N'mô tả ngắn', N'mô tả đầy đủ', 2500000, 2300000, 1, N'iphone8', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (4, N'Iphone X', N'iphonex.jpg                                                                                         ', 1, N'mô tả ngắn', N'mô tả đầy đủ', 2800000, 2500000, 1, N'iphonex', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (5, N'Iphone 11', N'iphone11.jpg                                                                                        ', 1, N'mô tả ngắn', N'mô tả đầy đủ', 3000000, 2900000, 1, N'iphone11', 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (6, N'SamSung Galxy Note 3', N'samsungnote3.jpg                                                                                    ', 3, N'mô tả ngắn', N'mô tả đầy đủ', 5000000, 4900000, 2, N'samsungnote3', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (7, N'SamSung Galxy Note 9', N'samsungnote9.jpg                                                                                    ', 3, N'mô tả ngắn', N'mô tả đầy đủ', 8000000, 7999000, 2, N'samsungnote9', 2, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (8, N'Laptop Asus Nitro 5', N'asusnitro.jpg                                                                                       ', 2, N'mô tả ngắn', N'mô tả đầy đủ', 15000000, 14500000, 2, N'nitro5', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (9, N'Ốp điện thoại Iphone X', N'opdtiphonex.jpg                                                                                     ', 4, N'mô tả ngắn', N'mô tả đầy đủ', 30000, 29000, 2, N'opiphonex', 4, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdateOnUtc]) VALUES (10, N'Ốp điện thoại Iphone 11', N'opdtiphone11.jpg                                                                                    ', 4, N'mô tả ngắn', N'mô tả đầy đủ', 31000, 29000, 3, N'opiphone11', 4, 0, 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Firstname], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'tran', N'thang', N'thang@gmail.com', N'202cb962ac59075b964b07152d234b70', NULL)
INSERT [dbo].[User] ([Id], [Firstname], [LastName], [Email], [Password], [IsAdmin]) VALUES (8, N'Tranvan', N'A', N'Minhloi@gmail.com', N'202cb962ac59075b964b07152d234b70', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:Giảm giá siêu sốc, 2:Đang được ưa chuộng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
USE [master]
GO
ALTER DATABASE [Wedsidebanhang] SET  READ_WRITE 
GO
