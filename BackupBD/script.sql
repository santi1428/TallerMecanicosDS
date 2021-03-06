USE [master]
GO
/****** Object:  Database [DSTALLER]    Script Date: 4/06/2019 11:59:12 a. m. ******/
CREATE DATABASE [DSTALLER]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TALLER', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TALLER.mdf' , SIZE = 5376KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TALLER_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TALLER_log.LDF' , SIZE = 5824KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DSTALLER] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DSTALLER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DSTALLER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DSTALLER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DSTALLER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DSTALLER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DSTALLER] SET ARITHABORT OFF 
GO
ALTER DATABASE [DSTALLER] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DSTALLER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DSTALLER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DSTALLER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DSTALLER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DSTALLER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DSTALLER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DSTALLER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DSTALLER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DSTALLER] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DSTALLER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DSTALLER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DSTALLER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DSTALLER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DSTALLER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DSTALLER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DSTALLER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DSTALLER] SET RECOVERY FULL 
GO
ALTER DATABASE [DSTALLER] SET  MULTI_USER 
GO
ALTER DATABASE [DSTALLER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DSTALLER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DSTALLER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DSTALLER] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DSTALLER] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DSTALLER', N'ON'
GO
ALTER DATABASE [DSTALLER] SET QUERY_STORE = OFF
GO
USE [DSTALLER]
GO
/****** Object:  Table [dbo].[TBLCARRO]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLCARRO](
	[PLACA] [varchar](6) NOT NULL,
	[MODELO] [int] NULL,
	[CODMARCA] [bigint] NULL,
	[FECHAMATRICULA] [varchar](10) NULL,
 CONSTRAINT [PK_TBLCARRO] PRIMARY KEY CLUSTERED 
(
	[PLACA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLCARROPROP]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLCARROPROP](
	[PLACA] [varchar](6) NOT NULL,
	[CEDPROP] [bigint] NOT NULL,
 CONSTRAINT [PK_TBLCARROPROP] PRIMARY KEY CLUSTERED 
(
	[PLACA] ASC,
	[CEDPROP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLCARROREP]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLCARROREP](
	[PLACA] [varchar](6) NOT NULL,
	[CODREPUESTO] [bigint] NOT NULL,
	[CEDVENDEDOR] [bigint] NOT NULL,
	[FECHA] [datetime] NOT NULL,
	[CANTIDAD] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PLACA] ASC,
	[CODREPUESTO] ASC,
	[CEDVENDEDOR] ASC,
	[FECHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLCARROSERV]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLCARROSERV](
	[NUMPLACA] [varchar](6) NOT NULL,
	[NUMSERVICIO] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NUMPLACA] ASC,
	[NUMSERVICIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLDETALLEFACT]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLDETALLEFACT](
	[Codigo_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[NroFactura] [int] NOT NULL,
	[Codigo_Producto] [int] NOT NULL,
	[Cantidad_Detalle] [int] NOT NULL,
	[ValorUnitario_Detalle] [int] NOT NULL,
	[Nombre_Producto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLFACTURA]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLFACTURA](
	[NroFactura] [int] NOT NULL,
	[CedulaPro] [bigint] NOT NULL,
	[CedulaVen] [bigint] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_TBLFACTURA] PRIMARY KEY CLUSTERED 
(
	[NroFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLJEFEMECANICO]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLJEFEMECANICO](
	[CEDULA] [varchar](10) NOT NULL,
	[NOMBRE] [varchar](30) NULL,
	[SALARIO] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[CEDULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLMARCA]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMARCA](
	[CODIGO] [bigint] NOT NULL,
	[NOMBRE] [varchar](30) NULL,
 CONSTRAINT [PK_TBLMARCA] PRIMARY KEY CLUSTERED 
(
	[CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLMECANICO]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMECANICO](
	[CEDULA] [bigint] NOT NULL,
	[NOMBRE] [varchar](30) NULL,
	[EDAD] [int] NULL,
	[CODSECCION] [bigint] NULL,
	[CEDJEFEMECANICO] [varchar](10) NULL,
 CONSTRAINT [PK_TBLMECANICO] PRIMARY KEY CLUSTERED 
(
	[CEDULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLPROPIETARIO]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLPROPIETARIO](
	[CEDULA] [bigint] NOT NULL,
	[NOMBRE] [varchar](30) NULL,
	[EDAD] [int] NULL,
	[TELEFONO] [varchar](10) NULL,
 CONSTRAINT [PK_TBLPROPIETARIO] PRIMARY KEY CLUSTERED 
(
	[CEDULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLPROVEDOR]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLPROVEDOR](
	[NIT] [bigint] NOT NULL,
	[NOMBRE] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[NIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLREPARACION]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLREPARACION](
	[NUMREP] [bigint] NOT NULL,
	[NUMPLACA] [varchar](6) NULL,
	[COSTOREP] [float] NULL,
	[CEDMECANICO] [bigint] NULL,
	[NOMBRE] [varchar](20) NULL,
 CONSTRAINT [PK__TBLREPAR__79207D51D9ADA2A6] PRIMARY KEY CLUSTERED 
(
	[NUMREP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLREPUESTO]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLREPUESTO](
	[CODIGO] [bigint] NOT NULL,
	[NOMBRE] [varchar](30) NULL,
	[FECHAREGISTRO] [varchar](10) NULL,
	[NITPROVEDOR] [bigint] NULL,
	[PRECIO] [float] NULL,
 CONSTRAINT [PK_TBLREPUESTO] PRIMARY KEY CLUSTERED 
(
	[CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLSECCION]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLSECCION](
	[CODIGO] [bigint] NOT NULL,
	[NOMBRE] [varchar](30) NULL,
	[ZONA] [varchar](10) NULL,
 CONSTRAINT [PK_TBLSECCION] PRIMARY KEY CLUSTERED 
(
	[CODIGO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLSERVICIOS]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLSERVICIOS](
	[NUMSERVICIO] [bigint] NOT NULL,
	[NOMSERVICIO] [varchar](30) NOT NULL,
	[PRECIO] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NUMSERVICIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLSUPERVISOR]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLSUPERVISOR](
	[CEDULA] [bigint] NOT NULL,
	[NOMBRE] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CEDULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLVENDEDOR]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLVENDEDOR](
	[CEDULA] [bigint] NOT NULL,
	[NOMBRE] [varchar](30) NULL,
	[CEDSUPERVISOR] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[CEDULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[TBLCARRO] ([PLACA], [MODELO], [CODMARCA], [FECHAMATRICULA]) VALUES (N'ABC560', 2010, 20, N'25/01/2010')
INSERT [dbo].[TBLCARRO] ([PLACA], [MODELO], [CODMARCA], [FECHAMATRICULA]) VALUES (N'FTY900', 2000, 20, N'16/09/2000')
INSERT [dbo].[TBLCARRO] ([PLACA], [MODELO], [CODMARCA], [FECHAMATRICULA]) VALUES (N'GUJ540', 2003, 10, N'31/12/2003')
INSERT [dbo].[TBLCARRO] ([PLACA], [MODELO], [CODMARCA], [FECHAMATRICULA]) VALUES (N'JUH560', 2002, 100, N'01/01/2002')
INSERT [dbo].[TBLCARRO] ([PLACA], [MODELO], [CODMARCA], [FECHAMATRICULA]) VALUES (N'KHG629', 2011, 50, N'10/10/2011')
INSERT [dbo].[TBLCARROPROP] ([PLACA], [CEDPROP]) VALUES (N'ABC560', 5)
INSERT [dbo].[TBLCARROPROP] ([PLACA], [CEDPROP]) VALUES (N'FTY900', 3)
INSERT [dbo].[TBLCARROPROP] ([PLACA], [CEDPROP]) VALUES (N'GUJ540', 4)
INSERT [dbo].[TBLCARROPROP] ([PLACA], [CEDPROP]) VALUES (N'JUH560', 2)
INSERT [dbo].[TBLCARROPROP] ([PLACA], [CEDPROP]) VALUES (N'KHG629', 1)
INSERT [dbo].[TBLCARROREP] ([PLACA], [CODREPUESTO], [CEDVENDEDOR], [FECHA], [CANTIDAD]) VALUES (N'ABC560', 2, 100, CAST(N'2019-10-10T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[TBLCARROSERV] ([NUMPLACA], [NUMSERVICIO]) VALUES (N'ABC560', 1)
INSERT [dbo].[TBLCARROSERV] ([NUMPLACA], [NUMSERVICIO]) VALUES (N'ABC560', 2)
SET IDENTITY_INSERT [dbo].[TBLDETALLEFACT] ON 

INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (59, 1, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (60, 1, 1, 20, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (61, 1, 7, 5, 150000, N'LLANTAS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (62, 2, 2, 1, 35000, N'LAVADO')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (63, 2, 3, 1, 50000, N'REVISION')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (64, 2, 2, 1, 35000, N'LAVADO')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (65, 3, 2, 1, 100000, N'NEUMATICO')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (66, 3, 4, 5, 25000, N'ACEITE 20W 50')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (67, 4, 3, 5, 15000, N'PASTA DE FRENOS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (68, 4, 3, 5, 15000, N'PASTA DE FRENOS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (69, 4, 3, 5, 15000, N'PASTA DE FRENOS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (70, 4, 3, 5, 15000, N'PASTA DE FRENOS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (71, 4, 3, 5, 15000, N'PASTA DE FRENOS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (72, 4, 3, 5, 15000, N'PASTA DE FRENOS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (73, 4, 3, 5, 15000, N'PASTA DE FRENOS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (74, 5, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (75, 5, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (76, 5, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (77, 5, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (78, 6, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (79, 6, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (80, 6, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (81, 6, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (82, 6, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (83, 6, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (84, 7, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (85, 7, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (86, 7, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (87, 7, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (88, 7, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (89, 8, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (90, 9, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (91, 10, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (92, 11, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (93, 12, 7, 1, 150000, N'LLANTAS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (94, 12, 5, 1, 60000, N'FAROLA DELANTERA')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (95, 12, 3, 1, 15000, N'PASTA DE FRENOS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (96, 12, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (97, 13, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (98, 13, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (99, 13, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (100, 13, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (101, 13, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (102, 13, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (103, 13, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (104, 13, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (105, 13, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (106, 14, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (107, 14, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (108, 14, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (109, 14, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (110, 14, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (111, 15, 1, 1, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (112, 15, 3, 1, 15000, N'PASTA DE FRENOS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (113, 15, 4, 1, 25000, N'ACEITE 20W 50')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (114, 15, 6, 1, 50000, N'TAPETES')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (115, 15, 7, 1, 150000, N'LLANTAS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (116, 16, 1, 5, 20000, N'FILTRO DE AIRE')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (117, 16, 1, 5, 100000, N'MOTOR')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (118, 16, 1, 1, 100000, N'MOTOR')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (119, 16, 2, 1, 50000, N'RETROVISOR')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (120, 17, 5, 1, 60000, N'FAROLA DELANTERA')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (121, 17, 2, 2, 100000, N'NEUMATICO')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (122, 17, 3, 2, 15000, N'PASTA DE FRENOS')
INSERT [dbo].[TBLDETALLEFACT] ([Codigo_Detalle], [NroFactura], [Codigo_Producto], [Cantidad_Detalle], [ValorUnitario_Detalle], [Nombre_Producto]) VALUES (123, 17, 4, 2, 25000, N'ACEITE 20W 50')
SET IDENTITY_INSERT [dbo].[TBLDETALLEFACT] OFF
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (1, 5, 100, CAST(N'2019-05-27T14:17:52.483' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (2, 0, 103, CAST(N'2019-06-04T00:35:11.237' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (3, 1, 100, CAST(N'2019-06-04T00:46:14.830' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (4, 1, 100, CAST(N'2019-06-04T01:23:02.330' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (5, 0, 101, CAST(N'2019-06-04T01:50:13.950' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (6, 0, 100, CAST(N'2019-06-04T01:53:55.860' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (7, 0, 100, CAST(N'2019-06-04T01:54:32.453' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (8, 0, 100, CAST(N'2019-06-04T01:55:21.177' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (9, 0, 100, CAST(N'2019-06-04T01:56:49.770' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (10, 0, 100, CAST(N'2019-06-04T01:57:05.937' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (11, 0, 100, CAST(N'2019-06-04T01:57:15.830' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (12, 0, 100, CAST(N'2019-06-04T03:49:07.770' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (13, 0, 100, CAST(N'2019-06-04T03:49:27.477' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (14, 0, 100, CAST(N'2019-06-04T03:51:38.687' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (15, 0, 100, CAST(N'2019-06-04T10:57:42.817' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (16, 5, 103, CAST(N'2019-06-04T11:10:57.860' AS DateTime))
INSERT [dbo].[TBLFACTURA] ([NroFactura], [CedulaPro], [CedulaVen], [Fecha]) VALUES (17, 5, 103, CAST(N'2019-06-04T11:46:02.350' AS DateTime))
INSERT [dbo].[TBLJEFEMECANICO] ([CEDULA], [NOMBRE], [SALARIO]) VALUES (N'1001', N'DIEGO HERNANDEZ', 1000000)
INSERT [dbo].[TBLJEFEMECANICO] ([CEDULA], [NOMBRE], [SALARIO]) VALUES (N'1002', N'SANTIAGO ROSE', 1000500)
INSERT [dbo].[TBLJEFEMECANICO] ([CEDULA], [NOMBRE], [SALARIO]) VALUES (N'1003', N'DANIEL LOPEZ', 1500000)
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (10, N'BMW')
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (20, N'MINI COOPER')
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (30, N'AUDI')
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (40, N'MERCEDES BENZ')
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (50, N'RENAULT')
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (60, N'NISSAN')
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (70, N'TOYOTA')
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (80, N'VOLSWAGEN')
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (90, N'FORD')
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (100, N'HYUNDAI')
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (110, N'FIAT')
INSERT [dbo].[TBLMARCA] ([CODIGO], [NOMBRE]) VALUES (120, N'PORSCHE')
INSERT [dbo].[TBLMECANICO] ([CEDULA], [NOMBRE], [EDAD], [CODSECCION], [CEDJEFEMECANICO]) VALUES (10, N'HUGO TORRES', 45, 200, N'1001')
INSERT [dbo].[TBLMECANICO] ([CEDULA], [NOMBRE], [EDAD], [CODSECCION], [CEDJEFEMECANICO]) VALUES (20, N'LINA PELAEZ', 23, 200, N'1002')
INSERT [dbo].[TBLMECANICO] ([CEDULA], [NOMBRE], [EDAD], [CODSECCION], [CEDJEFEMECANICO]) VALUES (30, N'HERNAN PEREZ', 25, 300, N'1002')
INSERT [dbo].[TBLMECANICO] ([CEDULA], [NOMBRE], [EDAD], [CODSECCION], [CEDJEFEMECANICO]) VALUES (40, N'JORGE VELEZ', 34, 400, N'1003')
INSERT [dbo].[TBLMECANICO] ([CEDULA], [NOMBRE], [EDAD], [CODSECCION], [CEDJEFEMECANICO]) VALUES (50, N'SANDRA TORO', 26, 400, N'1003')
INSERT [dbo].[TBLMECANICO] ([CEDULA], [NOMBRE], [EDAD], [CODSECCION], [CEDJEFEMECANICO]) VALUES (60, N'JOSE JARAMILLO', 35, 500, N'1003')
INSERT [dbo].[TBLPROPIETARIO] ([CEDULA], [NOMBRE], [EDAD], [TELEFONO]) VALUES (0, N'otro', 20, N'3208071372')
INSERT [dbo].[TBLPROPIETARIO] ([CEDULA], [NOMBRE], [EDAD], [TELEFONO]) VALUES (1, N'JUAN PEREZ', 39, N'3002997566')
INSERT [dbo].[TBLPROPIETARIO] ([CEDULA], [NOMBRE], [EDAD], [TELEFONO]) VALUES (2, N'LUIS POSADA', 26, N'3125874692')
INSERT [dbo].[TBLPROPIETARIO] ([CEDULA], [NOMBRE], [EDAD], [TELEFONO]) VALUES (3, N'TERESA DUARTE', 56, N'3135548562')
INSERT [dbo].[TBLPROPIETARIO] ([CEDULA], [NOMBRE], [EDAD], [TELEFONO]) VALUES (4, N'PAULA BETANCUR', 18, N'3215688452')
INSERT [dbo].[TBLPROPIETARIO] ([CEDULA], [NOMBRE], [EDAD], [TELEFONO]) VALUES (5, N'SANTIAGO BEDOYA', 31, N'3200236484')
INSERT [dbo].[TBLPROPIETARIO] ([CEDULA], [NOMBRE], [EDAD], [TELEFONO]) VALUES (478564, N'Alfonso Pelaes', 58, N'487561')
INSERT [dbo].[TBLPROVEDOR] ([NIT], [NOMBRE]) VALUES (1, N'GOODYEAR')
INSERT [dbo].[TBLPROVEDOR] ([NIT], [NOMBRE]) VALUES (2, N'TOYOTA')
INSERT [dbo].[TBLPROVEDOR] ([NIT], [NOMBRE]) VALUES (3, N'KENDA')
INSERT [dbo].[TBLPROVEDOR] ([NIT], [NOMBRE]) VALUES (4, N'OTRO')
INSERT [dbo].[TBLPROVEDOR] ([NIT], [NOMBRE]) VALUES (5, N'CHEVROLET')
INSERT [dbo].[TBLPROVEDOR] ([NIT], [NOMBRE]) VALUES (6, N'KIA')
INSERT [dbo].[TBLREPARACION] ([NUMREP], [NUMPLACA], [COSTOREP], [CEDMECANICO], [NOMBRE]) VALUES (1, N'ABC560', 100000, 10, N'MOTOR')
INSERT [dbo].[TBLREPARACION] ([NUMREP], [NUMPLACA], [COSTOREP], [CEDMECANICO], [NOMBRE]) VALUES (2, N'ABC560', 50000, 10, N'RETROVISOR')
INSERT [dbo].[TBLREPUESTO] ([CODIGO], [NOMBRE], [FECHAREGISTRO], [NITPROVEDOR], [PRECIO]) VALUES (1, N'FILTRO DE AIRE', N'25/01/2005', 4, 20000)
INSERT [dbo].[TBLREPUESTO] ([CODIGO], [NOMBRE], [FECHAREGISTRO], [NITPROVEDOR], [PRECIO]) VALUES (2, N'NEUMATICO', N'01/01/2010', 1, 100000)
INSERT [dbo].[TBLREPUESTO] ([CODIGO], [NOMBRE], [FECHAREGISTRO], [NITPROVEDOR], [PRECIO]) VALUES (3, N'PASTA DE FRENOS', N'31/12/2009', 5, 15000)
INSERT [dbo].[TBLREPUESTO] ([CODIGO], [NOMBRE], [FECHAREGISTRO], [NITPROVEDOR], [PRECIO]) VALUES (4, N'ACEITE 20W 50', N'14/09/2001', 2, 25000)
INSERT [dbo].[TBLREPUESTO] ([CODIGO], [NOMBRE], [FECHAREGISTRO], [NITPROVEDOR], [PRECIO]) VALUES (5, N'FAROLA DELANTERA', N'14/09/2002', 3, 60000)
INSERT [dbo].[TBLREPUESTO] ([CODIGO], [NOMBRE], [FECHAREGISTRO], [NITPROVEDOR], [PRECIO]) VALUES (6, N'TAPETES', N'14/09/2001', 5, 50000)
INSERT [dbo].[TBLREPUESTO] ([CODIGO], [NOMBRE], [FECHAREGISTRO], [NITPROVEDOR], [PRECIO]) VALUES (7, N'LLANTAS', N'30/11/2008', 1, 150000)
INSERT [dbo].[TBLSECCION] ([CODIGO], [NOMBRE], [ZONA]) VALUES (100, N'LATONERIA', N'A')
INSERT [dbo].[TBLSECCION] ([CODIGO], [NOMBRE], [ZONA]) VALUES (200, N'PINTURA', N'A')
INSERT [dbo].[TBLSECCION] ([CODIGO], [NOMBRE], [ZONA]) VALUES (300, N'ALINEACION', N'B')
INSERT [dbo].[TBLSECCION] ([CODIGO], [NOMBRE], [ZONA]) VALUES (400, N'ALISTAMIENTO', N'C')
INSERT [dbo].[TBLSECCION] ([CODIGO], [NOMBRE], [ZONA]) VALUES (500, N'FRENOS', N'C')
INSERT [dbo].[TBLSECCION] ([CODIGO], [NOMBRE], [ZONA]) VALUES (600, N'CHASIS', N'D')
INSERT [dbo].[TBLSERVICIOS] ([NUMSERVICIO], [NOMSERVICIO], [PRECIO]) VALUES (1, N'CAMBIO ACEITE', 10000)
INSERT [dbo].[TBLSERVICIOS] ([NUMSERVICIO], [NOMSERVICIO], [PRECIO]) VALUES (2, N'LAVADO', 35000)
INSERT [dbo].[TBLSERVICIOS] ([NUMSERVICIO], [NOMSERVICIO], [PRECIO]) VALUES (3, N'REVISION', 50000)
INSERT [dbo].[TBLSUPERVISOR] ([CEDULA], [NOMBRE]) VALUES (1010, N'JUAN PEREZ')
INSERT [dbo].[TBLSUPERVISOR] ([CEDULA], [NOMBRE]) VALUES (1020, N'PEDRO ARCE')
INSERT [dbo].[TBLVENDEDOR] ([CEDULA], [NOMBRE], [CEDSUPERVISOR]) VALUES (100, N'OSCAR RAMOS', 1010)
INSERT [dbo].[TBLVENDEDOR] ([CEDULA], [NOMBRE], [CEDSUPERVISOR]) VALUES (101, N'RAMIRO PEREZ', 1010)
INSERT [dbo].[TBLVENDEDOR] ([CEDULA], [NOMBRE], [CEDSUPERVISOR]) VALUES (102, N'CAHRLY QUINTERO', 1020)
INSERT [dbo].[TBLVENDEDOR] ([CEDULA], [NOMBRE], [CEDSUPERVISOR]) VALUES (103, N'MANUEL BALVIN', 1020)
INSERT [dbo].[TBLVENDEDOR] ([CEDULA], [NOMBRE], [CEDSUPERVISOR]) VALUES (104, N'SANTIGO OZUNA', 1010)
ALTER TABLE [dbo].[TBLCARRO]  WITH CHECK ADD  CONSTRAINT [FK_TBLCARRO_TBLMARCA] FOREIGN KEY([CODMARCA])
REFERENCES [dbo].[TBLMARCA] ([CODIGO])
GO
ALTER TABLE [dbo].[TBLCARRO] CHECK CONSTRAINT [FK_TBLCARRO_TBLMARCA]
GO
ALTER TABLE [dbo].[TBLCARROPROP]  WITH CHECK ADD  CONSTRAINT [FK_TBLCARROPROP_TBLCARRO] FOREIGN KEY([PLACA])
REFERENCES [dbo].[TBLCARRO] ([PLACA])
GO
ALTER TABLE [dbo].[TBLCARROPROP] CHECK CONSTRAINT [FK_TBLCARROPROP_TBLCARRO]
GO
ALTER TABLE [dbo].[TBLCARROPROP]  WITH CHECK ADD  CONSTRAINT [FK_TBLCARROPROP_TBLPROPIETARIO] FOREIGN KEY([CEDPROP])
REFERENCES [dbo].[TBLPROPIETARIO] ([CEDULA])
GO
ALTER TABLE [dbo].[TBLCARROPROP] CHECK CONSTRAINT [FK_TBLCARROPROP_TBLPROPIETARIO]
GO
ALTER TABLE [dbo].[TBLCARROREP]  WITH CHECK ADD FOREIGN KEY([CEDVENDEDOR])
REFERENCES [dbo].[TBLVENDEDOR] ([CEDULA])
GO
ALTER TABLE [dbo].[TBLCARROREP]  WITH CHECK ADD  CONSTRAINT [FK__TBLCARROR__CODRE__6B24EA82] FOREIGN KEY([CODREPUESTO])
REFERENCES [dbo].[TBLREPUESTO] ([CODIGO])
GO
ALTER TABLE [dbo].[TBLCARROREP] CHECK CONSTRAINT [FK__TBLCARROR__CODRE__6B24EA82]
GO
ALTER TABLE [dbo].[TBLCARROREP]  WITH CHECK ADD FOREIGN KEY([PLACA])
REFERENCES [dbo].[TBLCARRO] ([PLACA])
GO
ALTER TABLE [dbo].[TBLCARROSERV]  WITH CHECK ADD FOREIGN KEY([NUMPLACA])
REFERENCES [dbo].[TBLCARRO] ([PLACA])
GO
ALTER TABLE [dbo].[TBLCARROSERV]  WITH CHECK ADD FOREIGN KEY([NUMPLACA])
REFERENCES [dbo].[TBLCARRO] ([PLACA])
GO
ALTER TABLE [dbo].[TBLCARROSERV]  WITH CHECK ADD FOREIGN KEY([NUMSERVICIO])
REFERENCES [dbo].[TBLSERVICIOS] ([NUMSERVICIO])
GO
ALTER TABLE [dbo].[TBLDETALLEFACT]  WITH CHECK ADD FOREIGN KEY([NroFactura])
REFERENCES [dbo].[TBLFACTURA] ([NroFactura])
GO
ALTER TABLE [dbo].[TBLFACTURA]  WITH CHECK ADD FOREIGN KEY([CedulaPro])
REFERENCES [dbo].[TBLPROPIETARIO] ([CEDULA])
GO
ALTER TABLE [dbo].[TBLFACTURA]  WITH CHECK ADD FOREIGN KEY([CedulaVen])
REFERENCES [dbo].[TBLVENDEDOR] ([CEDULA])
GO
ALTER TABLE [dbo].[TBLMECANICO]  WITH CHECK ADD FOREIGN KEY([CEDJEFEMECANICO])
REFERENCES [dbo].[TBLJEFEMECANICO] ([CEDULA])
GO
ALTER TABLE [dbo].[TBLMECANICO]  WITH CHECK ADD  CONSTRAINT [FK_TBLMECANICO_TBLSECCION] FOREIGN KEY([CODSECCION])
REFERENCES [dbo].[TBLSECCION] ([CODIGO])
GO
ALTER TABLE [dbo].[TBLMECANICO] CHECK CONSTRAINT [FK_TBLMECANICO_TBLSECCION]
GO
ALTER TABLE [dbo].[TBLREPARACION]  WITH CHECK ADD  CONSTRAINT [FK__TBLREPARA__CEDME__6D0D32F4] FOREIGN KEY([CEDMECANICO])
REFERENCES [dbo].[TBLMECANICO] ([CEDULA])
GO
ALTER TABLE [dbo].[TBLREPARACION] CHECK CONSTRAINT [FK__TBLREPARA__CEDME__6D0D32F4]
GO
ALTER TABLE [dbo].[TBLREPARACION]  WITH CHECK ADD  CONSTRAINT [FK__TBLREPARA__NUMPL__440B1D61] FOREIGN KEY([NUMPLACA])
REFERENCES [dbo].[TBLCARRO] ([PLACA])
GO
ALTER TABLE [dbo].[TBLREPARACION] CHECK CONSTRAINT [FK__TBLREPARA__NUMPL__440B1D61]
GO
ALTER TABLE [dbo].[TBLREPUESTO]  WITH CHECK ADD  CONSTRAINT [FK__TBLREPUES__NITPR__59FA5E80] FOREIGN KEY([NITPROVEDOR])
REFERENCES [dbo].[TBLPROVEDOR] ([NIT])
GO
ALTER TABLE [dbo].[TBLREPUESTO] CHECK CONSTRAINT [FK__TBLREPUES__NITPR__59FA5E80]
GO
ALTER TABLE [dbo].[TBLVENDEDOR]  WITH CHECK ADD FOREIGN KEY([CEDSUPERVISOR])
REFERENCES [dbo].[TBLSUPERVISOR] ([CEDULA])
GO
/****** Object:  StoredProcedure [dbo].[Carro_ConsultarPlaca]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Carro_ConsultarPlaca]

@prPlaca varchar(6)

AS
BEGIN
	
	SELECT        dbo.TBLPROPIETARIO.CEDULA, dbo.TBLPROPIETARIO.NOMBRE
    FROM          dbo.TBLCARRO INNER JOIN dbo.TBLCARROPROP 
	              ON dbo.TBLCARRO.PLACA = dbo.TBLCARROPROP.PLACA 
				  INNER JOIN dbo.TBLPROPIETARIO
				  ON dbo.TBLCARROPROP.CEDPROP = dbo.TBLPROPIETARIO.CEDULA
    WHERE         TBLCARRO.PLACA=@prplaca
END
GO
/****** Object:  StoredProcedure [dbo].[Factura_CalcularTotal]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Factura_CalcularTotal]
@prFactura INT

AS
BEGIN

select sum(ValorUnitario_Detalle*Cantidad_Detalle) from TBLDETALLEFACT WHERE NroFactura=@prFactura
  
END
GO
/****** Object:  StoredProcedure [dbo].[Factura_GrabarDetalle]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Factura_GrabarDetalle]

@prNroFactura bigint,
@prProducto int,
@prCantidad int,
@prValorUnitario int,
@prNombre varchar(50)

AS
BEGIN
     insert into TBLDETALLEFACT (NroFactura,Codigo_Producto,Cantidad_Detalle,ValorUnitario_Detalle,Nombre_Producto)
	 values (@prNroFactura,@prProducto,@prCantidad,@prValorUnitario,@prNombre)
  
END
GO
/****** Object:  StoredProcedure [dbo].[Factura_GrabarEncabezado]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Factura_GrabarEncabezado]

@prCedulaPropietario bigint,
@prVendedor int

AS
BEGIN
  
   insert into tblfactura  (NroFactura,CedulaPro,CedulaVen,Fecha)
   values ((select COUNT(NroFactura) from TBLFACTURA)+1,@prCedulaPropietario,@prVendedor,GETDATE())

 select COUNT(NroFactura) from TBLFACTURA
END
GO
/****** Object:  StoredProcedure [dbo].[Factura_LlenarGrid]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Factura_LlenarGrid]

	@prNumeroFactura int

AS
BEGIN

	Select Nombre_Producto as Nombre,
		   
		   Cantidad_Detalle as Cantidad,
		   ValorUnitario_Detalle as ValorUnitario
	from TBLDETALLEfact
	where NroFactura=@prNumeroFactura

END
GO
/****** Object:  StoredProcedure [dbo].[Propietario_Consultar]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Propietario_Consultar]
@prCedula int
AS
BEGIN
	Select NOMBRE,EDAD,TELEFONO 
	from TBLPROPIETARIO
	WHERE CEDULA=@prCedula
END
GO
/****** Object:  StoredProcedure [dbo].[Propietario_Delete]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Propietario_Delete]
@prCedula BIGINT
AS
BEGIN
DELETE FROM TBLPROPIETARIO WHERE CEDULA = @prCedula;
END
GO
/****** Object:  StoredProcedure [dbo].[Propietario_Insert]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Propietario_Insert]
@prCedula BIGINT,
@prNombre VARCHAR(30),
@prEdad INT,
@prTelefono VARCHAR(10)
AS 
BEGIN
INSERT INTO TBLPROPIETARIO (CEDULA, NOMBRE, EDAD, TELEFONO) VALUES(@prCedula, @prNombre, @prEdad, @prTelefono);
END
GO
/****** Object:  StoredProcedure [dbo].[Propietario_LlenarGrid]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Propietario_LlenarGrid]
AS
BEGIN
SELECT CEDULA, NOMBRE, EDAD, TELEFONO FROM TBLPROPIETARIO;
END
GO
/****** Object:  StoredProcedure [dbo].[Propietario_Update]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Propietario_Update]
@prCedula BIGINT,
@prNombre VARCHAR(30),
@prEdad INT,
@prTelefono VARCHAR(10)
AS 
BEGIN
UPDATE TBLPROPIETARIO SET CEDULA = @prCedula, NOMBRE = @prNombre, EDAD = @prEdad, TELEFONO = @prTelefono WHERE CEDULA = @prCedula;
END
GO
/****** Object:  StoredProcedure [dbo].[Proveedor_LlenarCombo]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Proveedor_LlenarCombo]
AS
BEGIN
SELECT NIT AS 'Codigo', NOMBRE AS 'Texto' FROM TBLPROVEDOR; 
END
GO
/****** Object:  StoredProcedure [dbo].[Reparacion_ConsultarValorUnitario]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Reparacion_ConsultarValorUnitario]

	@prCodigo int

AS
BEGIN
	
	 Select COSTOREP
	 from TBLREPARACION
	 where NUMREP=@prCodigo
END
GO
/****** Object:  StoredProcedure [dbo].[Reparacion_LlenarCombo]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Reparacion_LlenarCombo]

AS
BEGIN
	
	Select NOMBRE AS Texto,
		   NUMREP AS Codigo
	 from TBLREPARACION

END
GO
/****** Object:  StoredProcedure [dbo].[Repuesto_ConsultarValorUnitario]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Repuesto_ConsultarValorUnitario]

	@prCodigo int

AS
BEGIN
	
	 Select PRECIO
	 from TBLREPUESTO
	 where CODIGO=@prCodigo
END
GO
/****** Object:  StoredProcedure [dbo].[Repuesto_Delete]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Repuesto_Delete]
@prCodigo	bigint
AS
BEGIN
    DELETE FROM	TBLREPUESTO
	WHERE CODIGO = @prCodigo;
END
GO
/****** Object:  StoredProcedure [dbo].[Repuesto_Insert]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Repuesto_Insert]
@prCodigo bigint,
@prNombre varchar(30),
@prValor money,
@prFecha varchar(10),
@prNIT bigint

AS
BEGIN
	INSERT INTO TBLREPUESTO(CODIGO, NOMBRE, PRECIO, FECHAREGISTRO, NITPROVEDOR) VALUES(@prCodigo, @prNombre, @prValor, @prFecha, @prNIT);
END
GO
/****** Object:  StoredProcedure [dbo].[Repuesto_LlenarCombo]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Repuesto_LlenarCombo]

AS
BEGIN
	
	Select NOMBRE AS Texto,
		   CODIGO AS Codigo
	 from TBLREPUESTO

END
GO
/****** Object:  StoredProcedure [dbo].[Repuesto_LlenarGrid]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Repuesto_LlenarGrid]
AS 
BEGIN 
SELECT        dbo.TBLPROVEDOR.NIT, dbo.TBLPROVEDOR.NOMBRE AS 'Proveedor', dbo.TBLREPUESTO.CODIGO AS 'Codigo', dbo.TBLREPUESTO.NOMBRE AS 'Nombre', dbo.TBLREPUESTO.PRECIO AS '$ Precio', dbo.TBLREPUESTO.FECHAREGISTRO AS 'Fecha'
FROM          dbo.TBLREPUESTO INNER JOIN
              dbo.TBLPROVEDOR ON dbo.TBLREPUESTO.NITPROVEDOR = dbo.TBLPROVEDOR.NIT
END
GO
/****** Object:  StoredProcedure [dbo].[Repuesto_Update]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Repuesto_Update]
@prCodigo				bigint,
@prNombre				varchar(30),
@prValor				float,
@prFecha				varchar(10),
@prNIT					bigint

AS
BEGIN
    UPDATE		TBLREPUESTO	
	SET			CODIGO = @prCodigo,
				NOMBRE = @prNombre,
				PRECIO = @prValor,
				FECHAREGISTRO = @prFecha,
				NITPROVEDOR = @prNIT
	WHERE		CODIGO = @prCodigo
END
GO
/****** Object:  StoredProcedure [dbo].[Servicio_Delete]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Servicio_Delete]
@prCodigo	bigint
AS
BEGIN
    DELETE FROM	TBLSERVICIOS
	WHERE NUMSERVICIO = @prCodigo;
END
GO
/****** Object:  StoredProcedure [dbo].[Servicio_Insert]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Servicio_Insert]
@prCodigo bigint,
@prNombre varchar(30),
@prValor float

AS
BEGIN
	INSERT INTO TBLSERVICIOS (NUMSERVICIO, NOMSERVICIO, PRECIO) VALUES(@prCodigo, @prNombre, @prValor);
END
GO
/****** Object:  StoredProcedure [dbo].[Servicio_LlenarGrid]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Servicio_LlenarGrid] AS

BEGIN
	SELECT NUMSERVICIO AS Codigo, NOMSERVICIO AS Nombre, PRECIO AS '$ Precio' FROM TBLSERVICIOS;
END
GO
/****** Object:  StoredProcedure [dbo].[Servicio_Update]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Servicio_Update]
@prCodigo				bigint,
@prNombre				varchar(30),
@prValor				float

AS
BEGIN
    UPDATE		TBLSERVICIOS
	SET			NOMSERVICIO = @prNombre,
				PRECIO = @prValor
	WHERE		NUMSERVICIO = @prCodigo
END
GO
/****** Object:  StoredProcedure [dbo].[Servicios_ConsultarValorUnitario]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Servicios_ConsultarValorUnitario]

	@prCodigo int

AS
BEGIN
	
	 Select PRECIO
	 from TBLSERVICIOS
	 where NUMSERVICIO=@prCodigo
END
GO
/****** Object:  StoredProcedure [dbo].[Servicios_LlenarCombo]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Servicios_LlenarCombo]

AS
BEGIN
	
	Select NOMSERVICIO AS Texto,
		   NUMSERVICIO AS Codigo
	 from TBLSERVICIOS

END
GO
/****** Object:  StoredProcedure [dbo].[Vendedor_LlenarCombo]    Script Date: 4/06/2019 11:59:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Vendedor_LlenarCombo]

AS
BEGIN

	select CEDULA as Codigo,
		   NOMBRE AS Texto 
	from TBLVENDEDOR

END
GO
USE [master]
GO
ALTER DATABASE [DSTALLER] SET  READ_WRITE 
GO
