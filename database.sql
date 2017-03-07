USE [lemonade_stand]
GO
/****** Object:  Table [dbo].[players]    Script Date: 3/6/2017 5:09:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[players](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[players_scores]    Script Date: 3/6/2017 5:09:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[players_scores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[player_id] [int] NULL,
	[score_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[scores]    Script Date: 3/6/2017 5:09:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[score] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[players] ON 

INSERT [dbo].[players] ([id], [username], [password]) VALUES (42, N'coolgurl123', N'password123')
INSERT [dbo].[players] ([id], [username], [password]) VALUES (43, N'coolgurl123', N'password123')
INSERT [dbo].[players] ([id], [username], [password]) VALUES (44, N'coolgurl123', N'password123')
INSERT [dbo].[players] ([id], [username], [password]) VALUES (45, N'coolgurl123', N'password123')
INSERT [dbo].[players] ([id], [username], [password]) VALUES (46, N'coolgurl123', N'password123')
INSERT [dbo].[players] ([id], [username], [password]) VALUES (38, N'coolgurl123', N'password123')
INSERT [dbo].[players] ([id], [username], [password]) VALUES (39, N'coolgurl123', N'password123')
INSERT [dbo].[players] ([id], [username], [password]) VALUES (40, N'coolgurl123', N'password123')
INSERT [dbo].[players] ([id], [username], [password]) VALUES (41, N'coolgurl123', N'password123')
SET IDENTITY_INSERT [dbo].[players] OFF
