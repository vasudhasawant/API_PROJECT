create database DP6Titans

USE [DP6Titans]
GO
/***** Object:  Table [dbo].[Cart]    Script Date: 4/9/2024 8:22:59 PM *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Cart_id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NULL,
	[Rid] [int] NULL,
	[Qty] [varchar](190) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/***** Object:  Table [dbo].[category]    Script Date: 4/9/2024 8:22:59 PM *****/
SET ANSI_NULLS ON
GO

GO
CREATE TABLE [dbo].[category](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/***** Object:  Table [dbo].[Orders]    Script Date: 4/9/2024 8:22:59 PM *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NULL,
	[Rid] [int] NULL,
	[Qty] [int] NULL,
	[ordate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/***** Object:  Table [dbo].[product2]    Script Date: 4/9/2024 8:22:59 PM *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product2](
	[p_id] [int] IDENTITY(1,1) NOT NULL,
	[p_name] [varchar](50) NULL,
	[price] [decimal](12, 2) NULL,
	[image] [varchar](max) NULL,
	[c_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/***** Object:  Table [dbo].[Registration]    Script Date: 4/9/2024 8:22:59 PM *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[Rid] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](60) NULL,
	[Email] [varchar](90) NULL,
	[Gender] [varchar](30) NULL,
	[PhoneNumber] [varchar](60) NULL,
	[City] [varchar](40) NULL,
	[Password] [varchar](50) NULL,
	[Roleid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/***** Object:  Table [dbo].[Role]    Script Date: 4/9/2024 8:22:59 PM *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Roleid] [int] NOT NULL,
	[RoleName] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[Roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [F_Product] FOREIGN KEY([p_id])
REFERENCES [dbo].[product2] ([p_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [F_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [F_Registration] FOREIGN KEY([Rid])
REFERENCES [dbo].[Registration] ([Rid])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [F_Registration]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fkorder_pid] FOREIGN KEY([id])
REFERENCES [dbo].[product2] ([p_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fkorder_pid]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fkorder_rid] FOREIGN KEY([Rid])
REFERENCES [dbo].[Registration] ([Rid])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fkorder_rid]
GO
ALTER TABLE [dbo].[product2]  WITH CHECK ADD  CONSTRAINT [fk_catg_prod] FOREIGN KEY([c_id])
REFERENCES [dbo].[category] ([c_id])
GO
ALTER TABLE [dbo].[product2] CHECK CONSTRAINT [fk_catg_prod]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Role] FOREIGN KEY([Roleid])
REFERENCES [dbo].[Role] ([Roleid])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Role]
GO