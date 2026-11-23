/* CharityDB - ban LocalDB
   Tao boi tu file CharityDB.sql goc.
   Chay tren (LocalDB)\MSSQLLocalDB.
   Script nay chi tao database moi; khong dung de chay de len database da ton tai.
*/
USE [master]
GO
IF DB_ID(N'CharityDB') IS NOT NULL
BEGIN
    THROW 50001, N'Database CharityDB da ton tai. Khong chay lai script nay de tranh trung lap du lieu.', 1;
END
GO
CREATE DATABASE [CharityDB]
GO
USE [CharityDB]
GO
USE [CharityDB]
GO
/****** Object:  Table [dbo].[Campaigns]    Script Date: 11/22/2026 12:15:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaigns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[TargetAmount] [decimal](18, 2) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Status] [int] NULL,
	[ImageUrl] [nvarchar](500) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/22/2026 12:15:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donations]    Script Date: 11/22/2026 12:15:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransactionCode] [varchar](50) NULL,
	[UserId] [int] NOT NULL,
	[CampaignId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DonatedAt] [datetime] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[Message] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[IsAnonymous] [bit] NULL,
	[DonationType] [nvarchar](20) NOT NULL,
	[ItemName] [nvarchar](200) NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Unit] [nvarchar](30) NULL,
	[EstimatedValue] [decimal](18, 2) NULL,
	[DeliveryMethod] [nvarchar](50) NULL,
	[ContactPhone] [varchar](20) NULL,
	[PickupAddress] [nvarchar](300) NULL,
	[DeliverySubOption] [nvarchar](50) NULL,
	[PostalTrackingCode] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/22/2026 12:15:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Role] [varchar](20) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Campaigns] ON 

INSERT [dbo].[Campaigns] ([Id], [CategoryId], [Title], [Description], [TargetAmount], [StartDate], [EndDate], [Status], [ImageUrl], [CreatedAt]) VALUES (1, NULL, N'Áo ấm vùng cao Hà Giang', N'Cùng mang đến mùa đông ấm áp cho hơn 500 em nhỏ tại các xã nghèo. ❤️ Mỗi chiếc áo ấm, mỗi món quà trao đi đều góp phần thắp lên niềm vui và hy vọng.

**Gửi hơi ấm – Trao yêu thương – Sưởi ấm mùa đông!** ❄️❤️', CAST(30000000.00 AS Decimal(18, 2)), CAST(N'2026-10-19T00:00:00.000' AS DateTime), CAST(N'2027-01-01T00:00:00.000' AS DateTime), 0, N'/Content/CampaignImages/images (1a).jpg', CAST(N'2026-10-19T10:28:36.213' AS DateTime))
INSERT [dbo].[Campaigns] ([Id], [CategoryId], [Title], [Description], [TargetAmount], [StartDate], [EndDate], [Status], [ImageUrl], [CreatedAt]) VALUES (2, NULL, N'Cứu trợ đồng bào lũ lụt miền Trung', N'Chung tay hỗ trợ người dân vượt qua khó khăn sau bão bằng nhu yếu phẩm, thuốc men và sửa chữa nhà cửa. ❤️ Mỗi sự sẻ chia là một nguồn động viên giúp bà con sớm ổn định cuộc sống.

**Sẻ chia hôm nay – Vững vàng ngày mai!** 🤝❤️', CAST(100000000.00 AS Decimal(18, 2)), CAST(N'2026-10-19T00:00:00.000' AS DateTime), CAST(N'2027-01-01T00:00:00.000' AS DateTime), 0, N'/Content/CampaignImages/bao-lu.jpg', CAST(N'2026-10-19T10:28:36.213' AS DateTime))
INSERT [dbo].[Campaigns] ([Id], [CategoryId], [Title], [Description], [TargetAmount], [StartDate], [EndDate], [Status], [ImageUrl], [CreatedAt]) VALUES (5, NULL, N'Chăm sóc người già neo đơn ', N'Những người già neo đơn đôi khi chỉ cần một lời hỏi thăm, một bàn tay sẻ chia và một chút yêu thương. ❤️

Trao yêu thương – Gửi hơi ấm – Lan tỏa hy vọng! ❤️', CAST(50000000.00 AS Decimal(18, 2)), CAST(N'2026-09-09T00:00:00.000' AS DateTime), CAST(N'2026-11-08T00:00:00.000' AS DateTime), 1, N'/Content/CampaignImages/images (1).jpg', CAST(N'2026-11-09T13:31:13.447' AS DateTime))
INSERT [dbo].[Campaigns] ([Id], [CategoryId], [Title], [Description], [TargetAmount], [StartDate], [EndDate], [Status], [ImageUrl], [CreatedAt]) VALUES (6, NULL, N'Hỗ trợ các em có hoàn cảnh khó khăn được tới trường', N'Mỗi em nhỏ đều xứng đáng có cơ hội đến trường và một tương lai tươi sáng. ❤️ Hãy cùng chung tay hỗ trợ trẻ em nghèo, trao thêm sách vở, niềm tin và hy vọng trên hành trình tri thức.

**Chung tay tiếp bước – Ươm mầm tương lai!** 🎒📚❤️', CAST(150000000.00 AS Decimal(18, 2)), CAST(N'2026-10-09T00:00:00.000' AS DateTime), CAST(N'2026-12-10T00:00:00.000' AS DateTime), 2, N'/Content/CampaignImages/images(3).jpg', CAST(N'2026-11-09T14:16:53.227' AS DateTime))
SET IDENTITY_INSERT [dbo].[Campaigns] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (1, N'Trẻ em & Giáo dục', N'Hỗ trợ học bổng, xây trường, sách vở')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (2, N'Cứu trợ thiên tai', N'Khắc phục bão lũ, hạn hán, sạt lở')
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (3, N'Y tế & Sức khỏe', N'Hỗ trợ viện phí cho bệnh nhân hiểm nghèo')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Donations] ON 

INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (1, N'TXN-001', 2, 1, CAST(500000.00 AS Decimal(18, 2)), CAST(N'2026-10-19T10:28:36.217' AS DateTime), N'Momo', N'Chúc các em chăm ngoan học giỏi', 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (2, N'TXN-002', 3, 1, CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2026-10-19T10:28:36.217' AS DateTime), N'VNPay', N'Gửi các em chút quà', 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (5, N'DEMO-DE545A93B468', 4, 2, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-10-29T16:00:21.607' AS DateTime), N'Chuyển khoản demo', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (6, N'DEMO-8ED1063FB83D', 4, 2, CAST(10000000.00 AS Decimal(18, 2)), CAST(N'2026-11-05T13:44:36.343' AS DateTime), N'Chuyển khoản demo', NULL, 1, 1, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (7, N'DEMO-5E01BC5E8B1B', 1005, 5, CAST(30000000.00 AS Decimal(18, 2)), CAST(N'2026-11-09T14:42:41.867' AS DateTime), N'Ví điện tử demo', N'Một phần nhỏ của mình mong các cụ luôn mạnh khỏe', 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (8, N'DEMO-4B7D87AD3C2F', 1005, 6, CAST(50000000.00 AS Decimal(18, 2)), CAST(N'2026-11-09T14:43:25.753' AS DateTime), N'Chuyển khoản demo', N'Chúc các em luôn mạnh khỏe và hạnh phúc', 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (9, N'DEMO-472188BC3BB3', 1006, 6, CAST(60000000.00 AS Decimal(18, 2)), CAST(N'2026-11-09T14:44:52.623' AS DateTime), N'Ví điện tử demo', NULL, 1, 1, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (10, N'DEMO-7ACCE1BBDF56', 1007, 6, CAST(40000000.00 AS Decimal(18, 2)), CAST(N'2026-11-09T14:45:53.057' AS DateTime), N'Ví điện tử demo', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (11, N'GOODS-000000000001', 1007, 5, CAST(0.00 AS Decimal(18, 2)), CAST(N'2026-11-10T09:00:00.000' AS DateTime), N'Hiện vật', N'Gửi các cụ ít gạo', 1, 0, N'InKind', N'Gạo ST25', CAST(50.00 AS Decimal(18, 2)), N'kg', CAST(1000000.00 AS Decimal(18, 2)), N'Tự mang đến', N'0912345678', NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (12, N'GOODS-000000000002', 1005, 1, CAST(0.00 AS Decimal(18, 2)), CAST(N'2026-11-11T10:00:00.000' AS DateTime), N'Hiện vật', NULL, 1, 0, N'InKind', N'Áo ấm trẻ em', CAST(30.00 AS Decimal(18, 2)), N'cái', CAST(3000000.00 AS Decimal(18, 2)), N'Nhờ đến lấy', N'0988777666', N'12 Nguyễn Huệ, Q1, TP.HCM', NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (13, N'CHARITY2U1005F2DBA8', 1005, 2, CAST(100000.00 AS Decimal(18, 2)), CAST(N'2026-11-15T19:33:36.327' AS DateTime), N'Chuyển khoản ngân hàng', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (14, N'CHARITY2U19F1359', 1, 2, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-11-15T19:47:06.140' AS DateTime), N'Chuyển khoản ngân hàng', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (15, N'CHARITY2U1889795', 1, 2, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-11-15T19:47:16.583' AS DateTime), N'Chuyển khoản ngân hàng', NULL, 1, 1, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (16, N'CHARITY2U1005BBD445', 1005, 2, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T10:11:57.877' AS DateTime), N'Chuyển khoản ngân hàng', N'Mong bà con mình mạnh khỏe', 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (17, N'CHARITY1U4272202', 4, 1, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T10:20:02.950' AS DateTime), N'Chuyển khoản ngân hàng', N'Thương các em', 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (18, N'CHARITY1U4CECE78', 4, 1, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T10:27:09.837' AS DateTime), N'Chuyển khoản ngân hàng', N'Thương các em ', 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (19, N'CHARITY1U4D8EF34', 4, 1, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T10:32:14.237' AS DateTime), N'Chuyển khoản ngân hàng', N'Thương các em ', 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (20, N'CHARITY1U4153323', 4, 1, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T10:36:59.660' AS DateTime), N'Chuyển khoản ngân hàng', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (21, N'CHARITY1U49D02B7', 4, 1, CAST(200000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T10:40:23.223' AS DateTime), N'Ví MoMo (demo)', NULL, 1, 1, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (22, N'CHARITY1U48F57FF', 4, 1, CAST(200000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T10:43:21.057' AS DateTime), N'Chuyển khoản ngân hàng', NULL, 1, 1, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (23, N'CHARITY1U4F247A1', 4, 1, CAST(100000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T10:48:29.400' AS DateTime), N'Ví MoMo (demo)', NULL, 1, 1, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (24, N'CHARITY1U45243AC', 4, 1, CAST(500000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T10:53:48.003' AS DateTime), N'ZaloPay (demo)', NULL, 1, 1, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (25, N'CHARITY1U4A93E51', 4, 1, CAST(500000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T10:59:04.037' AS DateTime), N'Ví MoMo (demo)', NULL, 1, 1, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (26, N'CHARITY1U44474CF', 4, 1, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T11:02:37.210' AS DateTime), N'Chuyển khoản ngân hàng', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (27, N'CHARITY2U43C1B97', 4, 2, CAST(900000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T11:05:01.487' AS DateTime), N'ZaloPay (demo)', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (28, N'CHARITY1U491CCA9', 4, 1, CAST(500000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T11:26:42.483' AS DateTime), N'ZaloPay (demo)', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (29, N'CHARITY1U1005866827', 1005, 1, CAST(500000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T11:31:39.067' AS DateTime), N'Chuyển khoản ngân hàng', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (30, N'CHARITY1U10050791A1', 1005, 1, CAST(100000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T11:34:45.797' AS DateTime), N'ZaloPay (demo)', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (31, N'CHARITY1U1005F8319B', 1005, 1, CAST(100000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T11:54:53.993' AS DateTime), N'Chuyển khoản ngân hàng', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (32, N'CHARITY1U100517173B', 1005, 1, CAST(200000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T12:09:15.813' AS DateTime), N'ZaloPay (demo)', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (33, N'CHARITY2U1498546', 1, 2, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T15:45:03.587' AS DateTime), N'Chuyển khoản ngân hàng', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (34, N'CHARITY1U1008099BC5', 1008, 1, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T17:18:34.190' AS DateTime), N'Chuyển khoản ngân hàng', N'thiện nguyện', 1, 1, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (35, N'GOODS-B23A1EA14151', 1008, 2, CAST(0.00 AS Decimal(18, 2)), CAST(N'2026-11-18T17:19:56.470' AS DateTime), N'Hiện vật', N'ăn no học tốt', 1, 0, N'InKind', N'Gạo', CAST(4.00 AS Decimal(18, 2)), N'kg', NULL, N'Gửi bưu điện', N'0815456247', NULL, NULL, N'VNPT-33156994')
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (36, N'CHARITY1U1005C2FDBD', 1005, 1, CAST(500000.00 AS Decimal(18, 2)), CAST(N'2026-11-18T21:28:01.660' AS DateTime), N'ZaloPay (demo)', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Donations] ([Id], [TransactionCode], [UserId], [CampaignId], [Amount], [DonatedAt], [PaymentMethod], [Message], [Status], [IsAnonymous], [DonationType], [ItemName], [Quantity], [Unit], [EstimatedValue], [DeliveryMethod], [ContactPhone], [PickupAddress], [DeliverySubOption], [PostalTrackingCode]) VALUES (37, N'CHARITY1U1008F0C2B2', 1008, 1, CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2026-11-21T21:43:07.580' AS DateTime), N'Chuyển khoản ngân hàng', NULL, 1, 0, N'Money', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Donations] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FullName], [Email], [PasswordHash], [PhoneNumber], [Role], [CreatedAt]) VALUES (1, N'Quản trị hệ thống', N'admin@charity.com', N'123456', N'0901234567', N'Admin', CAST(N'2026-10-19T10:28:36.213' AS DateTime))
INSERT [dbo].[Users] ([Id], [FullName], [Email], [PasswordHash], [PhoneNumber], [Role], [CreatedAt]) VALUES (2, N'Trần Nguyễn Vỹ', N'vy@gmail.com', N'123456', N'0815456247', N'User', CAST(N'2026-10-19T10:28:36.213' AS DateTime))
INSERT [dbo].[Users] ([Id], [FullName], [Email], [PasswordHash], [PhoneNumber], [Role], [CreatedAt]) VALUES (3, N'Trần Lê Đăng Khang', N'manhthuongquan@gmail.com', N'123456', N'0988888888', N'User', CAST(N'2026-10-19T10:28:36.213' AS DateTime))
INSERT [dbo].[Users] ([Id], [FullName], [Email], [PasswordHash], [PhoneNumber], [Role], [CreatedAt]) VALUES (4, N'Trần Lê Đăng Khang', N'khangtran07052345@gmail.com', N'12345678', NULL, N'User', CAST(N'2026-10-19T12:48:13.550' AS DateTime))
INSERT [dbo].[Users] ([Id], [FullName], [Email], [PasswordHash], [PhoneNumber], [Role], [CreatedAt]) VALUES (1004, N'Khang Trần', N'khangtran@gmail.com', N'23456789', NULL, N'User', CAST(N'2026-10-27T15:26:30.563' AS DateTime))
INSERT [dbo].[Users] ([Id], [FullName], [Email], [PasswordHash], [PhoneNumber], [Role], [CreatedAt]) VALUES (1005, N'Lê Hữu Trí', N'Trile@gmail.com', N'25092007', NULL, N'User', CAST(N'2026-11-09T14:20:01.367' AS DateTime))
INSERT [dbo].[Users] ([Id], [FullName], [Email], [PasswordHash], [PhoneNumber], [Role], [CreatedAt]) VALUES (1006, N'Trần Nguyễn Vỹ', N'Vytran@gmail.com', N'12345678', NULL, N'User', CAST(N'2026-11-09T14:44:17.447' AS DateTime))
INSERT [dbo].[Users] ([Id], [FullName], [Email], [PasswordHash], [PhoneNumber], [Role], [CreatedAt]) VALUES (1007, N'Nguyễn Bá Lộc', N'Loc@gmail.com', N'12345678', NULL, N'User', CAST(N'2026-11-09T14:45:26.613' AS DateTime))
INSERT [dbo].[Users] ([Id], [FullName], [Email], [PasswordHash], [PhoneNumber], [Role], [CreatedAt]) VALUES (1008, N'Bùi Đỗ Bảo Phúc', N'Phuc@gmail.com', N'12345678', NULL, N'User', CAST(N'2026-11-18T17:12:52.723' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Donation__D85E7026EE337145]    Script Date: 11/22/2026 12:15:21 PM ******/
ALTER TABLE [dbo].[Donations] ADD UNIQUE NONCLUSTERED 
(
	[TransactionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534C670F727]    Script Date: 11/22/2026 12:15:21 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Campaigns] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Campaigns] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Donations] ADD  DEFAULT (getdate()) FOR [DonatedAt]
GO
ALTER TABLE [dbo].[Donations] ADD  DEFAULT (N'Chuyển khoản') FOR [PaymentMethod]
GO
ALTER TABLE [dbo].[Donations] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Donations] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[Donations] ADD  CONSTRAINT [DF_Donations_Type]  DEFAULT (N'Money') FOR [DonationType]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('User') FOR [Role]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Campaigns]  WITH CHECK ADD  CONSTRAINT [FK_Campaigns_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Campaigns] CHECK CONSTRAINT [FK_Campaigns_Categories]
GO
ALTER TABLE [dbo].[Donations]  WITH CHECK ADD  CONSTRAINT [FK_Donations_Campaigns] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[Campaigns] ([Id])
GO
ALTER TABLE [dbo].[Donations] CHECK CONSTRAINT [FK_Donations_Campaigns]
GO
ALTER TABLE [dbo].[Donations]  WITH CHECK ADD  CONSTRAINT [FK_Donations_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Donations] CHECK CONSTRAINT [FK_Donations_Users]
GO
ALTER TABLE [dbo].[Campaigns]  WITH CHECK ADD CHECK  (([TargetAmount]>(0)))
GO
ALTER TABLE [dbo].[Campaigns]  WITH CHECK ADD  CONSTRAINT [CK_Campaign_Dates] CHECK  (([EndDate]>[StartDate]))
GO
ALTER TABLE [dbo].[Campaigns] CHECK CONSTRAINT [CK_Campaign_Dates]
GO
ALTER TABLE [dbo].[Donations]  WITH CHECK ADD  CONSTRAINT [CK_Donations_Type] CHECK  (([DonationType]=N'Money' AND [Amount]>(0) OR [DonationType]=N'InKind' AND [Amount]=(0) AND [ItemName] IS NOT NULL AND [Quantity]>(0)))
GO
ALTER TABLE [dbo].[Donations] CHECK CONSTRAINT [CK_Donations_Type]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='Admin' OR [Role]='User'))
GO
USE [master]
GO
ALTER DATABASE [CharityDB] SET  READ_WRITE 
GO
