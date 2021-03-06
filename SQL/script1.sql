USE [J3.L.P0015]
GO
ALTER TABLE [dbo].[rentingDetail] DROP CONSTRAINT [FK_rentingDetail_rentingCar]
GO
ALTER TABLE [dbo].[rentingDetail] DROP CONSTRAINT [FK_rentingDetail_car]
GO
ALTER TABLE [dbo].[rentingCar] DROP CONSTRAINT [FK_rentingCar_registration]
GO
ALTER TABLE [dbo].[rentingCar] DROP CONSTRAINT [FK_rentingCar_discount]
GO
ALTER TABLE [dbo].[feedBack] DROP CONSTRAINT [FK_feedBack_rentingDetail]
GO
ALTER TABLE [dbo].[feedBack] DROP CONSTRAINT [FK_feedBack_registration]
GO
/****** Object:  Table [dbo].[rentingDetail]    Script Date: 4/11/2021 9:55:10 PM ******/
DROP TABLE [dbo].[rentingDetail]
GO
/****** Object:  Table [dbo].[rentingCar]    Script Date: 4/11/2021 9:55:10 PM ******/
DROP TABLE [dbo].[rentingCar]
GO
/****** Object:  Table [dbo].[registration]    Script Date: 4/11/2021 9:55:10 PM ******/
DROP TABLE [dbo].[registration]
GO
/****** Object:  Table [dbo].[feedBack]    Script Date: 4/11/2021 9:55:10 PM ******/
DROP TABLE [dbo].[feedBack]
GO
/****** Object:  Table [dbo].[discount]    Script Date: 4/11/2021 9:55:10 PM ******/
DROP TABLE [dbo].[discount]
GO
/****** Object:  Table [dbo].[car]    Script Date: 4/11/2021 9:55:10 PM ******/
DROP TABLE [dbo].[car]
GO
USE [master]
GO
/****** Object:  Database [J3.L.P0015]    Script Date: 4/11/2021 9:55:10 PM ******/
DROP DATABASE [J3.L.P0015]
GO
/****** Object:  Database [J3.L.P0015]    Script Date: 4/11/2021 9:55:10 PM ******/
CREATE DATABASE [J3.L.P0015]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J3.L.P0015', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\J3.L.P0015.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'J3.L.P0015_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\J3.L.P0015_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [J3.L.P0015] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J3.L.P0015].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J3.L.P0015] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J3.L.P0015] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J3.L.P0015] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J3.L.P0015] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J3.L.P0015] SET ARITHABORT OFF 
GO
ALTER DATABASE [J3.L.P0015] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J3.L.P0015] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J3.L.P0015] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J3.L.P0015] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J3.L.P0015] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J3.L.P0015] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J3.L.P0015] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J3.L.P0015] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J3.L.P0015] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J3.L.P0015] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J3.L.P0015] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J3.L.P0015] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J3.L.P0015] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J3.L.P0015] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J3.L.P0015] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J3.L.P0015] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J3.L.P0015] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J3.L.P0015] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J3.L.P0015] SET  MULTI_USER 
GO
ALTER DATABASE [J3.L.P0015] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J3.L.P0015] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J3.L.P0015] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J3.L.P0015] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [J3.L.P0015] SET DELAYED_DURABILITY = DISABLED 
GO
USE [J3.L.P0015]
GO
/****** Object:  Table [dbo].[car]    Script Date: 4/11/2021 9:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[car](
	[carID] [varchar](50) NOT NULL,
	[name] [varchar](50) NULL,
	[color] [varchar](50) NULL,
	[year] [int] NULL,
	[category] [varchar](50) NULL,
	[image] [varchar](max) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[quantityChange] [int] NULL,
 CONSTRAINT [PK_car] PRIMARY KEY CLUSTERED 
(
	[carID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[discount]    Script Date: 4/11/2021 9:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[discount](
	[discountID] [varchar](10) NOT NULL,
	[percentDiscount] [float] NULL,
	[description] [varchar](300) NULL,
	[effectiveDate] [date] NULL,
	[expirationDate] [date] NULL,
 CONSTRAINT [PK_discount] PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feedBack]    Script Date: 4/11/2021 9:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[feedBack](
	[feedBackID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](50) NULL,
	[rentingDetailID] [int] NULL,
	[star] [float] NULL,
	[description] [varchar](300) NULL,
 CONSTRAINT [PK_feedBack] PRIMARY KEY CLUSTERED 
(
	[feedBackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registration]    Script Date: 4/11/2021 9:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registration](
	[userID] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[fullName] [varchar](100) NULL,
	[phone] [varchar](20) NULL,
	[address] [varchar](350) NULL,
	[createDate] [date] NULL,
	[role] [varchar](50) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rentingCar]    Script Date: 4/11/2021 9:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rentingCar](
	[rentingID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](50) NULL,
	[createDate] [date] NULL,
	[discountID] [varchar](10) NULL,
	[totalPrice] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_rentingCar] PRIMARY KEY CLUSTERED 
(
	[rentingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rentingDetail]    Script Date: 4/11/2021 9:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rentingDetail](
	[rentingDetailID] [int] IDENTITY(1,1) NOT NULL,
	[rentingID] [int] NULL,
	[carID] [varchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[rentalDate] [date] NULL,
	[returnDate] [date] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_rentingDetail] PRIMARY KEY CLUSTERED 
(
	[rentingDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'A325', N'Audi A5', N'Black', 2018, N'COUPE', N'https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/images/16q4/671590/2018-audi-a5-sportback-first-drive-review-car-and-driver-photo-672021-s-original.jpg', 550, 10, NULL)
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'C211', N'Chevrolet Tahoe', N'White', 2021, N'SUV', N'https://i.gaw.to/content/photos/44/27/442724-chevrolet-tahoe-2021.jpg', 970, 10, NULL)
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'C290', N'Chevrolet Corvette', N'White', 2020, N'COUPE', N'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/screen-shot-2019-10-03-at-9-52-03-pm-1570154537.png?crop=1xw:0.943558282208589xh;center,top&resize=1200:*', 440, 30, NULL)
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'F120', N'Ford Mustang', N'Yellow', 2019, N'COUPE', N'https://cdn.drivek.it/configurator-covermobile/cars/gb/$original$/FORD/MUSTANG/32383_COUPE-2-DOORS/ford-mustang-gt-2018-cover-mobile.jpg', 600, 10, NULL)
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'F550', N'Ford Expedition', N'White', 2020, N'SUV', N'https://cdn.jdpower.com/JDPA_2020%20Ford%20Expedition%20King%20Ranch%20White%20Front%20Quarter%20View.jpg', 850, 10, NULL)
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'F821', N'Ferrari 488 GTB', N'Red', 2020, N'SPORTS CAR', N'http://cdn.carbuzz.com/gallery-images/1600/341000/300/341322.jpg', 1000, 35, NULL)
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'K111', N'Kia Rio', N'White', 2020, N'SEDAN', N'https://www.carscoops.com/wp-content/uploads/2020/05/2021-Kia-Rio-6.jpg', 450, 20, NULL)
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'M444', N'Maybach S650', N'Black', 2019, N'SEDAN', N'https://autopro8.mediacdn.vn/2019/9/2/cb9edbe3-carlex-maybach-s650-tuning-5-156739343392072810055.jpg', 600, 40, NULL)
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'M666', N'Mazda Miata', N'White', 2020, N'SPORTS CAR', N'https://cnet2.cbsistatic.com/img/TTPOZ9TY5dJO5BBUuXdaRHcHlRo=/940x0/2020/05/26/d236f949-5d95-4376-91bb-dd90493fd81f/miata-promo.jpg', 700, 27, NULL)
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'N111', N'Nissan Versa', N'White', 2019, N'SEDAN', N'https://www.iihs.org/api/ratings/model-year-images/2754', 400, 20, NULL)
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'N281', N'Nissan Kicks', N'Sliver', 2020, N'SUV', N'https://www.motortrend.com/uploads/sites/5/2020/03/2020-Nissan-Kicks-SR-11.jpg', 900, 15, NULL)
INSERT [dbo].[car] ([carID], [name], [color], [year], [category], [image], [price], [quantity], [quantityChange]) VALUES (N'P980', N'Porsche 911', N'Sliver', 2021, N'SPORTS CAR', N'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/is8rDPGsGlcg/v1/-1x-1.jpg', 800, 25, NULL)
INSERT [dbo].[discount] ([discountID], [percentDiscount], [description], [effectiveDate], [expirationDate]) VALUES (N'ABC', 20, N'20% discount', CAST(N'2021-03-07' AS Date), CAST(N'2021-03-12' AS Date))
INSERT [dbo].[discount] ([discountID], [percentDiscount], [description], [effectiveDate], [expirationDate]) VALUES (N'BBB', 20, N'20% discount', CAST(N'2021-03-05' AS Date), CAST(N'2021-03-14' AS Date))
SET IDENTITY_INSERT [dbo].[feedBack] ON 

INSERT [dbo].[feedBack] ([feedBackID], [userID], [rentingDetailID], [star], [description]) VALUES (1, N'dinhquocdat1310@gmail.com', 7, 7, N'Good')
INSERT [dbo].[feedBack] ([feedBackID], [userID], [rentingDetailID], [star], [description]) VALUES (2, N'dinhquocdat1310@gmail.com', 8, 3, N'Bad')
SET IDENTITY_INSERT [dbo].[feedBack] OFF
INSERT [dbo].[registration] ([userID], [password], [fullName], [phone], [address], [createDate], [role]) VALUES (N'abc@gmail.com', N'123', N'a', N'0919589325', N'a', CAST(N'2021-02-28' AS Date), N'new')
INSERT [dbo].[registration] ([userID], [password], [fullName], [phone], [address], [createDate], [role]) VALUES (N'dinhquocdat1310@gmail.com', N'123', N'Dinh Quoc Dat', N'091891091', N'Bien Hoa`', CAST(N'2021-03-04' AS Date), N'active')
INSERT [dbo].[registration] ([userID], [password], [fullName], [phone], [address], [createDate], [role]) VALUES (N'dinhquocdat13100@gmail.com', N'123', N'Dinh Quoc Dat', N'0946235300', N'dd', CAST(N'2021-03-11' AS Date), N'new')
INSERT [dbo].[registration] ([userID], [password], [fullName], [phone], [address], [createDate], [role]) VALUES (N'leminhtai325@gmail.com', N'123', N'Guest', N'7', N'Vung Tau', CAST(N'2021-03-05' AS Date), N'active')
SET IDENTITY_INSERT [dbo].[rentingCar] ON 

INSERT [dbo].[rentingCar] ([rentingID], [userID], [createDate], [discountID], [totalPrice], [status]) VALUES (1, N'dinhquocdat1310@gmail.com', CAST(N'2021-03-07' AS Date), NULL, 3000, 1)
INSERT [dbo].[rentingCar] ([rentingID], [userID], [createDate], [discountID], [totalPrice], [status]) VALUES (2, N'dinhquocdat1310@gmail.com', CAST(N'2021-03-07' AS Date), NULL, 1800, 0)
INSERT [dbo].[rentingCar] ([rentingID], [userID], [createDate], [discountID], [totalPrice], [status]) VALUES (3, N'dinhquocdat1310@gmail.com', CAST(N'2021-03-07' AS Date), NULL, 3600, 1)
INSERT [dbo].[rentingCar] ([rentingID], [userID], [createDate], [discountID], [totalPrice], [status]) VALUES (4, N'dinhquocdat1310@gmail.com', CAST(N'2021-03-09' AS Date), NULL, 2750, 1)
INSERT [dbo].[rentingCar] ([rentingID], [userID], [createDate], [discountID], [totalPrice], [status]) VALUES (5, N'dinhquocdat1310@gmail.com', CAST(N'2021-03-09' AS Date), NULL, 2750, 1)
INSERT [dbo].[rentingCar] ([rentingID], [userID], [createDate], [discountID], [totalPrice], [status]) VALUES (6, N'dinhquocdat1310@gmail.com', CAST(N'2021-03-09' AS Date), NULL, 550, 0)
INSERT [dbo].[rentingCar] ([rentingID], [userID], [createDate], [discountID], [totalPrice], [status]) VALUES (7, N'dinhquocdat1310@gmail.com', CAST(N'2021-03-09' AS Date), N'BBB', 7040, 1)
INSERT [dbo].[rentingCar] ([rentingID], [userID], [createDate], [discountID], [totalPrice], [status]) VALUES (8, N'dinhquocdat1310@gmail.com', CAST(N'2021-03-10' AS Date), N'BBB', 15840, 1)
INSERT [dbo].[rentingCar] ([rentingID], [userID], [createDate], [discountID], [totalPrice], [status]) VALUES (9, N'dinhquocdat1310@gmail.com', CAST(N'2021-03-10' AS Date), NULL, 96000, 1)
INSERT [dbo].[rentingCar] ([rentingID], [userID], [createDate], [discountID], [totalPrice], [status]) VALUES (10, N'dinhquocdat1310@gmail.com', CAST(N'2021-03-11' AS Date), N'BBB', 56000, 1)
INSERT [dbo].[rentingCar] ([rentingID], [userID], [createDate], [discountID], [totalPrice], [status]) VALUES (11, N'dinhquocdat1310@gmail.com', CAST(N'2021-03-11' AS Date), N'BBB', 880, 1)
SET IDENTITY_INSERT [dbo].[rentingCar] OFF
SET IDENTITY_INSERT [dbo].[rentingDetail] ON 

INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (1, 1, N'F120', 600, 1, CAST(N'2021-03-07' AS Date), CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (2, 2, N'F120', 600, 1, CAST(N'2021-03-12' AS Date), CAST(N'2021-03-15' AS Date), 0)
INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (3, 3, N'F120', 600, 7, CAST(N'2021-03-09' AS Date), CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (4, 4, N'A325', 550, 5, CAST(N'2021-03-10' AS Date), CAST(N'2021-03-11' AS Date), 0)
INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (5, 5, N'A325', 550, 5, CAST(N'2021-03-10' AS Date), CAST(N'2021-03-11' AS Date), 0)
INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (6, 6, N'A325', 550, 1, CAST(N'2021-03-16' AS Date), CAST(N'2021-03-17' AS Date), 0)
INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (7, 7, N'F821', 1000, 1, CAST(N'2021-03-10' AS Date), CAST(N'2021-03-12' AS Date), 1)
INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (8, 7, N'F550', 850, 1, CAST(N'2021-03-17' AS Date), CAST(N'2021-03-25' AS Date), 1)
INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (9, 8, N'A325', 550, 4, CAST(N'2021-03-16' AS Date), CAST(N'2021-03-25' AS Date), 1)
INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (10, 9, N'M444', 600, 40, CAST(N'2021-03-11' AS Date), CAST(N'2021-03-15' AS Date), 1)
INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (11, 10, N'F821', 1000, 35, CAST(N'2021-03-16' AS Date), CAST(N'2021-03-18' AS Date), 1)
INSERT [dbo].[rentingDetail] ([rentingDetailID], [rentingID], [carID], [price], [quantity], [rentalDate], [returnDate], [status]) VALUES (12, 11, N'A325', 550, 1, CAST(N'2021-03-16' AS Date), CAST(N'2021-03-18' AS Date), 1)
SET IDENTITY_INSERT [dbo].[rentingDetail] OFF
ALTER TABLE [dbo].[feedBack]  WITH CHECK ADD  CONSTRAINT [FK_feedBack_registration] FOREIGN KEY([userID])
REFERENCES [dbo].[registration] ([userID])
GO
ALTER TABLE [dbo].[feedBack] CHECK CONSTRAINT [FK_feedBack_registration]
GO
ALTER TABLE [dbo].[feedBack]  WITH CHECK ADD  CONSTRAINT [FK_feedBack_rentingDetail] FOREIGN KEY([rentingDetailID])
REFERENCES [dbo].[rentingDetail] ([rentingDetailID])
GO
ALTER TABLE [dbo].[feedBack] CHECK CONSTRAINT [FK_feedBack_rentingDetail]
GO
ALTER TABLE [dbo].[rentingCar]  WITH CHECK ADD  CONSTRAINT [FK_rentingCar_discount] FOREIGN KEY([discountID])
REFERENCES [dbo].[discount] ([discountID])
GO
ALTER TABLE [dbo].[rentingCar] CHECK CONSTRAINT [FK_rentingCar_discount]
GO
ALTER TABLE [dbo].[rentingCar]  WITH CHECK ADD  CONSTRAINT [FK_rentingCar_registration] FOREIGN KEY([userID])
REFERENCES [dbo].[registration] ([userID])
GO
ALTER TABLE [dbo].[rentingCar] CHECK CONSTRAINT [FK_rentingCar_registration]
GO
ALTER TABLE [dbo].[rentingDetail]  WITH CHECK ADD  CONSTRAINT [FK_rentingDetail_car] FOREIGN KEY([carID])
REFERENCES [dbo].[car] ([carID])
GO
ALTER TABLE [dbo].[rentingDetail] CHECK CONSTRAINT [FK_rentingDetail_car]
GO
ALTER TABLE [dbo].[rentingDetail]  WITH CHECK ADD  CONSTRAINT [FK_rentingDetail_rentingCar] FOREIGN KEY([rentingID])
REFERENCES [dbo].[rentingCar] ([rentingID])
GO
ALTER TABLE [dbo].[rentingDetail] CHECK CONSTRAINT [FK_rentingDetail_rentingCar]
GO
USE [master]
GO
ALTER DATABASE [J3.L.P0015] SET  READ_WRITE 
GO
