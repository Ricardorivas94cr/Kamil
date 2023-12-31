USE [master]
GO
/****** Object:  Database [Kamil]    Script Date: 14/11/2023 9213054 ******/
CREATE DATABASE [Kamil]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kamil', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Kamil.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kamil_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Kamil_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Kamil] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kamil].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kamil] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kamil] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kamil] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kamil] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kamil] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kamil] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Kamil] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kamil] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kamil] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kamil] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kamil] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kamil] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kamil] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kamil] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kamil] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Kamil] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kamil] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kamil] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kamil] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kamil] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kamil] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kamil] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kamil] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kamil] SET  MULTI_USER 
GO
ALTER DATABASE [Kamil] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kamil] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kamil] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kamil] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kamil] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kamil] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Kamil] SET QUERY_STORE = ON
GO
ALTER DATABASE [Kamil] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Kamil]
GO
/****** Object:  Table [dbo].[CatalogoCentros]    Script Date: 14/11/2023 9213054 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogoCentros](
	[numCentro] [int] NOT NULL,
	[nombreCentro] [nvarchar](50) NOT NULL,
	[ciudad] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numCentro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directivos]    Script Date: 14/11/2023 9213055 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directivos](
	[idEmpleado] [int] NOT NULL,
	[numCentroSupervisa] [int] NOT NULL,
	[prestacionCombustible] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 14/11/2023 9213055 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[apellidoPaterno] [nvarchar](50) NOT NULL,
	[apellidoMaterno] [nvarchar](50) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[RFC] [nvarchar](50) NOT NULL,
	[idPuesto] [int] NULL,
	[directivo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 14/11/2023 9213055 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puestos](
	[idPuesto] [int] IDENTITY(1,1) NOT NULL,
	[nombrePuesto] [nvarchar](50) NOT NULL,
	[descripcionPuesto] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Directivos]  WITH CHECK ADD FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[Directivos]  WITH CHECK ADD FOREIGN KEY([numCentroSupervisa])
REFERENCES [dbo].[CatalogoCentros] ([numCentro])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([idPuesto])
REFERENCES [dbo].[Puestos] ([idPuesto])
GO
USE [master]
GO
ALTER DATABASE [Kamil] SET  READ_WRITE 
GO
