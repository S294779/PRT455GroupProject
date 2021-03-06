/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [Online_Shopping]    Script Date: 9/18/2017 8:57:49 PM ******/
CREATE DATABASE [Online_Shopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Online_Shopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Online_Shopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Online_Shopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Online_Shopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Online_Shopping] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online_Shopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Online_Shopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Online_Shopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Online_Shopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Online_Shopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Online_Shopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Online_Shopping] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Online_Shopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Online_Shopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Online_Shopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Online_Shopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Online_Shopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Online_Shopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Online_Shopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Online_Shopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Online_Shopping] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Online_Shopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Online_Shopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Online_Shopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Online_Shopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Online_Shopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Online_Shopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Online_Shopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Online_Shopping] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Online_Shopping] SET  MULTI_USER 
GO
ALTER DATABASE [Online_Shopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Online_Shopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Online_Shopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Online_Shopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Online_Shopping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Online_Shopping] SET QUERY_STORE = OFF
GO
USE [Online_Shopping]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Online_Shopping]
GO
/****** Object:  Table [dbo].[Tbl_Cart]    Script Date: 9/18/2017 8:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[MemberId] [int] NULL,
	[CartStatusId] [int] NULL,
	[AddedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[ShippingDetailId] [int] NULL,
 CONSTRAINT [PK_Tbl_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CartStatus]    Script Date: 9/18/2017 8:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CartStatus](
	[CartStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CartStatus] [varchar](100) NULL,
 CONSTRAINT [PK_Tbl_CartStatus] PRIMARY KEY CLUSTERED 
(
	[CartStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Category]    Script Date: 9/18/2017 8:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Tbl_ServiceCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_MemberRole]    Script Date: 9/18/2017 8:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_MemberRole](
	[MemberRoleId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Tbl_MemberRole] PRIMARY KEY CLUSTERED 
(
	[MemberRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Members]    Script Date: 9/18/2017 8:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Members](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmailId] [nvarchar](200) NULL,
	[Password] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Member] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 9/18/2017 8:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
	[Description] [nvarchar](max) NULL,
	[ProductImage] [varchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
	[IsFeatured] [bit] NULL,
 CONSTRAINT [PK_Tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Roles]    Script Date: 9/18/2017 8:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ShippingDetails]    Script Date: 9/18/2017 8:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ShippingDetails](
	[ShippingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[AddressLine] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[OrderId] [varchar](50) NULL,
	[AmountPaid] [decimal](18, 0) NULL,
	[PaymentType] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_ShippingAddress] PRIMARY KEY CLUSTERED 
(
	[ShippingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD FOREIGN KEY([CartStatusId])
REFERENCES [dbo].[Tbl_CartStatus] ([CartStatusId])
GO
ALTER TABLE [dbo].[Tbl_Cart]  WITH CHECK ADD  CONSTRAINT [FK__Tbl_Cart__Produc__32E0915F] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Tbl_Product] ([ProductId])
GO
ALTER TABLE [dbo].[Tbl_Cart] CHECK CONSTRAINT [FK__Tbl_Cart__Produc__32E0915F]
GO
ALTER TABLE [dbo].[Tbl_MemberRole]  WITH CHECK ADD  CONSTRAINT [fk_Tbl_Roles_Tbl_MemberRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Tbl_Roles] ([RoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tbl_MemberRole] CHECK CONSTRAINT [fk_Tbl_Roles_Tbl_MemberRole]
GO
ALTER TABLE [dbo].[Tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Category_Tbl_Product] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Tbl_Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Tbl_Product] CHECK CONSTRAINT [FK_Tbl_Category_Tbl_Product]
GO
/****** Object:  StoredProcedure [dbo].[USP_MemberShoppingCartDetails]    Script Date: 9/18/2017 8:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_MemberShoppingCartDetails] 
(@memberId int) 
as 
begin 
select cr.CartId, p.Price,p.ProductId,p.ProductImage,p.ProductName,c.CategoryName 
from Tbl_Cart cr join Tbl_Product p on p.ProductId=cr.ProductId 
join Tbl_Category c on c.CategoryId=p.CategoryId 
join Tbl_Members m on m.MemberId=cr.MemberId where m.MemberId=@memberId 
and cr.CartStatusId=1 end 

GO
/****** Object:  StoredProcedure [dbo].[USP_Search]    Script Date: 9/18/2017 8:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[USP_Search](@searchKey varchar(100)) as begin select p.Description,p.Price,p.ProductId,p.ProductImage, p.ProductName, c.CategoryName from Tbl_Product p  join Tbl_Category c on p.CategoryId=c.CategoryId where p.IsActive=1 and p.IsDelete=0 and c.IsActive=1 and c.IsDelete=0 and (p.ProductName like '%'+@searchKey+'%' or c.CategoryName like '%'+@searchKey+'%') end

GO
USE [master]
GO
ALTER DATABASE [Online_Shopping] SET  READ_WRITE 
GO
