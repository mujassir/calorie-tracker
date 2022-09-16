
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/14/2022 12:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 9/14/2022 12:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/14/2022 12:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/14/2022 12:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/14/2022 12:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/14/2022 12:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/14/2022 12:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[IsAdmin] [bit] NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[DailyCalorieLimit] [decimal](18, 2) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 9/14/2022 12:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodEntries]    Script Date: 9/14/2022 12:41:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Unit] [nvarchar](max) NULL,
	[Quantity] [decimal](18, 2) NULL,
	[UnitCalorieValue] [decimal](18, 2) NULL,
	[TotalCalories] [decimal](18, 2) NOT NULL,
	[FoodTakenAt] [datetime2](7) NULL,
	[UserId] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[ModifiedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_FoodEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220910200723_IdentityMigration', N'6.0.8')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAdmin], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DailyCalorieLimit]) VALUES (N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', N'Kamran Shahid', NULL, N'kamran.shahid@gmail.com', N'KAMRAN.SHAHID@GMAIL.COM', N'kamran.shahid@gmail.com', N'KAMRAN.SHAHID@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHQdGukL2ZUQO85YaX6FNcuMfmmPwTwyd8ujU6smTLHmYoxG/zt7WsmP4KTAO3YaZQ==', N'SQPXA73JW4LZVZTMXJQ4ZHACHBMLRLQM', N'87a6149a-f960-423b-b811-7c0c4529361c', NULL, 0, 0, NULL, 1, 0, CAST(2100.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAdmin], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DailyCalorieLimit]) VALUES (N'3d465f26-9ff8-470b-ad2e-1e4248c4bea3', N'Kaleem Paracha', NULL, N'kaleem@gmail.com', N'KALEEM@GMAIL.COM', N'kaleem@gmail.com', N'KALEEM@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEDiz4Blq0SG1Fakbi+ywHC8247vM0f6XD4cLMjgIrUtDwGqwS2JccjYGxtKOYUiqzQ==', N'XW3UD3IALCY2GRCPF5K7BBYXL6VNBXW2', N'891444ac-3065-4d31-be95-c3b3395740bb', NULL, 0, 0, NULL, 1, 0, CAST(2100.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [IsAdmin], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [DailyCalorieLimit]) VALUES (N'c00d678b-684b-4f18-99ce-a5902dadad5f', N'Mujassir Nasir', 1, N'mujassir@gmail.com', N'MUJASSIR@GMAIL.COM', N'mujassir@gmail.com', N'MUJASSIR@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBpl1AuNK2IlFoXSvaKtjZKMsO2XWevnaGKn2TYRwSTOpP7IacfmLukxZq+Qh4+g0Q==', N'CIEAU34OVCZEW2JEET4NZNH7B62VLTS6', N'4966831b-ac54-4d99-a26c-72e2d9680f9d', NULL, 0, 0, NULL, 1, 0, CAST(2100.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[FoodEntries] ON 
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (18, N'Bread', N'slice', CAST(18.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), CAST(N'2022-09-11T00:00:00.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (260, N'coffee cake', N'piece (1/9 of 20 oz cake)', CAST(1.00 AS Decimal(18, 2)), CAST(263.34 AS Decimal(18, 2)), CAST(263.34 AS Decimal(18, 2)), CAST(N'2022-09-07T20:52:42.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-12T01:52:48.8999055' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (261, N'lean beef', N'oz', CAST(1.00 AS Decimal(18, 2)), CAST(195.50 AS Decimal(18, 2)), CAST(195.50 AS Decimal(18, 2)), CAST(N'2022-09-07T20:53:07.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-12T01:53:10.6485122' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (262, N'beef burger', N'sandwich', CAST(1.00 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(N'2022-09-07T20:54:51.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-12T01:54:54.6616806' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (263, N'breaded chicken breast', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(37.80 AS Decimal(18, 2)), CAST(37.80 AS Decimal(18, 2)), CAST(N'2022-09-08T21:13:37.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-12T02:13:41.1459837' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (264, N'chicken thigh', N'thigh with skin', CAST(1.00 AS Decimal(18, 2)), CAST(278.20 AS Decimal(18, 2)), CAST(278.20 AS Decimal(18, 2)), CAST(N'2022-09-08T21:13:51.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-12T02:13:53.4408433' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (265, N'cooked white rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(205.40 AS Decimal(18, 2)), CAST(205.40 AS Decimal(18, 2)), CAST(N'2022-09-09T21:15:46.0000000' AS DateTime2), N'3d465f26-9ff8-470b-ad2e-1e4248c4bea3', CAST(N'2022-09-12T02:15:49.6229304' AS DateTime2), N'3d465f26-9ff8-470b-ad2e-1e4248c4bea3', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (266, N'whole wheat bread', N'slice', CAST(1.00 AS Decimal(18, 2)), CAST(80.64 AS Decimal(18, 2)), CAST(80.64 AS Decimal(18, 2)), CAST(N'2022-09-11T19:45:40.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T00:45:45.4566923' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (267, N'brown rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(N'2022-09-12T20:07:19.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T01:07:21.8697603' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (268, N'beef burger', N'sandwich', CAST(1.00 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(N'2022-09-12T20:12:46.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T01:07:51.6841709' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (269, N'corned beef', N'oz', CAST(1.00 AS Decimal(18, 2)), CAST(213.35 AS Decimal(18, 2)), CAST(213.35 AS Decimal(18, 2)), CAST(N'2022-09-12T20:10:03.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:10:10.3056012' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (270, N'fish fried', N'fillet', CAST(1.00 AS Decimal(18, 2)), CAST(199.23 AS Decimal(18, 2)), CAST(199.23 AS Decimal(18, 2)), CAST(N'2022-09-12T20:03:33.6600000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:14:40.3038430' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (272, N'fried rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(238.38 AS Decimal(18, 2)), CAST(238.38 AS Decimal(18, 2)), CAST(N'2022-09-12T20:05:10.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:16:01.1286851' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:24:18.6709432' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d')
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (274, N'fried shrimp', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(37.58 AS Decimal(18, 2)), CAST(37.58 AS Decimal(18, 2)), CAST(N'2022-09-12T20:41:13.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:16.5380055' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (275, N'fried chicken', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(376.60 AS Decimal(18, 2)), CAST(376.60 AS Decimal(18, 2)), CAST(N'2022-09-12T20:41:31.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:34.4700153' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (276, N'fried potatoes', N'serving medium', CAST(1.00 AS Decimal(18, 2)), CAST(365.04 AS Decimal(18, 2)), CAST(365.04 AS Decimal(18, 2)), CAST(N'2022-09-12T20:41:43.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:45.9562047' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (277, N'beef steak', N'steak', CAST(1.00 AS Decimal(18, 2)), CAST(614.38 AS Decimal(18, 2)), CAST(614.38 AS Decimal(18, 2)), CAST(N'2022-09-12T20:43:29.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:43:31.8746827' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (279, N'chicken', N'oz', CAST(1.00 AS Decimal(18, 2)), CAST(187.00 AS Decimal(18, 2)), CAST(187.00 AS Decimal(18, 2)), CAST(N'2022-09-12T20:50:41.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:50:44.4592159' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (280, N'Bread', N'slice', CAST(18.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), CAST(N'2022-09-04T00:00:00.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (281, N'angel food cake', N'piece (1/12 of 12 oz cake)', CAST(1.00 AS Decimal(18, 2)), CAST(72.24 AS Decimal(18, 2)), CAST(72.24 AS Decimal(18, 2)), CAST(N'2022-09-04T14:42:20.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-11T19:45:18.1835171' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (282, N'brown rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(N'2022-09-04T20:30:46.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-12T01:30:51.3826181' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (284, N'lean beef', N'oz', CAST(1.00 AS Decimal(18, 2)), CAST(195.50 AS Decimal(18, 2)), CAST(195.50 AS Decimal(18, 2)), CAST(N'2022-08-31T20:53:07.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-12T01:53:10.6485122' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (285, N'beef burger', N'sandwich', CAST(1.00 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(N'2022-08-31T20:54:51.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-12T01:54:54.6616806' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (286, N'breaded chicken breast', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(37.80 AS Decimal(18, 2)), CAST(37.80 AS Decimal(18, 2)), CAST(N'2022-09-01T21:13:37.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-12T02:13:41.1459837' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (287, N'chicken thigh', N'thigh with skin', CAST(1.00 AS Decimal(18, 2)), CAST(278.20 AS Decimal(18, 2)), CAST(278.20 AS Decimal(18, 2)), CAST(N'2022-09-01T21:13:51.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-12T02:13:53.4408433' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (288, N'cooked white rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(205.40 AS Decimal(18, 2)), CAST(205.40 AS Decimal(18, 2)), CAST(N'2022-09-02T21:15:46.0000000' AS DateTime2), N'3d465f26-9ff8-470b-ad2e-1e4248c4bea3', CAST(N'2022-09-12T02:15:49.6229304' AS DateTime2), N'3d465f26-9ff8-470b-ad2e-1e4248c4bea3', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (289, N'whole wheat bread', N'slice', CAST(1.00 AS Decimal(18, 2)), CAST(80.64 AS Decimal(18, 2)), CAST(80.64 AS Decimal(18, 2)), CAST(N'2022-09-04T19:45:40.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T00:45:45.4566923' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (290, N'brown rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(N'2022-09-05T20:07:19.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T01:07:21.8697603' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (291, N'beef burger', N'sandwich', CAST(1.00 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(N'2022-09-05T20:12:46.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T01:07:51.6841709' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (292, N'corned beef', N'oz', CAST(1.00 AS Decimal(18, 2)), CAST(213.35 AS Decimal(18, 2)), CAST(213.35 AS Decimal(18, 2)), CAST(N'2022-09-05T20:10:03.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:10:10.3056012' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (293, N'fish fried', N'fillet', CAST(1.00 AS Decimal(18, 2)), CAST(199.23 AS Decimal(18, 2)), CAST(199.23 AS Decimal(18, 2)), CAST(N'2022-09-05T20:03:33.6600000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:14:40.3038430' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (294, N'fried rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(238.38 AS Decimal(18, 2)), CAST(238.38 AS Decimal(18, 2)), CAST(N'2022-09-05T20:05:10.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:16:01.1286851' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:24:18.6709432' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d')
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (295, N'fried shrimp', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(37.58 AS Decimal(18, 2)), CAST(37.58 AS Decimal(18, 2)), CAST(N'2022-09-05T20:41:13.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:16.5380055' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (296, N'fried chicken', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(376.60 AS Decimal(18, 2)), CAST(376.60 AS Decimal(18, 2)), CAST(N'2022-09-05T20:41:31.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:34.4700153' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (297, N'fried potatoes', N'serving medium', CAST(1.00 AS Decimal(18, 2)), CAST(365.04 AS Decimal(18, 2)), CAST(365.04 AS Decimal(18, 2)), CAST(N'2022-09-05T20:41:43.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:45.9562047' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (298, N'beef steak', N'steak', CAST(1.00 AS Decimal(18, 2)), CAST(614.38 AS Decimal(18, 2)), CAST(614.38 AS Decimal(18, 2)), CAST(N'2022-09-05T20:43:29.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:43:31.8746827' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (299, N'chicken', N'oz', CAST(1.00 AS Decimal(18, 2)), CAST(187.00 AS Decimal(18, 2)), CAST(187.00 AS Decimal(18, 2)), CAST(N'2022-09-05T20:50:41.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:50:44.4592159' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (300, N'Bread', N'slice', CAST(18.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), CAST(N'2022-09-04T00:00:00.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (301, N'angel food cake', N'piece (1/12 of 12 oz cake)', CAST(1.00 AS Decimal(18, 2)), CAST(72.24 AS Decimal(18, 2)), CAST(72.24 AS Decimal(18, 2)), CAST(N'2022-09-04T14:42:20.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-11T19:45:18.1835171' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (302, N'brown rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(N'2022-09-04T20:30:46.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-12T01:30:51.3826181' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (304, N'lean beef', N'oz', CAST(1.00 AS Decimal(18, 2)), CAST(195.50 AS Decimal(18, 2)), CAST(195.50 AS Decimal(18, 2)), CAST(N'2022-08-31T20:53:07.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-12T01:53:10.6485122' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (305, N'beef burger', N'sandwich', CAST(1.00 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(N'2022-08-31T20:54:51.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-12T01:54:54.6616806' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (306, N'breaded chicken breast', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(37.80 AS Decimal(18, 2)), CAST(37.80 AS Decimal(18, 2)), CAST(N'2022-09-01T21:13:37.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-12T02:13:41.1459837' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (307, N'chicken thigh', N'thigh with skin', CAST(1.00 AS Decimal(18, 2)), CAST(278.20 AS Decimal(18, 2)), CAST(278.20 AS Decimal(18, 2)), CAST(N'2022-09-01T21:13:51.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-12T02:13:53.4408433' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (308, N'cooked white rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(205.40 AS Decimal(18, 2)), CAST(205.40 AS Decimal(18, 2)), CAST(N'2022-09-02T21:15:46.0000000' AS DateTime2), N'3d465f26-9ff8-470b-ad2e-1e4248c4bea3', CAST(N'2022-09-12T02:15:49.6229304' AS DateTime2), N'3d465f26-9ff8-470b-ad2e-1e4248c4bea3', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (309, N'whole wheat bread', N'slice', CAST(1.00 AS Decimal(18, 2)), CAST(80.64 AS Decimal(18, 2)), CAST(80.64 AS Decimal(18, 2)), CAST(N'2022-09-04T19:45:40.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T00:45:45.4566923' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (310, N'brown rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(N'2022-09-05T20:07:19.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T01:07:21.8697603' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (311, N'beef burger', N'sandwich', CAST(1.00 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(N'2022-09-05T20:12:46.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T01:07:51.6841709' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (312, N'corned beef', N'oz', CAST(1.00 AS Decimal(18, 2)), CAST(213.35 AS Decimal(18, 2)), CAST(213.35 AS Decimal(18, 2)), CAST(N'2022-09-05T20:10:03.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:10:10.3056012' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (313, N'fish fried', N'fillet', CAST(1.00 AS Decimal(18, 2)), CAST(199.23 AS Decimal(18, 2)), CAST(199.23 AS Decimal(18, 2)), CAST(N'2022-09-05T20:03:33.6600000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:14:40.3038430' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (314, N'fried rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(238.38 AS Decimal(18, 2)), CAST(238.38 AS Decimal(18, 2)), CAST(N'2022-09-05T20:05:10.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:16:01.1286851' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:24:18.6709432' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d')
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (315, N'fried shrimp', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(37.58 AS Decimal(18, 2)), CAST(37.58 AS Decimal(18, 2)), CAST(N'2022-09-05T20:41:13.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:16.5380055' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (316, N'fried chicken', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(376.60 AS Decimal(18, 2)), CAST(376.60 AS Decimal(18, 2)), CAST(N'2022-09-05T20:41:31.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:34.4700153' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (317, N'fried potatoes', N'serving medium', CAST(1.00 AS Decimal(18, 2)), CAST(365.04 AS Decimal(18, 2)), CAST(365.04 AS Decimal(18, 2)), CAST(N'2022-09-05T20:41:43.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:45.9562047' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (318, N'beef steak', N'steak', CAST(1.00 AS Decimal(18, 2)), CAST(614.38 AS Decimal(18, 2)), CAST(614.38 AS Decimal(18, 2)), CAST(N'2022-09-05T20:43:29.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:43:31.8746827' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (319, N'chicken', N'oz', CAST(1.00 AS Decimal(18, 2)), CAST(187.00 AS Decimal(18, 2)), CAST(187.00 AS Decimal(18, 2)), CAST(N'2022-09-05T20:50:41.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:50:44.4592159' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (320, N'Bread', N'slice', CAST(18.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), CAST(N'2022-08-28T00:00:00.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (323, N'coffee cake', N'piece (1/9 of 20 oz cake)', CAST(1.00 AS Decimal(18, 2)), CAST(263.34 AS Decimal(18, 2)), CAST(263.34 AS Decimal(18, 2)), CAST(N'2022-08-24T20:52:42.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-12T01:52:48.8999055' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (325, N'beef burger', N'sandwich', CAST(1.00 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(N'2022-08-24T20:54:51.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-12T01:54:54.6616806' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (326, N'breaded chicken breast', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(37.80 AS Decimal(18, 2)), CAST(37.80 AS Decimal(18, 2)), CAST(N'2022-08-25T21:13:37.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-12T02:13:41.1459837' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (327, N'chicken thigh', N'thigh with skin', CAST(1.00 AS Decimal(18, 2)), CAST(278.20 AS Decimal(18, 2)), CAST(278.20 AS Decimal(18, 2)), CAST(N'2022-08-25T21:13:51.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-12T02:13:53.4408433' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (328, N'cooked white rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(205.40 AS Decimal(18, 2)), CAST(205.40 AS Decimal(18, 2)), CAST(N'2022-08-26T21:15:46.0000000' AS DateTime2), N'3d465f26-9ff8-470b-ad2e-1e4248c4bea3', CAST(N'2022-09-12T02:15:49.6229304' AS DateTime2), N'3d465f26-9ff8-470b-ad2e-1e4248c4bea3', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (329, N'whole wheat bread', N'slice', CAST(1.00 AS Decimal(18, 2)), CAST(80.64 AS Decimal(18, 2)), CAST(80.64 AS Decimal(18, 2)), CAST(N'2022-08-28T19:45:40.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T00:45:45.4566923' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (330, N'brown rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(109.20 AS Decimal(18, 2)), CAST(N'2022-08-29T20:07:19.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T01:07:21.8697603' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (331, N'beef burger', N'sandwich', CAST(1.00 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(540.14 AS Decimal(18, 2)), CAST(N'2022-08-29T20:12:46.0000000' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', CAST(N'2022-09-13T01:07:51.6841709' AS DateTime2), N'c00d678b-684b-4f18-99ce-a5902dadad5f', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (332, N'corned beef', N'oz', CAST(1.00 AS Decimal(18, 2)), CAST(213.35 AS Decimal(18, 2)), CAST(213.35 AS Decimal(18, 2)), CAST(N'2022-08-29T20:10:03.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:10:10.3056012' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (333, N'fish fried', N'fillet', CAST(1.00 AS Decimal(18, 2)), CAST(199.23 AS Decimal(18, 2)), CAST(199.23 AS Decimal(18, 2)), CAST(N'2022-08-29T20:03:33.6600000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:14:40.3038430' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (334, N'fried rice', N'cup', CAST(1.00 AS Decimal(18, 2)), CAST(238.38 AS Decimal(18, 2)), CAST(238.38 AS Decimal(18, 2)), CAST(N'2022-08-29T20:05:10.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:16:01.1286851' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:24:18.6709432' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d')
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (335, N'fried shrimp', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(37.58 AS Decimal(18, 2)), CAST(37.58 AS Decimal(18, 2)), CAST(N'2022-08-29T20:41:13.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:16.5380055' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (336, N'fried chicken', N'piece', CAST(1.00 AS Decimal(18, 2)), CAST(376.60 AS Decimal(18, 2)), CAST(376.60 AS Decimal(18, 2)), CAST(N'2022-08-29T20:41:31.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:34.4700153' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (337, N'fried potatoes', N'serving medium', CAST(1.00 AS Decimal(18, 2)), CAST(365.04 AS Decimal(18, 2)), CAST(365.04 AS Decimal(18, 2)), CAST(N'2022-08-29T20:41:43.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:41:45.9562047' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (338, N'beef steak', N'steak', CAST(1.00 AS Decimal(18, 2)), CAST(614.38 AS Decimal(18, 2)), CAST(614.38 AS Decimal(18, 2)), CAST(N'2022-08-29T20:43:29.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:43:31.8746827' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
INSERT [dbo].[FoodEntries] ([Id], [Name], [Unit], [Quantity], [UnitCalorieValue], [TotalCalories], [FoodTakenAt], [UserId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy]) VALUES (339, N'chicken', N'oz', CAST(1.00 AS Decimal(18, 2)), CAST(187.00 AS Decimal(18, 2)), CAST(187.00 AS Decimal(18, 2)), CAST(N'2022-08-29T20:50:41.0000000' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', CAST(N'2022-09-13T01:50:44.4592159' AS DateTime2), N'1ee6eb70-8c47-4e49-8682-7c0aab9ec44d', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[FoodEntries] OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
