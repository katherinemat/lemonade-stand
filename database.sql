USE [lemonade_stand]
GO
/****** Object:  Table [dbo].[players]    Script Date: 3/9/2017 4:12:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[players](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[money] [decimal](9, 2) NULL,
	[count] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[players_scores]    Script Date: 3/9/2017 4:12:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[players_scores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[player_id] [int] NULL,
	[score] [decimal](9, 2) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[players] ON 

INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (62, N'k', N'k', CAST(20.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (63, N'hey', N'hey', CAST(20.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (64, N'coolgurl123', N'password123', CAST(15.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (65, N'coolgurl123', N'password123', CAST(35.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (66, N'coolgurl123', N'password123', CAST(0.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (67, N'coolgurl123', N'password123', CAST(20.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (68, N'coolgurl123', N'password123', CAST(60.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (69, N'coolgurl123', N'password123', CAST(10.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (70, N'coolgurl123', N'password123', CAST(40.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (71, N'coolgurl123', N'password123', CAST(10.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (72, N'coolgurl123', N'password123', CAST(30.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (73, N'kaz', N'password', CAST(20.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (74, N'coolgurl123', N'password123', CAST(20.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (75, N'coolgurl123', N'password123', CAST(5.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (76, N'coolgurl123', N'password123', CAST(60.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (77, N'coolgurl123', N'password123', CAST(55.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (78, N'coolgurl123', N'password123', CAST(5.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (79, N'coolgurl123', N'password123', CAST(35.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (80, N'coolgurl123', N'password123', CAST(10.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (81, N'coolgurl123', N'password123', CAST(0.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (82, N'coolgurl123', N'password123', CAST(20.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (83, N'coolgurl123', N'password123', CAST(0.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (84, N'coolgurl123', N'password123', CAST(0.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (85, N'coolgurl123', N'password123', CAST(10.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (86, N'coolgurl123', N'password123', CAST(10.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (87, N'coolgurl123', N'password123', CAST(10.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (88, N'coolgurl123', N'password123', CAST(10.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (89, N'coolgurl123', N'password123', CAST(-20.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (90, N'kaz', N'password', CAST(16.00 AS Decimal(9, 2)), 3)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (91, N'kk', N'kk', CAST(16.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (92, N'kaz', N'password', CAST(16.00 AS Decimal(9, 2)), 3)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (93, N'kaz', N'password', CAST(20.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (94, N'kaz', N'password', CAST(20.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (95, N'kaz', N'password', CAST(18.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (96, N'coolgurl123', N'password123', CAST(0.00 AS Decimal(9, 2)), 0)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (97, N'hey', N'hey', CAST(20.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (98, N'kaz', N'p', CAST(18.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (99, N'kaz', N'password', CAST(20.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (100, N'kaz', N'password', CAST(20.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (101, N'kaz', N'password', CAST(20.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[players] ([id], [username], [password], [money], [count]) VALUES (102, N'oweij', N'alsjf', CAST(20.00 AS Decimal(9, 2)), 1)
SET IDENTITY_INSERT [dbo].[players] OFF
SET IDENTITY_INSERT [dbo].[players_scores] ON 

INSERT [dbo].[players_scores] ([id], [player_id], [score]) VALUES (4, 63, CAST(21.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[players_scores] OFF
