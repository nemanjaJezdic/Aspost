USE [master]
GO
/****** Object:  Database [aspost]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE DATABASE [aspost]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'aspost', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\aspost.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'aspost_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\aspost_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [aspost] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [aspost].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [aspost] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [aspost] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [aspost] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [aspost] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [aspost] SET ARITHABORT OFF 
GO
ALTER DATABASE [aspost] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [aspost] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [aspost] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [aspost] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [aspost] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [aspost] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [aspost] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [aspost] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [aspost] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [aspost] SET  DISABLE_BROKER 
GO
ALTER DATABASE [aspost] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [aspost] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [aspost] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [aspost] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [aspost] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [aspost] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [aspost] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [aspost] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [aspost] SET  MULTI_USER 
GO
ALTER DATABASE [aspost] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [aspost] SET DB_CHAINING OFF 
GO
ALTER DATABASE [aspost] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [aspost] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [aspost] SET DELAYED_DURABILITY = DISABLED 
GO
USE [aspost]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/12/2022 11:58:41 AM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 6/12/2022 11:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/12/2022 11:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](255) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logs]    Script Date: 6/12/2022 11:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[User] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/12/2022 11:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 6/12/2022 11:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RatingNumber] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/12/2022 11:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 6/12/2022 11:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220530122423_createTables', N'5.0.17')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (16, N'Funny', CAST(N'2022-06-08 11:20:26.4598323' AS DateTime2), NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (17, N'Sport', CAST(N'2022-06-08 11:20:26.4598323' AS DateTime2), NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (18, N'News', CAST(N'2022-06-08 11:20:26.4598323' AS DateTime2), NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (19, N'Travel', CAST(N'2022-06-08 11:20:26.4598323' AS DateTime2), NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (20, N'Awesome', CAST(N'2022-06-08 11:20:26.4598323' AS DateTime2), NULL, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (21, N'Top', CAST(N'2022-06-11 16:12:42.2618554' AS DateTime2), CAST(N'2022-06-11 16:14:32.2781480' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Text], [PostId], [UserId], [ParentId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, N'Neki komentar 1', 9, 36, NULL, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), CAST(N'2022-06-12 08:59:08.4679189' AS DateTime2), 1)
INSERT [dbo].[Comments] ([Id], [Text], [PostId], [UserId], [ParentId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (2, N'Neki komentar', 9, 36, NULL, CAST(N'2022-06-12 08:53:29.4721080' AS DateTime2), NULL, 1)
INSERT [dbo].[Comments] ([Id], [Text], [PostId], [UserId], [ParentId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (3, N'Neki komentar', 9, 36, NULL, CAST(N'2022-06-12 08:53:31.5611453' AS DateTime2), NULL, 1)
INSERT [dbo].[Comments] ([Id], [Text], [PostId], [UserId], [ParentId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (4, N'Neki komentar', 9, 36, NULL, CAST(N'2022-06-12 08:53:33.4159839' AS DateTime2), CAST(N'2022-06-12 09:00:38.3360422' AS DateTime2), 0)
INSERT [dbo].[Comments] ([Id], [Text], [PostId], [UserId], [ParentId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (5, N'Neki komentar 1', 9, 36, 1, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), CAST(N'2022-06-12 09:00:06.0210258' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, N'Get categories', N'Unregistred user', N'{"Name":null,"Page":1,"PerPage":10}', CAST(N'2022-06-09 12:25:40.6591881' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (2, N'Get categories', N'Unregistred user', N'{"Name":null,"Page":1,"PerPage":10}', CAST(N'2022-06-09 12:27:47.5804476' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (3, N'Get one category', N'Unregistred user', N'16', CAST(N'2022-06-09 12:30:40.3823313' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (4, N'Get one category', N'Unregistred user', N'16', CAST(N'2022-06-09 12:32:05.1691808' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (5, N'Get categories', N'Unregistred user', N'{"Name":null,"Page":1,"PerPage":10}', CAST(N'2022-06-09 12:34:34.1487019' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (6, N'Get categories', N'Unregistred user', N'{"Name":null,"Page":1,"PerPage":10}', CAST(N'2022-06-09 12:37:24.7424593' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (7, N'Get categories', N'Lena.Fadel8', N'{"Name":null,"Page":1,"PerPage":10}', CAST(N'2022-06-09 14:51:34.9632414' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (8, N'Get categories', N'Ernest12', N'{"Name":null,"Page":1,"PerPage":10}', CAST(N'2022-06-09 14:54:46.8242152' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (9, N'Get one category', N'Ernest12', N'16', CAST(N'2022-06-09 14:55:09.1764937' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (10, N'Get one category', N'Ernest12', N'7', CAST(N'2022-06-09 14:55:33.6838954' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (11, N'Get one category', N'Ernest12', N'17', CAST(N'2022-06-09 14:55:51.5759188' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (12, N'Get categories', N'Ernest12', N'{"Name":null,"Page":1,"PerPage":10}', CAST(N'2022-06-11 15:34:28.7826759' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (13, N'Get one category', N'Ernest12', N'16', CAST(N'2022-06-11 15:34:59.7904494' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (14, N'Get categories', N'Ernest12', N'{"Name":"Funny","Page":1,"PerPage":10}', CAST(N'2022-06-11 15:35:38.5536666' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (15, N'Get categories', N'Ernest12', N'{"Name":"a","Page":1,"PerPage":10}', CAST(N'2022-06-11 15:35:47.6671878' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (16, N'Get users', N'Ernest12', N'{"Keyword":null,"Page":1,"PerPage":10}', CAST(N'2022-06-11 15:37:09.5558716' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (17, N'Get one user', N'Ernest12', N'36', CAST(N'2022-06-11 15:37:28.6869658' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (18, N'Get one user', N'Ernest12', N'37', CAST(N'2022-06-11 15:37:52.1063053' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (19, N'Get users', N'Ernest12', N'{"Keyword":"Margot","Page":1,"PerPage":10}', CAST(N'2022-06-11 15:38:16.7347140' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (20, N'Get users', N'Ernest12', N'{"Keyword":"Brenna","Page":1,"PerPage":10}', CAST(N'2022-06-11 15:38:26.1342516' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (21, N'Get users', N'Ernest12', N'{"Keyword":"Jaskolski","Page":1,"PerPage":10}', CAST(N'2022-06-11 15:38:39.5140169' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (22, N'Get users', N'Ernest12', N'{"Keyword":"as","Page":1,"PerPage":10}', CAST(N'2022-06-11 15:39:05.6725131' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (23, N'Get one user', N'Ernest12', N'1', CAST(N'2022-06-11 15:39:20.7343746' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (24, N'Get Posts', N'Ernest12', N'{"Keyword":null,"CategoryId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-11 15:40:07.6990608' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (25, N'Get one post', N'Ernest12', N'6', CAST(N'2022-06-11 15:41:15.1649196' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (26, N'Get one post', N'Ernest12', N'7', CAST(N'2022-06-11 15:41:29.0297127' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (27, N'Get Posts', N'Ernest12', N'{"Keyword":"Sport","CategoryId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-11 15:43:21.2541315' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (28, N'Get Posts', N'Ernest12', N'{"Keyword":"a","CategoryId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-11 15:43:33.5118326' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (29, N'Get Posts', N'Ernest12', N'{"Keyword":"Doloribus","CategoryId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-11 15:43:51.2778488' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (30, N'Create Post', N'Ernest12', N'{"Id":null,"Title":"neki tekst","Description":"neki tekst 2","Image":"putanja.png","NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"header2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"header2.jpg\""],"Content-Type":["image/jpeg"]},"Length":22339,"Name":"NewImage","FileName":"header2.jpg"},"UserId":17,"CategoryId":1}', CAST(N'2022-06-11 15:46:18.6742794' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (31, N'Create Post', N'Ernest12', N'{"Id":null,"Title":"neki tekst","Description":"neki tekst 2","Image":"putanja.png","NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"header2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"header2.jpg\""],"Content-Type":["image/jpeg"]},"Length":22339,"Name":"NewImage","FileName":"header2.jpg"},"UserId":37,"CategoryId":7}', CAST(N'2022-06-11 15:46:52.3662064' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (32, N'Create Post', N'Ernest12', N'{"Id":null,"Title":"neki tekst","Description":"neki tekst 2","Image":"putanja.png","NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"header2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"header2.jpg\""],"Content-Type":["image/jpeg"]},"Length":22339,"Name":"NewImage","FileName":"header2.jpg"},"UserId":37,"CategoryId":17}', CAST(N'2022-06-11 15:47:17.5116447' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (33, N'Create Post', N'Ernest12', N'{"Id":null,"Title":"neki tekst","Description":"neki tekst 2","Image":"putanja.png","NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"header2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"header2.jpg\""],"Content-Type":["image/jpeg"]},"Length":22339,"Name":"NewImage","FileName":"header2.jpg"},"UserId":39,"CategoryId":19}', CAST(N'2022-06-11 15:53:32.6070989' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (34, N'Create Post', N'Ernest12', N'{"Id":null,"Title":"neki tekst 2","Description":"neki tekst 4","Image":"putanja.png","NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"header2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"header2.jpg\""],"Content-Type":["image/jpeg"]},"Length":22339,"Name":"NewImage","FileName":"header2.jpg"},"UserId":39,"CategoryId":19}', CAST(N'2022-06-11 15:54:04.1589036' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (35, N'Update post', N'Ernest12', N'{"Id":39,"Title":"neki tekst 2","Description":"neki tekst 6","Image":"putanja.png","NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"header2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"header2.jpg\""],"Content-Type":["image/jpeg"]},"Length":22339,"Name":"NewImage","FileName":"header2.jpg"},"UserId":40,"CategoryId":19}', CAST(N'2022-06-11 15:55:08.4105786' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (36, N'Update post', N'Ernest12', N'{"Id":7,"Title":"neki tekst 2","Description":"neki tekst 6","Image":"putanja.png","NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"header2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"header2.jpg\""],"Content-Type":["image/jpeg"]},"Length":22339,"Name":"NewImage","FileName":"header2.jpg"},"UserId":40,"CategoryId":19}', CAST(N'2022-06-11 15:58:03.3255831' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (37, N'Update post', N'Ernest12', N'{"Id":7,"Title":"neki tekst 10","Description":"neki tekst 6","Image":"putanja.png","NewImage":{"ContentDisposition":"form-data; name=\"NewImage\"; filename=\"header2.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"NewImage\"; filename=\"header2.jpg\""],"Content-Type":["image/jpeg"]},"Length":22339,"Name":"NewImage","FileName":"header2.jpg"},"UserId":40,"CategoryId":19}', CAST(N'2022-06-11 15:58:57.1846637' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (38, N'Delete post using EF', N'Ernest12', N'16', CAST(N'2022-06-11 16:00:29.4699421' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (39, N'Create Category', N'Unregistred user', N'{"Name":"Top","Posts":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-11 16:11:03.7362201' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (40, N'Create Category', N'Ernest12', N'{"Name":"Top","Posts":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-11 16:12:42.0968460' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (41, N'Create Category', N'Ernest12', N'{"Name":"Funny","Posts":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-11 16:12:53.5545013' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (42, N'Delete category', N'Ernest12', N'21', CAST(N'2022-06-11 16:14:32.2151444' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (43, N'Admin create User', N'Ernest12', N'{"FirstName":"Pera","LastName":"Peric","Username":"pera123","Email":null,"Password":"sifra123","IsAdmin":true,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:40:33.6550921' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (44, N'Admin create User', N'Ernest12', N'{"FirstName":"Pera","LastName":"Peric","Username":"pera123","Email":"pera@gmail.com","Password":"sifra123","IsAdmin":true,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:41:26.7607447' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (45, N'Admin create User', N'Ernest12', N'{"FirstName":"Perac","LastName":"Pericc","Username":"pera1234","Email":"pera123@gmail.com","Password":"sifra123","IsAdmin":false,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:42:14.3378815' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (46, N'Admin update user', N'Ernest12', N'{"FirstName":"Perac","LastName":"Pericc","Username":"pera1234","Email":"pera123@gmail.com","Password":"sifra123","IsAdmin":true,"Id":52,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:43:08.2067524' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (47, N'Admin update user', N'Ernest12', N'{"FirstName":"Perivoje","LastName":"Peric","Username":"pera1234","Email":"pera123@gmail.com","Password":"sifra123","IsAdmin":true,"Id":52,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:43:50.8503488' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (48, N'Admin update user', N'Ernest12', N'{"FirstName":"Perivoje","LastName":"Peric","Username":"pera1234","Email":"pera123@gmail.com","Password":"sifra123","IsAdmin":true,"Id":52,"IsActive":true,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:44:29.5940243' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (49, N'Admin delete user', N'Ernest12', N'52', CAST(N'2022-06-12 08:45:05.5527395' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (50, N'Get Comments', N'Ernest12', N'{"UserId":null,"PostId":null,"ParentId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-12 08:48:54.7187966' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (51, N'Create new comment ef', N'Ernest12', N'{"Text":null,"PostId":9,"UserId":51,"ParentId":null,"ChildComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:52:40.0962303' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (52, N'Create new comment ef', N'Ernest12', N'{"Text":"Neki komentar","PostId":9,"UserId":51,"ParentId":null,"ChildComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:52:57.3876188' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (53, N'Create new comment ef', N'Ernest12', N'{"Text":"Neki komentar","PostId":9,"UserId":51,"ParentId":null,"ChildComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:53:29.3951036' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (54, N'Create new comment ef', N'Ernest12', N'{"Text":"Neki komentar","PostId":9,"UserId":51,"ParentId":null,"ChildComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:53:31.5571451' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (55, N'Create new comment ef', N'Ernest12', N'{"Text":"Neki komentar","PostId":9,"UserId":51,"ParentId":null,"ChildComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:53:33.3899824' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (56, N'Get Comments', N'Ernest12', N'{"UserId":null,"PostId":null,"ParentId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-12 08:54:04.1331195' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (57, N'Get one comment', N'Ernest12', N'3', CAST(N'2022-06-12 08:54:26.9746684' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (58, N'Create new comment ef', N'Ernest12', N'{"Text":"Neki komentar 2","PostId":9,"UserId":50,"ParentId":1,"ChildComments":[],"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:55:11.0456702' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (59, N'Get Comments', N'Ernest12', N'{"UserId":null,"PostId":null,"ParentId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-12 08:55:38.4329088' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (60, N'Update comment', N'Ernest12', N'{"Text":"Neki komentar 1","PostId":9,"UserId":50,"ParentId":null,"ChildComments":[],"Id":1,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:57:53.8524597' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (61, N'Get Comments', N'Ernest12', N'{"UserId":null,"PostId":null,"ParentId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-12 08:58:25.5523754' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (62, N'Update comment', N'Ernest12', N'{"Text":"Neki komentar 1","PostId":9,"UserId":50,"ParentId":null,"ChildComments":[],"Id":1,"IsActive":true,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 08:59:08.4579184' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (63, N'Get Comments', N'Ernest12', N'{"UserId":null,"PostId":null,"ParentId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-12 08:59:18.2905226' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (64, N'Update comment', N'Ernest12', N'{"Text":"Neki komentar 1","PostId":9,"UserId":50,"ParentId":1,"ChildComments":[],"Id":5,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 09:00:06.0110252' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (65, N'Get one comment', N'Ernest12', N'1', CAST(N'2022-06-12 09:00:13.6444265' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (66, N'Delete comment', N'Ernest12', N'4', CAST(N'2022-06-12 09:00:38.3240416' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (67, N'Get post ratings', N'Ernest12', N'{"PostId":null,"UserId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-12 09:02:26.7816876' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (68, N'Create post rating', N'Ernest12', N'{"Rating":7,"PostId":9,"UserId":50,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 09:04:03.5324873' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (69, N'Create post rating', N'Ernest12', N'{"Rating":4,"PostId":9,"UserId":50,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 09:04:21.7284624' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (70, N'Create post rating', N'Ernest12', N'{"Rating":5,"PostId":9,"UserId":50,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 09:05:24.3142083' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (71, N'Create post rating', N'Ernest12', N'{"Rating":0,"PostId":9,"UserId":50,"User":null,"Id":0,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 09:05:51.0763037' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (72, N'Update post rating', N'Ernest12', N'{"Rating":5,"PostId":9,"UserId":50,"User":null,"Id":1,"IsActive":false,"CreatedAt":"0001-01-01T00:00:00","UpdatedAt":null}', CAST(N'2022-06-12 09:06:30.9343334' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (73, N'Get post ratings', N'Ernest12', N'{"PostId":null,"UserId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-12 09:06:52.8562046' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (74, N'Get one post rating', N'Ernest12', N'2', CAST(N'2022-06-12 09:07:31.3495867' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (75, N'Get one post rating', N'Unregistred user', N'2', CAST(N'2022-06-12 09:07:44.5726473' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (76, N'Get one post rating', N'Ernest12', N'2', CAST(N'2022-06-12 09:10:17.0230762' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (77, N'Get post ratings', N'Ernest12', N'{"PostId":null,"UserId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-12 09:10:41.0279714' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (78, N'Get one post rating', N'Ernest12', N'1', CAST(N'2022-06-12 09:10:53.4161609' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (79, N'Get post ratings', N'Ernest12', N'{"PostId":null,"UserId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-12 09:12:03.6099736' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (80, N'Get Posts', N'Ernest12', N'{"Keyword":null,"CategoryId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-12 09:12:13.9382918' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (81, N'Get one post', N'Ernest12', N'9', CAST(N'2022-06-12 09:12:20.3366571' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (82, N'Get one post', N'Ernest12', N'10', CAST(N'2022-06-12 09:12:51.8097927' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (83, N'Get one post', N'Ernest12', N'9', CAST(N'2022-06-12 09:13:03.1908345' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (84, N'Get one post', N'Ernest12', N'8', CAST(N'2022-06-12 09:13:06.5088902' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (85, N'Get post ratings', N'Ernest12', N'{"PostId":null,"UserId":null,"Page":1,"PerPage":10}', CAST(N'2022-06-12 09:13:38.4105982' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (86, N'Delete post rating', N'Ernest12', N'1', CAST(N'2022-06-12 09:13:54.3729100' AS DateTime2), NULL, 1)
INSERT [dbo].[Logs] ([Id], [Name], [User], [Data], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (87, N'Delete post rating', N'Ernest12', N'2', CAST(N'2022-06-12 09:14:09.8394948' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[Logs] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (5, N'Doloribus harum velit sit et nesciunt dolores.', N'Quod quod esse facilis labore soluta atque. Laborum eos rerum dolore quo facere repellendus omnis quos beatae. Accusamus unde ea molestiae aliquid quo. Maiores et ut optio voluptatibus corporis nisi sequi optio.

Nemo voluptate non et quia atque at. Nisi ad aut esse laudantium quia vitae ipsa et perferendis. Enim et consequatur atque optio.

Repudiandae aut suscipit et natus illo. Ut amet libero cupiditate aut molestiae sint sunt. Quos deleniti odit molestias architecto in. Voluptatem voluptates qui ea possimus sint et molestiae ut et. Sunt aut harum odio porro dolorem cumque dolores.', N'48c3054e-4de6-45ba-b6f9-757ca588a13e.jpg', 36, 18, CAST(N'2022-06-08 11:29:51.1521309' AS DateTime2), NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (6, N'Velit sint et qui quam quod nobis ipsam consequatur officia.', N'Laboriosam voluptatibus architecto asperiores quam eligendi. Qui est maxime nostrum corporis possimus ut animi placeat illo. Minima consequatur in rerum atque maxime veniam iste earum.

Sit sint facilis ducimus exercitationem incidunt doloribus natus dignissimos. Dolores quod ipsa magnam libero. Quia eum quasi eos.

Et nemo dolore et cumque. Voluptas quo et placeat earum dolorum. Dolorem est vero laudantium fugit est consectetur. Laudantium ratione et sed iure illum cupiditate. Est accusamus debitis eveniet et cum laboriosam velit dolores provident. Ut minus et eum et quam.', N'19e84436-e6f5-4416-8d01-65f9b8d681db.jpg', 36, 19, CAST(N'2022-06-08 11:29:51.1521309' AS DateTime2), NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (7, N'neki tekst 10', N'neki tekst 6', N'7f07731f-e9e0-4f99-bddc-144a312b27eb.jpg', 36, 19, CAST(N'2022-06-08 11:29:51.1521309' AS DateTime2), CAST(N'2022-06-11 15:58:57.2466672' AS DateTime2), 1)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (8, N'Vel minus amet molestiae.', N'Illum molestiae repellendus non vel dicta aliquid. Distinctio et sed tenetur ipsum eius quisquam. Nostrum fuga eum ut molestias ullam cupiditate.

Laborum voluptatem facilis. Ut quis soluta reprehenderit eos cumque aut ut. Eaque ea temporibus quidem alias numquam ut nemo quo autem. Et odio natus mollitia rerum architecto. Et tenetur aut sed itaque nihil consequatur. Et cupiditate error aperiam sint.

Autem qui rem facere accusamus. Enim molestiae temporibus ut ea. Vero et consequatur vitae. Et sit quia minima aut quo nihil vitae. Nobis dolor vel maxime cum ad aut qui et.', N'6f0e53a8-abf4-4b88-a180-5eb855b0fdc4.jpg', 36, 18, CAST(N'2022-06-08 11:29:51.1521309' AS DateTime2), NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (9, N'Quia necessitatibus sed eius mollitia accusantium quia corporis culpa voluptatum.', N'Fuga odio illum ut suscipit ea. Sunt placeat ab. Ipsa laborum non unde quae modi vitae nihil. Quo eum sapiente vero eos. Laborum magnam deleniti provident voluptas id aut ad sequi earum. Impedit earum in qui quos tempora architecto eius neque est.

Minima vitae dolores ab tempore sunt. Deleniti a odit quis autem placeat sunt numquam quia. Nesciunt suscipit autem.

Sint qui accusantium. Nisi id rerum quidem cumque aliquid unde assumenda. Qui nisi omnis quia. Ea praesentium ut id similique est fugiat ea. Accusamus sequi alias.', N'35152f77-77f5-4be4-9e09-d3bd1d473552.jpg', 36, 17, CAST(N'2022-06-08 11:29:51.1521309' AS DateTime2), NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (10, N'Est officiis nesciunt error ex.', N'Tempora consectetur mollitia quia ea sit et reiciendis necessitatibus voluptas. Excepturi tenetur harum perferendis ratione voluptatem repudiandae in esse. Earum deserunt perferendis deleniti cumque vitae vero eveniet ipsa.

Non modi voluptatum ipsum et est velit unde commodi at. Dolore consequatur facilis ab rerum cum qui. Et omnis est. Veniam animi culpa voluptas. Itaque iure vitae nulla debitis officiis voluptatibus qui. Nulla minima quas quo.

Alias molestiae nisi. Fugiat et dignissimos. Dolorem aperiam incidunt non.', N'e6dfcae4-4072-45b0-a9ed-29a01ff40175.jpg', 36, 16, CAST(N'2022-06-08 11:29:51.1521309' AS DateTime2), NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (11, N'Aspernatur consectetur sunt quis aut dolores est reiciendis est tempore.', N'Nam voluptatem deleniti fugiat. Molestias earum placeat iste quia vero. Similique consequatur ab dolores sed. Consequatur facilis distinctio veritatis harum delectus enim doloribus optio numquam.

Incidunt possimus aut. Ipsum suscipit sapiente ut quo cupiditate nostrum laudantium commodi aut. Ipsam porro et dignissimos fugit. Vero eos quisquam rem animi nobis sint natus laudantium.

Voluptas deleniti necessitatibus aut minima eligendi fugiat porro. At sed veniam ex velit optio distinctio. A enim eveniet assumenda nemo ullam autem eveniet. Ea similique est dignissimos temporibus. Quo similique dolores aut vitae. Aperiam voluptatem delectus qui.', N'6a214d88-c13d-404b-aa50-99b59a3b76bb.jpg', 36, 17, CAST(N'2022-06-08 11:29:51.1521309' AS DateTime2), NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (12, N'Sint et in consequatur ad ut voluptatem.', N'Adipisci sint tenetur sit sit sint sed. Nostrum voluptatem et. Et hic sunt. Veritatis illum in in et dolore non ipsa minus. Quisquam voluptatem rerum magni nam fuga. Amet inventore quibusdam laborum fugit cumque similique.

Minus cumque distinctio. At nihil consequatur culpa non dicta. Atque soluta rerum maiores voluptates quis.

Rerum qui neque animi dignissimos non aut saepe est. Hic fugit aut quis. Sint tempora eum et provident sit ipsam corporis et culpa. Beatae quas aut consequatur. Dolorem ut est ratione eos sunt aut eius. Ut consequatur incidunt ea voluptatem aut iusto fugit voluptas et.', N'2200c60b-66c8-41a7-a767-1d2c2f8b44be.jpg', 36, 17, CAST(N'2022-06-08 11:29:51.1521309' AS DateTime2), NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (13, N'Non quae ut omnis similique voluptas et sit voluptatem.', N'Dolor sapiente rem quia non. Tempora illo rerum quia. Quis natus quia vitae. Expedita id maxime sapiente quod soluta ab ipsum dolor quidem.

Voluptatem voluptas vitae a molestias mollitia doloremque. Recusandae eos omnis adipisci necessitatibus. Corrupti quidem consequatur omnis impedit sunt atque earum. Esse sint corrupti harum aspernatur voluptates corporis. In dolore est aperiam et. Quia omnis sapiente.

Delectus occaecati nulla omnis architecto doloremque adipisci esse aut. Molestiae nihil explicabo. Maxime libero odio.', N'e3a3a0b5-ee52-4bfc-af82-b91a23fa8904.jpg', 36, 17, CAST(N'2022-06-08 11:29:51.1521309' AS DateTime2), NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (14, N'Delectus recusandae ea.', N'Sit hic et cum accusamus mollitia nesciunt voluptatibus placeat. Libero aut et similique delectus esse. Et dolores dolores voluptatem et qui iste. Accusamus consequatur assumenda omnis repellat et blanditiis suscipit quisquam distinctio. Fugiat ex quia illum facilis ipsa dolor.

Aut soluta aut rem id commodi. Eos magni deleniti. Consequuntur nobis est repellat tempora reprehenderit modi.

Numquam rerum nisi voluptates. Qui dolore culpa soluta at. Voluptatum autem dolores pariatur consectetur. Exercitationem sequi quidem numquam deserunt. Labore magni voluptatum ratione.', N'794d09b7-548d-4c1f-b4f6-c52ee118a1b5.jpg', 36, 19, CAST(N'2022-06-08 11:29:51.1521309' AS DateTime2), NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (15, N'neki tekst', N'neki tekst 2', N'c75ce9ec-81a4-40fc-a11c-e98f38a804dd.jpg', 36, 17, CAST(N'2022-06-11 15:47:17.5426465' AS DateTime2), NULL, 1)
INSERT [dbo].[Posts] ([Id], [Title], [Description], [Image], [UserId], [CategoryId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (16, N'neki tekst 2', N'neki tekst 4', N'c00759f4-be85-4be8-910c-9e140075f9d7.jpg', 36, 19, CAST(N'2022-06-11 15:54:04.3059120' AS DateTime2), CAST(N'2022-06-11 16:00:29.4909433' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([Id], [RatingNumber], [UserId], [PostId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, 0, 36, 9, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), CAST(N'2022-06-12 09:06:30.9983371' AS DateTime2), 0)
INSERT [dbo].[Ratings] ([Id], [RatingNumber], [UserId], [PostId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (2, 0, 36, 9, CAST(N'2022-06-12 09:05:24.4242146' AS DateTime2), CAST(N'2022-06-12 09:14:09.9014983' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Ratings] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (36, N'Marquise83@example.com', N'$2a$11$bRueDO/QHcsfMHn7rmSr9OBLBCnRz6c2qbVx5l3AnxT.qR3w/C/CS', N'Ernest12', N'Brenna', N'Jaskolski', 1, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (37, N'Kip_Ferry@example.org', N'$2a$11$7tmdlrONOKRRmCcoidPbHe1z3aE0.qB9A1.kNc8nVHpN4pB4G1dsa', N'Tammy_Tromp', N'Margot', N'Bechtelar', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (38, N'Loraine68@example.net', N'$2a$11$KbtMlbCgr9R/Put/Hc.9eOUttRSqolRKKV1jr/eFj4KwsRBZL52N6', N'Lena.Fadel8', N'Emmett', N'Bernier', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (39, N'Keven_Walter@example.net', N'$2a$11$qr3zreYE.NwDHOlx2E2FqOBToiPPKC5WXzYzpCBMWBX5nhLI0Vpki', N'Elsa.Kerluke36', N'Blaze', N'Toy', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (40, N'Emerson.Kautzer55@example.org', N'$2a$11$rW5bkUezul/s46wqf6nMUevM8S45/epreXIEmu/KGZEAh8BHG9Cvq', N'Roman_Reynolds', N'Florian', N'Deckow', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (41, N'Joany_Wyman82@example.net', N'$2a$11$3P6DaCSmtolkRAjLXLm3POnKULU3M5bbneWPfjNGPrcPICH2gE7TK', N'Gustavo_Romaguera97', N'Lou', N'Reichel', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (42, N'Tara.Brekke82@example.net', N'$2a$11$6PS6hq2sZaC1YV0Hr74LUuJU3rWfoVBoLx6/FUxGcSYIvD8/bwKay', N'Frank_Pfeffer', N'Lilla', N'Gleichner', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (43, N'Rose.Stamm55@example.com', N'$2a$11$vA5np5GvOl/mNAUOsTrGHOppmplbZE148cIKMaiMKKJ3W5AHypeUK', N'Ginger_Harris32', N'Keenan', N'Frami', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (44, N'Candido_Pfeffer@example.org', N'$2a$11$9Ew2jwasnaAlPfD/F11wZuFSlpqJsX9P//6RNQOY6VELUoJfFToaW', N'Jerome_Trantow', N'Taylor', N'Brown', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (45, N'Giovanna96@example.org', N'$2a$11$ewhZ07J9KaqU5SYvMBvzV.Js4LKvx2i6RpL2qm/gBYTheGNdcQ3rK', N'Anne.Littel38', N'Erich', N'Champlin', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (46, N'Delfina12@example.net', N'$2a$11$.HkF13xGz3v7XDKWzl/wieA3zgLRUzsVaev4XvvwFusIajbXjaNbS', N'Leigh.Maggio24', N'Abdul', N'Macejkovic', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (47, N'Brady22@example.net', N'$2a$11$MpsPmuRBbBGSqn0YCTHMfe0uTLL8Dt9nK2EFSpkWG29sU/JysUBZu', N'Warren_Bogan28', N'Brielle', N'Windler', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (48, N'Ahmad54@example.net', N'$2a$11$/ZmPNqo/Ap4X7EcCCo40iO0LaWmyUPpg8AFrLE1NWZZQIijq0rft6', N'Reginald.Hartmann', N'Jules', N'Watsica', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (49, N'Cruz.Bernhard@example.net', N'$2a$11$RRfO1gl1MoIN.GM2I8reeeV0cxpcGiwd94/Nn9J0SdtfAWABLvsEG', N'Melba_Jaskolski', N'Aniyah', N'Spinka', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (50, N'Emmalee_Schultz40@example.com', N'$2a$11$cMrbBtFiZYlmVFVYwaCe2uUZ9zxs3Rmp6SWuSix9dOzOWjUqDQ/eS', N'Hugo_Waelchi', N'Ibrahim', N'Heller', 0, CAST(N'2022-06-08 11:26:50.5568014' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (51, N'pera@gmail.com', N'$2a$11$XMJozeka3h7CO.ZVgpbesOaGAVkJpg1SHXdXXwOSZqiP/.GX6SEC2', N'pera123', N'Pera', N'Peric', 1, CAST(N'2022-06-12 08:41:27.0927637' AS DateTime2), NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [IsAdmin], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (52, N'pera123@gmail.com', N'$2a$11$i9I7LGc6Sj6ophhLNu8IU.OvGQ90es9vjdmyhUvuNtY1M0HI8Ooqq', N'pera1234', N'Perivoje', N'Peric', 1, CAST(N'0001-01-01 00:00:00.0000000' AS DateTime2), CAST(N'2022-06-12 08:45:05.5577398' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (1, 2, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (2, 3, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (3, 9, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (4, 10, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (5, 14, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (6, 15, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (7, 16, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (8, 18, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (9, 17, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (10, 19, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (11, 20, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (12, 26, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (13, 28, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (14, 27, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (15, 29, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
INSERT [dbo].[UserUseCases] ([Id], [UseCaseId], [UserId], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (16, 30, 52, CAST(N'2022-06-12 08:42:14.6418989' AS DateTime2), NULL, 1)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_ParentId]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_ParentId] ON [dbo].[Comments]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_PostId]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_PostId] ON [dbo].[Comments]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_CategoryId]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_CategoryId] ON [dbo].[Posts]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_UserId]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_UserId] ON [dbo].[Posts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ratings_PostId]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_Ratings_PostId] ON [dbo].[Ratings]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ratings_UserId]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_Ratings_UserId] ON [dbo].[Ratings]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Users_Email]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Users_Username]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)
WHERE ([Username] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 6/12/2022 11:58:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comments_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Comments_ParentId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Posts_PostId]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Users_UserId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [aspost] SET  READ_WRITE 
GO
