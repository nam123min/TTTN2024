USE [master]
GO
/****** Object:  Database [TicketingSystem]    Script Date: 18-Mar-24 8:43:28 AM ******/
CREATE DATABASE [TicketingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketingSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TicketingSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TicketingSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TicketingSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TicketingSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketingSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicketingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketingSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TicketingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketingSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [TicketingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [TicketingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketingSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TicketingSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TicketingSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TicketingSystem', N'ON'
GO
ALTER DATABASE [TicketingSystem] SET QUERY_STORE = OFF
GO
USE [TicketingSystem]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 18-Mar-24 8:43:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](11) NULL,
	[DayOfBirth] [date] NOT NULL,
	[WalletAddress] [nvarchar](255) NULL,
	[Balance] [decimal](10, 2) NOT NULL,
	[IsPublisher] [bit] NOT NULL,
	[IsAdministrator] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[token] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 18-Mar-24 8:43:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[AuthorityID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](10) NOT NULL,
	[AccountID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 18-Mar-24 8:43:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NOT NULL,
	[BuyerID] [int] NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[NFTID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Payment] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NFTs]    Script Date: 18-Mar-24 8:43:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NFTs](
	[NFTID] [int] IDENTITY(1,1) NOT NULL,
	[NFTAddress] [varchar](1000) NOT NULL,
	[AccountID] [int] NOT NULL,
	[TicketId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[isExpired] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NFTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 18-Mar-24 8:43:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1500) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18-Mar-24 8:43:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleName] [varchar](10) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 18-Mar-24 8:43:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[TicketName] [nvarchar](50) NOT NULL,
	[PublisherID] [int] NOT NULL,
	[TicketImage] [nvarchar](150) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[TypeID] [int] NOT NULL,
	[ShelfTime] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTypes]    Script Date: 18-Mar-24 8:43:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTypes](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Password], [Email], [Phone], [DayOfBirth], [WalletAddress], [Balance], [IsPublisher], [IsAdministrator], [IsActive], [token]) VALUES (1, N'Trương', N'Toàn Thắng', N'$2a$10$xRSMilFD4aI8n.GdE5eVUuSJ/ZR2yC0noAZGuIZ0q9XL2gqnRo.8e', N'Decede7@gmail.com', N'098234177', CAST(N'2000-01-01' AS Date), N'BqNdMCoGrScQvGMcGBckVyyQXWymDVzD17EsPVj2ZLLV', CAST(0.00 AS Decimal(10, 2)), 0, 1, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Password], [Email], [Phone], [DayOfBirth], [WalletAddress], [Balance], [IsPublisher], [IsAdministrator], [IsActive], [token]) VALUES (2, N'Lê', N'Phương Thảo', N'$2a$10$xRSMilFD4aI8n.GdE5eVUuSJ/ZR2yC0noAZGuIZ0q9XL2gqnRo.8e', N'thaoltpps25649@fpt.edu.vn', N'0352462001', CAST(N'2000-01-01' AS Date), N'A9gyWK9tZJ7cBgDxdoAp74oaxJHmxjibzJ6ngCVKVZDN', CAST(0.00 AS Decimal(10, 2)), 0, 0, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Password], [Email], [Phone], [DayOfBirth], [WalletAddress], [Balance], [IsPublisher], [IsAdministrator], [IsActive], [token]) VALUES (3, N'Trương', N'Hoàng Nam', N'$2a$10$xRSMilFD4aI8n.GdE5eVUuSJ/ZR2yC0noAZGuIZ0q9XL2gqnRo.8e', N'namthps25634@fpt.edu.vn', N'0921345433', CAST(N'2000-01-01' AS Date), N'BWE9fMTbSbbGvgBXMr8DtS9wBYp1yYF4SU1Y4cSKvcUx', CAST(0.00 AS Decimal(10, 2)), 1, 0, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Password], [Email], [Phone], [DayOfBirth], [WalletAddress], [Balance], [IsPublisher], [IsAdministrator], [IsActive], [token]) VALUES (4, N'Trần', N'Quỳnh Hương', N'$2a$10$xRSMilFD4aI8n.GdE5eVUuSJ/ZR2yC0noAZGuIZ0q9XL2gqnRo.8e', N'huongtqps25893@fpt.edu.vn', N'0914022377', CAST(N'2000-01-01' AS Date), N'7iVwLz1o5J39wvQDWzB7TWADXJm48hvboyd1iSfAzHKc', CAST(0.00 AS Decimal(10, 2)), 0, 0, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Password], [Email], [Phone], [DayOfBirth], [WalletAddress], [Balance], [IsPublisher], [IsAdministrator], [IsActive], [token]) VALUES (5, N'Trần', N'Văn Hà', N'$2a$10$xRSMilFD4aI8n.GdE5eVUuSJ/ZR2yC0noAZGuIZ0q9XL2gqnRo.8e', N'hatvps20256@fpt.edu.vn', N'0981123090', CAST(N'2000-01-01' AS Date), N'HBH36J9Lam3E1Pb95aWXiDCjrSsYPcSG5JTAqNQUxBzW', CAST(0.00 AS Decimal(10, 2)), 0, 0, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Password], [Email], [Phone], [DayOfBirth], [WalletAddress], [Balance], [IsPublisher], [IsAdministrator], [IsActive], [token]) VALUES (6, N'Trương', N'Thắng', N'$2a$10$xRSMilFD4aI8n.GdE5eVUuSJ/ZR2yC0noAZGuIZ0q9XL2gqnRo.8e', N'thangttps23028@fpt.edu.vn', N'0902447676', CAST(N'2000-01-01' AS Date), NULL, CAST(0.00 AS Decimal(10, 2)), 0, 1, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Password], [Email], [Phone], [DayOfBirth], [WalletAddress], [Balance], [IsPublisher], [IsAdministrator], [IsActive], [token]) VALUES (8, N'Lê', N'Thảo', N'$2a$10$xRSMilFD4aI8n.GdE5eVUuSJ/ZR2yC0noAZGuIZ0q9XL2gqnRo.8e', N'lethiphuongthaokt22@gmail.com', N'0914022137', CAST(N'2000-01-01' AS Date), NULL, CAST(0.00 AS Decimal(10, 2)), 0, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([AuthorityID], [RoleName], [AccountID]) VALUES (6, N'Admin', 6)
INSERT [dbo].[Authorities] ([AuthorityID], [RoleName], [AccountID]) VALUES (7, N'Customer', 1)
INSERT [dbo].[Authorities] ([AuthorityID], [RoleName], [AccountID]) VALUES (2, N'Customer', 2)
INSERT [dbo].[Authorities] ([AuthorityID], [RoleName], [AccountID]) VALUES (3, N'Customer', 3)
INSERT [dbo].[Authorities] ([AuthorityID], [RoleName], [AccountID]) VALUES (4, N'Customer', 4)
INSERT [dbo].[Authorities] ([AuthorityID], [RoleName], [AccountID]) VALUES (5, N'Customer', 5)
INSERT [dbo].[Authorities] ([AuthorityID], [RoleName], [AccountID]) VALUES (1, N'Manager', 1)
INSERT [dbo].[Authorities] ([AuthorityID], [RoleName], [AccountID]) VALUES (8, N'Publisher', 3)
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([PublisherID], [AccountID], [PublisherName], [Description], [Address], [IsActive]) VALUES (1, 3, N'Demo Hanoibus', N'Tổng công ty Vận tải Hà Nội (Transerco) là Doanh nghiệp Nhà nước trực thuộc UBND Thành phố Hà Nội được thành lập theo Quyết định số 72/2004/QĐ – UB ngày 14/5/2004.
Hiện nay, Transerco là đơn vị hàng đầu trong các lĩnh vực: dịch vụ vận tải hành khách công cộng bằng xe buýt (thương hiệu Hanoibus), quản lý bến bãi và dịch vụ điểm đỗ xe công cộng tại Thủ đô Hà Nội.
Với hơn 10.000 lao động đang làm việc tại 12 đơn vị trực thuộc và 5 công ty con, cùng tinh thần “Chung sức đồng lòng”, Transerco đã và đang đổi mới mạnh mẽ hơn nữa để nâng cao hiệu quả, sức cạnh tranh của doanh nghiệp Nhà nước cũng như thực hiện tốt các nhiệm vụ chính trị xã hội mà Thành phố giao phó.', N'Số 5 Lê Thánh Tông, Hoàn Kiếm, Hà Nội', 1)
SET IDENTITY_INSERT [dbo].[Publishers] OFF
GO
INSERT [dbo].[Roles] ([RoleName], [Description]) VALUES (N'Admin', N'Quản trị viên')
INSERT [dbo].[Roles] ([RoleName], [Description]) VALUES (N'Customer', N'Khách hàng mua vé')
INSERT [dbo].[Roles] ([RoleName], [Description]) VALUES (N'Manager', N'Giám đốc (quyền cao nhất)')
INSERT [dbo].[Roles] ([RoleName], [Description]) VALUES (N'Publisher', N'Nhà phát hành vé')
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([TicketID], [TicketName], [PublisherID], [TicketImage], [Price], [TypeID], [ShelfTime], [Description], [IsActive]) VALUES (1, N'Vé tháng xe buýt nội thành Hà Nội', 1, N'HANOIBUS.png', CAST(100000.00 AS Decimal(10, 2)), 1, 30, N'Vé dành cho đối tượng không thuộc diện ưu tiên. Vé dùng để di chuyển bằng các tuyến xe buýt trong nội thành Hà Nội.', 1)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketTypes] ON 

INSERT [dbo].[TicketTypes] ([TypeID], [TypeName]) VALUES (1, N'Vé tháng')
INSERT [dbo].[TicketTypes] ([TypeID], [TypeName]) VALUES (2, N'Tập vé')
SET IDENTITY_INSERT [dbo].[TicketTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__A9D10534ECC5F090]    Script Date: 18-Mar-24 8:43:28 AM ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Authorit__F962BB38DE2504DB]    Script Date: 18-Mar-24 8:43:28 AM ******/
ALTER TABLE [dbo].[Authorities] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NFTs__910F23D337AF4F51]    Script Date: 18-Mar-24 8:43:28 AM ******/
ALTER TABLE [dbo].[NFTs] ADD UNIQUE NONCLUSTERED 
(
	[NFTAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Publishe__349DA587B6632696]    Script Date: 18-Mar-24 8:43:28 AM ******/
ALTER TABLE [dbo].[Publishers] ADD UNIQUE NONCLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((0.00)) FOR [Balance]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((0)) FOR [IsPublisher]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((0)) FOR [IsAdministrator]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (getdate()) FOR [InvoiceDate]
GO
ALTER TABLE [dbo].[NFTs] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[NFTs] ADD  DEFAULT ((0)) FOR [isExpired]
GO
ALTER TABLE [dbo].[Publishers] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tickets] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD FOREIGN KEY([RoleName])
REFERENCES [dbo].[Roles] ([RoleName])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([BuyerID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([NFTID])
REFERENCES [dbo].[NFTs] ([NFTID])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([SellerID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[NFTs]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[NFTs]  WITH CHECK ADD FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([TicketID])
GO
ALTER TABLE [dbo].[Publishers]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publishers] ([PublisherID])
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[TicketTypes] ([TypeID])
GO
USE [master]
GO
ALTER DATABASE [TicketingSystem] SET  READ_WRITE 
GO
