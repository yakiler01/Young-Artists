USE [Young-Artists]
GO
/****** Object:  Table [dbo].[administrators]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[advertisement]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[announcement]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[commodity]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
	[commodity_sort] [int] NULL,
	[commodity_sale] [int] NULL,
	[commodity_Classification] [nvarchar](50) NULL,
	[commodity_state] [bit] NULL,
 CONSTRAINT [PK_commodity] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[contactPerson]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[customers]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
	[customer_birth_date] [nvarchar](30) NULL,
	[customer_gender] [nvarchar](10) NULL,
	[customer_creat_timestamp] [nvarchar](50) NULL,
	[customer_update_timestamp] [nvarchar](50) NULL,
 CONSTRAINT [PK_會員] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[details]    Script Date: 2023/3/25 上午 11:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[details](
	[details_id] [int] IDENTITY(1,1) NOT NULL,
	[eventtime] [nvarchar](50) NULL,
	[event_id] [int] NULL,
	[state] [nvarchar](20) NULL,
	[reason] [nvarchar](max) NULL,
 CONSTRAINT [PK_details] PRIMARY KEY CLUSTERED 
(
	[details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluation_form]    Script Date: 2023/3/25 上午 11:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluation_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[commodity_id] [int] NULL,
	[number_id] [int] NULL,
	[rate] [int] NULL,
	[evaluation_time] [nvarchar](50) NULL,
	[isstate] [bit] NULL,
 CONSTRAINT [PK_evaluation_form] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[event_collect]    Script Date: 2023/3/25 上午 11:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_collect](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NULL,
	[customer_id] [int] NULL,
 CONSTRAINT [PK_加入收藏] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event_location]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[event_type]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[order_form]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
	[isCart] [bit] NULL,
 CONSTRAINT [PK_order_form] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_main]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[seat]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[seat_price]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[seat_stock]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[ticket_order]    Script Date: 2023/3/25 上午 11:27:44 ******/
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
/****** Object:  Table [dbo].[ticket_order_detail]    Script Date: 2023/3/25 上午 11:27:44 ******/
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

INSERT [dbo].[administrators] ([administrator_id], [administrator_account], [administrator_password], [administrator_creat_timestamp], [administrator_update_timestamp]) VALUES (1, N'aaa', N'222', N'1', N'1')
INSERT [dbo].[administrators] ([administrator_id], [administrator_account], [administrator_password], [administrator_creat_timestamp], [administrator_update_timestamp]) VALUES (2, N'admin', N'111', N'1', N'1')
INSERT [dbo].[administrators] ([administrator_id], [administrator_account], [administrator_password], [administrator_creat_timestamp], [administrator_update_timestamp]) VALUES (3, N'abc', N'123', N'2023-02-03 上午 09:33:25', N'2023-02-03 上午 09:33:25')
SET IDENTITY_INSERT [dbo].[administrators] OFF
GO
SET IDENTITY_INSERT [dbo].[advertisement] ON 

INSERT [dbo].[advertisement] ([id], [advertisement_id], [advertisement_name], [advertisement_src], [advertisement_alt], [advertisement_href], [advertisement_startdate], [advertisement_enddate], [company_id], [event_id], [advertisement_online]) VALUES (1, 1, N'1', N'96f76907-643f-475b-8746-600cdd43d61d.jpg                                                            ', N'1                                                                                                   ', N'http://1@1.com                                                                                      ', N'2023-03-23', N'2023-03-24', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[advertisement] OFF
GO
SET IDENTITY_INSERT [dbo].[announcement] ON 

INSERT [dbo].[announcement] ([aid], [announcement_type], [content_title], [content_time], [content], [details_id]) VALUES (1, N'系統公告', N'系統測試', N'2023/01/31', N'系統測試訊息', N'1')
INSERT [dbo].[announcement] ([aid], [announcement_type], [content_title], [content_time], [content], [details_id]) VALUES (6, N'系統公告', N'身心障礙線上驗證購票服務啟用', N'2023-01-31', N'身心障礙者線上身分認證於2022/12/23(五)中午12點啟用 
網站或APP購買身障票或輪椅席，會員資料請先完成身分認證，再行購票。
舊會員請先至年代售票首頁 > 會員專區 > 會員登入 > 修改資料 > 身分認證，完成線上認證後，方能在網路購票。
新會員請先至年代售票首頁 > 會員專區 > 會員申請 > 身分認證，完成線上認證後，方能在網路購票。
如有任何問題，請洽 年代客服中心', NULL)
SET IDENTITY_INSERT [dbo].[announcement] OFF
GO
SET IDENTITY_INSERT [dbo].[commodity] ON 

INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (1, N'中秋花好月圓禮盒', N'這是禮盒', 250, 1000.0000, N'7eec7833-5771-42ae-9f93-39cf48620b38.jpg', N'2023/01/31', 999, 50, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (2, N'好吃的商品2', N'2號商品', 50, 9999.0000, N'488422fe-8443-4f2d-b4f4-f89e14d0f723.jpg', N'2023/3/16 下午 01:56:13', 1, 10, N'麥當勞', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (3, N'中秋花好月圓禮盒', N'這是禮盒', 250, 2000.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 2, 5, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (4, N'中秋花好月圓禮盒', N'這是禮盒', 250, 1205.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 3, 7, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (5, N'中秋花好月圓禮盒', N'這是禮盒', 250, 500.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 4, 5, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (6, N'中秋花好月圓禮盒', N'這是禮盒', 250, 12000.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 5, 3, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (7, N'中秋花好月圓禮盒', N'這是禮盒', 250, 9000.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 6, 1, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (8, N'中秋花好月圓禮盒', N'這是禮盒', 250, 700.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 7, 99, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (9, N'中秋花好月圓禮盒', N'這是禮盒', 250, 1000.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 8, 34, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (10, N'中秋花好月圓禮盒', N'這是禮盒', 250, 100000.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 9, 12, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (11, N'中秋花好月圓禮盒', N'這是禮盒', 250, 8765.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 10, 54, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (12, N'中秋花好月圓禮盒', N'這是禮盒', 250, 4587.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 11, 78, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (13, N'中秋花好月圓禮盒', N'這是禮盒', 250, 5487.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 12, 12, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (14, N'中秋花好月圓禮盒', N'這是禮盒', 250, 9875.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 12, 12, N'禮物', 1)
INSERT [dbo].[commodity] ([id], [commodity_name], [commodity_narrative], [commodity_num], [commodity_price], [commodity_image], [commodity_start], [commodity_sort], [commodity_sale], [commodity_Classification], [commodity_state]) VALUES (15, N'禮盒', N'這是禮盒', 0, 1234.0000, N'e65b3f09-8d1f-435f-a3b8-949c86575ec7.jpg', N'2023/01/31', 13, 20, N'禮物', 1)
SET IDENTITY_INSERT [dbo].[commodity] OFF
GO
SET IDENTITY_INSERT [dbo].[company] ON 

INSERT [dbo].[company] ([id], [company_id], [company_name], [company_phone], [company_address], [company_email], [company_online]) VALUES (1, 1, N'公會                                                ', N'0912345678                                        ', N'台北市                                               ', N'bigcompany@gmail.com                              ', 1)
SET IDENTITY_INSERT [dbo].[company] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (1, N'孫怡文', N'ms0355995@gmial.com', N'1Aa!123', N'0912345678', N'台南市', N'東區林森路135巷54號', N'1993/9/9', N'F', N'2023/01/13', N'2023/01/31')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (2, N'王小明', N'ming@gmail.com', N'12Afe#$fh', N'0988-445-111', N'桃園市', N'大園區航站南路9號', N'2008-02-20', N'M', N'2023-02-03 上午 09:23:03', N'2023/3/13 上午 09:43:52')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (3, N'123', N'123', N'123', N'123', N'123', N'123', N'123', N'123', N'2023/3/8 下午 04:06:13', N'2023/3/8 下午 04:06:13')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (4, N'string', N'string', N'string', N'string', N'string', N'string', N'string', N'string', N'2023/3/8 下午 02:19:51', N'2023/3/8 下午 02:19:51')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (10, N'123', N'123', N'123', N'123', N'123', N'123', N'123', N'123', N'2023/3/8 下午 04:06:13', N'2023/3/8 下午 04:06:13')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (11, N'5654646', N'd@d.com', N'A1898@dD', N'0912-555-444', N'台北市', N'151546', N'2023-03-05T16:00:00.000Z', N'男', N'2023/3/8 下午 04:06:13', N'2023/3/8 下午 04:06:13')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (12, N'王小明', N'1aaa@gmail.com', N'12Afe#$fh', N'0912-555-333', N'abc', N'abc', N'12', N'12', N'2023/3/8 下午 04:06:13', N'2023/3/10 下午 02:53:28')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (13, N'王小明', N'aaa@gmail.com', N'12Afe#$fh', N'0981-445-669', N'桃園市', N'大園區航站南路9號', N'2008-02-20', N'M', N'2023/3/9 下午 02:23:54', N'2023/3/9 下午 02:23:54')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (14, N'王小明', N'ms000@QQ.QQ', N'12Afe#$fh', N'0388-123-125', N'桃園市', N'大園區航站南路9號', N'2008-02-20', N'M', N'2023/3/9 下午 02:28:56', N'2023/3/9 下午 02:28:56')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (15, N'王小明', N'QQ@QQ.QQ', N'12Afe#$fh', N'1234-123-123', N'桃園市', N'大園區航站南路9號', N'2008-02-20', N'M', N'2023/3/9 下午 02:29:39', N'2023/3/9 下午 02:29:39')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (16, N'王小明', N'12@gmail.com', N'12Afe#$fh', N'0978-999-999', N'桃園市', N'大園區航站南路9號', N'2008-02-20', N'M', N'2023/3/10 下午 01:13:06', N'2023/3/10 下午 01:13:06')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (17, N'王小明', N'123@gmail.com', N'12Afe#$fh', N'0977-999-888', N'桃園市', N'大園區航站南路9號', N'2008-02-20', N'M', N'2023/3/10 下午 01:15:02', N'2023/3/10 下午 03:15:54')
INSERT [dbo].[customers] ([customer_id], [customer_name], [customer_email], [customer_password], [customer_phone], [customer_region], [customer_address], [customer_birth_date], [customer_gender], [customer_creat_timestamp], [customer_update_timestamp]) VALUES (18, N'黃大明', N'1745@gmail.com', N'66Afe#$fh', N'0955-666-999', N'台北市', N'大園區航站南路9號', N'2008-01-05T16:00:00.000Z', N'女', N'2023/3/15 上午 10:08:23', N'2023/3/15 上午 10:08:23')
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[details] ON 

INSERT [dbo].[details] ([details_id], [eventtime], [event_id], [state], [reason]) VALUES (1, N'2023-01-31', 1, N'延期', N'【安溥 to ebb 潮水箴言 高雄巨蛋演唱會 延期舉辦】

2/24(週五)安溥因不明原因肩頸至全手劇烈疼痛，於當日緊急安排住院檢查，目前醫院診斷結果為頸椎椎間盤突出並壓迫神經，出現疼痛且手部無法自主活動等現象，經醫生強烈建議需立即進行後續醫療安排，我們在以慎重而同樣遺憾的各項評估確認後於是公告安溥潮水箴言演唱會高雄場延期舉辦。

潮水箴言演唱會籌辦已久，安溥與大家高雄之約，初心不變。目前正與高雄巨蛋協商新的檔期日期，待新場次演出日期確定後將會在聯成娛樂社群平台公告。

安溥與團隊感謝所有一同創造潮水箴言演唱會的工作人員、硬體單位及協助宣傳高雄場之節目單位，深深感謝所有參與潮水箴言的歌迷朋友們，待安溥順利康復能重新運作工作後，我們期待終能㩦手在高雄巨蛋迎接彼此最好的時光。')
INSERT [dbo].[details] ([details_id], [eventtime], [event_id], [state], [reason]) VALUES (3, N'2022-11-10', 2, N'延期', N'原場地舉辦	可持原票券入場')
INSERT [dbo].[details] ([details_id], [eventtime], [event_id], [state], [reason]) VALUES (4, N'2022-06-09', 3, N'取消', N'各位觀眾朋友大家好，感謝各位耐心等待與體諒！〈STOMP破銅爛鐵30周年台灣巡演〉原定於今年的演出受到疫情影響延期， 經與國外團隊協調後，確定將延至2023年演出！台北改於2023/09/15(五)至09/17(日)、高雄2023/09/22(五)至09/24(日)舉辦。無退票的觀眾可憑原門票入場，尚未購票之觀眾則可重新購票，若選擇退票的觀眾可於即日起至2022/09/05(一)止辦理退票；重新開賣時間為2022/9/6(二) 中午12:00全面開賣，退票將不定時釋出。')
SET IDENTITY_INSERT [dbo].[details] OFF
GO
SET IDENTITY_INSERT [dbo].[event] ON 

INSERT [dbo].[event] ([event_id], [event_image], [event_name], [event_info], [company_id], [event_sell_start_timestamp], [event_sell_end_timestamp], [event_start_timestamp], [event_end_timestamp], [event_type_id], [event_location_id], [event_isstate]) VALUES (1, N'9545baf4-b6e6-444c-8ef2-d4c20eeab947.jpg', N'周杰倫演唱會', N'1', 1, N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', 1, 1, 1)
INSERT [dbo].[event] ([event_id], [event_image], [event_name], [event_info], [company_id], [event_sell_start_timestamp], [event_sell_end_timestamp], [event_start_timestamp], [event_end_timestamp], [event_type_id], [event_location_id], [event_isstate]) VALUES (2, N'b8197992-f048-4f8d-892c-de2cc396c553.png', N'周杰倫演唱會2', N'2', 1, N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', 2, 2, 1)
INSERT [dbo].[event] ([event_id], [event_image], [event_name], [event_info], [company_id], [event_sell_start_timestamp], [event_sell_end_timestamp], [event_start_timestamp], [event_end_timestamp], [event_type_id], [event_location_id], [event_isstate]) VALUES (3, N'a76ebb05-6686-46e1-bd9b-76f1dcdee33a.png', N'周杰倫演唱會3', N'3', 1, N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 07:00:00', N'2023/1/23 下午 10:00:00', 3, 3, 1)
SET IDENTITY_INSERT [dbo].[event] OFF
GO
SET IDENTITY_INSERT [dbo].[event_collect] ON 

INSERT [dbo].[event_collect] ([id], [event_id], [customer_id]) VALUES (4, 1, 2)
SET IDENTITY_INSERT [dbo].[event_collect] OFF
GO
SET IDENTITY_INSERT [dbo].[event_location] ON 

INSERT [dbo].[event_location] ([event_location_id], [event_location_name], [event_location_image], [event_location_info], [event_location_address], [event_location_isstate]) VALUES (1, N'國家音樂廳', N'c090b078-c0cb-497e-b19d-726d8f297746.jpg', N'內有兩個表演空間，分別是採「鞋盒式」設計的音樂廳（2022席，含14個輪椅席）、演奏廳（354席，含4個輪椅席），皆具國際級頂尖音場設計。鎮館之寶是全亞洲最大的機械式管風琴。', N'台北市', 1)
INSERT [dbo].[event_location] ([event_location_id], [event_location_name], [event_location_image], [event_location_info], [event_location_address], [event_location_isstate]) VALUES (2, N'臺北小巨蛋 ', N'dbcef147-4632-46ac-b213-ffb32833528e.jpg', N'臺北小巨蛋是位於臺灣臺北市松山區的多功能體育館，坐落於南京東路及敦化北路交叉口。除了提供體育競賽場地之外，亦經常舉辦演唱會、頒獎典禮等大型文藝活動，為臺灣娛樂業界的指標場所之一。', N'臺北市松山區南京東路四段2號', 1)
INSERT [dbo].[event_location] ([event_location_id], [event_location_name], [event_location_image], [event_location_info], [event_location_address], [event_location_isstate]) VALUES (3, N'臺北小巨蛋 ', N'2e1ef563-003b-41b3-989d-3d4e1a836a6a.jpg', N'臺北小巨蛋是位於臺灣臺北市松山區的多功能體育館，坐落於南京東路及敦化北路交叉口。除了提供體育競賽場地之外，亦經常舉辦演唱會、頒獎典禮等大型文藝活動，為臺灣娛樂業界的指標場所之一。', N'臺北市松山區南京東路四段2號', 1)
SET IDENTITY_INSERT [dbo].[event_location] OFF
GO
SET IDENTITY_INSERT [dbo].[event_type] ON 

INSERT [dbo].[event_type] ([event_type_id], [event_type_name]) VALUES (1, N'演唱會')
INSERT [dbo].[event_type] ([event_type_id], [event_type_name]) VALUES (2, N'音樂會')
INSERT [dbo].[event_type] ([event_type_id], [event_type_name]) VALUES (3, N'戲劇')
INSERT [dbo].[event_type] ([event_type_id], [event_type_name]) VALUES (4, N'運動')
INSERT [dbo].[event_type] ([event_type_id], [event_type_name]) VALUES (5, N'動漫')
SET IDENTITY_INSERT [dbo].[event_type] OFF
GO
SET IDENTITY_INSERT [dbo].[order_form] ON 

INSERT [dbo].[order_form] ([id], [number_id], [commodity_id], [order_time], [quantity_order], [isState], [isCart]) VALUES (40, 2, 1, N'2023/3/24 下午 02:15:07', 5, 0, 0)
INSERT [dbo].[order_form] ([id], [number_id], [commodity_id], [order_time], [quantity_order], [isState], [isCart]) VALUES (41, 2, 2, N'2023/3/24 下午 02:17:15', 4, 0, 0)
INSERT [dbo].[order_form] ([id], [number_id], [commodity_id], [order_time], [quantity_order], [isState], [isCart]) VALUES (42, 2, 3, N'2023/3/24 下午 02:17:20', 13, 0, 0)
INSERT [dbo].[order_form] ([id], [number_id], [commodity_id], [order_time], [quantity_order], [isState], [isCart]) VALUES (43, 2, 8, N'2023/3/24 下午 02:21:39', 2, 0, 0)
INSERT [dbo].[order_form] ([id], [number_id], [commodity_id], [order_time], [quantity_order], [isState], [isCart]) VALUES (44, 2, 9, N'2023/3/24 下午 02:21:43', 3, 0, 0)
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

INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (1, 1, N'A區', 40, 38, 2, 1000.0000, 1)
INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (2, 1, N'B區', 40, 38, 2, 1500.0000, 1)
INSERT [dbo].[seat_stock] ([id], [event_id], [area], [quantity], [stock], [sold], [price], [is_available]) VALUES (3, 1, N'C區', 40, 28, 12, 2000.0000, 1)
SET IDENTITY_INSERT [dbo].[seat_stock] OFF
GO
SET IDENTITY_INSERT [dbo].[ticket_order] ON 

INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (1, 1, 8500.0000, N'2023/3/8 上午 09:57:32', N'2023/3/8 上午 09:58:19', 2, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (2, 2, 5500.0000, N'2023/3/16 下午 03:24:47', N'2023/3/16 下午 03:24:47', 0, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (3, 3, 9000.0000, N'2023/3/17 上午 09:38:30', N'2023/3/17 上午 09:38:30', 0, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (4, 4, 7000.0000, N'2023/3/17 上午 09:39:10', N'2023/3/17 上午 09:39:10', 0, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (5, 5, 7000.0000, N'2023/3/17 上午 10:48:28', N'2023/3/17 上午 10:48:28', 0, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (6, 6, 7000.0000, N'2023/3/17 上午 10:48:47', N'2023/3/17 上午 10:48:47', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (7, 7, 2000.0000, N'2023/3/17 上午 10:49:09', N'2023/3/17 上午 10:49:09', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (8, 8, 2000.0000, N'2023/3/17 上午 10:49:37', N'2023/3/17 上午 10:49:37', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (9, 9, 2000.0000, N'2023/3/17 上午 10:50:02', N'2023/3/17 上午 10:50:02', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (10, 10, 2000.0000, N'2023/3/17 上午 10:50:23', N'2023/3/17 上午 10:50:23', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (11, 11, 3000.0000, N'2023/3/17 上午 10:53:06', N'2023/3/17 上午 10:53:06', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (16, 12, 4500.0000, N'2023/3/17 上午 11:12:29', N'2023/3/17 上午 11:12:29', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (17, 13, 6000.0000, N'2023/3/17 上午 11:13:37', N'2023/3/17 上午 11:13:37', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (18, 14, 3000.0000, N'2023/3/17 上午 11:15:10', N'2023/3/17 上午 11:15:10', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (19, 15, 4500.0000, N'2023/3/17 上午 11:17:25', N'2023/3/17 上午 11:17:25', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (20, 16, 3000.0000, N'2023/3/17 上午 11:17:37', N'2023/3/17 上午 11:17:37', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (21, 17, 6000.0000, N'2023/3/17 上午 11:19:20', N'2023/3/17 上午 11:19:20', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (23, 18, 2000.0000, N'2023/3/17 上午 11:26:15', N'2023/3/17 上午 11:26:15', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (24, 19, 3000.0000, N'2023/3/17 上午 11:31:53', N'2023/3/17 上午 11:31:53', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (28, 2023031712, 3000.0000, N'2023/3/22 上午 09:21:03', N'2023/3/22 上午 09:21:03', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (30, 2023034933, 1500.0000, N'2023/3/22 上午 09:23:25', N'2023/3/22 上午 09:23:25', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (31, 2023035419, 1500.0000, N'2023/3/22 上午 09:26:37', N'2023/3/22 上午 09:26:37', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (32, 2023038437, 2000.0000, N'2023/3/22 上午 09:51:44', N'2023/3/22 上午 09:51:44', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (34, 2023037554, 2000.0000, N'2023/3/22 上午 10:26:48', N'2023/3/22 上午 10:26:48', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (35, 2023039861, 2000.0000, N'2023/3/22 上午 10:43:03', N'2023/3/22 上午 10:43:03', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (36, 2023033632, 2000.0000, N'2023/3/22 上午 10:45:39', N'2023/3/22 上午 10:45:39', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (37, 2023033355, 4000.0000, N'2023/3/22 上午 10:46:44', N'2023/3/22 上午 10:46:44', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (38, 2023035578, 2000.0000, N'2023/3/22 上午 10:48:03', N'2023/3/22 上午 10:48:03', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (39, 2023037037, 2000.0000, N'2023/3/22 上午 10:54:39', N'2023/3/22 上午 10:54:39', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (40, 2023033440, 2000.0000, N'2023/3/22 上午 11:21:28', N'2023/3/22 上午 11:21:28', 0, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (41, 2023034611, 2000.0000, N'2023/3/22 上午 11:23:11', N'2023/3/22 上午 11:23:11', 0, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (42, 2023034974, 2000.0000, N'2023/3/22 上午 11:38:40', N'2023/3/22 上午 11:38:40', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (43, 2023033180, 2000.0000, N'2023/3/22 上午 11:41:10', N'2023/3/22 上午 11:41:10', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (44, 2023034043, 4000.0000, N'2023/3/22 下午 01:28:22', N'2023/3/22 下午 01:28:22', 0, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (45, 2023035433, 4000.0000, N'2023/3/22 下午 01:32:58', N'2023/3/22 下午 01:32:58', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (46, 2023037337, 2000.0000, N'2023/3/22 下午 01:36:36', N'2023/3/22 下午 01:36:36', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (47, 2023035593, 2000.0000, N'2023/3/22 下午 01:39:27', N'2023/3/22 下午 01:39:27', 0, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (48, 2023033178, 2000.0000, N'2023/3/22 下午 01:42:52', N'2023/3/22 下午 01:42:52', 0, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (49, 2023038538, 2000.0000, N'2023/3/22 下午 01:47:22', N'2023/3/22 下午 01:47:22', 0, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (50, 2023038738, 2000.0000, N'2023/3/22 下午 02:20:07', N'2023/3/22 下午 02:20:07', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (51, 2023032789, 2000.0000, N'2023/3/22 下午 02:47:58', N'2023/3/22 下午 02:47:58', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (52, 2023035506, 1000.0000, N'2023/3/22 下午 02:48:38', N'2023/3/22 下午 02:48:38', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (53, 2023039011, 2000.0000, N'2023/3/22 下午 02:49:28', N'2023/3/22 下午 02:49:28', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (54, 2023039899, 1500.0000, N'2023/3/22 下午 03:37:05', N'2023/3/22 下午 03:37:05', 0, 0, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (55, 2023037768, 2000.0000, N'2023/3/22 下午 03:39:41', N'2023/3/22 下午 03:39:41', 0, 1, 2)
INSERT [dbo].[ticket_order] ([id], [order_id], [order_total_price], [order_create_timestamp], [order_update_timestamp], [order_update_id], [order_state], [customer_id]) VALUES (56, 2023037692, 2500.0000, N'2023/3/23 下午 02:18:04', N'2023/3/23 下午 02:18:04', 0, 1, 2)
SET IDENTITY_INSERT [dbo].[ticket_order] OFF
GO
SET IDENTITY_INSERT [dbo].[ticket_order_detail] ON 

INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (1, 1, 1, N'A區', 1, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (2, 1, 1, N'A區', 2, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (3, 1, 1, N'B區', 1, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (4, 1, 1, N'B區', 2, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (5, 1, 1, N'B區', 3, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (6, 1, 1, N'C區', 1, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (7, 2, 1, N'B區', 4, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (8, 2, 1, N'C區', 2, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (9, 2, 1, N'C區', 3, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (10, 3, 1, N'B區', 5, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (11, 3, 1, N'B區', 6, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (12, 3, 1, N'C區', 4, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (13, 3, 1, N'C區', 5, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (14, 3, 1, N'C區', 6, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (15, 4, 1, N'B區', 7, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (16, 4, 1, N'B區', 8, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (17, 4, 1, N'C區', 7, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (18, 4, 1, N'C區', 8, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (19, 5, 1, N'B區', 9, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (20, 5, 1, N'B區', 10, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (21, 5, 1, N'C區', 9, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (22, 5, 1, N'C區', 10, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (23, 6, 1, N'B區', 11, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (24, 6, 1, N'B區', 12, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (25, 6, 1, N'C區', 11, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (26, 6, 1, N'C區', 12, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (27, 7, 1, N'C區', 13, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (28, 8, 1, N'C區', 14, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (29, 9, 1, N'C區', 15, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (30, 10, 1, N'C區', 16, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (31, 11, 1, N'B區', 13, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (32, 11, 1, N'B區', 14, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (47, 12, 1, N'B區', 15, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (48, 12, 1, N'B區', 16, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (49, 12, 1, N'B區', 17, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (50, 13, 1, N'B區', 18, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (51, 13, 1, N'B區', 19, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (52, 13, 1, N'B區', 20, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (53, 13, 1, N'B區', 21, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (54, 14, 1, N'B區', 22, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (55, 14, 1, N'B區', 23, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (56, 15, 1, N'B區', 24, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (57, 15, 1, N'B區', 25, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (58, 15, 1, N'B區', 26, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (59, 16, 1, N'B區', 27, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (60, 16, 1, N'B區', 28, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (61, 17, 1, N'C區', 17, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (62, 17, 1, N'C區', 18, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (63, 17, 1, N'C區', 19, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (66, 18, 1, N'C區', 20, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (67, 19, 1, N'B區', 29, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (68, 19, 1, N'B區', 30, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (79, 2023031712, 1, N'B區', 31, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (80, 2023031712, 1, N'B區', 32, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (83, 2023034933, 1, N'B區', 33, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (84, 2023035419, 1, N'B區', 34, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (85, 2023038437, 1, N'C區', 21, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (87, 2023037554, 1, N'C區', 22, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (88, 2023039861, 1, N'C區', 23, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (89, 2023033632, 1, N'C區', 24, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (90, 2023033355, 1, N'C區', 25, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (91, 2023033355, 1, N'C區', 26, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (92, 2023035578, 1, N'C區', 27, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (93, 2023037037, 1, N'C區', 28, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (94, 2023033440, 1, N'C區', 29, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (95, 2023034611, 1, N'C區', 30, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (96, 2023034974, 1, N'C區', 31, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (97, 2023033180, 1, N'C區', 32, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (98, 2023034043, 1, N'C區', 33, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (99, 2023034043, 1, N'C區', 34, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (100, 2023035433, 1, N'C區', 35, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (101, 2023035433, 1, N'C區', 36, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (102, 2023037337, 1, N'C區', 37, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (103, 2023035593, 1, N'C區', 38, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (104, 2023033178, 1, N'C區', 39, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (105, 2023038538, 1, N'C區', 40, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (106, 2023038738, 1, N'C區', 41, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (107, 2023032789, 1, N'C區', 42, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (108, 2023035506, 1, N'A區', 3, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (109, 2023039011, 1, N'C區', 43, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (110, 2023039899, 1, N'B區', 35, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (111, 2023037768, 1, N'C區', 44, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (112, 2023037692, 1, N'A區', 4, 2)
INSERT [dbo].[ticket_order_detail] ([id], [order_id], [event_id], [area], [seat_id], [customer_id]) VALUES (113, 2023037692, 1, N'B區', 36, 2)
SET IDENTITY_INSERT [dbo].[ticket_order_detail] OFF
GO
