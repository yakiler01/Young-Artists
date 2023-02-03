USE [master]
GO
/****** Object:  Database [Young-Artists]    Script Date: 2023/2/3 上午 11:38:00 ******/
CREATE DATABASE [Young-Artists]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'資料庫', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\資料庫.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'資料庫_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\資料庫_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[administrators]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[advertisement]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[announcement]    Script Date: 2023/2/3 上午 11:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[announcement](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[announcement_type] [nvarchar](20) NULL,
	[content_title] [nvarchar](50) NULL,
	[content_time] [nvarchar](50) NULL,
	[content] [nvarchar](500) NULL,
	[details_id] [char](1) NULL,
 CONSTRAINT [PK_announcement] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[commodity]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[company]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[contactPerson]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[customers]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[details]    Script Date: 2023/2/3 上午 11:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[details](
	[details_id] [int] IDENTITY(1,1) NOT NULL,
	[eventtime] [nvarchar](50) NULL,
	[event_id] [char](10) NULL,
	[state] [nvarchar](20) NULL,
	[reason] [nvarchar](500) NULL,
 CONSTRAINT [PK_details] PRIMARY KEY CLUSTERED 
(
	[details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluation_form]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[event]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[event_collect]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[event_location]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[event_type]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[order_form]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[order_main]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[seat]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[seat_price]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[seat_stock]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[ticket_order]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
/****** Object:  Table [dbo].[ticket_order_detail]    Script Date: 2023/2/3 上午 11:38:00 ******/
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
SET IDENTITY_INSERT [dbo].[administrators] ON 

INSERT [dbo].[administrators] ([administrator_id], [administrator_account], [administrator_password], [administrator_creat_timestamp], [administrator_update_timestamp]) VALUES (4, N'admin', N'123', N'2023-02-03 上午 10:19:23', N'2023-02-03 上午 10:19:23')
INSERT [dbo].[administrators] ([administrator_id], [administrator_account], [administrator_password], [administrator_creat_timestamp], [administrator_update_timestamp]) VALUES (5, N'root', N'123456', N'2023-02-03 上午 10:19:31', N'2023-02-03 上午 10:19:31')
INSERT [dbo].[administrators] ([administrator_id], [administrator_account], [administrator_password], [administrator_creat_timestamp], [administrator_update_timestamp]) VALUES (6, N'John', N'111', N'2023-02-03 上午 10:19:44', N'2023-02-03 上午 10:19:44')
SET IDENTITY_INSERT [dbo].[administrators] OFF
GO
SET IDENTITY_INSERT [dbo].[advertisement] ON 

INSERT [dbo].[advertisement] ([id], [advertisement_id], [advertisement_name], [advertisement_src], [advertisement_alt], [advertisement_href], [advertisement_startdate], [advertisement_enddate], [company_id], [event_id], [advertisement_online]) VALUES (1, 1, N'太空港音樂藝術節嘉年華 台北站', N'06ea2456-605e-4304-ada8-b66590192a28.png                                                            ', N'#TeamGaia是太空港幕後創意&執行團隊，用獨一無二的環保視野，                                                                  ', N'https://spaceport.kktix.cc/events/d68ab4aa                                                          ', N'2023-02-02', N'2023-02-16', 1, 1, 1)
INSERT [dbo].[advertisement] ([id], [advertisement_id], [advertisement_name], [advertisement_src], [advertisement_alt], [advertisement_href], [advertisement_startdate], [advertisement_enddate], [company_id], [event_id], [advertisement_online]) VALUES (2, 2, N'JJ20世界巡迴演唱會香港站', N'3bd2c635-089f-48d2-9fa8-0ff30aec9949.png                                                            ', N'JJ20世界巡迴演唱會香港站                                                                                      ', N'https://tix-get-go.kktix.cc/events/jjlinhk2023                                                      ', N'2023-02-04', N'2023-02-28', 2, 2, 1)
INSERT [dbo].[advertisement] ([id], [advertisement_id], [advertisement_name], [advertisement_src], [advertisement_alt], [advertisement_href], [advertisement_startdate], [advertisement_enddate], [company_id], [event_id], [advertisement_online]) VALUES (3, 3, N'太空港：遊戲開始', N'3900dd75-1fca-4f37-b724-1a48caf2b12c.png                                                            ', N'宇宙核心發出最新訊號                                                                                          ', N'https://spaceport.kktix.cc/events/89b56f38                                                          ', N'2023-02-03', N'2023-02-23', 3, 3, 1)
INSERT [dbo].[advertisement] ([id], [advertisement_id], [advertisement_name], [advertisement_src], [advertisement_alt], [advertisement_href], [advertisement_startdate], [advertisement_enddate], [company_id], [event_id], [advertisement_online]) VALUES (4, 4, N'理想混蛋 2023【奇異點 BESTRANGE】演唱會', N'7fc21b0e-1c42-4d5d-aa65-0210cbff57b4.png                                                            ', N'                            不存在規則的旅行                                                                ', N'https://best-onlineteam.kktix.cc/events/t16jg7w                                                     ', N'2023-02-04', N'2023-02-24', 4, 4, 1)
INSERT [dbo].[advertisement] ([id], [advertisement_id], [advertisement_name], [advertisement_src], [advertisement_alt], [advertisement_href], [advertisement_startdate], [advertisement_enddate], [company_id], [event_id], [advertisement_online]) VALUES (5, 5, N'OHM NANON 1st Fan Meeting in Hong Kong', N'daaacf50-96ab-4124-81f6-3395bc123cf1.png                                                            ', N'OHM NANON 1st Fan Meeting in Hong Kong                                                              ', N'https://kklivehk.kktix.cc/events/ohmnanonhk2023-0305                                                ', N'2023-02-04', N'2023-02-15', 5, 5, 1)
INSERT [dbo].[advertisement] ([id], [advertisement_id], [advertisement_name], [advertisement_src], [advertisement_alt], [advertisement_href], [advertisement_startdate], [advertisement_enddate], [company_id], [event_id], [advertisement_online]) VALUES (6, 6, N'靜物Lisa Djaati 台北Legacy 演唱會', N'82e61071-3300-4875-bd69-2f2905e30717.png                                                            ', N'從 Lisa 到靜物樂團，再到靜物 Lisa Djaati                                                                       ', N'https://haloprojecthouse.kktix.cc/events/faabd91b                                                   ', N'2023-02-02', N'2023-02-23', 6, 6, 0)
INSERT [dbo].[advertisement] ([id], [advertisement_id], [advertisement_name], [advertisement_src], [advertisement_alt], [advertisement_href], [advertisement_startdate], [advertisement_enddate], [company_id], [event_id], [advertisement_online]) VALUES (7, 7, N'太空港音樂藝術節嘉年華 台北站', N'2eabd887-59c5-42cc-a9ac-956297898f60.png                                                            ', N'JJ20世界巡迴演唱會香港站                                                                                      ', N'https://spaceport.kktix.cc/events/d68ab4aa                                                          ', N'2023-02-04', N'2023-02-27', 5, 5, 1)
SET IDENTITY_INSERT [dbo].[advertisement] OFF
GO
SET IDENTITY_INSERT [dbo].[announcement] ON 

INSERT [dbo].[announcement] ([aid], [announcement_type], [content_title], [content_time], [content], [details_id]) VALUES (1, N'系統公告', N'系統測試', N'2023/01/31', N'系統測試訊息', N'1')
INSERT [dbo].[announcement] ([aid], [announcement_type], [content_title], [content_time], [content], [details_id]) VALUES (6, N'系統公告', N'身心障礙線上驗證購票服務啟用', N'2023-01-31', N'身心障礙者線上身分認證於2022/12/23(五)中午12點啟用 
網站或APP購買身障票或輪椅席，會員資料請先完成身分認證，再行購票。
舊會員請先至年代售票首頁 > 會員專區 > 會員登入 > 修改資料 > 身分認證，完成線上認證後，方能在網路購票。
新會員請先至年代售票首頁 > 會員專區 > 會員申請 > 身分認證，完成線上認證後，方能在網路購票。
如有任何問題，請洽 年代客服中心', NULL)
INSERT [dbo].[announcement] ([aid], [announcement_type], [content_title], [content_time], [content], [details_id]) VALUES (8, N'系統公告', N'預防詐騙提醒', N'2023-02-03', N'年代售票系統預防詐騙提醒 ＊ 近日詐騙集團猖獗, 假借各大購物網站(通常是大陸口音)名義, 並竄改來電顯示偽裝成該公司或銀行的電話號碼, 
以慣用伎倆佯稱訂單轉帳,授權,分期,送貨簽收,結賬,等錯誤問題, 恐嚇會被連續扣款, 若不從, 歹徒就再恐嚇, 這表示自動放棄權益, 並有錄音存證等語,
 然後再假藉銀行人員或警察再打來(同樣竄改來電顯示), 要求到ATM提款機取消連續扣款設定..等語, 實際卻是可惡的轉帳詐騙手法, 請大家小心提防', NULL)
INSERT [dbo].[announcement] ([aid], [announcement_type], [content_title], [content_time], [content], [details_id]) VALUES (9, N'系統公告', N'系統維護公告', N'2023-01-31', N'因系統進行升級維護，聞意青年網站購票、全家購票及取票將於 2023/2/1 (三)、2/3 (五) 06:00 ~ 07:00 ', NULL)
INSERT [dbo].[announcement] ([aid], [announcement_type], [content_title], [content_time], [content], [details_id]) VALUES (10, N'異動公告', N'預防詐騙提醒', N'2022-12-07', N'不要被詐騙!!', NULL)
SET IDENTITY_INSERT [dbo].[announcement] OFF
GO
SET IDENTITY_INSERT [dbo].[commodity] ON 

INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_Classification], [commodity_state]) VALUES (1, N'藝術磁扣托特包-瓦薩里《百花大教堂》 【藝術磁扣托特包《百花大教堂》】', N'◎材質：１００％聚脂纖維 ◎尺寸：37X37x9 cm ◎多道加工手續紡織、染色、上漿，色牢度佳 ◎環保，手感溫潤，厚實耐磨耐用 ◎可肩背、手提，貼心內袋設計、方便使用 ◎大容量，可放入A4尺寸以上物品', 500, 790.0000, N'c751fbf5-b618-402d-8f0a-3298c0749705.jpg', N'2022/1/19 上午 09:59:05', N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_Classification], [commodity_state]) VALUES (2, N'波隆那X無字繪本-經典背袋《泡泡糖第五大街》', N'《泡泡糖第五大街》愛聽音樂的貓 創作靈感來自於2020年波隆那插畫展的入選作品《泡泡糖第五大街》 是著名波蘭插畫家高西婭 - 赫爾巴Gosia Herba 可以看見各種線條與筆觸間的交織旋律，運用色彩的層次，堆疊出樂譜的節奏！ 🎵 透過富有音樂的靈魂碰撞，愛聽音樂的貓，交織出出屬於動物們的專屬狂想曲！ 波隆那「泡泡糖第五大街」插畫經典背袋 ◎材質：高強度耐磨帆布 ◎尺寸：35X39 cm ◎多道加工手續紡織、染色、上漿，色牢度佳 ◎環保，手感溫潤，厚實耐磨耐用 ◎可肩背、手提，貼心內袋設計、方便使用 ◎大容量，可放入A4尺寸以上物品', 99, 590.0000, N'e57b4e6e-677a-43fd-ae8d-b31bd9710aa5.jpg', N'2019/10/23 上午 09:59:05', N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_Classification], [commodity_state]) VALUES (3, N'藝術圍裙-莫內《睡蓮》', N'藝術圍裙《睡蓮》 讓名畫圍裙陪你過生活，沉浸在藝術的美好氣息，讓生活更多采多姿。  ◎材質：100% 聚脂纖維 ◎成品尺寸：60x80cm ◎展開尺寸：64x87cm ◎優質真皮頸掛式綁帶收腰設計，可調整長度 ◎色牢度佳，縫線細緻，堅固結實 ◎口袋兩角皆有縫紉加固，防損耐用', 15, 690.0000, N'18a85db9-d4b4-4cfe-b014-075091e6a3fb.jpg', N'2017/12/3 上午 09:59:05', N'禮物', 0)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_Classification], [commodity_state]) VALUES (4, N'文藝復興大絲巾-拉斐爾《雅典學院》', N'文藝復興名畫絲巾《雅典學院》 此款文藝復興名畫絲巾以拉斐爾代表作《雅典學院》為設計 典雅獨特，質感佳、實用百搭，何不讓它為自己的日常造型增添一抹亮點！ ⚜ 畫作故事：拉斐爾的《雅典學院》以彩繪拱門為框架，描繪了古典時代最重要的哲學家、藝術家和科學家。在一座虛構的古典建築內，藉由完美的透視相互對話，象徵著文藝復興全盛期的精神，表現出篤信人類智慧的和諧，並讚美西方文明的結晶。畫作最右側戴著黑色帽子的是拉斐爾自畫像。 〔材質〕100% 純蠶絲 〔尺寸〕90 x 90cm', 30, 2980.0000, N'e76077ee-86f5-4332-bd5f-c527427a3638.jpg', N'2023/1/3 上午 09:59:05', N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_Classification], [commodity_state]) VALUES (5, N'文藝復興點心杯盤組-波提且利《維納斯的誕生》', N'無敘述', 999, 990.0000, N'd56eb191-c5be-469d-81da-fa58593132fe.jpg', N'2023/2/3 上午 09:59:05', N'禮物', 1)
SET IDENTITY_INSERT [dbo].[commodity] OFF
GO
SET IDENTITY_INSERT [dbo].[company] ON 

INSERT [dbo].[company] ([id], [company_id], [company_name], [company_phone], [company_address], [company_email], [company_online]) VALUES (1, 1, N'Legacy傳 音樂展演空間 
                                 ', N'02-33546253
                                     ', N'台北市八德路一段一號華山1914創意文化園區（中五館）
                     ', N'thewalllivehouse@gmail.com
                      ', 1)
INSERT [dbo].[company] ([id], [company_id], [company_name], [company_phone], [company_address], [company_email], [company_online]) VALUES (2, 2, N'水星媒體股份有限公司
                                      ', N'02-46287382
                                     ', N'台北市中山區大佳河濱公園十號水門
                                ', N'cs@spaceportcarnival.com
                        ', 1)
INSERT [dbo].[company] ([id], [company_id], [company_name], [company_phone], [company_address], [company_email], [company_online]) VALUES (3, 3, N'樂悠悠之口
                                           ', N'02-46287382
                                     ', N'台北市大安區光復南路100號B1
                                ', N'support@kktix.com

                              ', 1)
INSERT [dbo].[company] ([id], [company_id], [company_name], [company_phone], [company_address], [company_email], [company_online]) VALUES (4, 4, N'KKLIVE Hong Kong
                                ', N'02-27110339
                                     ', N'香港九龍展貿徑1號
                                       ', N'nfo@theuumouth.tw
                               ', 1)
INSERT [dbo].[company] ([id], [company_id], [company_name], [company_phone], [company_address], [company_email], [company_online]) VALUES (5, 5, N'廠商一號                                              ', N'02-25700025                                       ', N'台北市松山區八德路三段106巷1號B1                               ', N'chmetw@gmail.com                                  ', 1)
SET IDENTITY_INSERT [dbo].[company] OFF
GO
SET IDENTITY_INSERT [dbo].[contactPerson] ON 

INSERT [dbo].[contactPerson] ([id], [contactperson_name], [contactperson_title], [contactperson_phone], [contactperson_email], [company_id], [contactperson_online]) VALUES (1, N'溫傑方
                                             ', N'企劃
                                              ', N'0929483723
                                      ', N'griffin5151@gmail.com
                           ', 1, 1)
INSERT [dbo].[contactPerson] ([id], [contactperson_name], [contactperson_title], [contactperson_phone], [contactperson_email], [company_id], [contactperson_online]) VALUES (2, N'林帆柯
                                             ', N'秘書
                                              ', N'0958096247
                                      ', N'hayden8995@gmail.com
                            ', 2, 1)
INSERT [dbo].[contactPerson] ([id], [contactperson_name], [contactperson_title], [contactperson_phone], [contactperson_email], [company_id], [contactperson_online]) VALUES (3, N'鐘于以
                                             ', N'專員
                                              ', N'0987583189
                                      ', N'courtney8940@gmail.com
                          ', 3, 1)
INSERT [dbo].[contactPerson] ([id], [contactperson_name], [contactperson_title], [contactperson_phone], [contactperson_email], [company_id], [contactperson_online]) VALUES (4, N'蘇昌興
                                             ', N'客服
                                              ', N'0912115374
                                      ', N'kubrick5041@hotmail.com
                         ', 4, 1)
INSERT [dbo].[contactPerson] ([id], [contactperson_name], [contactperson_title], [contactperson_phone], [contactperson_email], [company_id], [contactperson_online]) VALUES (5, N'錢棠芪
                                             ', N'專員
                                              ', N'0932241401
                                      ', N'bianca9253@icloud.com
                           ', 5, 1)
INSERT [dbo].[contactPerson] ([id], [contactperson_name], [contactperson_title], [contactperson_phone], [contactperson_email], [company_id], [contactperson_online]) VALUES (6, N'高純新                                               ', N'CEO                                               ', N'0912345678                                        ', N'123@ul                                            ', 5, 0)
SET IDENTITY_INSERT [dbo].[contactPerson] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (1, N'1孫怡文', N'1ms0355995@gmial.com', NULL, N'0912-345-111', N'基隆市', N'東區林森路135巷54號', N'2023-02-02', N'F', N'2023/01/13', N'2023-02-03 上午 11:02:31')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (2, N'伊樲叅', N'123@', N'123456', N'0912345678', N'台南市', N'東區林森路135巷54號', N'1993/9/9', N'女', N'2023/2/2 上午 09:37:00', N'2023/2/2 上午 09:37:00')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (3, N'王美名', N'mei@gmail.com', N'125As$%', N'0945-156-336', N'嘉義縣', N'東區芳安路229號', N'1991-06-21', N'F', N'2023-02-03 上午 10:14:42', N'2023-02-03 上午 10:14:42')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (4, N'陳大頭', N'da@gmail.com', N'da#G56h', N'0978-556-336', N'宜蘭縣', N'礁溪鄉匏杓崙路132-15號', N'1985-07-18', N'M', N'2023-02-03 上午 10:16:08', N'2023-02-03 上午 10:16:08')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (5, N'楊恩恩', N'hen@gmail.com', N'12GMJI*(##s', N'0966-664-336', N'屏東縣', N'恆春鎮坑內路7號', N'1982-08-28', N'F', N'2023-02-03 上午 10:17:36', N'2023-02-03 上午 10:17:36')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (6, N'王三八', N'san@gamil.com', N'd123ADF*', N'0987-336-224', N'花蓮縣', N'光復鄉大全街', N'1995-02-17', N'F', N'2023-02-03 上午 10:18:51', N'2023-02-03 上午 10:18:51')
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[details] ON 

INSERT [dbo].[details] ([details_id], [eventtime], [event_id], [state], [reason]) VALUES (1, N'20231/31', N'1         ', N'延期', N'系統測試')
INSERT [dbo].[details] ([details_id], [eventtime], [event_id], [state], [reason]) VALUES (3, N'2022-11-10', N'2         ', N'延期', N'原場地舉辦	可持原票券入場')
INSERT [dbo].[details] ([details_id], [eventtime], [event_id], [state], [reason]) VALUES (4, N'2022-06-09', N'3         ', N'取消', N'因疫情取消')
SET IDENTITY_INSERT [dbo].[details] OFF
GO
SET IDENTITY_INSERT [dbo].[event] ON 

INSERT [dbo].[event] ([event_id], [event_image], [event_name], [event_info], [company_id], [event_sell_start_timestamp], [event_sell_end_timestamp], [event_start_timestamp], [event_end_timestamp], [event_type_id], [event_location_id], [event_isstate]) VALUES (1, N'797a85f9-6cae-4d20-8fcd-4b010f8a8e20.png', N'周杰倫演唱會', N'1', 1, N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', 1, 1, 0)
INSERT [dbo].[event] ([event_id], [event_image], [event_name], [event_info], [company_id], [event_sell_start_timestamp], [event_sell_end_timestamp], [event_start_timestamp], [event_end_timestamp], [event_type_id], [event_location_id], [event_isstate]) VALUES (2, N'b8197992-f048-4f8d-892c-de2cc396c553.png', N'周杰倫演唱會2', N'2', 2, N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', 2, 2, 1)
INSERT [dbo].[event] ([event_id], [event_image], [event_name], [event_info], [company_id], [event_sell_start_timestamp], [event_sell_end_timestamp], [event_start_timestamp], [event_end_timestamp], [event_type_id], [event_location_id], [event_isstate]) VALUES (3, N'a76ebb05-6686-46e1-bd9b-76f1dcdee33a.png', N'周杰倫演唱會', N'3', 3, N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', 3, 3, 1)
SET IDENTITY_INSERT [dbo].[event] OFF
GO
SET IDENTITY_INSERT [dbo].[event_location] ON 

INSERT [dbo].[event_location] ([event_location_id], [event_location_name], [event_location_image], [event_location_info], [event_location_address], [event_location_isstate]) VALUES (1, N'國家音樂廳', N'b70ca8c8-2dbc-45c6-a3ba-714f2d52309c.png', N'內有兩個表演空間，分別是採「鞋盒式」設計的音樂廳（2022席，含14個輪椅席）、演奏廳（354席，含4個輪椅席），皆具國際級頂尖音場設計。鎮館之寶是全亞洲最大的機械式管風琴。', N'1', 0)
SET IDENTITY_INSERT [dbo].[event_location] OFF
GO
SET IDENTITY_INSERT [dbo].[event_type] ON 

INSERT [dbo].[event_type] ([event_type_id], [event_type_name]) VALUES (2, N'音樂會')
SET IDENTITY_INSERT [dbo].[event_type] OFF
GO
SET IDENTITY_INSERT [dbo].[order_form] ON 

INSERT [dbo].[order_form] ([id], [number_id], [commodity_id], [order_time], [quantity_order], [isState]) VALUES (2, 2, 2, N'2023/2/2 上午 09:37:30', 50, 1)
INSERT [dbo].[order_form] ([id], [number_id], [commodity_id], [order_time], [quantity_order], [isState]) VALUES (3, 1, 1, N'2023/2/3 上午 10:22:31', 5, 1)
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

INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (1, 1, N'A區', 40, 33, 7, 1000.0000, 1)
INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (2, 1, N'B區', 40, 26, 14, 1500.0000, 1)
INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (3, 1, N'C區', 40, 29, 11, 2000.0000, 1)
INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (4, 3, N'A區', 40, 40, 0, 1000.0000, 1)
INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (5, 3, N'B區', 40, 41, -1, 1500.0000, 1)
INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (6, 3, N'C區', 40, 40, 0, 2000.0000, 1)
INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (7, 3, N'D區', 40, 40, 0, 150000.0000, 1)
SET IDENTITY_INSERT [dbo].[seat_stock] OFF
GO
SET IDENTITY_INSERT [dbo].[ticket_order] ON 

INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (1, 1, 1500.0000, N'2023/2/2 下午 02:01:43', N'2023/2/2 下午 02:01:43', 0, 0, 1)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (2, 2, 3000.0000, N'2023/2/2 下午 02:08:59', N'2023/2/2 下午 02:08:59', 0, 0, 1)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (3, 3, 4500.0000, N'2023/2/2 下午 02:09:36', N'2023/2/2 下午 02:09:36', 0, 0, 1)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (4, 4, 13500.0000, N'2023/2/3 上午 09:41:04', N'2023/2/3 上午 09:41:04', 0, 0, 1)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (5, 5, 2000.0000, N'2023/2/3 上午 11:13:47', N'2023/2/3 上午 11:13:47', 0, 0, 4)
SET IDENTITY_INSERT [dbo].[ticket_order] OFF
GO
SET IDENTITY_INSERT [dbo].[ticket_order_detail] ON 

INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (1, 1, 3, N'B區', 1, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (3, 2, 3, N'A區', 1, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (4, 2, 3, N'A區', 2, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (5, 2, 3, N'A區', 3, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (6, 3, 3, N'B區', 2, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (7, 3, 3, N'B區', 3, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (8, 3, 3, N'B區', 4, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (9, 4, 3, N'A區', 4, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (10, 4, 3, N'A區', 5, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (11, 4, 3, N'A區', 6, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (12, 4, 3, N'B區', 5, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (13, 4, 3, N'B區', 6, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (14, 4, 3, N'B區', 7, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (15, 4, 3, N'C區', 1, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (16, 4, 3, N'C區', 2, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (17, 4, 3, N'C區', 3, 1)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (18, 5, 3, N'A區', 7, 4)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (19, 5, 3, N'A區', 8, 4)
SET IDENTITY_INSERT [dbo].[ticket_order_detail] OFF
GO
USE [master]
GO
ALTER DATABASE [Young-Artists] SET  READ_WRITE 
GO
