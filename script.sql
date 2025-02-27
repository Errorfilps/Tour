USE [master]
GO
/****** Object:  Database [TourBaseSaidmuradov]    Script Date: 03.06.2024 13:19:16 ******/
CREATE DATABASE [TourBaseSaidmuradov]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TourBaseSaidmuradov', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TourBaseSaidmuradov.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'TourBaseSaidmuradov_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TourBaseSaidmuradov_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TourBaseSaidmuradov] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TourBaseSaidmuradov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TourBaseSaidmuradov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET ARITHABORT OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET RECOVERY FULL 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET  MULTI_USER 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TourBaseSaidmuradov] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TourBaseSaidmuradov] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TourBaseSaidmuradov]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 03.06.2024 13:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 03.06.2024 13:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[CountOfStarts] [int] NULL,
	[CountryCode] [nchar](2) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 03.06.2024 13:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NULL,
	[Text] [nvarchar](max) NULL,
	[Author] [nvarchar](100) NULL,
	[GrationDate] [datetime] NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 03.06.2024 13:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NULL,
	[ImageSource] [varbinary](100) NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTure]    Script Date: 03.06.2024 13:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTure](
	[HotelId] [int] NOT NULL,
	[TourId] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTure] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC,
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 03.06.2024 13:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Descropshion] [nvarchar](100) NULL,
	[ImagePrewiew] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 03.06.2024 13:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Descripton] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 03.06.2024 13:19:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[Tourid] [int] NOT NULL,
	[Typeid] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[Tourid] ASC,
	[Typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ch', N'Китай')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'en', N'Англия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ru', N'Россия')
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([id], [Name], [CountOfStarts], [CountryCode]) VALUES (1, N'Космос', 5, N'ru')
INSERT [dbo].[Hotel] ([id], [Name], [CountOfStarts], [CountryCode]) VALUES (2, N'Украина', 5, N'ru')
INSERT [dbo].[Hotel] ([id], [Name], [CountOfStarts], [CountryCode]) VALUES (3, N'Four Seasons', 5, N'ru')
INSERT [dbo].[Hotel] ([id], [Name], [CountOfStarts], [CountryCode]) VALUES (4, N'Тереза', 5, N'ch')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[HotelComment] ON 

INSERT [dbo].[HotelComment] ([id], [HotelId], [Text], [Author], [GrationDate]) VALUES (1, 1, N'Замечательный', N'Иванов Иван', CAST(N'2024-02-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HotelComment] ([id], [HotelId], [Text], [Author], [GrationDate]) VALUES (2, 2, N'Лучший отель', N'Джон Дое', CAST(N'2024-02-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HotelComment] ([id], [HotelId], [Text], [Author], [GrationDate]) VALUES (3, 3, N'Есть к чему стремиться', N'Мария', CAST(N'2024-02-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[HotelComment] OFF
GO
INSERT [dbo].[HotelOfTure] ([HotelId], [TourId]) VALUES (1, 4)
INSERT [dbo].[HotelOfTure] ([HotelId], [TourId]) VALUES (2, 7)
INSERT [dbo].[HotelOfTure] ([HotelId], [TourId]) VALUES (3, 8)
INSERT [dbo].[HotelOfTure] ([HotelId], [TourId]) VALUES (4, 9)
GO
SET IDENTITY_INSERT [dbo].[Tour] ON 

INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Descropshion], [ImagePrewiew], [Price], [IsActual]) VALUES (4, 127, N'Болгарское наследие', NULL, NULL, 35700.0000, 1)
INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Descropshion], [ImagePrewiew], [Price], [IsActual]) VALUES (7, 92, N'Волшебный восток', NULL, NULL, 77100.0000, 1)
INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Descropshion], [ImagePrewiew], [Price], [IsActual]) VALUES (8, 72, N'Город с большими огнями', NULL, NULL, 93300.0000, 1)
INSERT [dbo].[Tour] ([id], [TicketCount], [Name], [Descropshion], [ImagePrewiew], [Price], [IsActual]) VALUES (9, 143, N'Город четырех ворот', NULL, NULL, 72500.0000, 0)
SET IDENTITY_INSERT [dbo].[Tour] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([Id], [Name], [Descripton]) VALUES (1, N'Международный', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Descripton]) VALUES (2, N'Внутренний', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Descripton]) VALUES (3, N'Специализированный детский ', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Descripton]) VALUES (4, N'Экскурсионный', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Descripton]) VALUES (5, N'Лечебно-оздоровительный', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Descripton]) VALUES (6, N'Культурно-исторический', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
INSERT [dbo].[TypeOfTour] ([Tourid], [Typeid]) VALUES (4, 1)
INSERT [dbo].[TypeOfTour] ([Tourid], [Typeid]) VALUES (4, 2)
INSERT [dbo].[TypeOfTour] ([Tourid], [Typeid]) VALUES (7, 3)
INSERT [dbo].[TypeOfTour] ([Tourid], [Typeid]) VALUES (8, 4)
INSERT [dbo].[TypeOfTour] ([Tourid], [Typeid]) VALUES (9, 5)
INSERT [dbo].[TypeOfTour] ([Tourid], [Typeid]) VALUES (9, 6)
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTure]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTure_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOfTure] CHECK CONSTRAINT [FK_HotelOfTure_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTure]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTure_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTure] CHECK CONSTRAINT [FK_HotelOfTure_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([Tourid])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([Typeid])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [TourBaseSaidmuradov] SET  READ_WRITE 
GO
