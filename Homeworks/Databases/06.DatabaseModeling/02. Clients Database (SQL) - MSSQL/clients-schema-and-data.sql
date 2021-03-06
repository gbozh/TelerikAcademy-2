USE [master]
GO
CREATE DATABASE [Clients]
GO
ALTER DATABASE [Clients] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clients].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clients] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clients] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clients] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clients] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clients] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clients] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clients] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clients] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clients] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clients] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clients] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clients] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clients] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clients] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clients] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clients] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clients] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clients] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clients] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clients] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clients] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clients] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clients] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Clients] SET  MULTI_USER 
GO
ALTER DATABASE [Clients] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clients] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clients] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clients] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Clients] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Clients]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressText] [text] NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[ContinentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[ContinentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[TownId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[TownId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([AddressId], [AddressText], [TownId]) VALUES (1, N'Rosa Street', 2)
INSERT [dbo].[Addresses] ([AddressId], [AddressText], [TownId]) VALUES (2, N'Karamfil Street', 2)
INSERT [dbo].[Addresses] ([AddressId], [AddressText], [TownId]) VALUES (3, N'Bul. Tsar Simeon', 1)
INSERT [dbo].[Addresses] ([AddressId], [AddressText], [TownId]) VALUES (4, N'Georgi Rakovski 23', 1)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Continents] ON 

INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (2, N'Asia')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (3, N'Australia')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (4, N'Africa')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (5, N'Antarctica')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (6, N'South America')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (7, N'North America')
SET IDENTITY_INSERT [dbo].[Continents] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (2, N'Russia', 2)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (3, N'France', 1)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (4, N'Italy', 1)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (5, N'United States', 7)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (6, N'Cuba', 7)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (7, N'Brazil', 6)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (8, N'Colombia', 6)
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [AddressId]) VALUES (1, N'Ivan', N'Petrov', 1)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [AddressId]) VALUES (2, N'Peter', N'Georgiev', 2)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [AddressId]) VALUES (3, N'Ralitsa', N'Petrova', 3)
INSERT [dbo].[Persons] ([PersonId], [FirstName], [LastName], [AddressId]) VALUES (4, N'Rumqna', N'Osiak', 4)
SET IDENTITY_INSERT [dbo].[Persons] OFF
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (2, N'Varna', 1)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (3, N'Bourgas', 1)
INSERT [dbo].[Towns] ([TownId], [Name], [CountryId]) VALUES (4, N'Moscow', 2)
SET IDENTITY_INSERT [dbo].[Towns] OFF
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([TownId])
REFERENCES [dbo].[Towns] ([TownId])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Continents] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continents] ([ContinentId])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Continents]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Addresses]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Countries]
GO
USE [master]
GO
ALTER DATABASE [Clients] SET  READ_WRITE 
GO
