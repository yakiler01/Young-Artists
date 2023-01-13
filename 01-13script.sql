USE [master]
GO
/****** Object:  Database [資料庫]    Script Date: 2023/1/13 下午 04:34:28 ******/
CREATE DATABASE [資料庫]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'資料庫', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\資料庫.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'資料庫_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\資料庫_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [資料庫] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [資料庫].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [資料庫] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [資料庫] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [資料庫] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [資料庫] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [資料庫] SET ARITHABORT OFF 
GO
ALTER DATABASE [資料庫] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [資料庫] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [資料庫] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [資料庫] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [資料庫] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [資料庫] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [資料庫] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [資料庫] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [資料庫] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [資料庫] SET  DISABLE_BROKER 
GO
ALTER DATABASE [資料庫] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [資料庫] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [資料庫] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [資料庫] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [資料庫] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [資料庫] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [資料庫] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [資料庫] SET RECOVERY FULL 
GO
ALTER DATABASE [資料庫] SET  MULTI_USER 
GO
ALTER DATABASE [資料庫] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [資料庫] SET DB_CHAINING OFF 
GO
ALTER DATABASE [資料庫] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [資料庫] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [資料庫] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [資料庫] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'資料庫', N'ON'
GO
ALTER DATABASE [資料庫] SET QUERY_STORE = OFF
GO
USE [資料庫]
GO
/****** Object:  Table [dbo].[administrators]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrators](
	[administrator_id] [int] IDENTITY(1,1) NOT NULL,
	[administrator_account] [nvarchar](50) NULL,
	[administrator_password] [nvarchar](50) NULL,
	[administrator_creat_timestamp] [datetime] NULL,
	[administrator_update_timestamp] [datetime] NULL,
 CONSTRAINT [PK_管理員] PRIMARY KEY CLUSTERED 
(
	[administrator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advertisement]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertisement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[advertisement_id] [int] NULL,
	[advertisement_type] [int] NULL,
	[advertisement_name] [nvarchar](50) NULL,
	[advertisement_src] [nchar](100) NULL,
	[advertisement_alt] [nchar](100) NULL,
	[advertisement_href] [nchar](100) NULL,
	[advertisement_startdate] [date] NULL,
	[advertisement_enddate] [date] NULL,
	[company_id] [nvarchar](50) NULL,
	[event_id] [nvarchar](50) NULL,
	[advertisement_online] [bit] NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[commodity]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commodity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[narrative] [nvarchar](500) NULL,
	[num] [int] NULL,
	[商品圖片] [nchar](10) NULL,
	[商品上架時間] [nchar](10) NULL,
	[Classification] [nvarchar](50) NULL,
	[isState] [bit] NULL,
 CONSTRAINT [PK_commodity] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [nchar](50) NULL,
	[company_name] [nchar](50) NULL,
	[company_phone] [nchar](50) NULL,
	[company_address] [nchar](50) NULL,
	[company_email] [nchar](50) NULL,
	[company_online] [bit] NULL,
 CONSTRAINT [PK_Corporation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactPerson]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactPerson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contactperson_name] [nchar](50) NULL,
	[contactperson_title] [nchar](50) NULL,
	[contactperson_phone] [nchar](50) NULL,
	[contactperson_email] [nchar](50) NULL,
	[company_id] [nchar](50) NULL,
	[contactperson_online] [bit] NULL,
 CONSTRAINT [PK_ContactPerson] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](50) NULL,
	[customer_email] [nvarchar](50) NULL,
	[customer_password] [nvarchar](50) NULL,
	[customer_phone] [nvarchar](50) NULL,
	[customer_region] [nvarchar](30) NULL,
	[customer_address] [nvarchar](100) NULL,
	[customer_birth_date] [date] NULL,
	[customer_gender] [nvarchar](10) NULL,
	[customer_creat_timestamp] [datetime] NULL,
	[customer_update_timestamp] [datetime] NULL,
 CONSTRAINT [PK_會員] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluation_form]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluation_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[commodity_id] [int] NULL,
	[number_id] [int] NULL,
	[narrative] [nvarchar](500) NULL,
	[evaluation_time] [datetime] NULL,
	[isstate] [bit] NULL,
 CONSTRAINT [PK_evaluation_form] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event](
	[event_id] [int] IDENTITY(1,1) NOT NULL,
	[event_image] [nchar](10) NULL,
	[company_id] [int] NULL,
	[event_sell_start] [datetime] NULL,
	[event_sell_end] [datetime] NULL,
	[event_start] [nchar](10) NULL,
	[event_end] [datetime] NULL,
	[event_type_id] [nvarchar](50) NULL,
	[event_location_id] [nchar](10) NULL,
	[event_isstate] [bit] NULL,
 CONSTRAINT [PK_活動表] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event_location]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_location](
	[event_location_id] [int] IDENTITY(1,1) NOT NULL,
	[event_location_name] [nvarchar](50) NULL,
	[event_location_info] [nvarchar](50) NULL,
	[event_location_address] [nvarchar](50) NULL,
	[event_location_isstate] [bit] NULL,
 CONSTRAINT [PK_活動地點] PRIMARY KEY CLUSTERED 
(
	[event_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event_type]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_type](
	[event_type_id] [int] NOT NULL,
	[event_type_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_活動分類] PRIMARY KEY CLUSTERED 
(
	[event_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[order_creat_timestamp] [date] NULL,
	[order_update_timestamp] [date] NULL,
	[order_update_id] [int] NULL,
	[order_state] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[evnet_id] [int] NULL,
	[seat_id] [int] NULL,
	[customer_id] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_form]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number_id] [int] NULL,
	[commodity_id] [int] NULL,
	[order_time] [datetime] NULL,
	[quantity_order] [int] NULL,
	[isState] [bit] NULL,
 CONSTRAINT [PK_order_form] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat_price]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat_price](
	[seat_type_id] [nchar](10) NOT NULL,
	[seat_price] [int] NULL,
 CONSTRAINT [PK_座位價格] PRIMARY KEY CLUSTERED 
(
	[seat_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat_state]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat_state](
	[id] [int] NOT NULL,
	[event_id] [nchar](10) NULL,
	[seat_type_id] [int] NULL,
	[seat_count] [int] NULL,
 CONSTRAINT [PK_座位狀態表] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat_type]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[座位種類ID] [int] NULL,
	[座位種類名稱] [nvarchar](50) NULL,
	[座位價錢] [int] NULL,
	[座位數量] [int] NULL,
	[上下架] [bit] NULL,
 CONSTRAINT [PK_座位種類] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[公告內容資料表]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[公告內容資料表](
	[公告內容ID] [int] NOT NULL,
	[公告主題] [nvarchar](50) NULL,
	[公告時間] [datetime] NULL,
	[公告內容] [nvarchar](500) NULL,
 CONSTRAINT [PK_contentAnnouncement] PRIMARY KEY CLUSTERED 
(
	[公告內容ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[公告種類]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[公告種類](
	[公告種類ID] [int] IDENTITY(1,1) NOT NULL,
	[公告種類] [nvarchar](50) NULL,
 CONSTRAINT [PK_typeAnnouncement] PRIMARY KEY CLUSTERED 
(
	[公告種類ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[公告總表]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[公告總表](
	[announcement_id] [int] IDENTITY(1,1) NOT NULL,
	[content_title] [nchar](10) NULL,
	[concent] [nchar](10) NULL,
	[content_datetime] [nchar](10) NULL,
	[announcement_type] [nchar](10) NULL,
	[detaoled_id] [char](1) NULL,
 CONSTRAINT [PK_dataAnnouncement] PRIMARY KEY CLUSTERED 
(
	[announcement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[加入收藏]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[加入收藏](
	[id] [int] NOT NULL,
	[event_id] [int] NULL,
	[customer_id] [int] NULL,
 CONSTRAINT [PK_加入收藏] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[目前狀態]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[目前狀態](
	[狀態Id] [int] NOT NULL,
	[狀態種類] [nvarchar](50) NULL,
 CONSTRAINT [PK_typestate] PRIMARY KEY CLUSTERED 
(
	[狀態Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[訂單主表]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[訂單主表](
	[id] [int] NOT NULL,
	[商城購物ID] [int] NULL,
	[購票ID] [int] NULL,
	[會員ID] [int] NULL,
 CONSTRAINT [PK_訂單主表] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[座位]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[座位](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[座位種類ID] [int] NULL,
	[座位ID] [int] NULL,
	[座位分區] [nchar](10) NULL,
	[活動ID] [int] NULL,
	[上下架] [bit] NULL,
 CONSTRAINT [PK_座位] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[詳細資訊]    Script Date: 2023/1/13 下午 04:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[詳細資訊](
	[detaoled_id] [int] IDENTITY(1,1) NOT NULL,
	[活動Id] [char](10) NULL,
	[state] [char](1) NULL,
	[reason] [nvarchar](500) NULL,
 CONSTRAINT [PK_details] PRIMARY KEY CLUSTERED 
(
	[detaoled_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [order_id], [order_creat_timestamp], [order_update_timestamp], [order_update_id], [order_state]) VALUES (1, NULL, CAST(N'2022-01-03' AS Date), CAST(N'2022-01-03' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [order_id], [evnet_id], [seat_id], [customer_id]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [evnet_id], [seat_id], [customer_id]) VALUES (2, 1, 1, 2, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [evnet_id], [seat_id], [customer_id]) VALUES (3, 1, 1, 25, 1)
INSERT [dbo].[order_detail] ([id], [order_id], [evnet_id], [seat_id], [customer_id]) VALUES (4, 1, 1, 50, 1)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[公告種類] ON 

INSERT [dbo].[公告種類] ([公告種類ID], [公告種類]) VALUES (1, N'最新公告')
INSERT [dbo].[公告種類] ([公告種類ID], [公告種類]) VALUES (2, N'系統公告')
INSERT [dbo].[公告種類] ([公告種類ID], [公告種類]) VALUES (3, N'異動公告')
SET IDENTITY_INSERT [dbo].[公告種類] OFF
GO
SET IDENTITY_INSERT [dbo].[公告總表] ON 

INSERT [dbo].[公告總表] ([announcement_id], [content_title], [concent], [content_datetime], [announcement_type], [detaoled_id]) VALUES (1, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[公告總表] OFF
GO
USE [master]
GO
ALTER DATABASE [資料庫] SET  READ_WRITE 
GO
