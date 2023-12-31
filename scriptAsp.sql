USE [master]
GO
/****** Object:  Database [CookingBlogApi]    Script Date: 31.8.2023. 18:12:03 ******/
CREATE DATABASE [CookingBlogApi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CookingBlogApi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CookingBlogApi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CookingBlogApi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CookingBlogApi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CookingBlogApi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CookingBlogApi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CookingBlogApi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CookingBlogApi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CookingBlogApi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CookingBlogApi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CookingBlogApi] SET ARITHABORT OFF 
GO
ALTER DATABASE [CookingBlogApi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CookingBlogApi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CookingBlogApi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CookingBlogApi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CookingBlogApi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CookingBlogApi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CookingBlogApi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CookingBlogApi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CookingBlogApi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CookingBlogApi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CookingBlogApi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CookingBlogApi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CookingBlogApi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CookingBlogApi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CookingBlogApi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CookingBlogApi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CookingBlogApi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CookingBlogApi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CookingBlogApi] SET  MULTI_USER 
GO
ALTER DATABASE [CookingBlogApi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CookingBlogApi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CookingBlogApi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CookingBlogApi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CookingBlogApi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CookingBlogApi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CookingBlogApi] SET QUERY_STORE = OFF
GO
USE [CookingBlogApi]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 31.8.2023. 18:12:03 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogImages]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogImages](
	[ImageId] [int] NOT NULL,
	[BlogId] [int] NOT NULL,
 CONSTRAINT [PK_BlogImages] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC,
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[TextContent] [nvarchar](max) NULL,
	[AuthorId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogTags]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogTags](
	[BlogId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_BlogTags] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[ParentCommentId] [int] NULL,
	[Text] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](250) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoggEntries]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoggEntries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UseCaseName] [nvarchar](450) NOT NULL,
	[UserId] [int] NOT NULL,
	[Username] [nvarchar](450) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[IsAuthorized] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoggEntries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BlogId] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagValue] [nvarchar](15) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](25) NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[ProfileImageId] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 31.8.2023. 18:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230829142400_all', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230829145058_one new', N'5.0.17')
GO
INSERT [dbo].[BlogImages] ([ImageId], [BlogId]) VALUES (2, 1)
INSERT [dbo].[BlogImages] ([ImageId], [BlogId]) VALUES (2, 2)
INSERT [dbo].[BlogImages] ([ImageId], [BlogId]) VALUES (2, 4)
INSERT [dbo].[BlogImages] ([ImageId], [BlogId]) VALUES (2, 6)
INSERT [dbo].[BlogImages] ([ImageId], [BlogId]) VALUES (3, 1)
INSERT [dbo].[BlogImages] ([ImageId], [BlogId]) VALUES (4, 1)
INSERT [dbo].[BlogImages] ([ImageId], [BlogId]) VALUES (5, 2)
INSERT [dbo].[BlogImages] ([ImageId], [BlogId]) VALUES (6, 2)
INSERT [dbo].[BlogImages] ([ImageId], [BlogId]) VALUES (9, 5)
INSERT [dbo].[BlogImages] ([ImageId], [BlogId]) VALUES (9, 7)
INSERT [dbo].[BlogImages] ([ImageId], [BlogId]) VALUES (9, 8)
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [Title], [TextContent], [AuthorId], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'Nov Blog', N'Nov blog content', 1, 4, CAST(N'2023-08-29T16:43:32.3200000' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Blogs] ([Id], [Title], [TextContent], [AuthorId], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, N'Blog 2', N'Blog 2 content', 1, 8, CAST(N'2023-08-30T11:16:14.3644621' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[Blogs] ([Id], [Title], [TextContent], [AuthorId], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, N'Blog 3', N'Blog 2 content', 2, 8, CAST(N'2023-08-30T11:32:31.1800262' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[Blogs] ([Id], [Title], [TextContent], [AuthorId], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, N'Novi Blogg', N'Novi content bloga', 2, 3, CAST(N'2023-08-30T11:36:56.8407963' AS DateTime2), CAST(N'2023-08-30T14:53:03.5079609' AS DateTime2), NULL, 1, NULL, N'saska@gmail.com', N'saska@gmail.com')
INSERT [dbo].[Blogs] ([Id], [Title], [TextContent], [AuthorId], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, N'Novi Blog', N'Novi content bloga', 2, 3, CAST(N'2023-08-30T14:21:13.7702068' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[Blogs] ([Id], [Title], [TextContent], [AuthorId], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, N'Novi Blog 1', N'Novi content bloga', 2, 8, CAST(N'2023-08-30T14:33:00.7426000' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[Blogs] ([Id], [Title], [TextContent], [AuthorId], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, N'Novi Blog 5', N'Novi content bloga', 2, 8, CAST(N'2023-08-30T14:45:09.7261488' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (1, 1)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (2, 1)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (4, 1)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (5, 1)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (6, 1)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (7, 1)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (8, 1)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (7, 2)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (8, 2)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (1, 4)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (2, 5)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (4, 5)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (5, 5)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (6, 5)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (7, 5)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (8, 5)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (4, 6)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (5, 6)
INSERT [dbo].[BlogTags] ([BlogId], [TagId]) VALUES (8, 6)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'Cat 1', CAST(N'2023-08-29T16:41:03.0133333' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, N'Cat 2', CAST(N'2023-08-29T16:41:08.7866667' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, N'Cat 3', CAST(N'2023-08-29T16:41:13.3866667' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, N'Blog Cat NOVA', CAST(N'2023-08-29T16:43:32.1233333' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, N'Najnovija cat', CAST(N'2023-08-30T10:56:58.3629493' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, N'KategorijaIspravka', CAST(N'2023-08-30T11:09:37.7575980' AS DateTime2), CAST(N'2023-08-30T11:10:08.8324091' AS DateTime2), CAST(N'2023-08-30T11:10:28.2562132' AS DateTime2), 0, N'test@gmail.com', N'test@gmail.com', N'test@gmail.com')
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, N'Kategorija', CAST(N'2023-08-30T11:16:14.1156097' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, N'Kategorija 4', CAST(N'2023-08-30T11:36:56.6452607' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [BlogId], [AuthorId], [ParentCommentId], [Text], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 1, 2, NULL, N'Odusevljena sam ovim blogom.', CAST(N'2023-08-30T11:41:40.6138958' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[Comments] ([Id], [BlogId], [AuthorId], [ParentCommentId], [Text], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, 1, 1, 1, N'Hvala Vam!', CAST(N'2023-08-30T11:42:21.5948662' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[Comments] ([Id], [BlogId], [AuthorId], [ParentCommentId], [Text], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 4, 1, NULL, N'Obozavam Vase recepte, ideje su sjajne.', CAST(N'2023-08-30T11:43:35.6393193' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'260d3228-96ae-42b6-bb31-f265d1368985.png', CAST(N'2023-08-29T16:28:07.6166667' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, N'IMAGE.jpg', CAST(N'2023-08-29T16:43:32.1466667' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, N'img.jpg', CAST(N'2023-08-29T16:43:32.1466667' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, N'skroznova.jpg', CAST(N'2023-08-29T16:43:32.1466667' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, N'img1.jpg', CAST(N'2023-08-30T11:16:14.1156086' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, N'novaSlika.png', CAST(N'2023-08-30T11:19:08.6435018' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, N'fd8368ad-f76b-4b0d-bf97-c405d2e4a28d.png', CAST(N'2023-08-30T11:22:00.5363840' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, N'IMAGE2.jpg', CAST(N'2023-08-30T11:36:56.6452573' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[Images] ([Id], [Path], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, N'IMAGE1.jpg', CAST(N'2023-08-30T14:33:00.7425965' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Likes] ON 

INSERT [dbo].[Likes] ([Id], [BlogId], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 1, 2, CAST(N'2023-08-30T11:40:53.5750872' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[Likes] ([Id], [BlogId], [UserId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 4, 1, CAST(N'2023-08-30T11:42:38.4743188' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
SET IDENTITY_INSERT [dbo].[Likes] OFF
GO
SET IDENTITY_INSERT [dbo].[LoggEntries] ON 

INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'User Registration', 1, N'test1@gmail.com', N'{"Image":null,"Email":"test@gmail.com","Password":"Lozinka12!","FirstName":"Test","LastName":"Test","Username":"test","ProfileImage":null}', 0, CAST(N'2023-08-29T14:27:03.4169205' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, N'User Registration', 0, N'Anonymous', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"avatar.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"avatar.png\""],"Content-Type":["image/png"]},"Length":18263,"Name":"Image","FileName":"avatar.png"},"Email":"test@gmail.com","Password":"Lozinka12!","FirstName":"Test","LastName":"Test","Username":"test","ProfileImage":"260d3228-96ae-42b6-bb31-f265d1368985.png"}', 1, CAST(N'2023-08-29T14:28:00.2245083' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, N'Update user use-cases', 1, N'test@gmail.com', N'{"UserId":1,"UseCaseIds":[2,5,6,7,8,9,10,11,12,13,14,16,17,18,19,20,21,22,23,24]}', 1, CAST(N'2023-08-29T14:34:59.4116424' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, N'Update user credentials', 0, N'Anonymous', N'{"Image":null,"FirstName":null,"LastName":null,"NewEmail":"test@gmail.com","NewPassword":"Lozinka12!","NewUsername":"test","NewImageProfile":null,"Id":1}', 0, CAST(N'2023-08-29T14:38:09.6056472' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, N'Update user credentials', 1, N'test@gmail.com', N'{"Image":null,"FirstName":null,"LastName":null,"NewEmail":"test@gmail.com","NewPassword":"Lozinka12!","NewUsername":"test","NewImageProfile":null,"Id":1}', 1, CAST(N'2023-08-29T14:38:50.8791629' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, N'Update user credentials', 1, N'test@gmail.com', N'{"Image":null,"FirstName":"Test","LastName":"Testtt","NewEmail":"test@gmail.com","NewPassword":"Lozinka12!","NewUsername":"test","NewImageProfile":null,"Id":1}', 1, CAST(N'2023-08-29T14:39:52.3286883' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, N'Create Category', 1, N'test@gmail.com', N'{"Name":"Cat 1"}', 1, CAST(N'2023-08-29T14:41:02.9365581' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, N'Create Category', 1, N'test@gmail.com', N'{"Name":"Cat 2"}', 1, CAST(N'2023-08-29T14:41:08.7587746' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, N'Create Category', 1, N'test@gmail.com', N'{"Name":"Cat 3"}', 1, CAST(N'2023-08-29T14:41:13.3720964' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, N'Create Tag', 1, N'test@gmail.com', N'{"Name":"Tag 1"}', 1, CAST(N'2023-08-29T14:41:24.1666204' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, N'Create Tag', 1, N'test@gmail.com', N'{"Name":"Tag 2"}', 1, CAST(N'2023-08-29T14:41:28.7163440' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, N'Create Tag', 1, N'test@gmail.com', N'{"Name":"Tag 3"}', 1, CAST(N'2023-08-29T14:41:32.8610645' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (13, N'Update tag', 1, N'test@gmail.com', N'{"Id":3,"Data":{"Name":"Tag 33"}}', 1, CAST(N'2023-08-29T14:41:44.9330337' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (14, N'Create Blog', 1, N'test@gmail.com', N'{"Title":"Nov Blog","TextContent":"Nov blog content","Category":{"Name":"Blog Cat NOVA"},"Tags":["skroz novi tag","Tag 1"],"Files":["IMAGE.jpg","img.jpg","skroznova.jpg"]}', 1, CAST(N'2023-08-29T14:43:30.4327729' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (15, N'Create like', 1, N'test@gmail.com', N'{"BlogId":1,"Id":0}', 1, CAST(N'2023-08-29T14:45:40.4040609' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (16, N'Dislike', 1, N'test@gmail.com', N'1', 1, CAST(N'2023-08-29T14:52:35.9226706' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (17, N'Create like', 1, N'test@gmail.com', N'{"BlogId":1,"Id":0}', 1, CAST(N'2023-08-29T14:53:06.7276891' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (18, N'Dislike', 1, N'test@gmail.com', N'2', 1, CAST(N'2023-08-29T14:54:59.6204075' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (19, N'Add mark', 1, N'test@gmail.com', N'{"BlogId":1,"Mark":9}', 1, CAST(N'2023-08-29T15:09:03.4337484' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (20, N'Delete mark', 1, N'test@gmail.com', N'1', 0, CAST(N'2023-08-29T15:15:25.5067676' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (21, N'Dislike', 1, N'test@gmail.com', N'2', 1, CAST(N'2023-08-29T15:16:35.2932834' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (22, N'Delete mark', 1, N'test@gmail.com', N'2', 1, CAST(N'2023-08-29T15:17:31.5004520' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (23, N'Delete mark', 1, N'test@gmail.com', N'1', 1, CAST(N'2023-08-29T15:18:50.4226079' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (24, N'Add mark', 1, N'test@gmail.com', N'{"BlogId":1,"Mark":8}', 1, CAST(N'2023-08-29T15:27:06.7362902' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (25, N'Update mark', 1, N'test@gmail.com', N'{"Mark":7,"Id":2}', 1, CAST(N'2023-08-29T15:27:37.6424865' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (26, N'Update mark', 1, N'test@gmail.com', N'{"Mark":11,"Id":2}', 1, CAST(N'2023-08-29T15:38:40.3725090' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (27, N'Update mark', 1, N'test@gmail.com', N'{"Mark":10,"Id":2}', 1, CAST(N'2023-08-29T15:38:56.3759310' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, N'Find blog', 1, N'test@gmail.com', N'1', 1, CAST(N'2023-08-29T17:28:14.3899703' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (29, N'Search Blogs', 0, N'Anonymous', N'{"DateFrom":null,"DateTo":null,"Username":null,"Title":"Blog","Tag":null,"Category":null}', 1, CAST(N'2023-08-29T17:30:54.7492277' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (30, N'Search Blogs', 0, N'Anonymous', N'{"DateFrom":null,"DateTo":null,"Username":null,"Title":"Blog","Tag":null,"Category":null}', 1, CAST(N'2023-08-29T17:32:05.0880735' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (31, N'Create Category', 1, N'test@gmail.com', N'{"Name":"Najnovija cat"}', 1, CAST(N'2023-08-30T10:56:57.9623689' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (32, N'Create Category', 1, N'test@gmail.com', N'{"Name":"Najnovija cat"}', 1, CAST(N'2023-08-30T10:58:58.5658667' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (33, N'Create Category', 1, N'test@gmail.com', N'{"Name":"Kategorija"}', 1, CAST(N'2023-08-30T11:01:09.1061517' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (34, N'Update category', 1, N'test@gmail.com', N'{"Id":6,"Data":{"Name":"KategorijaIspravka"}}', 1, CAST(N'2023-08-30T11:03:53.6293490' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (35, N'Delete category', 1, N'test@gmail.com', N'6', 1, CAST(N'2023-08-30T11:04:43.5289690' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (36, N'Create Category', 1, N'test@gmail.com', N'{"Name":"Kategorija"}', 1, CAST(N'2023-08-30T11:09:36.0027268' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (37, N'Update category', 1, N'test@gmail.com', N'{"Id":7,"Data":{"Name":"KategorijaIspravka"}}', 1, CAST(N'2023-08-30T11:10:08.7332272' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (38, N'Delete category', 1, N'test@gmail.com', N'7', 1, CAST(N'2023-08-30T11:10:28.1275366' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (39, N'Update tag', 1, N'test@gmail.com', N'{"Id":4,"Data":{"Name":"Ispravka Tag"}}', 1, CAST(N'2023-08-30T11:11:21.7374193' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (40, N'Create Blog', 1, N'test@gmail.com', N'{"Title":"Blog 2","TextContent":"Blog 2 content","Category":{"Name":"Kategorija"},"Tags":["Tag 1","tagic"],"Files":["IMAGE.jpg","img1.jpg"]}', 1, CAST(N'2023-08-30T11:16:11.7452075' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (41, N'Update bloga', 1, N'test@gmail.com', N'{"NewTitle":"Blog 2","NewTextContent":"Blog 2 content","NewCategory":{"Name":"Kategorija"},"NewTags":["Tag 1","tagic"],"NewFiles":["IMAGE.jpg","img1.jpg","novaSlika.png"],"Id":2}', 1, CAST(N'2023-08-30T11:19:08.5132512' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (42, N'User Registration', 0, N'Anonymous', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"avatar.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"avatar.png\""],"Content-Type":["image/png"]},"Length":18263,"Name":"Image","FileName":"avatar.png"},"Email":"saska@gmail.com","Password":"Lozinka12!","FirstName":"Saska","LastName":"Radosavljevic","Username":null,"ProfileImage":"aed427ff-2b39-4ebf-b948-970d8d2710c8.png"}', 1, CAST(N'2023-08-30T11:21:29.8815185' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (43, N'User Registration', 0, N'Anonymous', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"avatar.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"avatar.png\""],"Content-Type":["image/png"]},"Length":18263,"Name":"Image","FileName":"avatar.png"},"Email":"saska@gmail.com","Password":"Lozinka12!","FirstName":"Saska","LastName":"Radosavljevic","Username":"saska","ProfileImage":"fd8368ad-f76b-4b0d-bf97-c405d2e4a28d.png"}', 1, CAST(N'2023-08-30T11:21:58.1511813' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (44, N'Update user credentials', 2, N'saska@gmail.com', N'{"Image":null,"FirstName":"Saska","LastName":"Radosavljevic","NewEmail":"saska@gmail.com","NewPassword":"Lozinka12!","NewUsername":"saska15","NewImageProfile":null,"Id":2}', 1, CAST(N'2023-08-30T11:28:12.2289203' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (45, N'Create Blog', 2, N'saska@gmail.com', N'{"Title":"Blog 2","TextContent":"Blog 2 content","Category":{"Name":"Kategorija"},"Tags":["Tag 1","tagic","zdravlje"],"Files":["IMAGE.jpg"]}', 0, CAST(N'2023-08-30T11:31:10.6685307' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (46, N'Create Blog', 2, N'saska@gmail.com', N'{"Title":"Blog 2","TextContent":"Blog 2 content","Category":{"Name":"Kategorija"},"Tags":["Tag 1","tagic","zdravlje"],"Files":["IMAGE.jpg"]}', 1, CAST(N'2023-08-30T11:31:52.5615796' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (47, N'Create Blog', 2, N'saska@gmail.com', N'{"Title":"Blog 3","TextContent":"Blog 2 content","Category":{"Name":"Kategorija"},"Tags":["Tag 1","tagic","zdravlje"],"Files":["IMAGE.jpg"]}', 1, CAST(N'2023-08-30T11:32:26.6596925' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (48, N'Create Blog', 2, N'saska@gmail.com', N'{"Title":"Blog 3","TextContent":"Blog 2 content","Category":{"Name":"Kategorija"},"Tags":["Tag 1","tagic","zdravlje"],"Files":["IMAGE.jpg"]}', 1, CAST(N'2023-08-30T11:36:26.9120708' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (49, N'Create Blog', 2, N'saska@gmail.com', N'{"Title":"Blog 4","TextContent":"Blog 4 content","Category":{"Name":"Kategorija 4"},"Tags":["Tag 1","tagic","zdravlje"],"Files":["IMAGE2.jpg"]}', 1, CAST(N'2023-08-30T11:36:53.1811827' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (50, N'Create like', 2, N'saska@gmail.com', N'{"BlogId":1,"Id":0}', 1, CAST(N'2023-08-30T11:40:53.1704766' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (51, N'Add mark', 2, N'saska@gmail.com', N'{"BlogId":1,"Mark":8}', 1, CAST(N'2023-08-30T11:41:08.9373436' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (52, N'Create comment', 2, N'saska@gmail.com', N'{"BlogId":1,"ParentCommentId":null,"Text":"Odusevljena sam ovim blogom."}', 1, CAST(N'2023-08-30T11:41:40.4728262' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (53, N'Create comment', 1, N'test@gmail.com', N'{"BlogId":null,"ParentCommentId":1,"Text":"Hvala Vam!"}', 1, CAST(N'2023-08-30T11:42:21.5515486' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (54, N'Create like', 1, N'test@gmail.com', N'{"BlogId":4,"Id":0}', 1, CAST(N'2023-08-30T11:42:38.4671197' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (55, N'Add mark', 1, N'test@gmail.com', N'{"BlogId":4,"Mark":9}', 1, CAST(N'2023-08-30T11:42:50.7051838' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (56, N'Create comment', 1, N'test@gmail.com', N'{"BlogId":4,"ParentCommentId":null,"Text":"Obozavam Vase recepte, ideje su sjajne."}', 1, CAST(N'2023-08-30T11:43:35.6155281' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (57, N'Search Blogs', 0, N'Anonymous', N'{"DateFrom":null,"DateTo":null,"Username":null,"Title":"Blog","Tag":null,"Category":null}', 1, CAST(N'2023-08-30T11:44:34.0666020' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (58, N'Search Blogs', 0, N'Anonymous', N'{"DateFrom":null,"DateTo":null,"Username":"saska15","Title":null,"Tag":null,"Category":null}', 1, CAST(N'2023-08-30T11:44:58.9634508' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (59, N'Search Blogs', 0, N'Anonymous', N'{"DateFrom":null,"DateTo":null,"Username":null,"Title":null,"Tag":null,"Category":"Kategorija"}', 1, CAST(N'2023-08-30T11:45:20.1512220' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (60, N'Search Blogs', 0, N'Anonymous', N'{"DateFrom":null,"DateTo":null,"Username":"test","Title":null,"Tag":null,"Category":"Kategorija"}', 1, CAST(N'2023-08-30T11:45:39.2034144' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (61, N'Search Blogs', 0, N'Anonymous', N'{"DateFrom":null,"DateTo":null,"Username":null,"Title":null,"Tag":"tagic","Category":"Kategorija"}', 1, CAST(N'2023-08-30T11:45:54.5165705' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (62, N'Search categories', 0, N'Anonymous', N'{"Keyword":"Kategorija","PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T11:46:41.4760645' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (63, N'Search categories', 0, N'Anonymous', N'{"Keyword":"Kat","PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T11:46:50.2200213' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (64, N'Search categories', 0, N'Anonymous', N'{"Keyword":"K","PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T11:47:00.1430641' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (65, N'Search categories', 0, N'Anonymous', N'{"Keyword":"c","PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T11:47:05.6199335' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (66, N'Search Tags', 0, N'Anonymous', N'{"Keyword":"c"}', 1, CAST(N'2023-08-30T11:47:22.2478311' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (67, N'Search Tags', 0, N'Anonymous', N'{"Keyword":"t"}', 1, CAST(N'2023-08-30T11:47:26.7510962' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (68, N'Search Blogs', 0, N'Anonymous', N'{"DateFrom":null,"DateTo":null,"Username":null,"Title":"blog","Tag":null,"Category":null,"PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T12:06:28.8588506' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (69, N'Search Blogs', 0, N'Anonymous', N'{"DateFrom":null,"DateTo":null,"Username":null,"Title":"nov","Tag":null,"Category":null,"PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T12:06:47.2736273' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (70, N'Search Blogs', 0, N'Anonymous', N'{"DateFrom":null,"DateTo":null,"Username":"saska","Title":null,"Tag":null,"Category":null,"PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T12:07:08.3743498' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (71, N'Search Blogs', 0, N'Anonymous', N'{"DateFrom":null,"DateTo":null,"Username":"saska15","Title":null,"Tag":null,"Category":null,"PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T12:07:19.7615173' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (72, N'Search categories', 0, N'Anonymous', N'{"Keyword":null,"PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T12:07:56.2676703' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (73, N'Find Category', 0, N'Anonymous', N'1', 1, CAST(N'2023-08-30T12:09:35.7222852' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (74, N'Find Tag', 0, N'Anonymous', N'1', 1, CAST(N'2023-08-30T12:11:21.5260760' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (75, N'Find blog', 0, N'Anonymous', N'1', 1, CAST(N'2023-08-30T12:11:31.5225830' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (76, N'Find blog', 0, N'Anonymous', N'4', 1, CAST(N'2023-08-30T12:11:41.4400148' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (77, N'Find Category', 0, N'Anonymous', N'4', 1, CAST(N'2023-08-30T12:11:54.0227079' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (78, N'Search use case logs', 1, N'test@gmail.com', N'{"DateFrom":null,"DateTo":null,"UseCaseName":"Delete","Username":null,"PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T12:26:11.7378067' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (79, N'Search use case logs', 1, N'test@gmail.com', N'{"DateFrom":null,"DateTo":null,"UseCaseName":"Create","Username":null,"PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T12:26:26.3292252' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (80, N'Search use case logs', 1, N'test@gmail.com', N'{"DateFrom":null,"DateTo":null,"UseCaseName":"Create","Username":null,"PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T12:26:46.8006450' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (81, N'Search use case logs', 1, N'test@gmail.com', N'{"DateFrom":null,"DateTo":null,"UseCaseName":"Create","Username":null,"PerPage":15,"Page":2}', 1, CAST(N'2023-08-30T12:27:10.9826953' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (82, N'Search use case logs', 1, N'test@gmail.com', N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"Username":"saska@gmail.com","PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T12:27:34.4911108' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (83, N'Search use case logs', 1, N'test@gmail.com', N'{"DateFrom":null,"DateTo":null,"UseCaseName":"Add","Username":"saska@gmail.com","PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T12:27:55.6577979' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (84, N'Search use case logs', 1, N'test@gmail.com', N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"Username":"test@gmail.com","PerPage":15,"Page":1}', 1, CAST(N'2023-08-30T12:28:05.8201872' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (85, N'Search use case logs', 1, N'test@gmail.com', N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"Username":"test@gmail.com","PerPage":15,"Page":3}', 1, CAST(N'2023-08-30T12:28:25.8862544' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (86, N'Create Blog', 2, N'saska@gmail.com', N'{"Title":"Novi Blog","TextContent":"Novi content bloga","Category":{"Name":"najnovija"},"Tags":["Tag 1","tagic"],"Files":["IMAGE.jpg"]}', 1, CAST(N'2023-08-30T14:20:32.4023593' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (87, N'Create Blog', 2, N'saska@gmail.com', N'{"Title":"Novi Blog","TextContent":"Novi content bloga","Category":{"Name":"Cat 3"},"Tags":["Tag 1","tagic"],"Files":["IMAGE.jpg"]}', 1, CAST(N'2023-08-30T14:21:11.3592731' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (88, N'Create Blog', 2, N'saska@gmail.com', N'{"Title":"Novi Blog 1","TextContent":"Novi content bloga","Category":{"Name":"Cat 6"},"Tags":["Tag 1","tagic","NEWTAG"],"Files":["IMAGE1.jpg"]}', 1, CAST(N'2023-08-30T14:32:17.3607145' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (89, N'Create Blog', 2, N'saska@gmail.com', N'{"Title":"Novi Blog 1","TextContent":"Novi content bloga","Category":{"Name":"Kategorija"},"Tags":["Tag 1","tagic","Tag 2"],"Files":["IMAGE1.jpg"]}', 1, CAST(N'2023-08-30T14:32:58.0287158' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (90, N'Create Blog', 2, N'saska@gmail.com', N'{"Title":"Novi Blog 1","TextContent":"Novi content bloga","Category":{"Name":"Kategorija"},"Tags":["Tag 1","tagic","Tag 2","lepota"],"Files":["IMAGE1.jpg"]}', 1, CAST(N'2023-08-30T14:44:41.4132543' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (91, N'Create Blog', 2, N'saska@gmail.com', N'{"Title":"Novi Blog 5","TextContent":"Novi content bloga","Category":{"Name":"Kategorija"},"Tags":["Tag 1","tagic","Tag 2","zdravlje"],"Files":["IMAGE1.jpg"]}', 1, CAST(N'2023-08-30T14:45:06.7443760' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (92, N'Update bloga', 2, N'saska@gmail.com', N'{"NewTitle":"Novi Blog 5","NewTextContent":"Novi content bloga","NewCategory":{"Name":"malakat"},"NewTags":["Tag 1","tagic","Tag 2","lepota"],"NewFiles":["IMAGE1.jpg"],"Id":5}', 1, CAST(N'2023-08-30T14:50:13.8742437' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (93, N'Update bloga', 2, N'saska@gmail.com', N'{"NewTitle":"Novi Blog 5","NewTextContent":"Novi content bloga","NewCategory":{"Name":"Cat 3"},"NewTags":["Tag 1","tagic","zdravlje"],"NewFiles":["IMAGE1.jpg"],"Id":5}', 1, CAST(N'2023-08-30T14:50:47.6241205' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (94, N'Update bloga', 2, N'saska@gmail.com', N'{"NewTitle":"Novi Blogg","NewTextContent":"Novi content bloga","NewCategory":{"Name":"Cat 3"},"NewTags":["Tag 1","tagic","zdravlje"],"NewFiles":["IMAGE1.jpg"],"Id":5}', 1, CAST(N'2023-08-30T14:53:03.2202978' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (95, N'User Registration', 0, N'Anonymous', N'{"Image":null,"Email":"proba@gmail.com","Password":"Lozinka12!","FirstName":"Proba","LastName":"Proba","Username":"proba","ProfileImage":null}', 1, CAST(N'2023-08-30T15:06:28.8382446' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (96, N'User Registration', 0, N'Anonymous', N'{"Image":null,"Email":"proba12@gmail.com","Password":"Lozinka12!","FirstName":"Proba12","LastName":"Proba12","Username":"proba12","ProfileImage":null}', 1, CAST(N'2023-08-30T15:16:23.2776194' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (97, N'User Registration', 0, N'Anonymous', N'{"Image":null,"Email":"proba12@gmail.com","Password":"Lozinka12!","FirstName":"Probaaaa","LastName":"Probaaa","Username":"proba12","ProfileImage":null}', 1, CAST(N'2023-08-30T15:16:53.2113040' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (98, N'User Registration', 0, N'Anonymous', N'{"Image":null,"Email":"new@gmail.com","Password":"Lozinka12!","FirstName":"New","LastName":"New","Username":"new12","ProfileImage":null}', 1, CAST(N'2023-08-30T15:24:17.5371616' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (99, N'User Registration', 0, N'Anonymous', N'{"Image":null,"Email":"korisnik@gmail.com","Password":"Lozinka12!","FirstName":"Korisnik","LastName":"Korisnik","Username":"korisnik","ProfileImage":null}', 1, CAST(N'2023-08-31T15:59:06.9108527' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
GO
INSERT [dbo].[LoggEntries] ([Id], [UseCaseName], [UserId], [Username], [Data], [IsAuthorized], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (100, N'Update user use-cases', 1, N'test@gmail.com', N'{"UserId":1,"UseCaseIds":[1,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]}', 1, CAST(N'2023-08-31T16:02:57.7671001' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
SET IDENTITY_INSERT [dbo].[LoggEntries] OFF
GO
SET IDENTITY_INSERT [dbo].[Marks] ON 

INSERT [dbo].[Marks] ([Id], [UserId], [BlogId], [Number], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, 1, 1, 10, CAST(N'2023-08-29T17:27:07.1933333' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Marks] ([Id], [UserId], [BlogId], [Number], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 2, 1, 8, CAST(N'2023-08-30T11:41:09.0205900' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
INSERT [dbo].[Marks] ([Id], [UserId], [BlogId], [Number], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 1, 4, 9, CAST(N'2023-08-30T11:42:50.7140978' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
SET IDENTITY_INSERT [dbo].[Marks] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [TagValue], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'Tag 1', CAST(N'2023-08-29T16:41:24.2400000' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Tags] ([Id], [TagValue], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, N'Tag 2', CAST(N'2023-08-29T16:41:28.7266667' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Tags] ([Id], [TagValue], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, N'Tag 33', CAST(N'2023-08-29T16:41:32.9200000' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Tags] ([Id], [TagValue], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, N'Ispravka Tag', CAST(N'2023-08-29T16:43:32.1500000' AS DateTime2), CAST(N'2023-08-30T11:11:21.8095027' AS DateTime2), NULL, 1, NULL, N'test@gmail.com', NULL)
INSERT [dbo].[Tags] ([Id], [TagValue], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, N'tagic', CAST(N'2023-08-30T11:16:14.1156048' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'test@gmail.com')
INSERT [dbo].[Tags] ([Id], [TagValue], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, N'zdravlje', CAST(N'2023-08-30T11:32:31.1800229' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'saska@gmail.com')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [ProfileImageId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'test@gmail.com', N'$2a$11$bFcPqaFRhwMdTuBz03Wmd.enJjPZw3XKX4dLMplLgQqilqd2KEALi', N'test', N'Test', N'Testtt', 1, CAST(N'2023-08-29T16:28:07.6500000' AS DateTime2), NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [ProfileImageId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, N'saska@gmail.com', N'$2a$11$7PKxw52R.8NPPT/JNCAtUuLiE.SgbiCzE0GnClapldEX51Uy7CgyC', N'saska15', N'Saska', N'Radosavljevic', 7, CAST(N'2023-08-30T11:22:00.5363679' AS DateTime2), CAST(N'2023-08-30T11:28:12.8899772' AS DateTime2), NULL, 1, NULL, N'saska@gmail.com', N'anonymous@gmail.com')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [ProfileImageId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, N'proba@gmail.com', N'$2a$11$JJiL5i.SPjDXlz/L81QyH.5Ndj6aQdMmtEpPhXY6fWfp8g3elYRAa', N'proba', N'Proba', N'Proba', NULL, CAST(N'2023-08-30T15:06:30.8223404' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [ProfileImageId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, N'proba12@gmail.com', N'$2a$11$UfMmS1opfgiGNDE6.gANvu3kfb0c20hDKBb0y0tBpmZvPCI1masNG', N'proba12', N'Probaaaa', N'Probaaa', NULL, CAST(N'2023-08-30T15:16:55.4476522' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [ProfileImageId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, N'new@gmail.com', N'$2a$11$x4p2U5z33POzZLEOia0F8eIkFc.6idu0OeGDoqdh0RDZUgBMwN9bu', N'new12', N'New', N'New', NULL, CAST(N'2023-08-30T15:24:19.3909900' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Username], [FirstName], [LastName], [ProfileImageId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsActive], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, N'korisnik@gmail.com', N'$2a$11$w/gVAOJLPl9eJGQbZk.gw.nGWHvgwbfYjtyctxAftj4usbLmZ9rGm', N'korisnik', N'Korisnik', N'Korisnik', NULL, CAST(N'2023-08-31T15:59:09.1439521' AS DateTime2), NULL, NULL, 1, NULL, NULL, N'anonymous@gmail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 2)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 6)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 7)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 8)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 9)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 10)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 12)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 14)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 15)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 16)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 18)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 19)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 26)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 27)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (1, 28)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 16)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 18)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 19)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 26)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (2, 27)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 1)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 4)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 5)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 11)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 13)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 15)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 16)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 17)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 18)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 19)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 20)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 21)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 22)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 23)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 24)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 25)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 26)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 27)
INSERT [dbo].[UserUseCases] ([UserId], [UseCaseId]) VALUES (6, 28)
GO
/****** Object:  Index [IX_BlogImages_ImageId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_BlogImages_ImageId] ON [dbo].[BlogImages]
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Blogs_AuthorId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_Blogs_AuthorId] ON [dbo].[Blogs]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Blogs_CategoryId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_Blogs_CategoryId] ON [dbo].[Blogs]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Blogs_Title]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Blogs_Title] ON [dbo].[Blogs]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogTags_TagId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_BlogTags_TagId] ON [dbo].[BlogTags]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_AuthorId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_AuthorId] ON [dbo].[Comments]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_BlogId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_BlogId] ON [dbo].[Comments]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_ParentCommentId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_ParentCommentId] ON [dbo].[Comments]
(
	[ParentCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Likes_BlogId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_Likes_BlogId] ON [dbo].[Likes]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Likes_UserId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_Likes_UserId] ON [dbo].[Likes]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LoggEntries_CreatedAt]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_LoggEntries_CreatedAt] ON [dbo].[LoggEntries]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LoggEntries_UseCaseName]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_LoggEntries_UseCaseName] ON [dbo].[LoggEntries]
(
	[UseCaseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_LoggEntries_Username]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_LoggEntries_Username] ON [dbo].[LoggEntries]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Marks_BlogId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_Marks_BlogId] ON [dbo].[Marks]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Marks_UserId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_Marks_UserId] ON [dbo].[Marks]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Tags_TagValue]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tags_TagValue] ON [dbo].[Tags]
(
	[TagValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_ProfileImageId]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE NONCLUSTERED INDEX [IX_Users_ProfileImageId] ON [dbo].[Users]
(
	[ProfileImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 31.8.2023. 18:12:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Images] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Likes] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Likes] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[LoggEntries] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[LoggEntries] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Marks] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Marks] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tags] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Tags] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[BlogImages]  WITH CHECK ADD  CONSTRAINT [FK_BlogImages_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
GO
ALTER TABLE [dbo].[BlogImages] CHECK CONSTRAINT [FK_BlogImages_Blogs_BlogId]
GO
ALTER TABLE [dbo].[BlogImages]  WITH CHECK ADD  CONSTRAINT [FK_BlogImages_Images_ImageId] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [dbo].[BlogImages] CHECK CONSTRAINT [FK_BlogImages_Images_ImageId]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Users_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Users_AuthorId]
GO
ALTER TABLE [dbo].[BlogTags]  WITH CHECK ADD  CONSTRAINT [FK_BlogTags_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
GO
ALTER TABLE [dbo].[BlogTags] CHECK CONSTRAINT [FK_BlogTags_Blogs_BlogId]
GO
ALTER TABLE [dbo].[BlogTags]  WITH CHECK ADD  CONSTRAINT [FK_BlogTags_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[BlogTags] CHECK CONSTRAINT [FK_BlogTags_Tags_TagId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Blogs_BlogId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Comments_ParentCommentId] FOREIGN KEY([ParentCommentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Comments_ParentCommentId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_AuthorId]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Blogs_BlogId]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Users_UserId]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Blogs_BlogId]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Images_ProfileImageId] FOREIGN KEY([ProfileImageId])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Images_ProfileImageId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [CookingBlogApi] SET  READ_WRITE 
GO
