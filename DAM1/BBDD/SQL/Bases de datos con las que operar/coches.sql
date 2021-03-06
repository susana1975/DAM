USE [master]
GO
/****** Object:  Database [coches]    Script Date: 05/06/2018 19:44:34 ******/
CREATE DATABASE [coches]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'coches', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\coches.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'coches_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\coches_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [coches] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [coches].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [coches] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [coches] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [coches] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [coches] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [coches] SET ARITHABORT OFF 
GO
ALTER DATABASE [coches] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [coches] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [coches] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [coches] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [coches] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [coches] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [coches] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [coches] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [coches] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [coches] SET  ENABLE_BROKER 
GO
ALTER DATABASE [coches] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [coches] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [coches] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [coches] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [coches] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [coches] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [coches] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [coches] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [coches] SET  MULTI_USER 
GO
ALTER DATABASE [coches] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [coches] SET DB_CHAINING OFF 
GO
ALTER DATABASE [coches] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [coches] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [coches] SET DELAYED_DURABILITY = DISABLED 
GO
USE [coches]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 05/06/2018 19:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes](
	[dni] [int] NOT NULL,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[ciudad] [varchar](10) NULL,
 CONSTRAINT [pk_dni] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[coches]    Script Date: 05/06/2018 19:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[coches](
	[codcoche] [int] NOT NULL,
	[nombre] [varchar](10) NULL,
	[modelo] [varchar](8) NULL,
 CONSTRAINT [pk_codcoche] PRIMARY KEY CLUSTERED 
(
	[codcoche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[concesionario]    Script Date: 05/06/2018 19:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[concesionario](
	[cifc] [varchar](9) NOT NULL,
	[nombre] [varchar](10) NULL,
	[ciudad] [varchar](20) NULL,
 CONSTRAINT [pk_cifc] PRIMARY KEY CLUSTERED 
(
	[cifc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[distribucion]    Script Date: 05/06/2018 19:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[distribucion](
	[cifc] [varchar](9) NOT NULL,
	[codcoche] [int] NOT NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [pk_distribucion] PRIMARY KEY CLUSTERED 
(
	[cifc] ASC,
	[codcoche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[marcas]    Script Date: 05/06/2018 19:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[marcas](
	[cifm] [varchar](9) NOT NULL,
	[nombre] [varchar](10) NULL,
	[ciudad] [varchar](20) NULL,
 CONSTRAINT [pk_cifm] PRIMARY KEY CLUSTERED 
(
	[cifm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[marco]    Script Date: 05/06/2018 19:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[marco](
	[cifm] [varchar](9) NOT NULL,
	[codcoche] [int] NOT NULL,
 CONSTRAINT [pk_marco] PRIMARY KEY CLUSTERED 
(
	[cifm] ASC,
	[codcoche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 05/06/2018 19:44:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ventas](
	[cifc] [varchar](9) NULL,
	[dni] [int] NULL,
	[codcoche] [int] NULL,
	[color] [varchar](8) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[distribucion]  WITH CHECK ADD  CONSTRAINT [fk_cifc1] FOREIGN KEY([cifc])
REFERENCES [dbo].[concesionario] ([cifc])
GO
ALTER TABLE [dbo].[distribucion] CHECK CONSTRAINT [fk_cifc1]
GO
ALTER TABLE [dbo].[distribucion]  WITH CHECK ADD  CONSTRAINT [fk_codcoche2] FOREIGN KEY([codcoche])
REFERENCES [dbo].[coches] ([codcoche])
GO
ALTER TABLE [dbo].[distribucion] CHECK CONSTRAINT [fk_codcoche2]
GO
ALTER TABLE [dbo].[marco]  WITH CHECK ADD  CONSTRAINT [fk_cifm] FOREIGN KEY([cifm])
REFERENCES [dbo].[marcas] ([cifm])
GO
ALTER TABLE [dbo].[marco] CHECK CONSTRAINT [fk_cifm]
GO
ALTER TABLE [dbo].[marco]  WITH CHECK ADD  CONSTRAINT [fk_codcoche1] FOREIGN KEY([codcoche])
REFERENCES [dbo].[coches] ([codcoche])
GO
ALTER TABLE [dbo].[marco] CHECK CONSTRAINT [fk_codcoche1]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [fk_cifc] FOREIGN KEY([cifc])
REFERENCES [dbo].[concesionario] ([cifc])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [fk_cifc]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [fk_codcoche] FOREIGN KEY([codcoche])
REFERENCES [dbo].[coches] ([codcoche])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [fk_codcoche]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD  CONSTRAINT [fk_dni] FOREIGN KEY([dni])
REFERENCES [dbo].[clientes] ([dni])
GO
ALTER TABLE [dbo].[ventas] CHECK CONSTRAINT [fk_dni]
GO
ALTER TABLE [dbo].[concesionario]  WITH CHECK ADD  CONSTRAINT [ck1_cifc] CHECK  (([cifc]=upper([cifc])))
GO
ALTER TABLE [dbo].[concesionario] CHECK CONSTRAINT [ck1_cifc]
GO
ALTER TABLE [dbo].[distribucion]  WITH CHECK ADD  CONSTRAINT [ck_cantidad] CHECK  (([cantidad]>(0)))
GO
ALTER TABLE [dbo].[distribucion] CHECK CONSTRAINT [ck_cantidad]
GO
ALTER TABLE [dbo].[marcas]  WITH CHECK ADD  CONSTRAINT [ck1_cifm] CHECK  (([cifm]=upper([cifm])))
GO
ALTER TABLE [dbo].[marcas] CHECK CONSTRAINT [ck1_cifm]
GO
USE [master]
GO
ALTER DATABASE [coches] SET  READ_WRITE 
GO
