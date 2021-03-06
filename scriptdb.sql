USE [NuevoDB]
GO
/****** Object:  Table [dbo].[EmailSettings]    Script Date: 18.03.2020 15:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailSettings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SmtpServer] [nvarchar](50) NULL,
	[MailSubject] [nvarchar](50) NULL,
	[FromMail] [nvarchar](50) NULL,
	[ToMail] [nvarchar](50) NULL,
	[FromMailPassword] [nvarchar](50) NULL,
	[Port] [int] NULL,
	[UserLoginID] [int] NULL,
 CONSTRAINT [PK_EmailSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 18.03.2020 15:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[UserLoginID] [int] NULL,
	[LogMsg] [nvarchar](max) NULL,
 CONSTRAINT [PK_ErrorLogs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TargetApps]    Script Date: 18.03.2020 15:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TargetApps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserLoginID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[TargetUrl] [nvarchar](50) NULL,
	[TimeInterval] [int] NULL,
	[IntervalType] [nvarchar](1) NULL,
 CONSTRAINT [PK_TargetApps] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 18.03.2020 15:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[EmailSettings]  WITH CHECK ADD  CONSTRAINT [FK_EmailSettings_UserLogin] FOREIGN KEY([UserLoginID])
REFERENCES [dbo].[UserLogin] ([ID])
GO
ALTER TABLE [dbo].[EmailSettings] CHECK CONSTRAINT [FK_EmailSettings_UserLogin]
GO
ALTER TABLE [dbo].[ErrorLogs]  WITH CHECK ADD  CONSTRAINT [FK_ErrorLogs_UserLogin] FOREIGN KEY([UserLoginID])
REFERENCES [dbo].[UserLogin] ([ID])
GO
ALTER TABLE [dbo].[ErrorLogs] CHECK CONSTRAINT [FK_ErrorLogs_UserLogin]
GO
ALTER TABLE [dbo].[TargetApps]  WITH CHECK ADD  CONSTRAINT [FK_TargetApps_UserLogin] FOREIGN KEY([UserLoginID])
REFERENCES [dbo].[UserLogin] ([ID])
GO
ALTER TABLE [dbo].[TargetApps] CHECK CONSTRAINT [FK_TargetApps_UserLogin]
GO
