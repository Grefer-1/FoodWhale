USE [master]
GO

DROP DATABASE [FoodWhale]
/****** Object:  Database [FoodWhale]    Script Date: 11/9/2021 4:23:29 PM ******/
CREATE DATABASE [FoodWhale]
 ON  PRIMARY 
( NAME = N'FoodWhale', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\FoodWhale.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FoodWhale_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\FoodWhale_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodWhale].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodWhale] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodWhale] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodWhale] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodWhale] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodWhale] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodWhale] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FoodWhale] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodWhale] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodWhale] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodWhale] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodWhale] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodWhale] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodWhale] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodWhale] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodWhale] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FoodWhale] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodWhale] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodWhale] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodWhale] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodWhale] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodWhale] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodWhale] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodWhale] SET RECOVERY FULL 
GO
ALTER DATABASE [FoodWhale] SET  MULTI_USER 
GO
ALTER DATABASE [FoodWhale] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodWhale] SET DB_CHAINING OFF 
GO
USE [FoodWhale]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/9/2021 4:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CID] [varchar](50) NOT NULL,
	[CName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category_1] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 11/9/2021 4:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[InID] [varchar](50) NOT NULL,
	[InName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[InID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/9/2021 4:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 11/9/2021 4:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[ODID] [varchar](50) NOT NULL,
	[OID] [int] NOT NULL,
	[InID] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 11/9/2021 4:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[RName] [varchar](50) NOT NULL,
	[RDescription] [varchar](max) NOT NULL,
	[VideoURL] [varchar](max) NULL,
	[Difficulty] [varchar](50) NOT NULL,
	[Time] [int] NOT NULL,
	[CID] [varchar](50) NOT NULL,
	[Rating] [int] NOT NULL,
	[imageID] [int] NULL,
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe_Image]    Script Date: 11/9/2021 4:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe_Image](
	[RID] [int] NULL,
	[imageURL] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe_Ingredient]    Script Date: 11/9/2021 4:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe_Ingredient](
	[RID] [int] NOT NULL,
	[InID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Recipe_Ingredient] PRIMARY KEY CLUSTERED 
(
	[RID] ASC,
	[InID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/9/2021 4:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UName] [varchar](50) NOT NULL,
	[DoB] [date] NULL,
	[Gender] [char](1) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[imageURL] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Access]    Script Date: 11/9/2021 4:23:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Access](
	[AID] [varchar](50) NOT NULL,
	[UID] [int] NOT NULL,
	[Date_access] [date] NOT NULL,
 CONSTRAINT [PK_User_Access] PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UID])
REFERENCES [dbo].[User] ([UID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Ingredient] FOREIGN KEY([InID])
REFERENCES [dbo].[Ingredient] ([InID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Ingredient]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order] FOREIGN KEY([OID])
REFERENCES [dbo].[Order] ([OID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_Category] FOREIGN KEY([CID])
REFERENCES [dbo].[Category] ([CID])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_Category]
GO
ALTER TABLE [dbo].[Recipe_Image]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Recipe] ([RID])
GO
ALTER TABLE [dbo].[Recipe_Ingredient]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_Ingredient_Ingredient] FOREIGN KEY([InID])
REFERENCES [dbo].[Ingredient] ([InID])
GO
ALTER TABLE [dbo].[Recipe_Ingredient] CHECK CONSTRAINT [FK_Recipe_Ingredient_Ingredient]
GO
ALTER TABLE [dbo].[Recipe_Ingredient]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_Ingredient_Recipe] FOREIGN KEY([RID])
REFERENCES [dbo].[Recipe] ([RID])
GO
ALTER TABLE [dbo].[Recipe_Ingredient] CHECK CONSTRAINT [FK_Recipe_Ingredient_Recipe]
GO
ALTER TABLE [dbo].[User_Access]  WITH CHECK ADD  CONSTRAINT [FK_User_Access_User] FOREIGN KEY([UID])
REFERENCES [dbo].[User] ([UID])
GO
ALTER TABLE [dbo].[User_Access] CHECK CONSTRAINT [FK_User_Access_User]
GO
USE [master]
GO
ALTER DATABASE [FoodWhale] SET  READ_WRITE 
GO
