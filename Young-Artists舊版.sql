USE [master]
GO
/****** Object:  Database [Young-Artists]    Script Date: 2023/1/18 下午 01:48:01 ******/
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
/****** Object:  Table [dbo].[administrators]    Script Date: 2023/1/18 下午 01:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrators](
	[administrator_id] [int] IDENTITY(1,1) NOT NULL,
	[administrator_account] [nvarchar](50) NULL,
	[administrator_password] [nvarchar](50) NULL,
	[administrator_creat_timestamp] [nvarchar](20) NULL,
	[administrator_update_timestamp] [nvarchar](20) NULL,
 CONSTRAINT [PK_管理員] PRIMARY KEY CLUSTERED 
(
	[administrator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advertisement]    Script Date: 2023/1/18 下午 01:48:02 ******/
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
	[advertisement_startdate] [nvarchar](20) NULL,
	[advertisement_enddate] [nvarchar](20) NULL,
	[company_id] [int] NULL,
	[event_id] [int] NULL,
	[advertisement_online] [bit] NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[commodity]    Script Date: 2023/1/18 下午 01:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commodity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[commodity_name] [nvarchar](50) NULL,
	[commodity_narrative] [nvarchar](500) NULL,
	[commodity_num] [int] NULL,
	[commodity_image] [nchar](10) NULL,
	[commodity_start] [nchar](10) NULL,
	[commodity_Classification] [nvarchar](50) NULL,
	[commodity_state] [bit] NULL,
 CONSTRAINT [PK_commodity] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company]    Script Date: 2023/1/18 下午 01:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int](50) NULL,
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
/****** Object:  Table [dbo].[contactPerson]    Script Date: 2023/1/18 下午 01:48:02 ******/
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
/****** Object:  Table [dbo].[customers]    Script Date: 2023/1/18 下午 01:48:02 ******/
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
	[customer_creat_timestamp] [nvarchar](20) NULL,
	[customer_update_timestamp] [nvarchar](20) NULL,
 CONSTRAINT [PK_會員] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_announcement]    Script Date: 2023/1/18 下午 01:48:02 ******/
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
/****** Object:  Table [dbo].[detailed_announcement]    Script Date: 2023/1/18 下午 01:48:02 ******/
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
/****** Object:  Table [dbo].[evaluation_form]    Script Date: 2023/1/18 下午 01:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluation_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[commodity_id] [int] NULL,
	[number_id] [int] NULL,
	[narrative] [nvarchar](500) NULL,
	[evaluation_time] [nvarchar](20) NULL,
	[isstate] [bit] NULL,
 CONSTRAINT [PK_evaluation_form] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event]    Script Date: 2023/1/18 下午 01:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event](
	[event_id] [int] IDENTITY(1,1) NOT NULL,
	[event_image] [nchar](10) NULL,
	[company_id] [int] NULL,
	[event_sell_start] [nvarchar](20) NULL,
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
/****** Object:  Table [dbo].[event_collect]    Script Date: 2023/1/18 下午 01:48:02 ******/
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
/****** Object:  Table [dbo].[event_location]    Script Date: 2023/1/18 下午 01:48:02 ******/
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
/****** Object:  Table [dbo].[event_type]    Script Date: 2023/1/18 下午 01:48:02 ******/
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
/****** Object:  Table [dbo].[order]    Script Date: 2023/1/18 下午 01:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[order_creat_timestamp] [nvarchar](20) NULL,
	[order_update_timestamp] [nvarchar](20) NULL,
	[order_update_id] [int] NULL,
	[order_state] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 2023/1/18 下午 01:48:02 ******/
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
/****** Object:  Table [dbo].[order_form]    Script Date: 2023/1/18 下午 01:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number_id] [int] NULL,
	[commodity_id] [int] NULL,
	[order_time] [nvarchar](20) NULL,
	[quantity_order] [int] NULL,
	[isState] [bit] NULL,
 CONSTRAINT [PK_order_form] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_main]    Script Date: 2023/1/18 下午 01:48:02 ******/
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
/****** Object:  Table [dbo].[seat_price]    Script Date: 2023/1/18 下午 01:48:02 ******/
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
/****** Object:  Table [dbo].[seat_state]    Script Date: 2023/1/18 下午 01:48:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat_state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [nchar](10) NULL,
	[seat_type_id] [int] NULL,
	[seat_count] [int] NULL,
 CONSTRAINT [PK_座位狀態表] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Young-Artists] SET  READ_WRITE 
GO
