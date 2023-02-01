USE [master]
GO
/****** Object:  Database [Young-Artists]    Script Date: 2023/1/31 下午 04:17:13 ******/
CREATE DATABASE [Young-Artists]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Young-Artists', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Young-Artists.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Young-Artists_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Young-Artists_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Young-Artists] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Young-Artists].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Young-Artists] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Young-Artists] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Young-Artists] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Young-Artists] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Young-Artists] SET ARITHABORT OFF 
GO
ALTER DATABASE [Young-Artists] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Young-Artists] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Young-Artists] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Young-Artists] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Young-Artists] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Young-Artists] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Young-Artists] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Young-Artists] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Young-Artists] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Young-Artists] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Young-Artists] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Young-Artists] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Young-Artists] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Young-Artists] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Young-Artists] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Young-Artists] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Young-Artists] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Young-Artists] SET RECOVERY FULL 
GO
ALTER DATABASE [Young-Artists] SET  MULTI_USER 
GO
ALTER DATABASE [Young-Artists] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Young-Artists] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Young-Artists] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Young-Artists] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Young-Artists] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Young-Artists] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Young-Artists', N'ON'
GO
ALTER DATABASE [Young-Artists] SET QUERY_STORE = OFF
GO
USE [Young-Artists]
GO
/****** Object:  Table [dbo].[administrators]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrators](
	[administrator_id] [int] IDENTITY(1,1) NOT NULL,
	[administrator_account] [nvarchar](50) NULL,
	[administrator_password] [nvarchar](50) NULL,
	[administrator_creat_timestamp] [nvarchar](50) NULL,
	[administrator_update_timestamp] [nvarchar](50) NULL,
 CONSTRAINT [PK_管理員] PRIMARY KEY CLUSTERED 
(
	[administrator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advertisement]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertisement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[advertisement_id] [int] NULL,
	[advertisement_name] [nvarchar](50) NULL,
	[advertisement_src] [nchar](100) NULL,
	[advertisement_alt] [nchar](100) NULL,
	[advertisement_href] [nchar](100) NULL,
	[advertisement_startdate] [nvarchar](50) NULL,
	[advertisement_enddate] [nvarchar](50) NULL,
	[company_id] [int] NULL,
	[event_id] [int] NULL,
	[advertisement_online] [bit] NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[commodity]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commodity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[commodity_name] [nvarchar](50) NULL,
	[commodity_narrative] [nvarchar](500) NULL,
	[commodity_num] [int] NULL,
	[commodity_price] [money] NULL,
	[commodity_image] [nvarchar](50) NULL,
	[commodity_start] [nvarchar](50) NULL,
	[commodity_Classification] [nvarchar](50) NULL,
	[commodity_state] [bit] NULL,
 CONSTRAINT [PK_commodity] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NULL,
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
/****** Object:  Table [dbo].[contactPerson]    Script Date: 2023/1/31 下午 04:17:13 ******/
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
	[company_id] [int] NULL,
	[contactperson_online] [bit] NULL,
 CONSTRAINT [PK_ContactPerson] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 2023/1/31 下午 04:17:13 ******/
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
	[customer_birth_date] [nvarchar](20) NULL,
	[customer_gender] [nvarchar](10) NULL,
	[customer_creat_timestamp] [nvarchar](50) NULL,
	[customer_update_timestamp] [nvarchar](50) NULL,
 CONSTRAINT [PK_會員] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_announcement]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_announcement](
	[announcement_id] [int] IDENTITY(1,1) NOT NULL,
	[content_title] [nchar](10) NULL,
	[concent] [nchar](10) NULL,
	[content_datetime] [nvarchar](50) NULL,
	[announcement_type] [nchar](10) NULL,
	[detaoled_id] [char](1) NULL,
 CONSTRAINT [PK_dataAnnouncement] PRIMARY KEY CLUSTERED 
(
	[announcement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detailed_announcement]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailed_announcement](
	[detaoled_id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [char](10) NULL,
	[state] [char](1) NULL,
	[reason] [nvarchar](500) NULL,
 CONSTRAINT [PK_details] PRIMARY KEY CLUSTERED 
(
	[detaoled_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluation_form]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluation_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[commodity_id] [int] NULL,
	[number_id] [int] NULL,
	[narrative] [nvarchar](500) NULL,
	[evaluation_time] [nvarchar](50) NULL,
	[isstate] [bit] NULL,
 CONSTRAINT [PK_evaluation_form] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event]    Script Date: 2023/1/31 下午 04:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event](
	[event_id] [int] IDENTITY(1,1) NOT NULL,
	[event_image] [nvarchar](50) NULL,
	[event_name] [nvarchar](50) NULL,
	[event_info] [nvarchar](max) NULL,
	[company_id] [int] NULL,
	[event_sell_start_timestamp] [nvarchar](50) NULL,
	[event_sell_end_timestamp] [nvarchar](50) NULL,
	[event_start_timestamp] [nvarchar](50) NULL,
	[event_end_timestamp] [nvarchar](50) NULL,
	[event_type_id] [int] NULL,
	[event_location_id] [int] NULL,
	[event_isstate] [bit] NULL,
 CONSTRAINT [PK_活動表] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event_collect]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_collect](
	[id] [int] NOT NULL,
	[event_id] [int] NULL,
	[customer_id] [int] NULL,
 CONSTRAINT [PK_加入收藏] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event_location]    Script Date: 2023/1/31 下午 04:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_location](
	[event_location_id] [int] IDENTITY(1,1) NOT NULL,
	[event_location_name] [nvarchar](50) NULL,
	[event_location_image] [nvarchar](50) NULL,
	[event_location_info] [nvarchar](max) NULL,
	[event_location_address] [nvarchar](50) NULL,
	[event_location_isstate] [bit] NULL,
 CONSTRAINT [PK_活動地點] PRIMARY KEY CLUSTERED 
(
	[event_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event_type]    Script Date: 2023/1/31 下午 04:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_type](
	[event_type_id] [int] IDENTITY(1,1) NOT NULL,
	[event_type_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_活動分類] PRIMARY KEY CLUSTERED 
(
	[event_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_form]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number_id] [int] NULL,
	[commodity_id] [int] NULL,
	[order_time] [nvarchar](50) NULL,
	[quantity_order] [int] NULL,
	[isState] [bit] NULL,
 CONSTRAINT [PK_order_form] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_main]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_main](
	[id] [int] NOT NULL,
	[shopping_id] [int] NULL,
	[order_form] [int] NULL,
	[member_id] [int] NULL,
 CONSTRAINT [PK_訂單主表] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NULL,
	[area] [nvarchar](50) NULL,
	[seat_id] [int] NULL,
	[price] [money] NULL,
	[is_available] [bit] NULL,
 CONSTRAINT [PK_seat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat_price]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat_price](
	[seat_type_id] [int] IDENTITY(1,1) NOT NULL,
	[seat_price] [int] NULL,
 CONSTRAINT [PK_座位價格] PRIMARY KEY CLUSTERED 
(
	[seat_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat_stock]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat_stock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NOT NULL,
	[area] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[stock] [int] NULL,
	[sold] [int] NULL,
	[price] [money] NULL,
	[is_available] [bit] NULL,
 CONSTRAINT [PK_seat_count] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket_order]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket_order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[order_total_price] [money] NULL,
	[order_create_timestamp] [nvarchar](100) NULL,
	[order_update_timestamp] [nvarchar](100) NULL,
	[order_update_id] [int] NULL,
	[order_state] [int] NULL,
	[customer_id] [int] NULL,
 CONSTRAINT [PK_ticket_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket_order_detail]    Script Date: 2023/1/31 下午 04:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket_order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[event_id] [int] NULL,
	[area] [nvarchar](50) NULL,
	[seat_id] [int] NULL,
	[customer_id] [int] NULL,
 CONSTRAINT [PK_ticket_order_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[commodity] ON 

INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_Classification], [commodity_state]) VALUES (1, N'中秋花好月圓禮盒', N'這是禮盒', 250, 1000.0000, N'0', N'2023/01/31', N'禮物', 1)
SET IDENTITY_INSERT [dbo].[commodity] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (1, N'孫怡文', N'ms0355995@gmial.com', N'123456', N'0912345678', N'台南市', N'東區林森路135巷54號', N'1993/9/9', N'女', N'2023/01/13', N'2023/01/31')
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[order_form] ON 

INSERT [dbo].[order_form] ([id], [number_id], [commodity_id], [order_time], [quantity_order], [isState]) VALUES (1, 1, 1, N'1', 1, 1)
SET IDENTITY_INSERT [dbo].[order_form] OFF
GO
SET IDENTITY_INSERT [dbo].[seat] ON 

INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (1, 1, N'A', 1, 1000.0000, 0)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (2, 1, N'A', 2, 1000.0000, 0)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (3, 1, N'A', 3, 1000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (4, 1, N'A', 4, 1000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (5, 1, N'A', 5, 1000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (6, 1, N'A', 6, 1000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (7, 1, N'A', 7, 1000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (8, 1, N'A', 8, 1000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (9, 1, N'A', 9, 1000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (10, 1, N'A', 10, 1000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (11, 1, N'B', 1, 1500.0000, 0)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (12, 1, N'B', 2, 1500.0000, 0)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (13, 1, N'B', 3, 1500.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (14, 1, N'B', 4, 1500.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (15, 1, N'B', 5, 1500.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (16, 1, N'B', 6, 1500.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (17, 1, N'B', 7, 1500.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (18, 1, N'B', 8, 1500.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (19, 1, N'B', 9, 1500.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (20, 1, N'B', 10, 1500.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (21, 1, N'C', 1, 2000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (22, 1, N'C', 2, 2000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (23, 1, N'C', 3, 2000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (24, 1, N'C', 4, 2000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (25, 1, N'C', 5, 2000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (26, 1, N'C', 6, 2000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (27, 1, N'C', 7, 2000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (28, 1, N'C', 8, 2000.0000, 1)
INSERT [dbo].[seat] ([id], [event_id], [area], [seat_id], [price], [is_available]) VALUES (29, 1, N'C', 9, 2000.0000, 1)
SET IDENTITY_INSERT [dbo].[seat] OFF
GO
SET IDENTITY_INSERT [dbo].[seat_stock] ON 

INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (1, 1, N'A區', 40, 2, 38, 1000.0000, 1)
INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (2, 1, N'B區', 40, 34, 6, 1500.0000, 1)
INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (3, 1, N'C區', 40, 32, 8, 2000.0000, 1)
SET IDENTITY_INSERT [dbo].[seat_stock] OFF
GO
USE [master]
GO
ALTER DATABASE [Young-Artists] SET  READ_WRITE 
GO
