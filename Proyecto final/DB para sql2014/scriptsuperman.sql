USE [master]
GO
/****** Object:  Database [Ingenieria]    Script Date: 25/04/2018 9:13:43 ******/
CREATE DATABASE [Ingenieria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ingenieria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Ingenieria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ingenieria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Ingenieria1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Ingenieria] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ingenieria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ingenieria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ingenieria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ingenieria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ingenieria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ingenieria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ingenieria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ingenieria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ingenieria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ingenieria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ingenieria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ingenieria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ingenieria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ingenieria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ingenieria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ingenieria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ingenieria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ingenieria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ingenieria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ingenieria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ingenieria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ingenieria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ingenieria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ingenieria] SET RECOVERY FULL 
GO
ALTER DATABASE [Ingenieria] SET  MULTI_USER 
GO
ALTER DATABASE [Ingenieria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ingenieria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ingenieria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ingenieria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ingenieria] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ingenieria', N'ON'
GO
USE [Ingenieria]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Ingenieria]
GO
/****** Object:  Table [dbo].[almacen]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[almacen](
	[idalmacen] [int] IDENTITY(1,1) NOT NULL,
	[CodCategoria] [int] NULL,
	[nombre] [nvarchar](100) NULL,
	[ubicacion] [nvarchar](100) NULL,
	[descripcion] [nvarchar](100) NULL,
	[NombreCategoria] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idalmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[area]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[area](
	[idArea] [int] IDENTITY(1,1) NOT NULL,
	[area] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auditoriacompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auditoriacompra](
	[idCompra] [int] NOT NULL,
	[idProveedor] [int] NULL,
	[fechaCompra] [datetime] NULL,
	[HoraCompra] [time](7) NULL,
	[idusuario] [int] NULL,
	[Subtotal] [numeric](18, 2) NULL,
	[Descuento] [numeric](18, 2) NULL,
	[TotalCordobas] [numeric](18, 2) NULL,
	[TotalDolares] [numeric](18, 2) NULL,
	[TipoPago] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
	[Accion] [nchar](10) NULL,
	[Fecha_creada] [datetime] NULL,
	[Fecha_modificada] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auditoriaLavado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auditoriaLavado](
	[idLavado] [int] NULL,
	[total] [money] NULL,
	[fecha] [datetime] NULL,
	[placa] [nvarchar](10) NULL,
	[idLavadoVehiculo] [int] NULL,
	[idGrupo] [int] NULL,
	[usuario] [nvarchar](100) NULL,
	[accion] [nvarchar](10) NULL,
	[fechaCreada] [datetime] NULL,
	[fechaModificado] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditoriaMantenimiento]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriaMantenimiento](
	[total] [money] NOT NULL,
	[fecha] [date] NULL,
	[placa] [nvarchar](10) NOT NULL,
	[idgrupo] [int] NULL,
	[idservicioVehiculo] [int] NULL,
	[usuario] [nvarchar](100) NULL,
	[accion] [nchar](10) NULL,
	[fechacreada] [datetime] NULL,
	[fechamodificada] [datetime] NULL,
	[idmantenimiento] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditoriaVenta]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriaVenta](
	[NumVenta] [int] NOT NULL,
	[idCliente] [int] NULL,
	[idUsuario] [int] NULL,
	[fechaFac] [datetime] NULL,
	[Subtotal] [numeric](18, 2) NULL,
	[Descuento] [numeric](18, 2) NULL,
	[totalcordobas] [numeric](18, 2) NULL,
	[TipoPago] [nvarchar](50) NULL,
	[HoraFac] [time](7) NULL,
	[TotalDolares] [numeric](18, 2) NULL,
	[Estado] [nvarchar](50) NULL,
	[Accion] [nchar](10) NULL,
	[Fecha_creada] [datetime] NULL,
	[Fecha_modificada] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categoria]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[CodCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](50) NULL,
	[Nombredelproducto] [nvarchar](50) NULL,
	[CodProducto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[clientes]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [nvarchar](120) NOT NULL,
	[apellido] [nvarchar](120) NOT NULL,
	[correo] [nvarchar](80) NOT NULL,
	[celular] [int] NULL,
	[estado] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[compra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[idProveedor] [int] NULL,
	[fechaCompra] [datetime] NULL,
	[idusuario] [int] NULL,
	[Subtotal] [numeric](18, 2) NULL,
	[Descuento] [numeric](18, 2) NULL,
	[TotalCordobas] [numeric](18, 2) NULL,
	[TotalDolares] [numeric](18, 2) NULL,
	[TipoPago] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK__compra__48B99DB7A19D3F9A] PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Control_Entrada]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control_Entrada](
	[usuarioo] [nvarchar](50) NOT NULL,
	[loginn] [datetime] NOT NULL,
	[logout] [datetime] NOT NULL,
	[id_control] [int] IDENTITY(1,1) NOT NULL,
	[maquina] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Control_Entrada] PRIMARY KEY CLUSTERED 
(
	[id_control] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detallecompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallecompra](
	[idCompra] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NOT NULL,
	[total] [numeric](18, 2) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Detalledevolucion]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalledevolucion](
	[Iddevolucion] [int] NULL,
	[Idproducto] [int] NULL,
	[Cantidad] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalledevolucioncompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalledevolucioncompra](
	[Iddevolucion] [int] NULL,
	[Idproducto] [int] NULL,
	[Cantidad] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detallepago]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallepago](
	[iddetallepago] [int] IDENTITY(1,1) NOT NULL,
	[numerodocumento] [int] NULL,
	[codigotipopago] [nvarchar](50) NULL,
	[monto] [numeric](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[iddetallepago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalleventa]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleventa](
	[cantidad] [int] NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[totaldetalle] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[devolucion]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[devolucion](
	[Iddevolucion] [int] IDENTITY(1,1) NOT NULL,
	[Idusuario] [int] NULL,
	[NumVenta] [int] NULL,
	[fecha] [datetime] NULL,
	[observacion] [nvarchar](100) NULL,
 CONSTRAINT [PK__devoluci__F5D1BEAE580E2C3D] PRIMARY KEY CLUSTERED 
(
	[Iddevolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[devolucionCompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[devolucionCompra](
	[Iddevolucion] [int] IDENTITY(1,1) NOT NULL,
	[Idusuario] [int] NULL,
	[Idcompra] [int] NULL,
	[fecha] [datetime] NULL,
	[observacion] [nvarchar](100) NULL,
 CONSTRAINT [PK__devoluci__F5D1BEAEA597D7EA] PRIMARY KEY CLUSTERED 
(
	[Iddevolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[empleado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[celular] [int] NULL,
	[direccion] [nvarchar](90) NOT NULL,
	[cedula] [nvarchar](16) NOT NULL,
	[apellidos] [nvarchar](120) NOT NULL,
	[nombres] [nvarchar](80) NOT NULL,
	[fechaNac] [datetime] NOT NULL,
	[salario] [money] NOT NULL,
	[cargo] [nvarchar](50) NULL,
	[estado] [nvarchar](10) NULL,
	[idArea] [int] NULL,
	[idgrupo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[grupoTrabajadores]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupoTrabajadores](
	[idgrupo] [int] IDENTITY(1,1) NOT NULL,
	[grupoTrabajadores] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[idgrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lavado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lavado](
	[idLavado] [int] IDENTITY(1,1) NOT NULL,
	[total] [money] NOT NULL,
	[fecha] [datetime] NULL,
	[placa] [nvarchar](10) NOT NULL,
	[idLavadoVehiculo] [int] NULL,
	[idgrupo] [int] NULL,
	[usuario] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLavado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LavadoVehiculo]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LavadoVehiculo](
	[idLavadoVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[idServicioLavado] [int] NULL,
	[idVehiculoLavado] [int] NULL,
	[precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLavadoVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[logTransacciones]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logTransacciones](
	[TipoTrn] [char](1) NULL,
	[Tabla] [varchar](128) NULL,
	[PK] [varchar](1000) NULL,
	[Campo] [varchar](128) NULL,
	[ValorOriginal] [varchar](1000) NULL,
	[ValorNuevo] [varchar](1000) NULL,
	[FechaTrn] [datetime] NULL,
	[Usuario] [varchar](128) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mantenimiento]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mantenimiento](
	[idMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[total] [money] NOT NULL,
	[fecha] [datetime] NULL,
	[placa] [nvarchar](10) NOT NULL,
	[idgrupo] [int] NULL,
	[idservicioVehiculo] [int] NULL,
	[usuario] [nvarchar](100) NULL,
 CONSTRAINT [PK__mantenim__187F756A96D1568E] PRIMARY KEY CLUSTERED 
(
	[idMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[CodMarca] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [nvarchar](50) NULL,
 CONSTRAINT [PK__Marcas__AA3A5ECCCAC30603] PRIMARY KEY CLUSTERED 
(
	[CodMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pago]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pago](
	[numerodocumento] [int] NULL,
	[cordobas] [numeric](18, 6) NULL,
	[dolares] [numeric](18, 6) NULL,
	[vuelto] [numeric](18, 6) NULL,
	[fecha] [datetime] NULL,
	[idUsuario] [int] NULL,
	[montofactura] [numeric](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[permiso]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso](
	[idUsuario] [int] NULL,
	[facturar] [bit] NULL,
	[personas] [bit] NULL,
	[producto] [bit] NULL,
	[reporte] [bit] NULL,
	[mantenimiento] [bit] NULL,
	[lavado] [bit] NULL,
	[btnFacturar] [bit] NULL,
	[btnUsuarios] [bit] NULL,
	[Password] [bit] NULL,
	[usuario] [varchar](50) NULL,
	[btnProducto] [bit] NULL,
	[btnmantenimiento] [bit] NULL,
	[btnLavado] [bit] NULL,
	[btnPersona] [bit] NULL,
	[btnFacturarCompra] [bit] NULL,
	[Logs] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Productos]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[CodProducto] [int] IDENTITY(1,1) NOT NULL,
	[Producto] [nvarchar](50) NULL,
	[CodMarca] [int] NULL,
	[CodSAC] [nvarchar](20) NULL,
	[Existencia] [int] NULL,
	[Costo] [numeric](18, 2) NULL,
	[Precio] [numeric](18, 2) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK__Producto__0D06FDF334322440] PRIMARY KEY CLUSTERED 
(
	[CodProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[idProveedor] [int] IDENTITY(1,1) NOT NULL,
	[apellidos] [nvarchar](120) NULL,
	[nombres] [nvarchar](80) NOT NULL,
	[nombreempresa] [nvarchar](80) NULL,
	[direccion] [nvarchar](max) NOT NULL,
	[RUC] [nvarchar](50) NULL,
	[telefono] [nvarchar](12) NULL,
	[correo] [nvarchar](80) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK__proveedo__A3FA8E6B806206D1] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicioLavado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicioLavado](
	[idServicioLavado] [int] IDENTITY(1,1) NOT NULL,
	[servicioLavado] [nvarchar](50) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idServicioLavado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicioMantenimiento]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicioMantenimiento](
	[idServicioMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[servicioMantenimiento] [nvarchar](50) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK__servicio__55760ABF8E3ED749] PRIMARY KEY CLUSTERED 
(
	[idServicioMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServicioVehiculo]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicioVehiculo](
	[idServicioVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[idServicioMantenimiento] [int] NULL,
	[idVehiculoMantenimiento] [int] NULL,
	[precio] [money] NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idServicioVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipopago]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipopago](
	[codigotipopago] [nvarchar](50) NOT NULL,
	[TipoPago] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigotipopago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[estado] [nvarchar](10) NULL,
	[Password] [nvarchar](max) NULL,
	[idEmpleado] [int] NULL,
 CONSTRAINT [PK_idUsuario_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VehiculoLavado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiculoLavado](
	[idVehiculoLavado] [int] IDENTITY(1,1) NOT NULL,
	[vehiculoLavado] [nvarchar](50) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idVehiculoLavado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VehiculoMantenimiento]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiculoMantenimiento](
	[idVehiculoMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[vehiculoMantenimiento] [nvarchar](50) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idVehiculoMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[venta]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[NumVenta] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[idUsuario] [int] NULL,
	[fechaFac] [datetime] NULL,
	[Subtotal] [numeric](18, 2) NULL,
	[Descuento] [numeric](18, 2) NULL,
	[totalcordobas] [numeric](18, 2) NULL,
	[TipoPago] [nvarchar](50) NULL,
	[TotalDolares] [numeric](18, 2) NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK__venta__5B397B9C0054EB42] PRIMARY KEY CLUSTERED 
(
	[NumVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[area] ON 

INSERT [dbo].[area] ([idArea], [area]) VALUES (1, N'Lavado')
SET IDENTITY_INSERT [dbo].[area] OFF
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (3, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:01.847' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (4, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:01.863' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (5, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:01.863' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (6, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:01.863' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (7, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:01.863' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (8, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:01.863' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (9, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:02.300' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (10, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:02.660' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (11, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:02.987' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (12, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:02.987' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (13, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:03.207' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (14, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:03.473' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (15, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:03.677' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (16, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:04.020' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (17, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:04.237' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (18, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:04.393' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (19, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:04.580' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (20, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:04.863' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (21, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:05.050' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (22, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:05.253' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (23, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:05.440' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (24, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:05.567' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (25, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:05.690' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (26, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:05.737' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (27, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:05.863' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (28, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:05.987' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (29, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:06.097' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (30, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:06.223' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (31, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:06.317' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (32, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:06.440' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (33, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:06.550' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (34, 1, CAST(N'2018-11-04T00:00:00.000' AS DateTime), NULL, 1, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'fec', N'ad', N'Agregada  ', CAST(N'2018-04-12T05:10:06.677' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (35, 1, CAST(N'2018-04-12T05:49:38.030' AS DateTime), NULL, 1, CAST(1476.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1697.40 AS Numeric(18, 2)), CAST(54.93 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T05:49:50.747' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (36, 1, CAST(N'2018-04-12T05:50:28.080' AS DateTime), NULL, 1, CAST(123.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(141.45 AS Numeric(18, 2)), CAST(4.58 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T05:50:41.233' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (37, 1, CAST(N'2018-04-12T05:52:29.520' AS DateTime), NULL, 1, CAST(246.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(282.90 AS Numeric(18, 2)), CAST(9.16 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T05:52:43.350' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (38, 1, CAST(N'2018-04-12T05:53:52.843' AS DateTime), NULL, 1, CAST(1476.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1697.40 AS Numeric(18, 2)), CAST(54.93 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T05:54:03.837' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (39, 1, CAST(N'2018-04-12T05:54:37.953' AS DateTime), NULL, 1, CAST(1353.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1555.95 AS Numeric(18, 2)), CAST(50.35 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T05:54:57.177' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (41, 1, CAST(N'2018-04-12T06:02:21.880' AS DateTime), NULL, 2, CAST(26214252.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(30146389.80 AS Numeric(18, 2)), CAST(975611.32 AS Numeric(18, 2)), N'Efectivo', N'', N'Agregada  ', CAST(N'2018-04-12T06:02:36.457' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (47, 1, CAST(N'2018-04-12T06:26:44.333' AS DateTime), NULL, 2, CAST(15129.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(17398.35 AS Numeric(18, 2)), CAST(563.05 AS Numeric(18, 2)), N'Tarjeta', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T06:26:54.763' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (49, 1, CAST(N'2018-04-12T06:29:19.620' AS DateTime), NULL, 1, CAST(15129.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(17398.35 AS Numeric(18, 2)), CAST(563.05 AS Numeric(18, 2)), N'Tarjeta', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T06:29:29.450' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (50, 1, CAST(N'2018-04-12T07:55:38.467' AS DateTime), NULL, 2, CAST(3989505.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(4587930.75 AS Numeric(18, 2)), CAST(148476.72 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T07:55:53.643' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (53, 1, CAST(N'2018-04-25T06:18:57.090' AS DateTime), NULL, 2, CAST(26199.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(30128.85 AS Numeric(18, 2)), CAST(975.04 AS Numeric(18, 2)), N'Tarjeta', N'Cancelada', N'Agregada  ', CAST(N'2018-04-25T06:19:15.743' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (54, 1, CAST(N'2018-04-25T06:19:45.280' AS DateTime), NULL, 2, CAST(81762.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(94026.30 AS Numeric(18, 2)), CAST(3042.92 AS Numeric(18, 2)), N'Efectivo', N'', N'Agregada  ', CAST(N'2018-04-25T06:20:12.463' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (55, 1, CAST(N'2018-04-25T06:20:36.120' AS DateTime), NULL, 1, CAST(1722.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1980.30 AS Numeric(18, 2)), CAST(64.09 AS Numeric(18, 2)), N'Tarjeta', N'Pendiente', N'Agregada  ', CAST(N'2018-04-25T06:20:49.753' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (56, 1, CAST(N'2018-04-25T06:21:15.003' AS DateTime), NULL, 2, CAST(53762.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(59971.51 AS Numeric(18, 2)), CAST(1940.83 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-25T06:21:39.327' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (57, 1, CAST(N'2018-04-25T06:21:54.493' AS DateTime), NULL, 1, CAST(1476.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1697.40 AS Numeric(18, 2)), CAST(54.93 AS Numeric(18, 2)), N'Efectivo', N'Pendiente', N'Agregada  ', CAST(N'2018-04-25T06:22:08.090' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (58, 1, CAST(N'2018-04-25T06:24:22.797' AS DateTime), NULL, 1, CAST(84908.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(97644.20 AS Numeric(18, 2)), CAST(3160.01 AS Numeric(18, 2)), N'Efectivo', N'Pendiente', N'Agregada  ', CAST(N'2018-04-25T06:24:49.127' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (59, 1, CAST(N'2018-04-25T06:25:46.580' AS DateTime), NULL, 2, CAST(25914.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(29801.10 AS Numeric(18, 2)), CAST(964.44 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-25T06:26:09.607' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (60, 1, CAST(N'2018-04-25T06:26:26.823' AS DateTime), NULL, 2, CAST(14808.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(17029.20 AS Numeric(18, 2)), CAST(551.11 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-25T06:26:40.840' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (61, 1, CAST(N'2018-04-25T06:27:18.467' AS DateTime), NULL, 1, CAST(10183964.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(11711558.60 AS Numeric(18, 2)), CAST(379014.84 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-25T06:27:48.717' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (65, 1, CAST(N'2018-04-25T08:07:23.977' AS DateTime), NULL, 3, CAST(26123.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(30041.45 AS Numeric(18, 2)), CAST(972.22 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-25T08:07:53.257' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (40, 1, CAST(N'2018-04-12T05:59:43.837' AS DateTime), NULL, 1, CAST(15129.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(17398.35 AS Numeric(18, 2)), CAST(563.05 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T05:59:57.600' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (42, 1, CAST(N'2018-04-12T06:11:29.700' AS DateTime), NULL, 1, CAST(123.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(141.45 AS Numeric(18, 2)), CAST(4.58 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T06:11:42.577' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (43, 1, CAST(N'2018-04-12T06:12:25.163' AS DateTime), NULL, 1, CAST(118695.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(136499.25 AS Numeric(18, 2)), CAST(4417.45 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T06:12:37.153' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (44, 1, CAST(N'2018-04-12T06:13:17.020' AS DateTime), NULL, 1, CAST(738.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(848.70 AS Numeric(18, 2)), CAST(27.47 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T06:13:31.853' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (45, 1, CAST(N'2018-04-12T06:14:05.890' AS DateTime), NULL, 2, CAST(738.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(848.70 AS Numeric(18, 2)), CAST(27.47 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T06:14:16.627' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (46, 1, CAST(N'2018-04-12T06:18:25.427' AS DateTime), NULL, 2, CAST(738.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(848.70 AS Numeric(18, 2)), CAST(27.47 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T06:18:36.353' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (48, 1, CAST(N'2018-04-12T06:27:52.043' AS DateTime), NULL, 1, CAST(15129.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(17398.35 AS Numeric(18, 2)), CAST(563.05 AS Numeric(18, 2)), N'Tarjeta', N'12', N'Agregada  ', CAST(N'2018-04-12T06:28:04.240' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (62, 1, CAST(N'2018-04-25T06:29:37.780' AS DateTime), NULL, 2, CAST(14808.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(17029.20 AS Numeric(18, 2)), CAST(551.11 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-25T06:29:52.367' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (63, 1, CAST(N'2018-04-25T06:43:55.997' AS DateTime), NULL, 1, CAST(12.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13.80 AS Numeric(18, 2)), CAST(0.45 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-25T06:44:12.323' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (51, 1, CAST(N'2018-04-12T08:43:09.677' AS DateTime), NULL, 2, CAST(123.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(141.45 AS Numeric(18, 2)), CAST(4.58 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T08:43:24.597' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (52, 1, CAST(N'2018-04-12T09:28:05.103' AS DateTime), NULL, 2, CAST(12.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13.80 AS Numeric(18, 2)), CAST(0.45 AS Numeric(18, 2)), N'Efectivo', N'Cancelada', N'Agregada  ', CAST(N'2018-04-12T09:28:42.717' AS DateTime), NULL)
INSERT [dbo].[auditoriacompra] ([idCompra], [idProveedor], [fechaCompra], [HoraCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (64, 1, CAST(N'2018-04-25T07:57:49.507' AS DateTime), NULL, 3, CAST(500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(575.00 AS Numeric(18, 2)), CAST(18.61 AS Numeric(18, 2)), N'Tarjeta', N'Cancelada', N'Agregada  ', CAST(N'2018-04-25T07:58:02.430' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (2, 80.0000, CAST(N'2018-04-10T00:00:00.000' AS DateTime), N'RS 0066', 5, 4, N'joc', N'Agregado', CAST(N'2018-04-10T00:35:07.747' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (3, 450.0000, CAST(N'2018-04-10T00:00:00.000' AS DateTime), N'CH 5454', 4, 1, N'joc', N'Agregado', CAST(N'2018-04-10T11:48:16.853' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (6, 350.0000, CAST(N'2018-04-11T00:00:00.000' AS DateTime), N'm 1234', 1, 2, N'joc', N'Agregado', CAST(N'2018-04-11T07:54:21.167' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (7, 80.0000, CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'MS4544', 5, 1, N'new', N'Agregado', CAST(N'2018-04-12T21:30:43.637' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (8, 450.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'RS 000215', 4, 1, N'joc', N'Agregado', CAST(N'2018-04-13T00:03:40.527' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (9, 180.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'JI 2798', 2, 4, N'joc', N'Agregado', CAST(N'2018-04-13T00:04:08.550' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (11, 80.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'tdgfsghs', 5, 4, N'joc', N'Agregado', CAST(N'2018-04-13T12:37:58.080' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (12, 80.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'NS 15574', 5, 4, N'joc', N'Agregado', CAST(N'2018-04-13T14:33:34.757' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (13, 150.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'jmj', 3, 2, N'joc', N'Agregado', CAST(N'2018-04-13T16:32:54.983' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (14, 150.0000, CAST(N'2018-04-13T16:39:17.000' AS DateTime), N'ns 242', 3, 2, N'joc', N'Agregado', CAST(N'2018-04-13T16:39:29.153' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (15, 80.0000, CAST(N'2018-04-13T16:40:36.000' AS DateTime), N'jhu', 5, 2, N'joc', N'Agregado', CAST(N'2018-04-13T16:40:43.177' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (16, 350.0000, CAST(N'2018-04-16T20:14:20.000' AS DateTime), N'MT 54878', 1, 2, N'joc', N'Agregado', CAST(N'2018-04-16T20:14:34.663' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (17, 350.0000, CAST(N'2018-04-16T23:56:52.000' AS DateTime), N'MT 1511', 1, 4, N'joc', N'Agregado', CAST(N'2018-04-16T23:57:04.380' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (18, 600.0000, CAST(N'2018-04-17T00:00:10.000' AS DateTime), N'MS 5855', 6, 1, N'joc', N'Agregado', CAST(N'2018-04-17T00:00:39.163' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (20, 450.0000, CAST(N'2018-04-17T00:08:40.000' AS DateTime), N'RS', 4, 1, N'joc', N'Agregado', CAST(N'2018-04-17T00:08:52.457' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (24, 180.0000, CAST(N'2018-04-17T00:18:47.000' AS DateTime), N'dd', 2, 2, N'joc', N'Agregado', CAST(N'2018-04-17T00:18:53.123' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (25, 350.0000, CAST(N'2018-04-17T00:20:06.000' AS DateTime), N'rsss', 1, 2, N'joc', N'Agregado', CAST(N'2018-04-17T00:20:14.513' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (26, 450.0000, CAST(N'2018-04-17T00:21:28.000' AS DateTime), N'rrss', 4, 1, N'joc', N'Agregado', CAST(N'2018-04-17T00:21:39.077' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (28, 180.0000, CAST(N'2018-04-17T00:26:01.000' AS DateTime), N'mn 02266', 2, 4, N'joc', N'Agregado', CAST(N'2018-04-17T00:26:19.100' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (29, 180.0000, CAST(N'2018-04-17T00:27:39.000' AS DateTime), N'Rs 23559', 2, 1, N'joc', N'Agregado', CAST(N'2018-04-17T00:27:56.037' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (30, 180.0000, CAST(N'2018-04-17T00:29:16.000' AS DateTime), N'M 144871', 2, 1, N'joc', N'Agregado', CAST(N'2018-04-17T00:29:30.110' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (10, 600.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'NS 1215', 6, 1, N'joc', N'Agregado', CAST(N'2018-04-13T00:08:54.040' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (19, 180.0000, CAST(N'2018-04-17T00:05:16.000' AS DateTime), N'mk', 2, 1, N'joc', N'Agregado', CAST(N'2018-04-17T00:05:24.657' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (21, 80.0000, CAST(N'2018-04-17T00:10:04.000' AS DateTime), N'MN', 5, 4, N'joc', N'Agregado', CAST(N'2018-04-17T00:10:17.857' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (22, 150.0000, CAST(N'2018-04-17T00:14:47.000' AS DateTime), N'MS', 3, 4, N'joc', N'Agregado', CAST(N'2018-04-17T00:15:15.110' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (23, 180.0000, CAST(N'2018-04-17T00:17:42.000' AS DateTime), N'f', 2, 1, N'joc', N'Agregado', CAST(N'2018-04-17T00:17:48.797' AS DateTime), NULL)
INSERT [dbo].[auditoriaLavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idGrupo], [usuario], [accion], [fechaCreada], [fechaModificado]) VALUES (27, 80.0000, CAST(N'2018-04-17T00:23:32.000' AS DateTime), N'MN', 5, 4, N'joc', N'Agregado', CAST(N'2018-04-17T00:23:46.220' AS DateTime), NULL)
INSERT [dbo].[AuditoriaMantenimiento] ([total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario], [accion], [fechacreada], [fechamodificada], [idmantenimiento]) VALUES (800.0000, CAST(N'2018-10-04' AS Date), N'M 021545', 2, 1, N'joc', N'Agregado  ', CAST(N'2018-04-10T00:25:58.180' AS DateTime), NULL, 1)
INSERT [dbo].[AuditoriaMantenimiento] ([total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario], [accion], [fechacreada], [fechamodificada], [idmantenimiento]) VALUES (800.0000, CAST(N'2018-04-13' AS Date), N'dad', 1, 1, N'joc', N'Agregado  ', CAST(N'2018-04-13T16:29:47.453' AS DateTime), NULL, 3)
INSERT [dbo].[AuditoriaMantenimiento] ([total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario], [accion], [fechacreada], [fechamodificada], [idmantenimiento]) VALUES (800.0000, CAST(N'2018-04-13' AS Date), N'ns ', 2, 1, N'joc', N'Agregado  ', CAST(N'2018-04-13T16:30:50.390' AS DateTime), NULL, 4)
INSERT [dbo].[AuditoriaMantenimiento] ([total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario], [accion], [fechacreada], [fechamodificada], [idmantenimiento]) VALUES (800.0000, CAST(N'2018-04-13' AS Date), N'ms 54554', 2, 1, N'joc', N'Agregado  ', CAST(N'2018-04-13T16:31:18.060' AS DateTime), NULL, 5)
INSERT [dbo].[AuditoriaMantenimiento] ([total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario], [accion], [fechacreada], [fechamodificada], [idmantenimiento]) VALUES (800.0000, CAST(N'2018-04-13' AS Date), N',kjk', 2, 1, N'joc', N'Agregado  ', CAST(N'2018-04-13T16:32:15.097' AS DateTime), NULL, 6)
INSERT [dbo].[AuditoriaMantenimiento] ([total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario], [accion], [fechacreada], [fechamodificada], [idmantenimiento]) VALUES (800.0000, CAST(N'2018-04-16' AS Date), N'jjk5', 1, 1, N'joc', N'Agregado  ', CAST(N'2018-04-16T20:13:53.770' AS DateTime), NULL, 7)
INSERT [dbo].[AuditoriaMantenimiento] ([total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario], [accion], [fechacreada], [fechamodificada], [idmantenimiento]) VALUES (800.0000, CAST(N'2018-04-17' AS Date), N'MN 00045', 2, 1, N'joc', N'Agregado  ', CAST(N'2018-04-17T00:24:39.163' AS DateTime), NULL, 8)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (327, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:56.697' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (328, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:56.727' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (329, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:56.947' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (330, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:57.073' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (331, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:57.277' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (332, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:57.400' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (333, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:57.557' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (334, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:57.667' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (335, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:57.837' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (336, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:57.947' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (337, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:58.103' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (338, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:58.213' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (339, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:58.370' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (340, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:58.557' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (341, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:58.650' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (342, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:58.760' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (343, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:58.917' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (344, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:59.087' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (345, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:59.183' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (346, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:59.370' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (347, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:59.463' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (348, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:59.650' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (349, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:59.807' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (350, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:31:59.837' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (351, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:32:00.083' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (352, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:32:00.193' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (353, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:32:00.303' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (354, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:32:00.397' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (355, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:32:00.443' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (356, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:32:00.583' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (357, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:32:00.770' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (358, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:32:00.867' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (359, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:11.510' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (360, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:11.713' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (361, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:11.807' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (362, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:11.903' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (363, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:12.057' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (364, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:12.153' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (365, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:12.340' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (366, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:12.417' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (367, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:12.620' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (368, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:12.697' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (369, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:12.870' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (370, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:13.043' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (371, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:13.137' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (372, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:13.247' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (373, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:13.417' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (374, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:13.590' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (375, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:13.697' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (376, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:13.870' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (377, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:13.980' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (378, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:14.153' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (379, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:14.323' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (380, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:14.433' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (381, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:14.620' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (382, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:14.793' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (383, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:14.903' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (384, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:15.073' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (385, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:15.197' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (386, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:15.417' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (387, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:15.543' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (388, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:15.730' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (389, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:15.857' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (390, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:33:16.043' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (390, 0, 0, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), N'', NULL, CAST(0.00 AS Numeric(18, 2)), N'', N'Agregado  ', CAST(N'2018-04-11T08:35:54.580' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (392, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:54.860' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (393, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:55.033' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (394, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:55.140' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (395, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:55.313' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (396, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:55.423' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (397, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:55.580' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (398, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:55.687' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (399, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:55.843' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (400, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:55.953' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (401, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:56.063' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (402, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:56.237' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (403, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:56.390' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (404, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:56.500' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (405, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:56.687' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (406, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:56.797' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (407, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:56.987' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (408, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:57.080' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (409, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:57.283' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (410, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:57.423' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (411, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:57.610' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (412, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:57.720' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (413, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:57.953' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (414, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:58.080' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (415, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:58.297' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (416, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:58.453' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (417, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:58.640' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (418, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:58.767' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (419, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:58.987' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (420, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:59.250' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (421, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:59.610' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (422, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', NULL, CAST(1.00 AS Numeric(18, 2)), N'cancelada', N'Agregado  ', CAST(N'2018-04-11T08:35:59.807' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (423, 1, 1, CAST(N'2018-04-11T09:40:50.447' AS DateTime), CAST(132.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(151.80 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(4.91 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-11T09:41:05.260' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (424, 2, 2, CAST(N'2018-04-13T13:43:52.703' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1.15 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(0.04 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T13:44:04.693' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (428, 2, 2, CAST(N'2018-04-13T14:05:36.640' AS DateTime), CAST(5250.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(6037.50 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(195.39 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T14:05:48.437' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (429, 2, 2, CAST(N'2018-04-13T14:17:10.337' AS DateTime), CAST(6000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(6900.00 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(223.30 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T14:17:26.070' AS DateTime), NULL)
GO
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (431, 2, 1, CAST(N'2018-04-13T15:20:14.807' AS DateTime), CAST(12000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13800.00 AS Numeric(18, 2)), N'Tarjeta', NULL, CAST(446.60 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T15:20:29.097' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (433, 2, 1, CAST(N'2018-04-13T15:25:59.547' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1.15 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(0.04 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T15:26:17.137' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (434, 2, 2, CAST(N'2018-04-13T15:27:08.433' AS DateTime), CAST(10500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(12075.00 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(390.78 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T15:27:20.650' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (435, 2, 2, CAST(N'2018-04-13T15:47:26.903' AS DateTime), CAST(2.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(2.30 AS Numeric(18, 2)), N'Tarjeta', NULL, CAST(0.07 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T15:47:36.637' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (436, 2, 1, CAST(N'2018-04-13T15:49:25.773' AS DateTime), CAST(10500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(12075.00 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(390.78 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T15:49:37.107' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (437, 2, 2, CAST(N'2018-04-13T15:50:53.790' AS DateTime), CAST(6000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(6900.00 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(223.30 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T15:51:06.060' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (425, 2, 1, CAST(N'2018-04-13T13:45:15.017' AS DateTime), CAST(77024.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(88577.60 AS Numeric(18, 2)), N'Tarjeta', NULL, CAST(2866.59 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T13:45:58.380' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (426, 2, 2, CAST(N'2018-04-13T13:46:12.650' AS DateTime), CAST(33.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(37.95 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(1.23 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T13:46:32.473' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (427, 2, 2, CAST(N'2018-04-13T13:48:10.090' AS DateTime), CAST(1262.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1451.30 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(46.97 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T13:48:32.307' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (430, 2, 2, CAST(N'2018-04-13T14:38:53.020' AS DateTime), CAST(6032.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(6936.80 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(224.49 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T14:39:17.473' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (432, 2, 2, CAST(N'2018-04-13T15:22:42.360' AS DateTime), CAST(2054.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(2362.10 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(76.44 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T15:23:01.197' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (439, 2, 2, CAST(N'2018-04-13T15:53:17.570' AS DateTime), CAST(503500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(579025.00 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(18738.67 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T15:53:42.047' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (440, 2, 2, CAST(N'2018-04-13T17:02:01.760' AS DateTime), CAST(6000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(6900.00 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(223.30 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T17:02:12.410' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (441, 2, 2, CAST(N'2018-04-13T17:02:47.977' AS DateTime), CAST(250.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(287.50 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(9.30 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T17:02:58.957' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (443, 2, 2, CAST(N'2018-04-13T17:15:55.103' AS DateTime), CAST(6300.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(7245.00 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(234.47 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T17:16:09.540' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (444, 2, 1, CAST(N'2018-04-13T17:20:45.883' AS DateTime), CAST(9027.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(10381.05 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(335.96 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T17:21:15.053' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (446, 2, 2, CAST(N'2018-04-25T00:43:46.217' AS DateTime), CAST(3324.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(3822.60 AS Numeric(18, 2)), N'Tarjeta', NULL, CAST(123.71 AS Numeric(18, 2)), N'Anulada', N'Agregado  ', CAST(N'2018-04-25T00:44:45.843' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (447, 2, 2, CAST(N'2018-04-25T00:49:15.783' AS DateTime), CAST(5.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(5.75 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(0.19 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-25T00:49:50.400' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (448, 2, 1, CAST(N'2018-04-25T00:53:14.223' AS DateTime), CAST(12.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13.80 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(0.45 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-25T00:53:31.280' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (449, 2, 2, CAST(N'2018-04-25T00:59:13.603' AS DateTime), CAST(3456.00 AS Numeric(18, 2)), CAST(123.00 AS Numeric(18, 2)), CAST(3974.40 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(128.62 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-25T01:00:01.807' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (450, 2, 2, CAST(N'2018-04-25T01:00:28.253' AS DateTime), CAST(3004.00 AS Numeric(18, 2)), CAST(12.00 AS Numeric(18, 2)), CAST(3040.05 AS Numeric(18, 2)), N'Tarjeta', NULL, CAST(98.38 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-25T01:01:17.757' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (451, 2, 2, CAST(N'2018-04-25T06:22:38.570' AS DateTime), CAST(144.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(165.60 AS Numeric(18, 2)), N'Tarjeta', NULL, CAST(5.36 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-25T06:22:50.610' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (452, 2, 3, CAST(N'2018-04-25T07:56:44.537' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1.15 AS Numeric(18, 2)), N'Tarjeta', NULL, CAST(0.04 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-25T07:57:03.440' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (453, 2, 3, CAST(N'2018-04-25T08:03:33.010' AS DateTime), CAST(12.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13.80 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(0.45 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-25T08:03:46.127' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (438, 2, 1, CAST(N'2018-04-13T15:52:53.210' AS DateTime), CAST(12000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13800.00 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(446.60 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T15:53:05.647' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (442, 2, 2, CAST(N'2018-04-13T17:13:57.567' AS DateTime), CAST(6144.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(7065.60 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(228.66 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T17:14:12.977' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (445, 2, 2, CAST(N'2018-04-13T17:25:18.673' AS DateTime), CAST(24.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(27.60 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(0.89 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-13T17:25:28.793' AS DateTime), NULL)
INSERT [dbo].[AuditoriaVenta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [HoraFac], [TotalDolares], [Estado], [Accion], [Fecha_creada], [Fecha_modificada]) VALUES (454, 2, 3, CAST(N'2018-04-25T08:03:58.900' AS DateTime), CAST(23512.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(27038.80 AS Numeric(18, 2)), N'Efectivo', NULL, CAST(875.04 AS Numeric(18, 2)), N'Cancelada', N'Agregado  ', CAST(N'2018-04-25T08:04:29.550' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([idCliente], [nombres], [apellido], [correo], [celular], [estado]) VALUES (1, N'gelder', N'g', N'ome', 123, N'activo')
INSERT [dbo].[clientes] ([idCliente], [nombres], [apellido], [correo], [celular], [estado]) VALUES (2, N'fsdgfd', N'fasd', N'fdsafasd', 12314, N'Activo')
SET IDENTITY_INSERT [dbo].[clientes] OFF
SET IDENTITY_INSERT [dbo].[compra] ON 

INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (52, 1, CAST(N'2018-04-12T09:28:05.103' AS DateTime), 2, CAST(12.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13.80 AS Numeric(18, 2)), CAST(0.45 AS Numeric(18, 2)), N'Efectivo', N'Cancelada')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (53, 1, CAST(N'2018-04-25T06:18:57.090' AS DateTime), 2, CAST(26199.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(30128.85 AS Numeric(18, 2)), CAST(975.04 AS Numeric(18, 2)), N'Tarjeta', N'Cancelada')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (54, 1, CAST(N'2018-04-25T06:19:45.280' AS DateTime), 2, CAST(81762.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(94026.30 AS Numeric(18, 2)), CAST(3042.92 AS Numeric(18, 2)), N'Efectivo', N'')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (55, 1, CAST(N'2018-04-25T06:20:36.120' AS DateTime), 1, CAST(1722.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1980.30 AS Numeric(18, 2)), CAST(64.09 AS Numeric(18, 2)), N'Tarjeta', N'Pendiente')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (56, 1, CAST(N'2018-04-25T06:21:15.003' AS DateTime), 2, CAST(53762.00 AS Numeric(18, 2)), CAST(3.00 AS Numeric(18, 2)), CAST(59971.51 AS Numeric(18, 2)), CAST(1940.83 AS Numeric(18, 2)), N'Efectivo', N'Cancelada')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (57, 1, CAST(N'2018-04-25T06:21:54.493' AS DateTime), 1, CAST(1476.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1697.40 AS Numeric(18, 2)), CAST(54.93 AS Numeric(18, 2)), N'Efectivo', N'Pendiente')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (58, 1, CAST(N'2018-04-25T06:24:22.797' AS DateTime), 1, CAST(84908.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(97644.20 AS Numeric(18, 2)), CAST(3160.01 AS Numeric(18, 2)), N'Efectivo', N'Pendiente')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (59, 1, CAST(N'2018-04-25T06:25:46.580' AS DateTime), 2, CAST(25914.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(29801.10 AS Numeric(18, 2)), CAST(964.44 AS Numeric(18, 2)), N'Efectivo', N'Cancelada')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (60, 1, CAST(N'2018-04-25T06:26:26.823' AS DateTime), 2, CAST(14808.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(17029.20 AS Numeric(18, 2)), CAST(551.11 AS Numeric(18, 2)), N'Efectivo', N'Anulada')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (61, 1, CAST(N'2018-04-25T06:27:18.467' AS DateTime), 1, CAST(10183964.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(11711558.60 AS Numeric(18, 2)), CAST(379014.84 AS Numeric(18, 2)), N'Efectivo', N'Anulada')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (62, 1, CAST(N'2018-04-25T06:29:37.780' AS DateTime), 2, CAST(14808.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(17029.20 AS Numeric(18, 2)), CAST(551.11 AS Numeric(18, 2)), N'Efectivo', N'Cancelada')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (63, 1, CAST(N'2018-04-25T06:43:55.997' AS DateTime), 1, CAST(12.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13.80 AS Numeric(18, 2)), CAST(0.45 AS Numeric(18, 2)), N'Efectivo', N'Anulada')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (64, 1, CAST(N'2018-04-25T07:57:49.507' AS DateTime), 3, CAST(500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(575.00 AS Numeric(18, 2)), CAST(18.61 AS Numeric(18, 2)), N'Tarjeta', N'Cancelada')
INSERT [dbo].[compra] ([idCompra], [idProveedor], [fechaCompra], [idusuario], [Subtotal], [Descuento], [TotalCordobas], [TotalDolares], [TipoPago], [Estado]) VALUES (65, 1, CAST(N'2018-04-25T08:07:23.977' AS DateTime), 3, CAST(26123.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(30041.45 AS Numeric(18, 2)), CAST(972.22 AS Numeric(18, 2)), N'Efectivo', N'Cancelada')
SET IDENTITY_INSERT [dbo].[compra] OFF
SET IDENTITY_INSERT [dbo].[Control_Entrada] ON 

INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-09T23:53:18.667' AS DateTime), CAST(N'2018-04-09T23:55:37.577' AS DateTime), 1, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-09T23:55:42.587' AS DateTime), CAST(N'2018-04-09T23:59:55.437' AS DateTime), 2, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T00:03:11.980' AS DateTime), CAST(N'2018-04-10T00:03:11.980' AS DateTime), 3, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T00:04:24.617' AS DateTime), CAST(N'2018-04-10T00:06:48.747' AS DateTime), 4, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'NEW ', CAST(N'2018-04-10T00:06:54.743' AS DateTime), CAST(N'2018-04-10T00:11:11.427' AS DateTime), 5, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T00:11:14.817' AS DateTime), CAST(N'2018-04-10T00:11:36.883' AS DateTime), 6, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'NEW', CAST(N'2018-04-10T00:11:42.847' AS DateTime), CAST(N'2018-04-10T00:12:04.083' AS DateTime), 7, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T00:12:07.443' AS DateTime), CAST(N'2018-04-10T00:12:29.813' AS DateTime), 8, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'NEW ', CAST(N'2018-04-10T00:12:34.253' AS DateTime), CAST(N'2018-04-10T00:12:39.837' AS DateTime), 9, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T00:18:05.177' AS DateTime), CAST(N'2018-04-10T00:18:05.177' AS DateTime), 10, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T00:18:53.807' AS DateTime), CAST(N'2018-04-10T00:18:53.807' AS DateTime), 11, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T00:19:52.613' AS DateTime), CAST(N'2018-04-10T00:19:52.613' AS DateTime), 12, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T00:23:28.470' AS DateTime), CAST(N'2018-04-10T00:23:28.470' AS DateTime), 13, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T00:34:40.267' AS DateTime), CAST(N'2018-04-10T00:36:14.173' AS DateTime), 14, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'NEW', CAST(N'2018-04-10T01:08:53.930' AS DateTime), CAST(N'2018-04-10T01:09:06.483' AS DateTime), 15, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T01:09:10.370' AS DateTime), CAST(N'2018-04-10T01:09:10.370' AS DateTime), 16, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T01:09:18.363' AS DateTime), CAST(N'2018-04-10T01:09:18.363' AS DateTime), 17, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T01:09:47.777' AS DateTime), CAST(N'2018-04-10T01:10:21.773' AS DateTime), 18, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T01:10:26.617' AS DateTime), CAST(N'2018-04-10T01:10:58.613' AS DateTime), 19, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T01:11:05.100' AS DateTime), CAST(N'2018-04-10T01:11:15.717' AS DateTime), 20, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'NEW ', CAST(N'2018-04-10T01:11:22.907' AS DateTime), CAST(N'2018-04-10T01:11:35.490' AS DateTime), 21, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T02:56:52.857' AS DateTime), CAST(N'2018-04-10T02:56:54.807' AS DateTime), 22, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T02:57:00.647' AS DateTime), CAST(N'2018-04-10T02:57:15.357' AS DateTime), 23, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T02:58:25.520' AS DateTime), CAST(N'2018-04-10T02:58:25.520' AS DateTime), 24, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T02:58:30.127' AS DateTime), CAST(N'2018-04-10T02:58:30.127' AS DateTime), 25, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:03:47.943' AS DateTime), CAST(N'2018-04-10T03:03:57.097' AS DateTime), 26, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:04:42.877' AS DateTime), CAST(N'2018-04-10T03:04:42.877' AS DateTime), 27, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:05:36.083' AS DateTime), CAST(N'2018-04-10T03:05:36.083' AS DateTime), 28, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:05:59.657' AS DateTime), CAST(N'2018-04-10T03:05:59.657' AS DateTime), 29, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:08:18.987' AS DateTime), CAST(N'2018-04-10T03:08:18.987' AS DateTime), 30, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:09:39.180' AS DateTime), CAST(N'2018-04-10T03:09:39.180' AS DateTime), 31, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:13:27.160' AS DateTime), CAST(N'2018-04-10T03:13:27.160' AS DateTime), 32, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:13:32.027' AS DateTime), CAST(N'2018-04-10T03:13:32.027' AS DateTime), 33, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:15:19.893' AS DateTime), CAST(N'2018-04-10T03:15:19.893' AS DateTime), 34, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:32:45.330' AS DateTime), CAST(N'2018-04-10T03:32:45.330' AS DateTime), 35, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:34:13.327' AS DateTime), CAST(N'2018-04-10T03:34:13.327' AS DateTime), 36, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:35:09.597' AS DateTime), CAST(N'2018-04-10T03:35:09.597' AS DateTime), 37, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:36:29.200' AS DateTime), CAST(N'2018-04-10T03:36:29.200' AS DateTime), 38, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:36:56.047' AS DateTime), CAST(N'2018-04-10T03:36:56.047' AS DateTime), 39, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:49:42.433' AS DateTime), CAST(N'2018-04-10T03:49:42.433' AS DateTime), 40, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:50:21.020' AS DateTime), CAST(N'2018-04-10T03:50:21.020' AS DateTime), 41, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T03:57:19.897' AS DateTime), CAST(N'2018-04-10T03:57:19.897' AS DateTime), 42, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T04:01:03.867' AS DateTime), CAST(N'2018-04-10T04:01:03.867' AS DateTime), 43, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T04:02:42.913' AS DateTime), CAST(N'2018-04-10T04:02:42.913' AS DateTime), 44, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T04:09:39.393' AS DateTime), CAST(N'2018-04-10T04:09:39.393' AS DateTime), 45, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T04:10:39.533' AS DateTime), CAST(N'2018-04-10T04:10:39.533' AS DateTime), 46, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T04:14:13.597' AS DateTime), CAST(N'2018-04-10T04:14:39.983' AS DateTime), 47, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T11:44:04.643' AS DateTime), CAST(N'2018-04-10T11:44:04.643' AS DateTime), 48, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T11:47:30.053' AS DateTime), CAST(N'2018-04-10T11:47:30.053' AS DateTime), 49, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T11:51:42.110' AS DateTime), CAST(N'2018-04-10T11:51:42.110' AS DateTime), 50, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-10T11:54:04.160' AS DateTime), CAST(N'2018-04-10T11:54:04.160' AS DateTime), 51, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'J', CAST(N'2018-04-11T07:50:43.643' AS DateTime), CAST(N'2018-04-11T07:50:43.643' AS DateTime), 52, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T07:50:53.693' AS DateTime), CAST(N'2018-04-11T07:50:53.693' AS DateTime), 53, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T07:50:58.277' AS DateTime), CAST(N'2018-04-11T07:51:23.457' AS DateTime), 54, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T07:51:53.643' AS DateTime), CAST(N'2018-04-11T07:52:07.160' AS DateTime), 55, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T07:52:40.087' AS DateTime), CAST(N'2018-04-11T07:54:39.347' AS DateTime), 56, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'J', CAST(N'2018-04-11T07:59:28.070' AS DateTime), CAST(N'2018-04-11T07:59:28.070' AS DateTime), 57, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T07:59:32.660' AS DateTime), CAST(N'2018-04-11T08:00:06.287' AS DateTime), 58, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:38:21.347' AS DateTime), CAST(N'2018-04-11T08:38:29.780' AS DateTime), 59, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:38:40.537' AS DateTime), CAST(N'2018-04-11T08:38:43.707' AS DateTime), 60, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:39:44.353' AS DateTime), CAST(N'2018-04-11T08:39:50.620' AS DateTime), 61, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:41:35.447' AS DateTime), CAST(N'2018-04-11T08:41:35.447' AS DateTime), 62, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:42:30.213' AS DateTime), CAST(N'2018-04-11T08:42:30.213' AS DateTime), 63, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:42:52.787' AS DateTime), CAST(N'2018-04-11T08:42:52.787' AS DateTime), 64, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:45:12.863' AS DateTime), CAST(N'2018-04-11T08:45:12.863' AS DateTime), 65, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:45:36.107' AS DateTime), CAST(N'2018-04-11T08:46:05.527' AS DateTime), 66, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:46:58.747' AS DateTime), CAST(N'2018-04-11T08:46:58.747' AS DateTime), 67, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:49:52.263' AS DateTime), CAST(N'2018-04-11T08:50:26.783' AS DateTime), 68, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:50:52.793' AS DateTime), CAST(N'2018-04-11T08:51:10.463' AS DateTime), 69, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:51:33.193' AS DateTime), CAST(N'2018-04-11T08:51:45.517' AS DateTime), 70, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:53:00.527' AS DateTime), CAST(N'2018-04-11T08:53:26.307' AS DateTime), 71, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T08:56:06.397' AS DateTime), CAST(N'2018-04-11T08:56:24.237' AS DateTime), 72, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T09:37:36.853' AS DateTime), CAST(N'2018-04-11T09:38:44.307' AS DateTime), 73, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T09:38:51.037' AS DateTime), CAST(N'2018-04-11T09:39:32.503' AS DateTime), 74, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T09:40:47.307' AS DateTime), CAST(N'2018-04-11T09:41:42.383' AS DateTime), 75, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T09:43:43.360' AS DateTime), CAST(N'2018-04-11T09:43:43.360' AS DateTime), 76, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T09:43:46.137' AS DateTime), CAST(N'2018-04-11T09:44:11.780' AS DateTime), 77, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T09:44:39.367' AS DateTime), CAST(N'2018-04-11T09:44:39.367' AS DateTime), 78, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T09:44:43.540' AS DateTime), CAST(N'2018-04-11T09:45:09.040' AS DateTime), 79, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T09:49:24.047' AS DateTime), CAST(N'2018-04-11T09:49:24.047' AS DateTime), 80, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T09:50:57.233' AS DateTime), CAST(N'2018-04-11T09:51:11.670' AS DateTime), 81, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T18:14:45.877' AS DateTime), CAST(N'2018-04-11T18:15:21.377' AS DateTime), 82, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T18:34:49.560' AS DateTime), CAST(N'2018-04-11T18:34:59.057' AS DateTime), 83, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T18:38:57.907' AS DateTime), CAST(N'2018-04-11T18:39:34.957' AS DateTime), 84, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T18:39:53.573' AS DateTime), CAST(N'2018-04-11T18:39:53.573' AS DateTime), 85, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T18:41:07.327' AS DateTime), CAST(N'2018-04-11T18:41:15.273' AS DateTime), 86, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T18:43:53.720' AS DateTime), CAST(N'2018-04-11T18:43:53.720' AS DateTime), 87, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T18:45:06.947' AS DateTime), CAST(N'2018-04-11T18:45:06.947' AS DateTime), 88, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T18:45:40.457' AS DateTime), CAST(N'2018-04-11T18:45:49.110' AS DateTime), 89, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:07:36.357' AS DateTime), CAST(N'2018-04-11T19:08:16.293' AS DateTime), 90, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:10:16.277' AS DateTime), CAST(N'2018-04-11T19:10:22.900' AS DateTime), 91, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:10:49.783' AS DateTime), CAST(N'2018-04-11T19:10:49.783' AS DateTime), 92, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:12:42.983' AS DateTime), CAST(N'2018-04-11T19:13:03.637' AS DateTime), 93, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:16:35.957' AS DateTime), CAST(N'2018-04-11T19:16:41.333' AS DateTime), 94, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:17:22.543' AS DateTime), CAST(N'2018-04-11T19:17:22.543' AS DateTime), 95, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:18:52.333' AS DateTime), CAST(N'2018-04-11T19:18:52.333' AS DateTime), 96, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:21:12.823' AS DateTime), CAST(N'2018-04-11T19:21:22.243' AS DateTime), 97, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:32:50.377' AS DateTime), CAST(N'2018-04-11T19:33:36.347' AS DateTime), 98, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:39:41.663' AS DateTime), CAST(N'2018-04-11T19:39:48.723' AS DateTime), 99, N'GelderGomez\Gelder')
GO
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:40:41.683' AS DateTime), CAST(N'2018-04-11T19:40:50.010' AS DateTime), 100, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:41:18.697' AS DateTime), CAST(N'2018-04-11T19:41:25.400' AS DateTime), 101, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:43:30.557' AS DateTime), CAST(N'2018-04-11T19:43:30.557' AS DateTime), 102, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-11T19:45:33.667' AS DateTime), CAST(N'2018-04-11T19:46:09.647' AS DateTime), 103, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T05:45:16.953' AS DateTime), CAST(N'2018-04-12T05:45:16.953' AS DateTime), 104, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T05:45:41.993' AS DateTime), CAST(N'2018-04-12T05:45:41.993' AS DateTime), 105, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T05:48:21.663' AS DateTime), CAST(N'2018-04-12T05:49:56.313' AS DateTime), 106, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T05:50:23.817' AS DateTime), CAST(N'2018-04-12T05:50:23.817' AS DateTime), 107, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T05:51:58.743' AS DateTime), CAST(N'2018-04-12T05:51:58.743' AS DateTime), 108, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T05:52:23.520' AS DateTime), CAST(N'2018-04-12T05:52:23.520' AS DateTime), 109, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T05:53:47.863' AS DateTime), CAST(N'2018-04-12T05:53:47.863' AS DateTime), 110, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T05:54:34.247' AS DateTime), CAST(N'2018-04-12T05:55:12.760' AS DateTime), 111, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T05:56:20.293' AS DateTime), CAST(N'2018-04-12T05:56:50.470' AS DateTime), 112, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T05:59:38.873' AS DateTime), CAST(N'2018-04-12T06:00:18.707' AS DateTime), 113, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:00:59.903' AS DateTime), CAST(N'2018-04-12T06:01:11.410' AS DateTime), 114, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:02:18.347' AS DateTime), CAST(N'2018-04-12T06:02:42.943' AS DateTime), 115, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:05:08.377' AS DateTime), CAST(N'2018-04-12T06:05:27.947' AS DateTime), 116, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:10:41.007' AS DateTime), CAST(N'2018-04-12T06:10:53.167' AS DateTime), 117, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:11:26.377' AS DateTime), CAST(N'2018-04-12T06:11:26.377' AS DateTime), 118, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:12:22.237' AS DateTime), CAST(N'2018-04-12T06:12:56.813' AS DateTime), 119, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:13:13.940' AS DateTime), CAST(N'2018-04-12T06:13:40.980' AS DateTime), 120, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:14:02.507' AS DateTime), CAST(N'2018-04-12T06:14:28.433' AS DateTime), 121, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:18:22.097' AS DateTime), CAST(N'2018-04-12T06:18:56.437' AS DateTime), 122, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:19:32.407' AS DateTime), CAST(N'2018-04-12T06:20:04.160' AS DateTime), 123, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:22:40.523' AS DateTime), CAST(N'2018-04-12T06:26:19.057' AS DateTime), 124, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:26:40.663' AS DateTime), CAST(N'2018-04-12T06:26:40.663' AS DateTime), 125, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:27:49.130' AS DateTime), CAST(N'2018-04-12T06:28:19.320' AS DateTime), 126, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:29:02.497' AS DateTime), CAST(N'2018-04-12T06:29:07.593' AS DateTime), 127, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:29:16.333' AS DateTime), CAST(N'2018-04-12T06:29:44.310' AS DateTime), 128, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:43:28.920' AS DateTime), CAST(N'2018-04-12T06:43:28.920' AS DateTime), 129, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:44:37.713' AS DateTime), CAST(N'2018-04-12T06:44:37.713' AS DateTime), 130, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:44:41.040' AS DateTime), CAST(N'2018-04-12T06:44:41.040' AS DateTime), 131, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:45:10.997' AS DateTime), CAST(N'2018-04-12T06:45:10.997' AS DateTime), 132, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:47:43.897' AS DateTime), CAST(N'2018-04-12T06:47:43.897' AS DateTime), 133, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:48:03.853' AS DateTime), CAST(N'2018-04-12T06:48:03.853' AS DateTime), 134, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T06:49:00.483' AS DateTime), CAST(N'2018-04-12T06:49:00.483' AS DateTime), 135, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T07:43:56.387' AS DateTime), CAST(N'2018-04-12T07:44:31.313' AS DateTime), 136, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T07:45:26.567' AS DateTime), CAST(N'2018-04-12T07:45:26.567' AS DateTime), 137, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T07:46:40.810' AS DateTime), CAST(N'2018-04-12T07:46:54.717' AS DateTime), 138, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T07:54:29.987' AS DateTime), CAST(N'2018-04-12T07:54:29.987' AS DateTime), 139, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T07:55:34.500' AS DateTime), CAST(N'2018-04-12T07:55:34.500' AS DateTime), 140, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T07:57:46.490' AS DateTime), CAST(N'2018-04-12T07:57:46.490' AS DateTime), 141, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T08:07:13.170' AS DateTime), CAST(N'2018-04-12T08:07:13.170' AS DateTime), 142, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T08:09:00.657' AS DateTime), CAST(N'2018-04-12T08:09:00.657' AS DateTime), 143, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T08:09:03.190' AS DateTime), CAST(N'2018-04-12T08:09:03.190' AS DateTime), 144, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T08:10:47.803' AS DateTime), CAST(N'2018-04-12T08:10:47.803' AS DateTime), 145, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T08:41:29.547' AS DateTime), CAST(N'2018-04-12T08:41:29.547' AS DateTime), 146, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T08:42:10.847' AS DateTime), CAST(N'2018-04-12T08:42:10.847' AS DateTime), 147, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T08:46:19.137' AS DateTime), CAST(N'2018-04-12T08:46:19.137' AS DateTime), 148, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T08:48:29.700' AS DateTime), CAST(N'2018-04-12T08:48:29.700' AS DateTime), 149, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T08:53:16.740' AS DateTime), CAST(N'2018-04-12T08:53:16.740' AS DateTime), 150, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T08:53:51.677' AS DateTime), CAST(N'2018-04-12T08:54:23.597' AS DateTime), 151, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T08:55:23.770' AS DateTime), CAST(N'2018-04-12T08:55:23.770' AS DateTime), 152, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:03:31.453' AS DateTime), CAST(N'2018-04-12T09:04:09.290' AS DateTime), 153, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:09:41.373' AS DateTime), CAST(N'2018-04-12T09:09:41.373' AS DateTime), 154, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:13:14.713' AS DateTime), CAST(N'2018-04-12T09:13:14.713' AS DateTime), 155, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:15:55.923' AS DateTime), CAST(N'2018-04-12T09:15:55.923' AS DateTime), 156, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:18:01.730' AS DateTime), CAST(N'2018-04-12T09:18:01.730' AS DateTime), 157, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:19:44.417' AS DateTime), CAST(N'2018-04-12T09:19:44.417' AS DateTime), 158, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:20:11.697' AS DateTime), CAST(N'2018-04-12T09:20:11.697' AS DateTime), 159, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:20:47.143' AS DateTime), CAST(N'2018-04-12T09:20:47.143' AS DateTime), 160, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:27:53.027' AS DateTime), CAST(N'2018-04-12T09:32:56.837' AS DateTime), 161, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:38:36.243' AS DateTime), CAST(N'2018-04-12T09:38:36.243' AS DateTime), 162, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:41:12.463' AS DateTime), CAST(N'2018-04-12T09:41:12.463' AS DateTime), 163, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:43:43.710' AS DateTime), CAST(N'2018-04-12T09:43:43.710' AS DateTime), 164, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:45:38.370' AS DateTime), CAST(N'2018-04-12T09:45:38.370' AS DateTime), 165, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:47:05.287' AS DateTime), CAST(N'2018-04-12T09:47:05.287' AS DateTime), 166, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:47:24.267' AS DateTime), CAST(N'2018-04-12T09:47:24.267' AS DateTime), 167, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:50:48.513' AS DateTime), CAST(N'2018-04-12T09:51:40.083' AS DateTime), 168, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T09:52:07.167' AS DateTime), CAST(N'2018-04-12T09:52:07.167' AS DateTime), 169, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T21:15:52.143' AS DateTime), CAST(N'2018-04-12T21:19:32.390' AS DateTime), 170, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T21:19:38.300' AS DateTime), CAST(N'2018-04-12T21:19:57.673' AS DateTime), 171, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T21:23:34.413' AS DateTime), CAST(N'2018-04-12T21:23:38.057' AS DateTime), 172, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T21:29:24.497' AS DateTime), CAST(N'2018-04-12T21:29:56.703' AS DateTime), 173, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T21:30:00.720' AS DateTime), CAST(N'2018-04-12T21:30:14.313' AS DateTime), 174, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'NEW ', CAST(N'2018-04-12T21:30:22.657' AS DateTime), CAST(N'2018-04-12T21:30:54.927' AS DateTime), 175, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T21:30:58.550' AS DateTime), CAST(N'2018-04-12T21:31:28.883' AS DateTime), 176, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'NEW', CAST(N'2018-04-12T21:31:37.773' AS DateTime), CAST(N'2018-04-12T21:32:07.560' AS DateTime), 177, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T21:34:20.953' AS DateTime), CAST(N'2018-04-12T21:34:20.953' AS DateTime), 178, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T21:35:11.093' AS DateTime), CAST(N'2018-04-12T21:35:11.093' AS DateTime), 179, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T21:50:36.750' AS DateTime), CAST(N'2018-04-12T21:50:36.750' AS DateTime), 180, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T22:10:35.217' AS DateTime), CAST(N'2018-04-12T22:10:35.217' AS DateTime), 181, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T22:13:51.173' AS DateTime), CAST(N'2018-04-12T22:13:51.173' AS DateTime), 182, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-12T22:15:32.617' AS DateTime), CAST(N'2018-04-12T22:15:32.617' AS DateTime), 183, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T00:03:09.020' AS DateTime), CAST(N'2018-04-13T00:03:09.020' AS DateTime), 184, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T00:07:28.417' AS DateTime), CAST(N'2018-04-13T00:07:28.417' AS DateTime), 185, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T00:36:19.003' AS DateTime), CAST(N'2018-04-13T00:37:03.437' AS DateTime), 186, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N' JOC', CAST(N'2018-04-13T00:55:01.833' AS DateTime), CAST(N'2018-04-13T00:55:01.833' AS DateTime), 187, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N' JOC', CAST(N'2018-04-13T00:55:06.920' AS DateTime), CAST(N'2018-04-13T00:55:06.920' AS DateTime), 188, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N' NEW', CAST(N'2018-04-13T00:55:17.720' AS DateTime), CAST(N'2018-04-13T00:55:17.720' AS DateTime), 189, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N' NEW', CAST(N'2018-04-13T00:55:24.637' AS DateTime), CAST(N'2018-04-13T00:55:24.637' AS DateTime), 190, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N' JOC', CAST(N'2018-04-13T00:55:32.667' AS DateTime), CAST(N'2018-04-13T00:55:32.667' AS DateTime), 191, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T00:55:53.527' AS DateTime), CAST(N'2018-04-13T00:55:53.527' AS DateTime), 192, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:01:10.760' AS DateTime), CAST(N'2018-04-13T01:01:10.760' AS DateTime), 193, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:04:26.027' AS DateTime), CAST(N'2018-04-13T01:04:26.027' AS DateTime), 194, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:06:50.873' AS DateTime), CAST(N'2018-04-13T01:06:50.873' AS DateTime), 195, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:09:11.093' AS DateTime), CAST(N'2018-04-13T01:09:11.093' AS DateTime), 196, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:11:48.103' AS DateTime), CAST(N'2018-04-13T01:11:48.103' AS DateTime), 197, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:13:33.030' AS DateTime), CAST(N'2018-04-13T01:13:33.030' AS DateTime), 198, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:15:53.410' AS DateTime), CAST(N'2018-04-13T01:16:54.517' AS DateTime), 199, N'VT78\JOCSEL DIAZ')
GO
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:17:44.207' AS DateTime), CAST(N'2018-04-13T01:18:28.577' AS DateTime), 200, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:19:09.107' AS DateTime), CAST(N'2018-04-13T01:20:13.183' AS DateTime), 201, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:21:02.727' AS DateTime), CAST(N'2018-04-13T01:21:52.627' AS DateTime), 202, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:22:28.797' AS DateTime), CAST(N'2018-04-13T01:23:05.370' AS DateTime), 203, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T01:24:46.547' AS DateTime), CAST(N'2018-04-13T01:25:54.407' AS DateTime), 204, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T02:32:22.633' AS DateTime), CAST(N'2018-04-13T02:32:22.633' AS DateTime), 205, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T02:54:23.917' AS DateTime), CAST(N'2018-04-13T02:54:23.917' AS DateTime), 206, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T02:56:58.087' AS DateTime), CAST(N'2018-04-13T02:57:30.693' AS DateTime), 207, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T02:58:09.953' AS DateTime), CAST(N'2018-04-13T02:58:41.657' AS DateTime), 208, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T03:00:11.393' AS DateTime), CAST(N'2018-04-13T03:00:53.677' AS DateTime), 209, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T03:02:51.097' AS DateTime), CAST(N'2018-04-13T03:03:28.593' AS DateTime), 210, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T03:04:10.627' AS DateTime), CAST(N'2018-04-13T03:04:40.633' AS DateTime), 211, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T03:10:49.100' AS DateTime), CAST(N'2018-04-13T03:11:31.437' AS DateTime), 212, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T03:12:04.107' AS DateTime), CAST(N'2018-04-13T03:13:00.373' AS DateTime), 213, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T03:13:36.813' AS DateTime), CAST(N'2018-04-13T03:14:51.683' AS DateTime), 214, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T04:23:27.043' AS DateTime), CAST(N'2018-04-13T04:24:07.000' AS DateTime), 215, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T04:39:29.187' AS DateTime), CAST(N'2018-04-13T04:39:29.187' AS DateTime), 216, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T04:44:41.013' AS DateTime), CAST(N'2018-04-13T04:45:16.670' AS DateTime), 217, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T04:46:44.917' AS DateTime), CAST(N'2018-04-13T04:47:06.953' AS DateTime), 218, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T04:48:23.120' AS DateTime), CAST(N'2018-04-13T04:50:19.860' AS DateTime), 219, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T05:35:47.277' AS DateTime), CAST(N'2018-04-13T05:36:20.107' AS DateTime), 220, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T05:37:26.263' AS DateTime), CAST(N'2018-04-13T05:37:48.633' AS DateTime), 221, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T05:38:23.313' AS DateTime), CAST(N'2018-04-13T05:39:29.803' AS DateTime), 222, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:12:49.793' AS DateTime), CAST(N'2018-04-13T18:15:05.770' AS DateTime), 223, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:15:23.950' AS DateTime), CAST(N'2018-04-13T18:15:42.087' AS DateTime), 224, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:16:21.683' AS DateTime), CAST(N'2018-04-13T18:16:29.657' AS DateTime), 225, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:16:45.790' AS DateTime), CAST(N'2018-04-13T18:16:57.557' AS DateTime), 226, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:18:03.067' AS DateTime), CAST(N'2018-04-13T18:19:34.813' AS DateTime), 227, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:27:33.613' AS DateTime), CAST(N'2018-04-13T18:27:33.613' AS DateTime), 228, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:28:41.037' AS DateTime), CAST(N'2018-04-13T18:28:41.037' AS DateTime), 229, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:35:48.983' AS DateTime), CAST(N'2018-04-13T18:35:48.983' AS DateTime), 230, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:39:22.117' AS DateTime), CAST(N'2018-04-13T18:39:22.117' AS DateTime), 231, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:48:09.220' AS DateTime), CAST(N'2018-04-13T18:48:38.280' AS DateTime), 232, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:52:51.843' AS DateTime), CAST(N'2018-04-13T18:54:11.630' AS DateTime), 233, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:54:54.797' AS DateTime), CAST(N'2018-04-13T18:55:19.280' AS DateTime), 234, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T18:55:36.897' AS DateTime), CAST(N'2018-04-13T19:09:08.637' AS DateTime), 235, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T19:29:43.107' AS DateTime), CAST(N'2018-04-13T19:30:17.773' AS DateTime), 236, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T19:38:59.273' AS DateTime), CAST(N'2018-04-13T19:40:38.407' AS DateTime), 237, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T19:42:25.160' AS DateTime), CAST(N'2018-04-13T19:42:34.820' AS DateTime), 238, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T19:43:13.750' AS DateTime), CAST(N'2018-04-13T19:43:43.653' AS DateTime), 239, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T19:44:37.810' AS DateTime), CAST(N'2018-04-13T19:45:14.447' AS DateTime), 240, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T19:46:12.300' AS DateTime), CAST(N'2018-04-13T19:46:12.300' AS DateTime), 241, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T19:46:30.177' AS DateTime), CAST(N'2018-04-13T19:47:06.653' AS DateTime), 242, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T12:36:38.360' AS DateTime), CAST(N'2018-04-13T12:38:30.047' AS DateTime), 243, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:02:02.257' AS DateTime), CAST(N'2018-04-13T13:02:05.950' AS DateTime), 244, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:03:57.217' AS DateTime), CAST(N'2018-04-13T13:04:15.200' AS DateTime), 245, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:04:34.357' AS DateTime), CAST(N'2018-04-13T13:05:02.357' AS DateTime), 246, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:05:36.877' AS DateTime), CAST(N'2018-04-13T13:05:44.060' AS DateTime), 247, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:06:01.477' AS DateTime), CAST(N'2018-04-13T13:06:15.580' AS DateTime), 248, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:06:50.780' AS DateTime), CAST(N'2018-04-13T13:06:54.063' AS DateTime), 249, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:07:09.167' AS DateTime), CAST(N'2018-04-13T13:07:39.750' AS DateTime), 250, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:10:11.090' AS DateTime), CAST(N'2018-04-13T13:10:20.113' AS DateTime), 251, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:11:22.763' AS DateTime), CAST(N'2018-04-13T13:11:47.557' AS DateTime), 252, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:43:46.827' AS DateTime), CAST(N'2018-04-13T13:46:47.560' AS DateTime), 253, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:48:05.930' AS DateTime), CAST(N'2018-04-13T13:50:18.663' AS DateTime), 254, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:51:18.137' AS DateTime), CAST(N'2018-04-13T13:51:25.550' AS DateTime), 255, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T13:54:34.770' AS DateTime), CAST(N'2018-04-13T13:58:23.123' AS DateTime), 256, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T14:05:30.880' AS DateTime), CAST(N'2018-04-13T14:07:17.733' AS DateTime), 257, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T14:17:05.823' AS DateTime), CAST(N'2018-04-13T14:19:30.797' AS DateTime), 258, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T14:33:09.743' AS DateTime), CAST(N'2018-04-13T14:33:53.393' AS DateTime), 259, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T14:38:49.837' AS DateTime), CAST(N'2018-04-13T14:39:27.473' AS DateTime), 260, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T14:39:56.470' AS DateTime), CAST(N'2018-04-13T14:42:00.063' AS DateTime), 261, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T15:20:11.273' AS DateTime), CAST(N'2018-04-13T15:20:11.273' AS DateTime), 262, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T15:22:37.397' AS DateTime), CAST(N'2018-04-13T15:25:22.637' AS DateTime), 263, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T15:25:55.627' AS DateTime), CAST(N'2018-04-13T15:26:24.613' AS DateTime), 264, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T15:27:05.153' AS DateTime), CAST(N'2018-04-13T15:27:45.397' AS DateTime), 265, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T15:47:21.517' AS DateTime), CAST(N'2018-04-13T15:47:40.033' AS DateTime), 266, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T15:49:22.730' AS DateTime), CAST(N'2018-04-13T15:49:22.730' AS DateTime), 267, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T15:50:44.747' AS DateTime), CAST(N'2018-04-13T15:50:44.747' AS DateTime), 268, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T15:52:48.183' AS DateTime), CAST(N'2018-04-13T15:53:51.640' AS DateTime), 269, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T16:00:19.813' AS DateTime), CAST(N'2018-04-13T16:00:59.737' AS DateTime), 270, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T16:21:40.733' AS DateTime), CAST(N'2018-04-13T16:23:10.707' AS DateTime), 271, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T16:23:36.073' AS DateTime), CAST(N'2018-04-13T16:23:55.903' AS DateTime), 272, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T16:28:20.170' AS DateTime), CAST(N'2018-04-13T16:28:37.803' AS DateTime), 273, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T16:29:33.970' AS DateTime), CAST(N'2018-04-13T16:30:02.917' AS DateTime), 274, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T16:30:35.713' AS DateTime), CAST(N'2018-04-13T16:30:35.713' AS DateTime), 275, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T16:32:02.830' AS DateTime), CAST(N'2018-04-13T16:33:03.680' AS DateTime), 276, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T16:35:19.303' AS DateTime), CAST(N'2018-04-13T16:35:29.060' AS DateTime), 277, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T16:39:12.853' AS DateTime), CAST(N'2018-04-13T16:39:41.327' AS DateTime), 278, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T16:40:31.360' AS DateTime), CAST(N'2018-04-13T16:40:55.550' AS DateTime), 279, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T17:01:37.570' AS DateTime), CAST(N'2018-04-13T17:02:18.473' AS DateTime), 280, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T17:02:44.433' AS DateTime), CAST(N'2018-04-13T17:03:06.313' AS DateTime), 281, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T17:13:51.147' AS DateTime), CAST(N'2018-04-13T17:13:51.147' AS DateTime), 282, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T17:13:53.863' AS DateTime), CAST(N'2018-04-13T17:13:53.863' AS DateTime), 283, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T17:15:50.717' AS DateTime), CAST(N'2018-04-13T17:16:26.733' AS DateTime), 284, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T17:20:41.957' AS DateTime), CAST(N'2018-04-13T17:21:27.380' AS DateTime), 285, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T17:23:03.860' AS DateTime), CAST(N'2018-04-13T17:23:12.400' AS DateTime), 286, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T17:23:58.460' AS DateTime), CAST(N'2018-04-13T17:24:11.407' AS DateTime), 287, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-13T17:25:15.557' AS DateTime), CAST(N'2018-04-13T17:25:39.283' AS DateTime), 288, N'B_FISICA_PC36\Laboratorio 1 - PC01')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T20:12:18.487' AS DateTime), CAST(N'2018-04-16T20:14:53.597' AS DateTime), 289, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T20:15:33.257' AS DateTime), CAST(N'2018-04-16T20:15:56.533' AS DateTime), 290, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T20:20:11.877' AS DateTime), CAST(N'2018-04-16T20:20:51.377' AS DateTime), 291, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T20:23:02.837' AS DateTime), CAST(N'2018-04-16T20:23:02.837' AS DateTime), 292, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T20:26:26.087' AS DateTime), CAST(N'2018-04-16T20:26:26.087' AS DateTime), 293, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T20:27:45.573' AS DateTime), CAST(N'2018-04-16T20:28:30.603' AS DateTime), 294, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T20:28:55.390' AS DateTime), CAST(N'2018-04-16T20:28:55.390' AS DateTime), 295, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T20:30:19.643' AS DateTime), CAST(N'2018-04-16T20:30:19.643' AS DateTime), 296, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T20:40:31.283' AS DateTime), CAST(N'2018-04-16T20:40:47.527' AS DateTime), 297, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T21:07:25.870' AS DateTime), CAST(N'2018-04-16T21:08:14.100' AS DateTime), 298, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T21:09:57.947' AS DateTime), CAST(N'2018-04-16T21:10:45.077' AS DateTime), 299, N'VT78\JOCSEL DIAZ')
GO
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T21:11:51.743' AS DateTime), CAST(N'2018-04-16T21:11:51.743' AS DateTime), 300, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T21:13:16.963' AS DateTime), CAST(N'2018-04-16T21:13:16.963' AS DateTime), 301, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T21:15:26.467' AS DateTime), CAST(N'2018-04-16T21:16:28.713' AS DateTime), 302, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T21:17:51.713' AS DateTime), CAST(N'2018-04-16T21:18:30.257' AS DateTime), 303, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T21:37:57.937' AS DateTime), CAST(N'2018-04-16T21:37:57.937' AS DateTime), 304, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T21:39:37.203' AS DateTime), CAST(N'2018-04-16T21:41:00.047' AS DateTime), 305, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T21:56:30.740' AS DateTime), CAST(N'2018-04-16T21:56:30.740' AS DateTime), 306, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:03:42.950' AS DateTime), CAST(N'2018-04-16T22:03:42.950' AS DateTime), 307, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:04:59.813' AS DateTime), CAST(N'2018-04-16T22:11:42.027' AS DateTime), 308, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:15:31.067' AS DateTime), CAST(N'2018-04-16T22:16:03.033' AS DateTime), 309, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:23:19.243' AS DateTime), CAST(N'2018-04-16T22:23:19.243' AS DateTime), 310, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:24:19.720' AS DateTime), CAST(N'2018-04-16T22:24:19.720' AS DateTime), 311, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:24:59.547' AS DateTime), CAST(N'2018-04-16T22:24:59.547' AS DateTime), 312, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:29:17.900' AS DateTime), CAST(N'2018-04-16T22:29:17.900' AS DateTime), 313, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:30:48.860' AS DateTime), CAST(N'2018-04-16T22:30:48.860' AS DateTime), 314, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:36:18.900' AS DateTime), CAST(N'2018-04-16T22:36:18.900' AS DateTime), 315, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:41:00.937' AS DateTime), CAST(N'2018-04-16T22:41:02.623' AS DateTime), 316, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:41:06.357' AS DateTime), CAST(N'2018-04-16T22:41:39.763' AS DateTime), 317, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:44:50.083' AS DateTime), CAST(N'2018-04-16T22:50:01.697' AS DateTime), 318, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:51:50.220' AS DateTime), CAST(N'2018-04-16T22:51:50.220' AS DateTime), 319, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:54:00.107' AS DateTime), CAST(N'2018-04-16T22:54:19.630' AS DateTime), 320, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T22:56:00.643' AS DateTime), CAST(N'2018-04-16T23:00:05.877' AS DateTime), 321, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T23:03:59.660' AS DateTime), CAST(N'2018-04-16T23:03:59.660' AS DateTime), 322, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T23:24:30.747' AS DateTime), CAST(N'2018-04-16T23:24:30.747' AS DateTime), 323, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T23:25:08.057' AS DateTime), CAST(N'2018-04-16T23:25:08.057' AS DateTime), 324, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T23:30:28.067' AS DateTime), CAST(N'2018-04-16T23:30:28.067' AS DateTime), 325, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T23:32:57.807' AS DateTime), CAST(N'2018-04-16T23:43:12.763' AS DateTime), 326, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T23:46:03.820' AS DateTime), CAST(N'2018-04-16T23:46:03.820' AS DateTime), 327, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T23:48:56.697' AS DateTime), CAST(N'2018-04-16T23:48:56.697' AS DateTime), 328, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T23:50:12.740' AS DateTime), CAST(N'2018-04-16T23:50:12.740' AS DateTime), 329, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T23:51:19.213' AS DateTime), CAST(N'2018-04-16T23:51:19.213' AS DateTime), 330, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T23:52:38.903' AS DateTime), CAST(N'2018-04-16T23:52:38.903' AS DateTime), 331, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-16T23:56:48.193' AS DateTime), CAST(N'2018-04-16T23:56:48.193' AS DateTime), 332, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:00:05.603' AS DateTime), CAST(N'2018-04-17T00:00:05.603' AS DateTime), 333, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:05:07.873' AS DateTime), CAST(N'2018-04-17T00:06:43.380' AS DateTime), 334, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:08:35.833' AS DateTime), CAST(N'2018-04-17T00:08:35.833' AS DateTime), 335, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:09:58.677' AS DateTime), CAST(N'2018-04-17T00:09:58.677' AS DateTime), 336, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:17:31.407' AS DateTime), CAST(N'2018-04-17T00:17:31.407' AS DateTime), 337, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:18:44.267' AS DateTime), CAST(N'2018-04-17T00:18:44.267' AS DateTime), 338, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:20:00.363' AS DateTime), CAST(N'2018-04-17T00:20:00.363' AS DateTime), 339, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:21:23.363' AS DateTime), CAST(N'2018-04-17T00:21:50.573' AS DateTime), 340, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:23:28.800' AS DateTime), CAST(N'2018-04-17T00:24:02.973' AS DateTime), 341, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:24:10.707' AS DateTime), CAST(N'2018-04-17T00:24:57.750' AS DateTime), 342, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:25:55.523' AS DateTime), CAST(N'2018-04-17T00:26:44.090' AS DateTime), 343, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:27:36.113' AS DateTime), CAST(N'2018-04-17T00:28:25.927' AS DateTime), 344, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:29:08.530' AS DateTime), CAST(N'2018-04-17T00:29:08.530' AS DateTime), 345, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-17T00:29:12.280' AS DateTime), CAST(N'2018-04-17T00:29:46.680' AS DateTime), 346, N'VT78\JOCSEL DIAZ')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T00:43:39.210' AS DateTime), CAST(N'2018-04-25T00:46:46.137' AS DateTime), 347, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T00:49:10.597' AS DateTime), CAST(N'2018-04-25T00:50:01.950' AS DateTime), 348, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T00:53:10.537' AS DateTime), CAST(N'2018-04-25T00:53:47.027' AS DateTime), 349, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T00:59:09.140' AS DateTime), CAST(N'2018-04-25T01:00:13.913' AS DateTime), 350, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T01:00:24.330' AS DateTime), CAST(N'2018-04-25T01:02:07.717' AS DateTime), 351, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T01:06:51.703' AS DateTime), CAST(N'2018-04-25T01:07:12.060' AS DateTime), 352, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T01:20:08.537' AS DateTime), CAST(N'2018-04-25T01:20:31.773' AS DateTime), 353, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T01:23:35.163' AS DateTime), CAST(N'2018-04-25T01:23:35.163' AS DateTime), 354, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T01:23:39.237' AS DateTime), CAST(N'2018-04-25T01:23:39.237' AS DateTime), 355, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T01:24:27.710' AS DateTime), CAST(N'2018-04-25T01:24:27.710' AS DateTime), 356, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T01:27:31.170' AS DateTime), CAST(N'2018-04-25T01:27:46.243' AS DateTime), 357, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T01:28:02.200' AS DateTime), CAST(N'2018-04-25T01:28:14.153' AS DateTime), 358, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T01:28:35.567' AS DateTime), CAST(N'2018-04-25T01:29:14.830' AS DateTime), 359, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T01:30:25.843' AS DateTime), CAST(N'2018-04-25T01:30:25.843' AS DateTime), 360, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T01:30:29.063' AS DateTime), CAST(N'2018-04-25T01:30:29.063' AS DateTime), 361, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'AFS', CAST(N'2018-04-25T01:32:52.657' AS DateTime), CAST(N'2018-04-25T01:32:52.657' AS DateTime), 362, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'USUARIO', CAST(N'2018-04-25T02:07:21.060' AS DateTime), CAST(N'2018-04-25T02:07:21.060' AS DateTime), 363, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T02:19:13.430' AS DateTime), CAST(N'2018-04-25T02:19:15.273' AS DateTime), 364, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T02:39:27.483' AS DateTime), CAST(N'2018-04-25T02:39:29.873' AS DateTime), 365, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'USUARIO', CAST(N'2018-04-25T02:41:19.390' AS DateTime), CAST(N'2018-04-25T02:41:19.390' AS DateTime), 366, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T02:47:54.697' AS DateTime), CAST(N'2018-04-25T02:47:57.030' AS DateTime), 367, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'USUARIO', CAST(N'2018-04-25T03:01:49.340' AS DateTime), CAST(N'2018-04-25T03:01:49.340' AS DateTime), 368, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T03:01:53.740' AS DateTime), CAST(N'2018-04-25T03:01:55.887' AS DateTime), 369, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T06:18:50.057' AS DateTime), CAST(N'2018-04-25T06:20:27.430' AS DateTime), 370, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T06:20:32.437' AS DateTime), CAST(N'2018-04-25T06:20:58.133' AS DateTime), 371, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T06:21:10.507' AS DateTime), CAST(N'2018-04-25T06:21:10.507' AS DateTime), 372, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T06:22:34.380' AS DateTime), CAST(N'2018-04-25T06:22:34.380' AS DateTime), 373, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T06:24:09.360' AS DateTime), CAST(N'2018-04-25T06:24:59.860' AS DateTime), 374, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T06:25:41.350' AS DateTime), CAST(N'2018-04-25T06:25:41.350' AS DateTime), 375, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T06:27:14.757' AS DateTime), CAST(N'2018-04-25T06:29:58.300' AS DateTime), 376, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T06:32:03.747' AS DateTime), CAST(N'2018-04-25T06:36:22.537' AS DateTime), 377, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T06:36:57.140' AS DateTime), CAST(N'2018-04-25T06:36:57.140' AS DateTime), 378, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T06:43:50.770' AS DateTime), CAST(N'2018-04-25T06:43:50.770' AS DateTime), 379, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T06:54:17.033' AS DateTime), CAST(N'2018-04-25T06:56:19.947' AS DateTime), 380, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'GELDER', CAST(N'2018-04-25T06:56:25.837' AS DateTime), CAST(N'2018-04-25T06:57:15.817' AS DateTime), 381, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T07:01:17.793' AS DateTime), CAST(N'2018-04-25T07:01:17.793' AS DateTime), 382, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T07:04:34.360' AS DateTime), CAST(N'2018-04-25T07:04:34.360' AS DateTime), 383, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T07:07:21.953' AS DateTime), CAST(N'2018-04-25T07:07:21.953' AS DateTime), 384, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T07:10:34.953' AS DateTime), CAST(N'2018-04-25T07:11:22.217' AS DateTime), 385, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T07:12:05.930' AS DateTime), CAST(N'2018-04-25T07:13:18.717' AS DateTime), 386, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T07:56:35.057' AS DateTime), CAST(N'2018-04-25T07:57:12.937' AS DateTime), 387, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T07:57:45.163' AS DateTime), CAST(N'2018-04-25T07:58:09.447' AS DateTime), 388, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T08:03:19.207' AS DateTime), CAST(N'2018-04-25T08:04:41.437' AS DateTime), 389, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T08:07:19.390' AS DateTime), CAST(N'2018-04-25T08:08:10.717' AS DateTime), 390, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T08:09:43.840' AS DateTime), CAST(N'2018-04-25T08:09:54.087' AS DateTime), 391, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T08:56:42.143' AS DateTime), CAST(N'2018-04-25T08:56:42.143' AS DateTime), 392, N'GelderGomez\Gelder')
INSERT [dbo].[Control_Entrada] ([usuarioo], [loginn], [logout], [id_control], [maquina]) VALUES (N'JOC', CAST(N'2018-04-25T08:57:59.157' AS DateTime), CAST(N'2018-04-25T08:58:17.893' AS DateTime), 393, N'GelderGomez\Gelder')
SET IDENTITY_INSERT [dbo].[Control_Entrada] OFF
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (52, 3, 12, CAST(12.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (53, 1, 213, CAST(26199.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (54, 6, 41, CAST(28700.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (54, 4, 43, CAST(53062.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (55, 1, 14, CAST(1722.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (56, 4, 43, CAST(53062.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (56, 6, 1, CAST(700.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (57, 1, 12, CAST(1476.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (58, 4, 31, CAST(38254.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (58, 6, 12, CAST(8400.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (58, 4, 31, CAST(38254.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (59, 4, 21, CAST(25914.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (60, 4, 12, CAST(14808.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (61, 4, 4123, CAST(5087782.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (61, 4, 4123, CAST(5087782.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (61, 6, 12, CAST(8400.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (62, 4, 12, CAST(14808.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (63, 3, 12, CAST(12.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (65, 6, 1, CAST(700.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (65, 5, 31, CAST(15500.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (65, 3, 123, CAST(123.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (65, 6, 14, CAST(9800.00 AS Numeric(18, 2)))
INSERT [dbo].[detallecompra] ([idCompra], [idProducto], [cantidad], [total]) VALUES (64, 5, 1, CAST(500.00 AS Numeric(18, 2)))
INSERT [dbo].[Detalledevolucion] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (3, 1, 132)
INSERT [dbo].[Detalledevolucion] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (2, 1, 6)
INSERT [dbo].[Detalledevolucion] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (3, 1, 965)
INSERT [dbo].[Detalledevolucion] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (4, 3, 4)
INSERT [dbo].[Detalledevolucion] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (4, 5, 12)
INSERT [dbo].[detalledevolucioncompra] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (9, 3, 1)
INSERT [dbo].[detalledevolucioncompra] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (11, 3, 1)
INSERT [dbo].[detalledevolucioncompra] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (17, 3, 12)
INSERT [dbo].[detalledevolucioncompra] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (19, 4, 12)
INSERT [dbo].[detalledevolucioncompra] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (20, 3, 12)
INSERT [dbo].[detalledevolucioncompra] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (21, 4, 4123)
INSERT [dbo].[detalledevolucioncompra] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (21, 4, 4123)
INSERT [dbo].[detalledevolucioncompra] ([Iddevolucion], [Idproducto], [Cantidad]) VALUES (21, 6, 12)
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (132, 423, 1, CAST(132.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (2, 435, 3, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (21, 436, 6, CAST(10500.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 437, 6, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (1000, 438, 4, CAST(12000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 442, 4, CAST(144.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 442, 6, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (2, 445, 4, CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (3324, 446, 1, CAST(3324.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (5, 447, 3, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 448, 1, CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 449, 4, CAST(144.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (312, 449, 1, CAST(312.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 449, 5, CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (4, 450, 3, CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 450, 5, CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 451, 4, CAST(144.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (1, 452, 3, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 453, 1, CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (14, 439, 5, CAST(3500.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (1000, 439, 6, CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 440, 6, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (1, 441, 5, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 443, 6, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (25, 443, 4, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 444, 5, CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (1, 444, 1, CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (2, 444, 3, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (2, 444, 4, CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 444, 6, CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (12, 454, 3, CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (43, 454, 6, CAST(21500.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (3, 454, 6, CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[detalleventa] ([cantidad], [idVenta], [idProducto], [totaldetalle]) VALUES (1, 454, 6, CAST(500.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[devolucion] ON 

INSERT [dbo].[devolucion] ([Iddevolucion], [Idusuario], [NumVenta], [fecha], [observacion]) VALUES (1, 1, 262, CAST(N'2011-11-11T00:00:00.000' AS DateTime), N'osesdfasd')
INSERT [dbo].[devolucion] ([Iddevolucion], [Idusuario], [NumVenta], [fecha], [observacion]) VALUES (2, 1, 262, CAST(N'2011-11-11T00:00:00.000' AS DateTime), N'dgfdfasdf')
INSERT [dbo].[devolucion] ([Iddevolucion], [Idusuario], [NumVenta], [fecha], [observacion]) VALUES (3, 1, 423, CAST(N'2018-04-11T09:40:50.000' AS DateTime), N'wefads')
INSERT [dbo].[devolucion] ([Iddevolucion], [Idusuario], [NumVenta], [fecha], [observacion]) VALUES (4, 2, 450, CAST(N'2018-04-25T01:00:28.000' AS DateTime), N'Se jodio todo')
SET IDENTITY_INSERT [dbo].[devolucion] OFF
SET IDENTITY_INSERT [dbo].[devolucionCompra] ON 

INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (9, 2, 52, CAST(N'2018-04-12T09:28:05.000' AS DateTime), N'lkjhgfds')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (10, 2, 52, CAST(N'2018-04-12T09:28:05.000' AS DateTime), N'444caswasc')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (11, 2, 52, CAST(N'2018-04-12T09:28:05.000' AS DateTime), N'sdb')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (12, 2, 52, CAST(N'2018-04-12T09:28:05.000' AS DateTime), N'hgsfd')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (13, 2, 52, CAST(N'2018-04-12T09:28:05.000' AS DateTime), N'fdsfsf')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (14, 2, 52, CAST(N'2018-04-12T09:28:05.000' AS DateTime), N'gfd')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (15, 2, 52, CAST(N'2018-04-12T09:28:05.000' AS DateTime), N'weqr')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (16, 2, 52, CAST(N'2018-04-12T09:28:05.000' AS DateTime), N'wqer')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (17, 2, 52, CAST(N'2018-04-12T09:28:05.000' AS DateTime), N'qwer')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (18, 1, 63, CAST(N'2018-04-25T06:43:55.000' AS DateTime), N'')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (19, 2, 60, CAST(N'2018-04-25T06:26:26.000' AS DateTime), N'dsfg')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (20, 1, 63, CAST(N'2018-04-25T06:43:55.000' AS DateTime), N'no hya ndas')
INSERT [dbo].[devolucionCompra] ([Iddevolucion], [Idusuario], [Idcompra], [fecha], [observacion]) VALUES (21, 1, 61, CAST(N'2018-04-25T06:27:18.000' AS DateTime), N'dsfa')
SET IDENTITY_INSERT [dbo].[devolucionCompra] OFF
SET IDENTITY_INSERT [dbo].[empleado] ON 

INSERT [dbo].[empleado] ([idEmpleado], [celular], [direccion], [cedula], [apellidos], [nombres], [fechaNac], [salario], [cargo], [estado], [idArea], [idgrupo]) VALUES (1, 5450278, N'managua', N'449-111111-1002M', N'Diaz', N'Jocsel', CAST(N'2000-11-11T00:00:00.000' AS DateTime), 8900.0000, N'admin', N'activo', 1, 1)
INSERT [dbo].[empleado] ([idEmpleado], [celular], [direccion], [cedula], [apellidos], [nombres], [fechaNac], [salario], [cargo], [estado], [idArea], [idgrupo]) VALUES (2, 844878, N'managua', N'001-020301-1000A', N'nuevo', N'nuevo', CAST(N'2001-12-11T00:00:00.000' AS DateTime), 8900.0000, N'Lavado', N'Activo', 1, 1)
INSERT [dbo].[empleado] ([idEmpleado], [celular], [direccion], [cedula], [apellidos], [nombres], [fechaNac], [salario], [cargo], [estado], [idArea], [idgrupo]) VALUES (3, 12345678, N'nO TIENE VIVE SOLO', N'001-223455-6324M', N'Gomez Solorzano', N'Gelder josr', CAST(N'1999-12-12T00:00:00.000' AS DateTime), 11234.0000, N'Administrador', N'Activo', 1, 3)
SET IDENTITY_INSERT [dbo].[empleado] OFF
SET IDENTITY_INSERT [dbo].[grupoTrabajadores] ON 

INSERT [dbo].[grupoTrabajadores] ([idgrupo], [grupoTrabajadores]) VALUES (1, N'Lavado')
INSERT [dbo].[grupoTrabajadores] ([idgrupo], [grupoTrabajadores]) VALUES (2, N'Mantenimiento')
INSERT [dbo].[grupoTrabajadores] ([idgrupo], [grupoTrabajadores]) VALUES (3, N'Venta')
INSERT [dbo].[grupoTrabajadores] ([idgrupo], [grupoTrabajadores]) VALUES (4, N'Apoyo')
SET IDENTITY_INSERT [dbo].[grupoTrabajadores] OFF
SET IDENTITY_INSERT [dbo].[lavado] ON 

INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (1, 150.0000, CAST(N'2018-04-09T00:00:00.000' AS DateTime), N'MT 20698', 3, 1, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (2, 80.0000, CAST(N'2018-04-10T00:00:00.000' AS DateTime), N'RS 0066', 5, 4, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (3, 250.0000, CAST(N'2018-03-29T00:00:00.000' AS DateTime), N'19', 2, 1, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (5, 123.0000, CAST(N'2018-02-09T00:00:00.000' AS DateTime), N'CKK 123', 5, 1, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (6, 350.0000, CAST(N'2018-04-11T00:00:00.000' AS DateTime), N'm 1234', 1, 2, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (7, 80.0000, CAST(N'2018-04-12T00:00:00.000' AS DateTime), N'MS4544', 5, 1, N'new')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (8, 450.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'RS 000215', 4, 1, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (9, 180.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'JI 2798', 2, 4, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (10, 600.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'NS 1215', 6, 1, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (11, 80.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'tdgfsghs', 5, 4, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (12, 80.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'NS 15574', 5, 4, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (13, 150.0000, CAST(N'2018-04-13T00:00:00.000' AS DateTime), N'jmj', 3, 2, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (14, 150.0000, CAST(N'2018-04-13T16:39:17.000' AS DateTime), N'ns 242', 3, 2, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (15, 80.0000, CAST(N'2018-04-13T16:40:36.000' AS DateTime), N'jhu', 5, 2, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (16, 350.0000, CAST(N'2018-04-16T20:14:20.000' AS DateTime), N'MT 54878', 1, 2, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (17, 350.0000, CAST(N'2018-04-16T23:56:52.000' AS DateTime), N'MT 1511', 1, 4, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (18, 600.0000, CAST(N'2018-04-17T00:00:10.000' AS DateTime), N'MS 5855', 6, 1, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (19, 180.0000, CAST(N'2018-04-17T00:05:16.000' AS DateTime), N'mk', 2, 1, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (20, 450.0000, CAST(N'2018-04-17T00:08:40.000' AS DateTime), N'RS', 4, 1, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (21, 80.0000, CAST(N'2018-04-17T00:10:04.000' AS DateTime), N'MN', 5, 4, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (22, 150.0000, CAST(N'2018-04-17T00:14:47.000' AS DateTime), N'MS', 3, 4, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (23, 180.0000, CAST(N'2018-04-17T00:17:42.000' AS DateTime), N'f', 2, 1, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (24, 180.0000, CAST(N'2018-04-17T00:18:47.000' AS DateTime), N'dd', 2, 2, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (25, 350.0000, CAST(N'2018-04-17T00:20:06.000' AS DateTime), N'rsss', 1, 2, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (26, 450.0000, CAST(N'2018-04-17T00:21:28.000' AS DateTime), N'rrss', 4, 1, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (27, 80.0000, CAST(N'2018-04-17T00:23:32.000' AS DateTime), N'MN', 5, 4, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (28, 180.0000, CAST(N'2018-04-17T00:26:01.000' AS DateTime), N'mn 02266', 2, 4, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (29, 180.0000, CAST(N'2018-04-17T00:27:39.000' AS DateTime), N'Rs 23559', 2, 1, N'joc')
INSERT [dbo].[lavado] ([idLavado], [total], [fecha], [placa], [idLavadoVehiculo], [idgrupo], [usuario]) VALUES (30, 180.0000, CAST(N'2018-04-17T00:29:16.000' AS DateTime), N'M 144871', 2, 1, N'joc')
SET IDENTITY_INSERT [dbo].[lavado] OFF
SET IDENTITY_INSERT [dbo].[LavadoVehiculo] ON 

INSERT [dbo].[LavadoVehiculo] ([idLavadoVehiculo], [idServicioLavado], [idVehiculoLavado], [precio]) VALUES (1, 1, 1, 350.0000)
INSERT [dbo].[LavadoVehiculo] ([idLavadoVehiculo], [idServicioLavado], [idVehiculoLavado], [precio]) VALUES (2, 1, 2, 180.0000)
INSERT [dbo].[LavadoVehiculo] ([idLavadoVehiculo], [idServicioLavado], [idVehiculoLavado], [precio]) VALUES (3, 1, 4, 150.0000)
INSERT [dbo].[LavadoVehiculo] ([idLavadoVehiculo], [idServicioLavado], [idVehiculoLavado], [precio]) VALUES (4, 1, 5, 450.0000)
INSERT [dbo].[LavadoVehiculo] ([idLavadoVehiculo], [idServicioLavado], [idVehiculoLavado], [precio]) VALUES (5, 1, 6, 80.0000)
INSERT [dbo].[LavadoVehiculo] ([idLavadoVehiculo], [idServicioLavado], [idVehiculoLavado], [precio]) VALUES (6, 3, 5, 600.0000)
SET IDENTITY_INSERT [dbo].[LavadoVehiculo] OFF
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=1', N'idServicioLavado', NULL, N'1', CAST(N'2018-04-09T23:54:50.993' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=1', N'servicioLavado', NULL, N'Lavado', CAST(N'2018-04-09T23:54:50.993' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=1', N'estado', NULL, N'1', CAST(N'2018-04-09T23:54:50.993' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=2', N'idServicioLavado', NULL, N'2', CAST(N'2018-04-09T23:55:03.163' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=2', N'servicioLavado', NULL, N'Esprayado', CAST(N'2018-04-09T23:55:03.163' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=2', N'estado', NULL, N'1', CAST(N'2018-04-09T23:55:03.163' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=3', N'idServicioLavado', NULL, N'3', CAST(N'2018-04-09T23:55:16.767' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=3', N'servicioLavado', NULL, N'Lavado y esprayado', CAST(N'2018-04-09T23:55:16.767' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=3', N'estado', NULL, N'1', CAST(N'2018-04-09T23:55:16.767' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=4', N'idServicioLavado', NULL, N'4', CAST(N'2018-04-09T23:55:31.650' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=4', N'servicioLavado', NULL, N'Aspirado Interior', CAST(N'2018-04-09T23:55:31.650' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'servicioLavado', N'idServicioLavado=4', N'estado', NULL, N'1', CAST(N'2018-04-09T23:55:31.650' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'ServicioVehiculo', N'idServicioVehiculo=1', N'idServicioVehiculo', NULL, N'1', CAST(N'2018-04-10T00:25:38.937' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'ServicioVehiculo', N'idServicioVehiculo=1', N'idServicioMantenimiento', NULL, N'1', CAST(N'2018-04-10T00:25:38.937' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'ServicioVehiculo', N'idServicioVehiculo=1', N'idVehiculoMantenimiento', NULL, N'1', CAST(N'2018-04-10T00:25:38.937' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'ServicioVehiculo', N'idServicioVehiculo=1', N'precio', NULL, N'800.00', CAST(N'2018-04-10T00:25:38.937' AS DateTime), N'VT78\JOCSEL DIAZ')
INSERT [dbo].[logTransacciones] ([TipoTrn], [Tabla], [PK], [Campo], [ValorOriginal], [ValorNuevo], [FechaTrn], [Usuario]) VALUES (N'I', N'ServicioVehiculo', N'idServicioVehiculo=1', N'estado', NULL, N'1', CAST(N'2018-04-10T00:25:38.937' AS DateTime), N'VT78\JOCSEL DIAZ')
SET IDENTITY_INSERT [dbo].[mantenimiento] ON 

INSERT [dbo].[mantenimiento] ([idMantenimiento], [total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario]) VALUES (1, 800.0000, CAST(N'2018-10-04T00:00:00.000' AS DateTime), N'M 021545', 2, 1, N'joc')
INSERT [dbo].[mantenimiento] ([idMantenimiento], [total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario]) VALUES (2, 12313.0000, CAST(N'2018-10-04T00:00:00.000' AS DateTime), N'm123', 2, 1, N'joc')
INSERT [dbo].[mantenimiento] ([idMantenimiento], [total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario]) VALUES (3, 800.0000, CAST(N'2018-04-13T16:29:38.000' AS DateTime), N'dad', 1, 1, N'joc')
INSERT [dbo].[mantenimiento] ([idMantenimiento], [total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario]) VALUES (4, 800.0000, CAST(N'2018-04-13T16:30:40.000' AS DateTime), N'ns ', 2, 1, N'joc')
INSERT [dbo].[mantenimiento] ([idMantenimiento], [total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario]) VALUES (5, 800.0000, CAST(N'2018-04-13T16:31:03.000' AS DateTime), N'ms 54554', 2, 1, N'joc')
INSERT [dbo].[mantenimiento] ([idMantenimiento], [total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario]) VALUES (6, 800.0000, CAST(N'2018-04-13T16:32:07.000' AS DateTime), N',kjk', 2, 1, N'joc')
INSERT [dbo].[mantenimiento] ([idMantenimiento], [total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario]) VALUES (7, 800.0000, CAST(N'2018-04-16T20:13:44.000' AS DateTime), N'jjk5', 1, 1, N'joc')
INSERT [dbo].[mantenimiento] ([idMantenimiento], [total], [fecha], [placa], [idgrupo], [idservicioVehiculo], [usuario]) VALUES (8, 800.0000, CAST(N'2018-04-17T00:24:14.000' AS DateTime), N'MN 00045', 2, 1, N'joc')
SET IDENTITY_INSERT [dbo].[mantenimiento] OFF
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([CodMarca], [Marca]) VALUES (1, N'nose')
SET IDENTITY_INSERT [dbo].[Marcas] OFF
INSERT [dbo].[permiso] ([idUsuario], [facturar], [personas], [producto], [reporte], [mantenimiento], [lavado], [btnFacturar], [btnUsuarios], [Password], [usuario], [btnProducto], [btnmantenimiento], [btnLavado], [btnPersona], [btnFacturarCompra], [Logs]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, N'joc', 1, 1, 1, 1, 1, 1)
INSERT [dbo].[permiso] ([idUsuario], [facturar], [personas], [producto], [reporte], [mantenimiento], [lavado], [btnFacturar], [btnUsuarios], [Password], [usuario], [btnProducto], [btnmantenimiento], [btnLavado], [btnPersona], [btnFacturarCompra], [Logs]) VALUES (2, 0, 0, 0, 1, 0, 0, 0, 0, NULL, N'new', 0, 0, 1, 0, 0, 0)
INSERT [dbo].[permiso] ([idUsuario], [facturar], [personas], [producto], [reporte], [mantenimiento], [lavado], [btnFacturar], [btnUsuarios], [Password], [usuario], [btnProducto], [btnmantenimiento], [btnLavado], [btnPersona], [btnFacturarCompra], [Logs]) VALUES (3, 1, 1, 1, 1, 1, 1, 1, 1, NULL, N'Gelder', 1, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([CodProducto], [Producto], [CodMarca], [CodSAC], [Existencia], [Costo], [Precio], [Activo]) VALUES (1, N'nose1', 1, N'2314C', 244958, CAST(1.00 AS Numeric(18, 2)), CAST(123.00 AS Numeric(18, 2)), 1)
INSERT [dbo].[Productos] ([CodProducto], [Producto], [CodMarca], [CodSAC], [Existencia], [Costo], [Precio], [Activo]) VALUES (2, N'FASD', 1, N'1234SX', 1234, CAST(12.00 AS Numeric(18, 2)), CAST(123.00 AS Numeric(18, 2)), 0)
INSERT [dbo].[Productos] ([CodProducto], [Producto], [CodMarca], [CodSAC], [Existencia], [Costo], [Precio], [Activo]) VALUES (3, N'1', 1, N'11', 126, CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), 1)
INSERT [dbo].[Productos] ([CodProducto], [Producto], [CodMarca], [CodSAC], [Existencia], [Costo], [Precio], [Activo]) VALUES (4, N'asdfghjklhgg', 1, N'123456rdfc', 8608, CAST(12.00 AS Numeric(18, 2)), CAST(1234.00 AS Numeric(18, 2)), 1)
INSERT [dbo].[Productos] ([CodProducto], [Producto], [CodMarca], [CodSAC], [Existencia], [Costo], [Precio], [Activo]) VALUES (5, N'ADSFG', 1, N'DSAF', 116, CAST(250.00 AS Numeric(18, 2)), CAST(500.00 AS Numeric(18, 2)), 1)
INSERT [dbo].[Productos] ([CodProducto], [Producto], [CodMarca], [CodSAC], [Existencia], [Costo], [Precio], [Activo]) VALUES (6, N'EWRSTDF', 1, N'13141C', 187, CAST(500.00 AS Numeric(18, 2)), CAST(700.00 AS Numeric(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Productos] OFF
SET IDENTITY_INSERT [dbo].[proveedor] ON 

INSERT [dbo].[proveedor] ([idProveedor], [apellidos], [nombres], [nombreempresa], [direccion], [RUC], [telefono], [correo], [estado]) VALUES (1, N'gaed', N'gelrd', N'dfas', N'dsfsagrdfgsdfgdsfgsdfgsdfg', N'v434123fsdf', N'12345678', N'asdff', 1)
SET IDENTITY_INSERT [dbo].[proveedor] OFF
SET IDENTITY_INSERT [dbo].[servicioLavado] ON 

INSERT [dbo].[servicioLavado] ([idServicioLavado], [servicioLavado], [estado]) VALUES (1, N'Lavado', 1)
INSERT [dbo].[servicioLavado] ([idServicioLavado], [servicioLavado], [estado]) VALUES (2, N'Esprayado', 1)
INSERT [dbo].[servicioLavado] ([idServicioLavado], [servicioLavado], [estado]) VALUES (3, N'Lavado y esprayado', 1)
INSERT [dbo].[servicioLavado] ([idServicioLavado], [servicioLavado], [estado]) VALUES (4, N'Aspirado Interior', 1)
SET IDENTITY_INSERT [dbo].[servicioLavado] OFF
SET IDENTITY_INSERT [dbo].[servicioMantenimiento] ON 

INSERT [dbo].[servicioMantenimiento] ([idServicioMantenimiento], [servicioMantenimiento], [estado]) VALUES (1, N'Cambio de aceite', 1)
SET IDENTITY_INSERT [dbo].[servicioMantenimiento] OFF
SET IDENTITY_INSERT [dbo].[ServicioVehiculo] ON 

INSERT [dbo].[ServicioVehiculo] ([idServicioVehiculo], [idServicioMantenimiento], [idVehiculoMantenimiento], [precio], [estado]) VALUES (1, 1, 1, 800.0000, 1)
SET IDENTITY_INSERT [dbo].[ServicioVehiculo] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [Usuario], [estado], [Password], [idEmpleado]) VALUES (1, N'joc', N'Activo', N'joc', 1)
INSERT [dbo].[Usuarios] ([idUsuario], [Usuario], [estado], [Password], [idEmpleado]) VALUES (2, N'new', N'Activo', N'new', 2)
INSERT [dbo].[Usuarios] ([idUsuario], [Usuario], [estado], [Password], [idEmpleado]) VALUES (3, N'Gelder', N'Activo', N'1234', 3)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
SET IDENTITY_INSERT [dbo].[VehiculoLavado] ON 

INSERT [dbo].[VehiculoLavado] ([idVehiculoLavado], [vehiculoLavado], [estado]) VALUES (1, N'Camion', 1)
INSERT [dbo].[VehiculoLavado] ([idVehiculoLavado], [vehiculoLavado], [estado]) VALUES (2, N'Camioneta', 1)
INSERT [dbo].[VehiculoLavado] ([idVehiculoLavado], [vehiculoLavado], [estado]) VALUES (3, N'Carro', 0)
INSERT [dbo].[VehiculoLavado] ([idVehiculoLavado], [vehiculoLavado], [estado]) VALUES (4, N'Carro', 1)
INSERT [dbo].[VehiculoLavado] ([idVehiculoLavado], [vehiculoLavado], [estado]) VALUES (5, N'Cabezal', 1)
INSERT [dbo].[VehiculoLavado] ([idVehiculoLavado], [vehiculoLavado], [estado]) VALUES (6, N'Moto', 1)
SET IDENTITY_INSERT [dbo].[VehiculoLavado] OFF
SET IDENTITY_INSERT [dbo].[VehiculoMantenimiento] ON 

INSERT [dbo].[VehiculoMantenimiento] ([idVehiculoMantenimiento], [vehiculoMantenimiento], [estado]) VALUES (1, N'Carro', 1)
SET IDENTITY_INSERT [dbo].[VehiculoMantenimiento] OFF
SET IDENTITY_INSERT [dbo].[venta] ON 

INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (262, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'Anulada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (263, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (264, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (265, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (266, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (267, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (268, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (269, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (270, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (271, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (272, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (273, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (274, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (275, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (276, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (277, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (278, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (279, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (280, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (281, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (282, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (283, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (284, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (285, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (286, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (287, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (288, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (289, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (290, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (291, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (292, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (293, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (294, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (295, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (296, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (297, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (298, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (299, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (300, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (301, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (302, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (303, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (304, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (305, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (306, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (307, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (308, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (309, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (310, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (311, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (312, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (313, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (314, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (315, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (316, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (317, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (318, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (319, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (320, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (321, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (322, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (323, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (324, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (325, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (326, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (327, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (328, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (329, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (330, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (331, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (332, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (333, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (334, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (335, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (336, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (337, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (338, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (339, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (340, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (341, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (342, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (343, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (344, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (345, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (346, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (347, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (348, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (349, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (350, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (351, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (352, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (353, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (354, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (355, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (356, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (357, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (358, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (359, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (360, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
GO
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (361, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (362, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (363, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (364, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (365, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (366, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (367, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (368, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (369, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (370, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (371, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (372, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (373, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (374, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (375, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (376, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (377, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (378, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (379, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (380, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (381, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (382, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (383, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (384, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (385, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (386, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (387, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (388, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (389, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (390, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (392, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (393, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (394, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (395, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (396, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (397, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (398, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (399, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (400, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (401, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (402, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (403, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (404, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (405, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (406, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (407, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (408, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (409, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (410, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (411, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (412, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (413, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (414, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (415, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (416, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (417, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (418, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (419, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (420, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (421, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (422, 1, 1, CAST(N'2011-11-11T00:00:00.000' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), CAST(1.00 AS Numeric(18, 2)), N'efectivo', CAST(1.00 AS Numeric(18, 2)), N'cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (423, 1, 1, CAST(N'2018-04-11T09:40:50.447' AS DateTime), CAST(132.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(151.80 AS Numeric(18, 2)), N'Efectivo', CAST(4.91 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (424, 2, 2, CAST(N'2018-04-13T13:43:52.703' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1.15 AS Numeric(18, 2)), N'Efectivo', CAST(0.04 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (425, 2, 1, CAST(N'2018-04-13T13:45:15.017' AS DateTime), CAST(77024.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(88577.60 AS Numeric(18, 2)), N'Tarjeta', CAST(2866.59 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (426, 2, 2, CAST(N'2018-04-13T13:46:12.650' AS DateTime), CAST(33.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(37.95 AS Numeric(18, 2)), N'Efectivo', CAST(1.23 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (427, 2, 2, CAST(N'2018-04-13T13:48:10.090' AS DateTime), CAST(1262.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1451.30 AS Numeric(18, 2)), N'Efectivo', CAST(46.97 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (428, 2, 2, CAST(N'2018-04-13T14:05:36.640' AS DateTime), CAST(5250.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(6037.50 AS Numeric(18, 2)), N'Efectivo', CAST(195.39 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (429, 2, 2, CAST(N'2018-04-13T14:17:10.337' AS DateTime), CAST(6000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(6900.00 AS Numeric(18, 2)), N'Efectivo', CAST(223.30 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (430, 2, 2, CAST(N'2018-04-13T14:38:53.020' AS DateTime), CAST(6032.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(6936.80 AS Numeric(18, 2)), N'Efectivo', CAST(224.49 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (431, 2, 1, CAST(N'2018-04-13T15:20:14.807' AS DateTime), CAST(12000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13800.00 AS Numeric(18, 2)), N'Tarjeta', CAST(446.60 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (432, 2, 2, CAST(N'2018-04-13T15:22:42.360' AS DateTime), CAST(2054.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(2362.10 AS Numeric(18, 2)), N'Efectivo', CAST(76.44 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (433, 2, 1, CAST(N'2018-04-13T15:25:59.547' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1.15 AS Numeric(18, 2)), N'Efectivo', CAST(0.04 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (434, 2, 2, CAST(N'2018-04-13T15:27:08.433' AS DateTime), CAST(10500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(12075.00 AS Numeric(18, 2)), N'Efectivo', CAST(390.78 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (435, 2, 2, CAST(N'2018-04-13T15:47:26.903' AS DateTime), CAST(2.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(2.30 AS Numeric(18, 2)), N'Tarjeta', CAST(0.07 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (436, 2, 1, CAST(N'2018-04-13T15:49:25.773' AS DateTime), CAST(10500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(12075.00 AS Numeric(18, 2)), N'Efectivo', CAST(390.78 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (437, 2, 2, CAST(N'2018-04-13T15:50:53.790' AS DateTime), CAST(6000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(6900.00 AS Numeric(18, 2)), N'Efectivo', CAST(223.30 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (438, 2, 1, CAST(N'2018-04-13T15:52:53.210' AS DateTime), CAST(12000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13800.00 AS Numeric(18, 2)), N'Efectivo', CAST(446.60 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (439, 2, 2, CAST(N'2018-04-13T15:53:17.570' AS DateTime), CAST(503500.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(579025.00 AS Numeric(18, 2)), N'Efectivo', CAST(18738.67 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (440, 2, 2, CAST(N'2018-04-13T17:02:01.760' AS DateTime), CAST(6000.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(6900.00 AS Numeric(18, 2)), N'Efectivo', CAST(223.30 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (441, 2, 2, CAST(N'2018-04-13T17:02:47.977' AS DateTime), CAST(250.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(287.50 AS Numeric(18, 2)), N'Efectivo', CAST(9.30 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (442, 2, 2, CAST(N'2018-04-13T17:13:57.567' AS DateTime), CAST(6144.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(7065.60 AS Numeric(18, 2)), N'Efectivo', CAST(228.66 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (443, 2, 2, CAST(N'2018-04-13T17:15:55.103' AS DateTime), CAST(6300.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(7245.00 AS Numeric(18, 2)), N'Efectivo', CAST(234.47 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (444, 2, 1, CAST(N'2018-04-13T17:20:45.883' AS DateTime), CAST(9027.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(10381.05 AS Numeric(18, 2)), N'Efectivo', CAST(335.96 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (445, 2, 2, CAST(N'2018-04-13T17:25:18.673' AS DateTime), CAST(24.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(27.60 AS Numeric(18, 2)), N'Efectivo', CAST(0.89 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (446, 2, 2, CAST(N'2018-04-25T00:43:46.217' AS DateTime), CAST(3324.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(3822.60 AS Numeric(18, 2)), N'Tarjeta', CAST(123.71 AS Numeric(18, 2)), N'Anulada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (447, 2, 2, CAST(N'2018-04-25T00:49:15.783' AS DateTime), CAST(5.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(5.75 AS Numeric(18, 2)), N'Efectivo', CAST(0.19 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (448, 2, 1, CAST(N'2018-04-25T00:53:14.223' AS DateTime), CAST(12.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13.80 AS Numeric(18, 2)), N'Efectivo', CAST(0.45 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (449, 2, 2, CAST(N'2018-04-25T00:59:13.603' AS DateTime), CAST(3456.00 AS Numeric(18, 2)), CAST(123.00 AS Numeric(18, 2)), CAST(3974.40 AS Numeric(18, 2)), N'Efectivo', CAST(128.62 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (450, 2, 2, CAST(N'2018-04-25T01:00:28.253' AS DateTime), CAST(3004.00 AS Numeric(18, 2)), CAST(12.00 AS Numeric(18, 2)), CAST(3040.05 AS Numeric(18, 2)), N'Tarjeta', CAST(98.38 AS Numeric(18, 2)), N'Anulada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (451, 2, 2, CAST(N'2018-04-25T06:22:38.570' AS DateTime), CAST(144.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(165.60 AS Numeric(18, 2)), N'Tarjeta', CAST(5.36 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (452, 2, 3, CAST(N'2018-04-25T07:56:44.537' AS DateTime), CAST(1.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(1.15 AS Numeric(18, 2)), N'Tarjeta', CAST(0.04 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (453, 2, 3, CAST(N'2018-04-25T08:03:33.010' AS DateTime), CAST(12.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(13.80 AS Numeric(18, 2)), N'Efectivo', CAST(0.45 AS Numeric(18, 2)), N'Cancelada')
INSERT [dbo].[venta] ([NumVenta], [idCliente], [idUsuario], [fechaFac], [Subtotal], [Descuento], [totalcordobas], [TipoPago], [TotalDolares], [Estado]) VALUES (454, 2, 3, CAST(N'2018-04-25T08:03:58.900' AS DateTime), CAST(23512.00 AS Numeric(18, 2)), CAST(0.00 AS Numeric(18, 2)), CAST(27038.80 AS Numeric(18, 2)), N'Efectivo', CAST(875.04 AS Numeric(18, 2)), N'Cancelada')
SET IDENTITY_INSERT [dbo].[venta] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__permiso__9AFF8FC626FF7343]    Script Date: 25/04/2018 9:13:43 ******/
ALTER TABLE [dbo].[permiso] ADD UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Usuarios__E3237CF7B865E743]    Script Date: 25/04/2018 9:13:43 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[almacen]  WITH CHECK ADD FOREIGN KEY([CodCategoria])
REFERENCES [dbo].[categoria] ([CodCategoria])
GO
ALTER TABLE [dbo].[categoria]  WITH CHECK ADD  CONSTRAINT [FK__categoria__CodPr__5AEE82B9] FOREIGN KEY([CodProducto])
REFERENCES [dbo].[Productos] ([CodProducto])
GO
ALTER TABLE [dbo].[categoria] CHECK CONSTRAINT [FK__categoria__CodPr__5AEE82B9]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [FK__compra__idProvee__4316F928] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[proveedor] ([idProveedor])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [FK__compra__idProvee__4316F928]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [FK_compra_Usuarios] FOREIGN KEY([idusuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [FK_compra_Usuarios]
GO
ALTER TABLE [dbo].[detallecompra]  WITH CHECK ADD  CONSTRAINT [FK__detalleco__idCom__440B1D61] FOREIGN KEY([idCompra])
REFERENCES [dbo].[compra] ([idCompra])
GO
ALTER TABLE [dbo].[detallecompra] CHECK CONSTRAINT [FK__detalleco__idCom__440B1D61]
GO
ALTER TABLE [dbo].[detallecompra]  WITH CHECK ADD  CONSTRAINT [FK__detalleco__idPro__44FF419A] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([CodProducto])
GO
ALTER TABLE [dbo].[detallecompra] CHECK CONSTRAINT [FK__detalleco__idPro__44FF419A]
GO
ALTER TABLE [dbo].[Detalledevolucion]  WITH CHECK ADD  CONSTRAINT [FK__Detallede__Iddev__67DE6983] FOREIGN KEY([Iddevolucion])
REFERENCES [dbo].[devolucion] ([Iddevolucion])
GO
ALTER TABLE [dbo].[Detalledevolucion] CHECK CONSTRAINT [FK__Detallede__Iddev__67DE6983]
GO
ALTER TABLE [dbo].[Detalledevolucion]  WITH CHECK ADD  CONSTRAINT [FK__Detallede__Idpro__60A75C0F] FOREIGN KEY([Idproducto])
REFERENCES [dbo].[Productos] ([CodProducto])
GO
ALTER TABLE [dbo].[Detalledevolucion] CHECK CONSTRAINT [FK__Detallede__Idpro__60A75C0F]
GO
ALTER TABLE [dbo].[detalledevolucioncompra]  WITH CHECK ADD  CONSTRAINT [FK__detallede__Idpro__6AEFE058] FOREIGN KEY([Idproducto])
REFERENCES [dbo].[Productos] ([CodProducto])
GO
ALTER TABLE [dbo].[detalledevolucioncompra] CHECK CONSTRAINT [FK__detallede__Idpro__6AEFE058]
GO
ALTER TABLE [dbo].[detalledevolucioncompra]  WITH CHECK ADD  CONSTRAINT [FK_detalledevolucioncompra_devolucionCompra] FOREIGN KEY([Iddevolucion])
REFERENCES [dbo].[devolucionCompra] ([Iddevolucion])
GO
ALTER TABLE [dbo].[detalledevolucioncompra] CHECK CONSTRAINT [FK_detalledevolucioncompra_devolucionCompra]
GO
ALTER TABLE [dbo].[detallepago]  WITH CHECK ADD FOREIGN KEY([codigotipopago])
REFERENCES [dbo].[tipopago] ([codigotipopago])
GO
ALTER TABLE [dbo].[detalleventa]  WITH CHECK ADD  CONSTRAINT [FK__detalleve__idPro__46E78A0C] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([CodProducto])
GO
ALTER TABLE [dbo].[detalleventa] CHECK CONSTRAINT [FK__detalleve__idPro__46E78A0C]
GO
ALTER TABLE [dbo].[detalleventa]  WITH CHECK ADD  CONSTRAINT [FK__detalleve__idVen__47DBAE45] FOREIGN KEY([idVenta])
REFERENCES [dbo].[venta] ([NumVenta])
GO
ALTER TABLE [dbo].[detalleventa] CHECK CONSTRAINT [FK__detalleve__idVen__47DBAE45]
GO
ALTER TABLE [dbo].[devolucion]  WITH CHECK ADD  CONSTRAINT [FK__devolucio__NumVe__49C3F6B7] FOREIGN KEY([NumVenta])
REFERENCES [dbo].[venta] ([NumVenta])
GO
ALTER TABLE [dbo].[devolucion] CHECK CONSTRAINT [FK__devolucio__NumVe__49C3F6B7]
GO
ALTER TABLE [dbo].[devolucionCompra]  WITH CHECK ADD  CONSTRAINT [FK__devolucio__Idcom__681373AD] FOREIGN KEY([Idcompra])
REFERENCES [dbo].[compra] ([idCompra])
GO
ALTER TABLE [dbo].[devolucionCompra] CHECK CONSTRAINT [FK__devolucio__Idcom__681373AD]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD FOREIGN KEY([idArea])
REFERENCES [dbo].[area] ([idArea])
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD FOREIGN KEY([idgrupo])
REFERENCES [dbo].[grupoTrabajadores] ([idgrupo])
GO
ALTER TABLE [dbo].[lavado]  WITH CHECK ADD FOREIGN KEY([idgrupo])
REFERENCES [dbo].[grupoTrabajadores] ([idgrupo])
GO
ALTER TABLE [dbo].[lavado]  WITH CHECK ADD FOREIGN KEY([idLavadoVehiculo])
REFERENCES [dbo].[LavadoVehiculo] ([idLavadoVehiculo])
GO
ALTER TABLE [dbo].[LavadoVehiculo]  WITH CHECK ADD FOREIGN KEY([idServicioLavado])
REFERENCES [dbo].[servicioLavado] ([idServicioLavado])
GO
ALTER TABLE [dbo].[LavadoVehiculo]  WITH CHECK ADD FOREIGN KEY([idVehiculoLavado])
REFERENCES [dbo].[VehiculoLavado] ([idVehiculoLavado])
GO
ALTER TABLE [dbo].[mantenimiento]  WITH CHECK ADD  CONSTRAINT [FK__mantenimi__idgru__5070F446] FOREIGN KEY([idgrupo])
REFERENCES [dbo].[grupoTrabajadores] ([idgrupo])
GO
ALTER TABLE [dbo].[mantenimiento] CHECK CONSTRAINT [FK__mantenimi__idgru__5070F446]
GO
ALTER TABLE [dbo].[mantenimiento]  WITH CHECK ADD  CONSTRAINT [FK__mantenimi__idser__5165187F] FOREIGN KEY([idservicioVehiculo])
REFERENCES [dbo].[ServicioVehiculo] ([idServicioVehiculo])
GO
ALTER TABLE [dbo].[mantenimiento] CHECK CONSTRAINT [FK__mantenimi__idser__5165187F]
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[permiso]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK__Productos__CodMa__5441852A] FOREIGN KEY([CodMarca])
REFERENCES [dbo].[Marcas] ([CodMarca])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK__Productos__CodMa__5441852A]
GO
ALTER TABLE [dbo].[ServicioVehiculo]  WITH CHECK ADD  CONSTRAINT [FK__ServicioV__idSer__5535A963] FOREIGN KEY([idServicioMantenimiento])
REFERENCES [dbo].[servicioMantenimiento] ([idServicioMantenimiento])
GO
ALTER TABLE [dbo].[ServicioVehiculo] CHECK CONSTRAINT [FK__ServicioV__idSer__5535A963]
GO
ALTER TABLE [dbo].[ServicioVehiculo]  WITH CHECK ADD FOREIGN KEY([idVehiculoMantenimiento])
REFERENCES [dbo].[VehiculoMantenimiento] ([idVehiculoMantenimiento])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK__venta__idCliente__5812160E] FOREIGN KEY([idCliente])
REFERENCES [dbo].[clientes] ([idCliente])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK__venta__idCliente__5812160E]
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD  CONSTRAINT [FK__venta__idUsuario__59063A47] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[venta] CHECK CONSTRAINT [FK__venta__idUsuario__59063A47]
GO
/****** Object:  StoredProcedure [dbo].[actualizar_clientes]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[actualizar_clientes]
(
@i_idcliente int,
@i_nombres  nvarchar(120),
@i_apellido nvarchar(120),
@i_correo nvarchar(80),
@i_celular nvarchar(8),
@i_estado nvarchar(10)
  )
  AS 
  BEGIN
  UPDATE clientes SET  nombres=@i_nombres, apellido=@i_apellido, correo= @i_correo, celular = @i_celular , estado= @i_estado where idCliente=@i_idcliente
  END
 
 



GO
/****** Object:  StoredProcedure [dbo].[actualizaralmacen]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizaralmacen]
(
@idalmacen int,
@CodCategoria int,
@nombre nvarchar(100),
@ubicacion nvarchar(100),
@descripcion nvarchar(100),
@NombreCategoria nvarchar(50)
)
as
begin
update almacen  set CodCategoria=@CodCategoria,nombre = @nombre , ubicacion = @ubicacion , descripcion=@descripcion, NombreCategoria=@NombreCategoria where idalmacen=@idalmacen
end


GO
/****** Object:  StoredProcedure [dbo].[actualizarcategoria]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create PROCEDURE [dbo].[actualizarcategoria]
(
@CodCategoria int,
@Tipo nvarchar(50),
@Codproducto nvarchar(20),
@Nombredelproducto nvarchar(50)

 )
 AS 
 BEGIN
 UPDATE categoria SET  Tipo=@Tipo, CodProducto= @Codproducto , Nombredelproducto = @Nombredelproducto   where CodCategoria  =@CodCategoria
 END






GO
/****** Object:  StoredProcedure [dbo].[actualizarmarca]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create PROCEDURE [dbo].[actualizarmarca]
(
@Codmarca int,
@marca nvarchar(20)
 )
 AS 
 BEGIN
 UPDATE Marcas SET  Marca = @marca where CodMarca  =@Codmarca
 END




GO
/****** Object:  StoredProcedure [dbo].[actualizarproducto]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[actualizarproducto]
(
@Codproducto int,
@Producto nvarchar (50),
@Codmarca int,
@CodSac nvarchar(20),
@existencia int,
@Costo numeric(18,2),
@Precio numeric(18,2),
@Activo bit
 )
 AS 
 BEGIN
 UPDATE productos SET Producto=@Producto, CodMarca= @Codmarca , CodSAC =@CodSac,Existencia= @existencia, Costo = @Costo , Precio = @Precio ,Activo= @Activo where CodProducto=@Codproducto
 END







GO
/****** Object:  StoredProcedure [dbo].[agregardevolucion]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[agregardevolucion]
(

@Idusuario int,
@fechafactura datetime,
@Numventa int,
@observacion nvarchar(100)
)
as 
begin
insert into devolucion(idUsuario,NumVenta,fecha,observacion)
values (@Idusuario,@Numventa,@fechafactura,@observacion)
select SCOPE_IDENTITY() as id
end



GO
/****** Object:  StoredProcedure [dbo].[agregardevolucioncompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[agregardevolucioncompra]
(

@Idusuario int,
@fechafactura datetime,
@idcompra int,
@observacion nvarchar(50)
)
as 
begin
insert into devolucioncompra(idUsuario,idcompra,fecha,observacion)
values (@Idusuario,@idcompra,@fechafactura,@observacion)
select SCOPE_IDENTITY() as id
end
GO
/****** Object:  StoredProcedure [dbo].[agregarventa]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[agregarventa]
(
@I_idcliente int,
@Idusuario int,
@fechafactura datetime,
@tipopago nvarchar(50),
@Estado nvarchar(50),
@Subtotal numeric (18,2),
@Descuento numeric (18,2),
@totalcordobas numeric(18,2),
@totaldolares numeric(18,2)
)
as 
begin
insert into venta (idCliente,idUsuario,fechaFac,TipoPago,Estado,Subtotal,Descuento,totalcordobas,TotalDolares)
values (@I_idcliente,@Idusuario,@fechafactura,@tipopago,@Estado,@Subtotal,@Descuento,@totalcordobas,@totaldolares)
select SCOPE_IDENTITY() as id

---AuditoriaVenta
declare @fecha datetime
select @fecha = SYSDATETIME()
declare @idventaAudi int
select @idventaAudi = MAX(NumVenta) from venta

select * from AuditoriaVenta
insert into AuditoriaVenta(idCliente,idUsuario,fechaFac,TipoPago,Estado,Subtotal,Descuento,totalcordobas,TotalDolares,NumVenta,Accion,Fecha_creada)
values(@I_idcliente,@Idusuario,@fechafactura,@tipopago,@Estado,@Subtotal,@Descuento,@totalcordobas,@totaldolares,@idventaAudi,'Agregado',@fecha)
end

--select * from venta
--exec agregarventa
--@Numventas = 262,
--@I_idcliente = 1,
--@Idusuario = 1 ,
--@fechafactura = '2011-11-11 00:00:00.000',
--@tipopago  = 'efectivo',
--@Estado = 'cancelada',
--@Subtotal = 1.00,
--@Descuento = 1.00 ,
--@totalcordobas = 1.00,
--@totaldolares = 1.00








GO
/****** Object:  StoredProcedure [dbo].[getalmacen]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[getalmacen]
as
begin
select
a.idalmacen,
a.CodCategoria,
a.nombre,
a.ubicacion,
a.descripcion,
a.NombreCategoria
from almacen as A
inner join categoria as C on c.CodCategoria = A.CodCategoria

end





GO
/****** Object:  StoredProcedure [dbo].[getcategoria]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getcategoria]
 as 
begin 
select  C.CodCategoria,
c.Tipo,
C.CodProducto,
C.Nombredelproducto
from categoria as C
inner join Productos as P on P.CodProducto = C.CodProducto
 end





GO
/****** Object:  StoredProcedure [dbo].[getcliente]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getcliente]
 as select  idcliente,nombres,apellido,correo,celular,estado from clientes where estado = 'Activo' 




GO
/****** Object:  StoredProcedure [dbo].[getcompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getcompra]
 as 
 begin 
 select  c.idCompra,
	c.idProveedor,
	c.fechaCompra,
	c.TotalCordobas,
	c.idusuario,
	c.TipoPago,
	c.Descuento,
	c.Subtotal,
	c.TotalDolares,
	c.Estado

	
  from compra as C
  inner join proveedor as p on p.idProveedor= c.idProveedor
   inner join Usuarios as u on u.idUsuario= c.idusuario
   where c.Estado = 'Cancelada' 
  end 




GO
/****** Object:  StoredProcedure [dbo].[getdetallecompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getdetallecompra](
@idcompra int

)
as
begin
declare @id int
select @id = max(idCompra) from detallecompra
select 
d.cantidad,
d.idCompra,
d.idproducto,
p.Producto,
p.Costo,
d.total
from detallecompra as d
inner join compra as c on c.idCompra = d.idCompra
inner join productos as p on p.CodProducto = d.idproducto 
where d.idCompra = @id and Estado = 'Cancelada'
end




GO
/****** Object:  StoredProcedure [dbo].[getdetallecomprax]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[getdetallecomprax]
as
begin
select 
d.cantidad,
d.idCompra,
d.idproducto,
p.Producto,
p.Costo,
d.total
from detallecompra as d
inner join compra as c on c.idCompra = d.idCompra
inner join productos as p on p.CodProducto = d.idproducto 
where  Estado = 'Cancelada'
end






GO
/****** Object:  StoredProcedure [dbo].[getdetalledevolucion]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getdetalledevolucion]
as
begin
select 
d.cantidad,
d.Iddevolucion,
d.idproducto,
p.Producto,
p.Precio
from Detalledevolucion as d
inner join devolucion as x on x.Iddevolucion = d.Iddevolucion
inner join productos as p on P.CodProducto = d.idproducto 
end





GO
/****** Object:  StoredProcedure [dbo].[getdetalledevolucioncompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getdetalledevolucioncompra]
as
begin
select 
d.cantidad,
d.Iddevolucion,
d.idproducto,
p.Producto,
p.Precio
from detalledevolucioncompra as d
inner join devolucion as x on x.Iddevolucion = d.Iddevolucion
inner join productos as p on P.CodProducto = d.idproducto 
end

GO
/****** Object:  StoredProcedure [dbo].[getdetalleventa]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getdetalleventa]
(
@idventa int
)
as
begin
declare @id int
select @id = max(idVenta) from detalleventa
select 
d.cantidad,
d.idVenta,
v.totalcordobas,
d.idproducto,
p.Producto,
p.Precio,
d.totaldetalle
from detalleventa as d
inner join venta as v on v.NumVenta = d.idVenta
inner join productos as p on P.CodProducto = d.idproducto 
where d.idVenta = @id and Estado = 'Cancelada'
end




GO
/****** Object:  StoredProcedure [dbo].[getdetalleventax]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[getdetalleventax]
as
begin

select 
d.cantidad,
d.idVenta,
v.totalcordobas,
d.idproducto,
p.Producto,
p.Precio,
d.totaldetalle
from detalleventa as d
inner join venta as v on v.NumVenta = d.idVenta
inner join productos as p on P.CodProducto = d.idproducto 
where Estado = 'Cancelada'
end



GO
/****** Object:  StoredProcedure [dbo].[getdevolucion]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getdevolucion]
as
begin
	select
	d.Iddevolucion,
	d.Idusuario,
	d.NumVenta,
	d.fecha,
	d.observacion
	from devolucion as d
	inner join venta as v on v.NumVenta = d.NumVenta

end

GO
/****** Object:  StoredProcedure [dbo].[getdevolucioncompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getdevolucioncompra]
as
begin
	select
	d.Iddevolucion,
	d.Idusuario,
	d.Idcompra,
	d.fecha,
	d.observacion
	from devolucionCompra as d
	inner join compra as C on c.idCompra = d.Idcompra

end
GO
/****** Object:  StoredProcedure [dbo].[getmarca]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getmarca]
 as 
select  CodMarca,
Marca
from Marcas 



GO
/****** Object:  StoredProcedure [dbo].[getprodcuto]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getprodcuto]
 as 
 begin 
 select  p.CodProducto, p.Producto, p.CodMarca, p.CodSAC,p.Existencia,p.Costo,p.Precio,p.Activo
  from Productos as P
  inner join Marcas as M on M.CodMarca= p.CodMarca
  where Activo = 'True'
  end 









GO
/****** Object:  StoredProcedure [dbo].[getventa]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getventa]
as
begin
	select
	v.NumVenta,
	v.idCliente,
	v.idUsuario,
	v.fechaFac,
	v.TipoPago,
	v.Estado,
	v.Subtotal,
	v.Descuento,
	v.totalcordobas,
	v.TotalDolares	
	from venta as v
	inner join Usuarios as u on  u.idUsuario = v.idUsuario
	inner join clientes as c on  c.idCliente = v.idCliente
	where v.Estado = 'Cancelada' 

end



GO
/****** Object:  StoredProcedure [dbo].[getventax]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getventax]
as
begin
	select
	v.NumVenta,
	v.idCliente,
	v.idUsuario,
	v.fechaFac,
	v.TipoPago,
	v.Estado,
	v.Subtotal,
	v.Descuento,
	v.totalcordobas,
	v.TotalDolares	
	from venta as v
	inner join Usuarios as u on  u.idUsuario = v.idUsuario
	inner join clientes as c on  c.idCliente = v.idCliente
	where v.Estado = 'Cancelada' 

end



GO
/****** Object:  StoredProcedure [dbo].[insertar_cliente]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure [dbo].[insertar_cliente]
(

@nombres  nvarchar(120),
@apellido nvarchar(120),
@correo nvarchar(80),
@celular nvarchar(8),
@estado nvarchar(10)
  )
  AS 
  BEGIN
  INSERT INTO clientes( nombres,apellido,correo,celular,estado)
  VALUES ( @nombres, @apellido, @correo,@celular,@estado)
  END



GO
/****** Object:  StoredProcedure [dbo].[insertar_detalle]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[insertar_detalle]
(
@cantidad int,
@idventa int,
@idproducto int,
@totaldetalle decimal(18,1)
  )
  AS 

  BEGIN
  INSERT INTO detalleventa( cantidad,idVenta,idProducto,totaldetalle)
  VALUES ( @cantidad,@idventa,@idproducto, @totaldetalle)
  END






GO
/****** Object:  StoredProcedure [dbo].[insertar_detalledevolucion]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertar_detalledevolucion]
(
@iddevolucion int,
@idproducto int,
@cantidad int
  )
  AS 
  BEGIN
  INSERT INTO Detalledevolucion(cantidad,Iddevolucion,idProducto)
  VALUES (@cantidad,@iddevolucion,@idproducto)
  END


GO
/****** Object:  StoredProcedure [dbo].[insertar_detalledevolucioncompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertar_detalledevolucioncompra]
(
@iddevolucion int,
@idproducto int,
@cantidad int
  )
  AS 
  BEGIN
  INSERT INTO detalledevolucioncompra( cantidad,Iddevolucion,idProducto)
  VALUES (@cantidad,@iddevolucion,@idproducto)
  END

GO
/****** Object:  StoredProcedure [dbo].[insertaralmacen]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[insertaralmacen]
 (

@CodCategoria int,
@nombre nvarchar(100),
@ubicacion nvarchar(100),
@descripcion nvarchar(100),
@NombreCategoria nvarchar(50)
 )
 as
 begin 
 insert into almacen(nombre,CodCategoria,ubicacion,descripcion,NombreCategoria)
 values (@nombre,@CodCategoria,@ubicacion,@descripcion,@NombreCategoria)
 end


GO
/****** Object:  StoredProcedure [dbo].[insertarcategoria]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarcategoria]
(
@Tipo nvarchar(50),
@Codproducto nvarchar(20),
@Nombredelproducto nvarchar(50)
  )
  AS 
  BEGIN
  INSERT INTO categoria(Tipo,CodProducto,Nombredelproducto)
  VALUES ( @Tipo,@Codproducto,@Nombredelproducto)
  END



GO
/****** Object:  StoredProcedure [dbo].[insertarcompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarcompra]
(
@IdProveedor int,
@Idusuario int,
@TotalCordobas Numeric(18,2),
@TotalDolares Numeric(18,2),
@Tipopago nvarchar(50),
@Descuento Numeric(18,2),
@Subtotal Numeric(18,2),
@FechaCompra datetime,
@Estado nvarchar(50)

  )
  As 
  BEGIN
  INSERT INTO compra(idProveedor,idusuario,TotalCordobas,TotalDolares,TipoPago,Descuento,Subtotal,fechaCompra,Estado)
  VALUES ( @IdProveedor,@Idusuario,@TotalCordobas,@TotalDolares,@Tipopago,@Descuento,@Subtotal,@FechaCompra,@Estado)
  select SCOPE_IDENTITY() as id


--AuditoriaCOMPRA
declare @fecha datetime
select @fecha = SYSDATETIME()
declare @idcompraaudi int
select @idcompraaudi = MAX(idCompra) from compra

select * from auditoriacompra
INSERT INTO auditoriacompra(idProveedor,idusuario,TotalCordobas,TotalDolares,TipoPago,Descuento,Subtotal,fechaCompra,Estado,idCompra,Accion,Fecha_creada)
VALUES ( @IdProveedor,@Idusuario,@TotalCordobas,@TotalDolares,@Tipopago,@Descuento,@Subtotal,@FechaCompra,@Estado,@idcompraaudi,'Agregada',@fecha)
End

--select * from compra
--select * from auditoriacompra
--exec insertarcompra
--@Numcompra =2,
--@IdProveedor =1,
--@Idusuario =1,
--@TotalCordobas =1,
--@TotalDolares =1,
--@Tipopago ='fec',
--@Descuento =1,
--@Subtotal =1,
--@FechaCompra = '2018-04-11 00:00:00.000',
--@Estado = 'ad'




GO
/****** Object:  StoredProcedure [dbo].[insertardetallecompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[insertardetallecompra]
(
@idcompra int,
@idproducto int,
@cantidad int,
@total numeric(18,2)
  )
  AS 
  BEGIN
  INSERT INTO detallecompra( idCompra,idProducto,cantidad,total)
  VALUES ( @idcompra,@idproducto,@cantidad, @total)
  END






GO
/****** Object:  StoredProcedure [dbo].[insertarmarca]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[insertarmarca]
(
@marca nvarchar(20)
  )
  AS 
  BEGIN
  INSERT INTO Marcas(Marca)
  VALUES ( @marca)
  END




GO
/****** Object:  StoredProcedure [dbo].[insertarproducto]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarproducto]
(
@Producto nvarchar (50),
@Codmarca int,
@CodSAC Nvarchar(20),
@existencia int,
@Costo numeric(18,2),
@Precio numeric(18,2),
@Activo bit
  )
  AS 
  BEGIN
  INSERT INTO productos (Producto,CodMarca,CodSAC,Existencia,Costo,Precio,Activo)
  VALUES ( @Producto,@Codmarca,@CodSAC,@existencia,@Costo,@Precio ,@Activo)
  END






GO
/****** Object:  StoredProcedure [dbo].[modificarcompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[modificarcompra]
(
@Numcompra int,
@Estado nvarchar(50)

)
as 
begin
Update compra Set Estado = @Estado Where idCompra = @Numcompra
end
GO
/****** Object:  StoredProcedure [dbo].[modificarventa]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create procedure [dbo].[modificarventa]
(
@Numventas int,
@Estado nvarchar(50)

)
as 
begin
Update venta Set Estado = @Estado Where NumVenta = @Numventas
end
GO
/****** Object:  StoredProcedure [dbo].[reportecompra]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reportecompra]
(
@Compra int
)
 as 
 begin 
 declare @id int
select @id = max(idCompra) from detallecompra
select 
 c.idCompra,
	c.idProveedor,
	p.nombres,
	p.nombreempresa,
	c.fechaCompra,
	c.TotalCordobas,
	c.idusuario,
	u.Usuario,
	c.TipoPago,
	c.Descuento,
	c.Subtotal,
	c.TotalDolares,
	c.Estado	
  from compra as C
  inner join proveedor as p on p.idProveedor= c.idProveedor
   inner join Usuarios as u on u.idUsuario= c.idusuario
   where c.Estado = 'Cancelada' and c.idCompra = @id
  end 


GO
/****** Object:  StoredProcedure [dbo].[reporteventa]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[reporteventa]
(
@venta int
)
as
begin
declare @id int
select @id = max(idVenta) from detalleventa
	select
	v.NumVenta,
	v.idCliente,
	c.nombres,
	v.idUsuario,
	u.Usuario,
	v.fechaFac,
	v.TipoPago,
	v.Estado,
	v.Subtotal,
	v.Descuento,
	v.totalcordobas,
	v.TotalDolares	
	from venta as v
	inner join Usuarios as u on  u.idUsuario = v.idUsuario
	inner join clientes as c on  c.idCliente = v.idCliente

	where v.Estado = 'Cancelada' and v.NumVenta = @id

end

GO
/****** Object:  StoredProcedure [dbo].[sp_Area]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_Area](
	@idArea int ='',
	@i_area nvarchar(15)='',
	@i_operacion char(1)
)
as
if @i_operacion = 'I'
begin
insert into Ingenieria..area([area]) 
values (@i_area)
end

if @i_operacion = 'S'
begin
select [idArea],[area] from area
end

if @i_operacion = 'U'
begin
update area set area = @i_area
where idArea = @idArea
end



GO
/****** Object:  StoredProcedure [dbo].[sp_auditoria_man]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_auditoria_man]
as
begin
--declare @acc nvarchar(10)
--if (select accion from AuditoriaMantenimiento am)='I'
--begin
--select @acc = 'Agregado'
--end
--else if (select accion from AuditoriaMantenimiento am)='M'
--begin
--select @acc = 'Modificado'
--end

SELECT AM.idmantenimiento,(e.nombres+' '+e.apellidos)AS Realizado_Por,AM.total as Total,AM.fecha as Fecha,AM.placa as Placa,GT.grupoTrabajadores as Mecanicos,SM.servicioMantenimiento as Servicio,VM.vehiculoMantenimiento as Vehiculo,AM.fechacreada as Creado,am.fechamodificada as Modificado,accion as Accion  FROM AuditoriaMantenimiento AM
INNER JOIN grupoTrabajadores GT ON GT.idgrupo=AM.idgrupo
INNER JOIN ServicioVehiculo SV ON SV.idServicioVehiculo=AM.idservicioVehiculo
INNER JOIN servicioMantenimiento SM ON SM.idServicioMantenimiento=SV.idServicioMantenimiento
INNER JOIN VehiculoMantenimiento VM ON VM.idVehiculoMantenimiento=SV.idVehiculoMantenimiento
INNER JOIN Usuarios U ON U.Usuario=AM.usuario
INNER JOIN empleado E ON E.idEmpleado=U.idEmpleado
end


GO
/****** Object:  StoredProcedure [dbo].[Sp_AUDITORIACOMPRA]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_AUDITORIACOMPRA]
 as 
 begin 
 select  
	
	c.idCompra,
	c.idProveedor,
	c.fechaCompra,
	c.TotalCordobas,
	c.idusuario,
	c.TipoPago,
	c.Descuento,
	c.Subtotal,
	c.TotalDolares,
	c.Estado,
	(e.nombres+' '+e.apellidos)AS Realizado_Por,
	C.Fecha_creada as Creado,
	C.Fecha_modificada as Modificado,
	C.accion as Accion 	
  from auditoriacompra as C
  inner join proveedor as p on p.idProveedor= c.idProveedor
   inner join Usuarios as u on u.idUsuario= c.idusuario
   	INNER JOIN empleado E ON E.idEmpleado=U.idEmpleado
  end 

GO
/****** Object:  StoredProcedure [dbo].[sp_auditoriaLavado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_auditoriaLavado]
as
begin
select auditoriaLavado.fecha,auditoriaLavado.accion,empleado.nombres +' '+empleado.apellidos as Realizado_por, VehiculoLavado.vehiculoLavado,
auditoriaLavado.placa,grupoTrabajadores.grupoTrabajadores,
servicioLavado.servicioLavado,
auditoriaLavado.total,
auditoriaLavado.fechaCreada,auditoriaLavado.fechaModificado,
auditoriaLavado.idLavado,lavado.idLavado,Usuarios.idUsuario,
grupoTrabajadores.idgrupo,servicioLavado.idServicioLavado,
VehiculoLavado.idVehiculoLavado,
empleado.idEmpleado,LavadoVehiculo.idLavadoVehiculo
from auditoriaLavado inner join lavado on 
auditoriaLavado.idLavado = lavado.idLavado
inner join Usuarios on lavado.usuario = Usuarios.Usuario
inner join grupoTrabajadores on lavado.idgrupo = grupoTrabajadores.idgrupo
inner join LavadoVehiculo on 
lavado.idLavadoVehiculo = LavadoVehiculo.idLavadoVehiculo
inner join servicioLavado on 
LavadoVehiculo.idServicioLavado = servicioLavado.idServicioLavado
inner join VehiculoLavado on vehiculoLavado.idVehiculoLavado = LavadoVehiculo.idVehiculoLavado
inner join empleado on empleado.idEmpleado = Usuarios.idEmpleado
end
---exec sp_auditoriaLavado

GO
/****** Object:  StoredProcedure [dbo].[Sp_Auditoriaventa]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Auditoriaventa]
as
begin
	select
	Av.NumVenta,
	Av.idCliente,
	Av.idUsuario,
	Av.fechaFac,
	Av.TipoPago,
	Av.Estado,
	Av.Subtotal,
	Av.Descuento,
	Av.totalcordobas,
	Av.TotalDolares	,
	(e.nombres+' '+e.apellidos)AS Realizado_Por,
	Av.Fecha_creada as Creado,
	Av.Fecha_modificada as Modificado,
	Av.accion as Accion 
	from AuditoriaVenta as Av
	inner join Usuarios as u on  u.idUsuario = Av.idUsuario
	inner join clientes as c on  c.idCliente = Av.idCliente
	INNER JOIN empleado E ON E.idEmpleado=U.idEmpleado
end

GO
/****** Object:  StoredProcedure [dbo].[sp_empleado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_empleado](
	@idEmpleado int = '',
	@i_celular int = '',
	@i_direccion nvarchar(90)='',
	@i_cedula nvarchar(16)='',
	@i_apellidos nvarchar(120)='',
	@i_nombres nvarchar(80)='',
	@i_fechaNac datetime='',
	@i_salario money='',
	@i_cargo nvarchar(50)='',
	@i_estado nvarchar(10)='',
	@i_idArea int='',
	@i_idGrupo int='',
	@i_operacion char(1)
)
as
if @i_operacion = 'I'
begin
insert into Ingenieria..empleado([celular],[direccion],[cedula],[apellidos],[nombres],
[fechaNac],[salario],[cargo],[estado],[idArea],[idgrupo]) values
(@i_celular ,@i_direccion ,@i_cedula ,@i_apellidos ,@i_nombres,@i_fechaNac ,@i_salario,@i_cargo ,
	@i_estado ,@i_idArea ,@i_idGrupo )
end

if @i_operacion = 'U'
begin
update Ingenieria..empleado set celular = @i_celular, direccion = @i_direccion, cedula = @i_cedula,
apellidos = @i_apellidos, nombres = @i_nombres, fechaNac = @i_fechaNac, salario =  @i_salario,
cargo = @i_cargo, estado = @i_estado, idArea = @i_idArea, idgrupo = @i_idGrupo
where idEmpleado = @idEmpleado
end

if @i_operacion = 'S'
begin
select empleado.idEmpleado,grupoTrabajadores.idgrupo,area.idArea,
empleado.nombres, empleado.apellidos,empleado.fechaNac,
empleado.cedula,empleado.direccion,empleado.celular,empleado.salario,
empleado.cargo,
empleado.estado,area.area,grupoTrabajadores.grupoTrabajadores from area inner join empleado on
area.idArea = empleado.idArea inner join grupoTrabajadores on
empleado.idgrupo = grupoTrabajadores.idgrupo
end

/*exec sp_empleado
	@idEmpleado = 2,
	@i_celular  = 89,
	@i_direccion ='matagalpa',
	@i_cedula ='002',
	@i_apellidos ='treminiooo',
	@i_nombres ='bladimir',
	@i_fechaNac ='11/12/2000',
	@i_salario =9000,
	@i_cargo ='lavado',
	@i_estado ='activo',
	@i_idArea =1,
	@i_idGrupo =1,
	@i_operacion ='U'*/



GO
/****** Object:  StoredProcedure [dbo].[sp_facturaLavado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_facturaLavado](
@idLavado int
)
as
begin
declare @id int
select @id = max(idLavado) from lavado
select lavado.idLavado,lavado.fecha,Usuarios.Usuario,empleado.nombres + ' ' + empleado.apellidos,
grupoTrabajadores.idgrupo,grupoTrabajadores.grupoTrabajadores as Area,
VehiculoLavado.idVehiculoLavado,VehiculoLavado.vehiculoLavado,
servicioLavado.idServicioLavado,servicioLavado.servicioLavado,lavado.idgrupo as Grupo_asignado,
LavadoVehiculo.idLavadoVehiculo,LavadoVehiculo.precio,lavado.placa,lavado.total
from Usuarios inner join empleado on Usuarios.idEmpleado = empleado.idEmpleado
inner join lavado on Usuarios.Usuario = lavado.usuario
inner join grupoTrabajadores on lavado.idgrupo = grupoTrabajadores.idgrupo 
inner join LavadoVehiculo on lavado.idLavadoVehiculo = LavadoVehiculo.idLavadoVehiculo
inner join VehiculoLavado on LavadoVehiculo.idVehiculoLavado = vehiculoLavado.idVehiculoLavado
inner join servicioLavado on LavadoVehiculo.idServicioLavado = servicioLavado.idServicioLavado
where lavado.idLavado = @id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_facturarMantenimiento]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_facturarMantenimiento]
(
	@idManteniminto int
)
as
begin
declare @id int
select @id = max(idMantenimiento) from mantenimiento m
select m.idMantenimiento,m.total,m.fecha,m.placa,gt.grupoTrabajadores,sm.servicioMantenimiento,vm.vehiculoMantenimiento,m.usuario,e.nombres,e.apellidos,m.idgrupo,m.idservicioVehiculo,sm.idServicioMantenimiento,vm.idVehiculoMantenimiento from mantenimiento m
inner join Usuarios u on u.Usuario=m.usuario
inner join empleado e on e.idEmpleado=u.idEmpleado
inner join grupoTrabajadores gt on gt.idgrupo=m.idgrupo
inner join ServicioVehiculo sv on sv.idServicioVehiculo=m.idservicioVehiculo
inner join servicioMantenimiento sm on sm.idServicioMantenimiento=sv.idServicioMantenimiento
inner join VehiculoMantenimiento vm on vm.idVehiculoMantenimiento=sv.idVehiculoMantenimiento
where m.idMantenimiento = @id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_grupoTrabajadores]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_grupoTrabajadores](
	@idgrupo int ='',
	@i_grupoTrabajadores nvarchar(15)='',
	@i_operacion char(1)
)
as
if @i_operacion = 'I'
begin
insert into Ingenieria..grupoTrabajadores([grupoTrabajadores]) values
(@i_grupoTrabajadores)
end

if @i_operacion = 'U'
begin
update grupoTrabajadores set grupoTrabajadores = @i_grupoTrabajadores 
where idgrupo = @idgrupo
end

if @i_operacion =  'S'
begin
select [idgrupo],[grupoTrabajadores] from grupoTrabajadores
end

/*exec sp_grupoTrabajadores
	@idgrupo  = 2,
	@i_grupoTrabajadores ='mantenimiento',
	@i_operacion ='U'*/



GO
/****** Object:  StoredProcedure [dbo].[sp_Inactivo]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Inactivo]
(
@i_operacion varchar(1)
)
as
if @i_operacion='c'
begin

 select  idcliente,nombres,apellido,correo,celular,estado from clientes where estado = 'Inactivo' 
 end

if @i_operacion='P'
begin 
 select  p.CodProducto, p.Producto, p.CodMarca, p.CodSAC,p.Existencia,p.Costo,p.Precio,p.Activo
  from Productos as P 
  inner join Marcas as M on M.CodMarca= p.CodMarca
  where Activo =  'false'
  end 


  if @i_operacion='v'
begin
	select
	v.NumVenta,
	v.idCliente,
	v.idUsuario,
	v.fechaFac,
	v.TipoPago,
	v.Estado,
	v.Subtotal,
	v.Descuento,
	v.totalcordobas,
	v.TotalDolares	
	from venta as v
	inner join Usuarios as u on  u.idUsuario = v.idUsuario
	inner join clientes as c on  c.idCliente = v.idCliente
	where V.Estado = 'Anulada'
  end 



GO
/****** Object:  StoredProcedure [dbo].[sp_lavado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_lavado]
(
	@idLavado int = '',
	@i_total money = '',
	@i_fecha datetime ='',
	@i_placa nvarchar(10)='',
	@i_idlavadoVehiculo int='',
	@i_idGrupo int='',
	@i_usuario nvarchar(100)='',
	@i_operacion char(1)
)
as
if @i_operacion = 'I'
begin
insert into Ingenieria..lavado([total],[fecha],[placa],[idLavadoVehiculo],[idgrupo],[usuario]) values
(@i_total,@i_fecha,@i_placa,@i_idlavadoVehiculo,@i_idGrupo,@i_usuario)

---AuditoriaLavado
declare @fecha datetime
select @fecha = SYSDATETIME()
declare @idLavadoAL int
select @idLavadoAL = MAX(idLavado) from lavado
insert into Ingenieria..auditoriaLavado([total],[fecha],[placa],[idLavadoVehiculo],[idgrupo],[usuario],[idLavado],[accion],[fechaCreada]) values
(@i_total,@i_fecha,@i_placa,@i_idlavadoVehiculo,@i_idGrupo,@i_usuario,@idLavadoAL,'Agregado',@fecha)

end
if @i_operacion = 'S'
begin
select lavado.idLavado,lavado.fecha,Usuarios.Usuario,empleado.nombres + ' ' + empleado.apellidos,
grupoTrabajadores.idgrupo,grupoTrabajadores.grupoTrabajadores as Area,
VehiculoLavado.idVehiculoLavado,VehiculoLavado.vehiculoLavado,
servicioLavado.idServicioLavado,servicioLavado.servicioLavado,lavado.idgrupo as Grupo_asignado,
LavadoVehiculo.idLavadoVehiculo,LavadoVehiculo.precio,lavado.placa,lavado.total
from Usuarios inner join empleado on Usuarios.idEmpleado = empleado.idEmpleado
inner join lavado on Usuarios.Usuario = lavado.usuario
inner join grupoTrabajadores on lavado.idgrupo = grupoTrabajadores.idgrupo 
inner join LavadoVehiculo on lavado.idLavadoVehiculo = LavadoVehiculo.idLavadoVehiculo
inner join VehiculoLavado on LavadoVehiculo.idVehiculoLavado = vehiculoLavado.idVehiculoLavado
inner join servicioLavado on LavadoVehiculo.idServicioLavado = servicioLavado.idServicioLavado
end
/*select * from lavado
select * from LavadoVehiculo
select * from grupoTrabajadores
select * from servicioLavado
select * from VehiculoLavado
select * from Ingenieria..empleado
select * from Usuarios
select * from area
end
*/

if @i_operacion = 'U'
begin
update Ingenieria..lavado set total = @i_total,fecha = @i_fecha,placa = @i_placa, idLavadoVehiculo = @i_idlavadoVehiculo,
idgrupo = @i_idGrupo, usuario = @i_usuario where idLavado = @idLavado
end
/*select * from lavado
select * from LavadoVehiculo
exec [sp_lavado]
	@idLavado = 3,
	@i_total = '250',
	@i_fecha ='29/03/2018',
	@i_placa ='19',
	@i_idlavadoVehiculo ='2',
	@i_idGrupo ='1',
	@i_usuario ='joc',
	@i_operacion = 'u'*/






GO
/****** Object:  StoredProcedure [dbo].[sp_lavadoVehiculo]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_lavadoVehiculo](
	@idLavadoVehiculo int = '',
	@i_idServicioLavado int = '',
	@i_idVehiculoLavado int = '',
	@i_precio money ='',
	@i_operacion char(1)
)
as
if @i_operacion = 'I'
begin
insert into Ingenieria..LavadoVehiculo([idServicioLavado],[idVehiculoLavado],[precio])
values (@i_idServicioLavado,@i_idVehiculoLavado,@i_precio)
end
if @i_operacion = 'S'
begin
/*select * from LavadoVehiculo
select * from servicioLavado
select * from VehiculoLavado*/

select LavadoVehiculo.idLavadoVehiculo,servicioLavado.idServicioLavado,
VehiculoLavado.idVehiculoLavado,
VehiculoLavado.vehiculoLavado,servicioLavado.servicioLavado,
LavadoVehiculo.precio
from LavadoVehiculo inner join servicioLavado on LavadoVehiculo.idServicioLavado = servicioLavado.idServicioLavado
inner join VehiculoLavado on LavadoVehiculo.idVehiculoLavado = vehiculoLavado.idVehiculoLavado
end
if @i_operacion = 'U'
begin
update Ingenieria..LavadoVehiculo set idServicioLavado = @i_idServicioLavado,
idVehiculoLavado = @i_idVehiculoLavado, precio = @i_precio where
idLavadoVehiculo = @idLavadoVehiculo
end

--exec  sp_lavadoVehiculo
--	--@idLavadoVehiculo = 3,
--	--@i_idServicioLavado  = 2,
--	--@i_idVehiculoLavado  = 6,
--	--@i_precio  ='650',
--	@i_operacion ='S'


GO
/****** Object:  StoredProcedure [dbo].[sp_log]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_log]
(
@usuario nvarchar(50)='',
@operacion char=''
)
as
if @operacion='I'
begin
declare @fecha datetime
declare @maq nvarchar(50)
select @fecha = SYSDATETIME()
select @maq = SYSTEM_USER
declare @intt int
select @intt = MAX(id_control) from Control_Entrada where usuarioo=@usuario and maquina=@maq
update Control_Entrada set logout=@fecha where usuarioo=@usuario and maquina=@maq and id_control=@intt
end

if @operacion='S'
begin
select (em.nombres+' '+em.apellidos)as Empleado,u.Usuario,ce.loginn,ce.logout,ce.maquina from Control_Entrada ce
inner join Usuarios u on u.Usuario=ce.usuarioo
inner join empleado em on em.idEmpleado=u.idEmpleado
end


GO
/****** Object:  StoredProcedure [dbo].[sp_mantenimiento]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_mantenimiento]
(
@idMantenimiento int = 0,
@total money = 0,
@fecha datetime='',
@placa nvarchar(10)='',
@idgrupo int =0,
@idservicioVehiculo int=0, 
@usuario nvarchar(100)='',
@i_operacion char(1)
)
as 
if @i_operacion='S'
begin 
select m.idMantenimiento,m.total,m.fecha,m.placa,gt.grupoTrabajadores,sm.servicioMantenimiento,vm.vehiculoMantenimiento,m.usuario,e.nombres,e.apellidos,m.idgrupo,m.idservicioVehiculo,sm.idServicioMantenimiento,vm.idVehiculoMantenimiento from mantenimiento m
inner join Usuarios u on u.Usuario=m.usuario
inner join empleado e on e.idEmpleado=u.idEmpleado
inner join grupoTrabajadores gt on gt.idgrupo=m.idgrupo
inner join ServicioVehiculo sv on sv.idServicioVehiculo=m.idservicioVehiculo
inner join servicioMantenimiento sm on sm.idServicioMantenimiento=sv.idServicioMantenimiento
inner join VehiculoMantenimiento vm on vm.idVehiculoMantenimiento=sv.idVehiculoMantenimiento

end

if @i_operacion='I'
begin
insert into mantenimiento(total,fecha,placa,idgrupo,idservicioVehiculo,usuario)
values (@total,@fecha,@placa,@idgrupo,@idservicioVehiculo,@usuario)

declare @fec datetime
select @fec = SYSDATETIME()
declare @id int
select @id = MAX(idMantenimiento) from mantenimiento

select * from AuditoriaMantenimiento
insert into AuditoriaMantenimiento(total,fecha,placa,idgrupo,idservicioVehiculo,usuario,accion,fechacreada,idMantenimiento)
values (@total,@fecha,@placa,@idgrupo,@idservicioVehiculo,@usuario,'Agregado',@fec,@id)
end


GO
/****** Object:  StoredProcedure [dbo].[sp_Pago]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Pago](
 @i_numeroDocumento int = '',
 @i_cordobas numeric(18,6) = '',
 @i_dolares numeric(18,6)='',
 @i_vuelto numeric(18,6)='',
 @fecha datetime,
 @i_idUsuario int='',
 @i_montoFactura numeric(18,2)='',
 @i_operacion char(1)
)
as
if @i_operacion = 'I'
begin
insert into Ingenieria..pago([numerodocumento],[cordobas],[dolares],[vuelto],
[fecha],[idUsuario],[montofactura]) values (@i_numeroDocumento,@i_cordobas,
@i_dolares,@i_vuelto,@fecha,@i_idUsuario,@i_montoFactura)
end

if @i_operacion = 'S'
begin
select numerodocumento,cordobas,dolares,vuelto,fecha,montofactura,
pago.idUsuario,Usuarios.Usuario,empleado.nombres+' '+ empleado.apellidos from pago inner join Usuarios
on pago.idUsuario = Usuarios.idUsuario inner join empleado on Usuarios.idEmpleado = empleado.idEmpleado
end
if @i_operacion = 'U'
begin
update Ingenieria..pago set cordobas = @i_cordobas, dolares = @i_dolares,
vuelto = @i_vuelto,fecha = @fecha,idUsuario = @i_idUsuario, montofactura = @i_montoFactura
where numerodocumento = @i_numeroDocumento
end

--exec  sp_Pago
-- @i_numeroDocumento  = '0001',
-- @i_cordobas  = 2500,
-- @i_dolares = 70,
-- @i_vuelto = 50,
-- @fecha ='01/04/2018',
-- @i_idUsuario = 3,
-- @i_montoFactura ='2600',
-- @i_operacion ='U'
-- select * from Usuarios
-- select * from empleado


GO
/****** Object:  StoredProcedure [dbo].[sp_proveedor]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_proveedor]
(
@idProveedor int=0,
@nombres nvarchar(80) = '',
@apellidos nvarchar(120)='' ,
@telefono nvarchar(12) = '',
@RUC nvarchar(50)='',
@correo nvarchar(80) = '',
@direccion nvarchar(max) = '',
@estado bit = 1,
@nombreempresa nvarchar(80)='',
@i_operacion varchar(1)
)
as

if @i_operacion='I'
begin

insert into [Ingenieria]..proveedor(nombres,apellidos,RUC,telefono,correo,direccion,estado,nombreempresa)
values (@nombres,@apellidos,@RUC,@telefono,@correo,@direccion,@estado,@nombreempresa)
end

if @i_operacion='U'
begin 

update [Ingenieria]..proveedor set nombres=@nombres,apellidos=@apellidos,telefono=@telefono,correo=@correo,direccion=@direccion,estado=@estado,nombreempresa=@nombreempresa,RUC=@RUC where idProveedor=@idProveedor

end

if @i_operacion='S'
begin

select idProveedor,nombres,apellidos,RUC,telefono,correo,direccion,estado,nombreempresa from proveedor where estado='True'

end


GO
/****** Object:  StoredProcedure [dbo].[sp_ReporteLavadoFecha]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ReporteLavadoFecha] (
@fecha date=''
--@nombre nvarchar(200)='',
--@vehiculo nvarchar(50)='',
--@servicio nvarchar(100)=''
)
as
begin
select lavado.idLavado,lavado.fecha,Usuarios.Usuario,empleado.nombres + ' ' + empleado.apellidos,
grupoTrabajadores.idgrupo,grupoTrabajadores.grupoTrabajadores as Area,
VehiculoLavado.idVehiculoLavado,VehiculoLavado.vehiculoLavado,
servicioLavado.idServicioLavado,servicioLavado.servicioLavado,lavado.idgrupo as Grupo_asignado,
LavadoVehiculo.idLavadoVehiculo,LavadoVehiculo.precio,lavado.placa,lavado.total
from Usuarios inner join empleado on Usuarios.idEmpleado = empleado.idEmpleado 
inner join lavado on Usuarios.Usuario = lavado.usuario
inner join grupoTrabajadores on lavado.idgrupo = grupoTrabajadores.idgrupo 
inner join LavadoVehiculo on lavado.idLavadoVehiculo = LavadoVehiculo.idLavadoVehiculo
inner join VehiculoLavado on LavadoVehiculo.idVehiculoLavado = vehiculoLavado.idVehiculoLavado
inner join servicioLavado on LavadoVehiculo.idServicioLavado = servicioLavado.idServicioLavado where lavado.fecha = @fecha
group by  lavado.idLavado,lavado.fecha,Usuarios.Usuario,empleado.nombres + ' ' + empleado.apellidos,
grupoTrabajadores.idgrupo,grupoTrabajadores.grupoTrabajadores,
VehiculoLavado.idVehiculoLavado,VehiculoLavado.vehiculoLavado,
servicioLavado.idServicioLavado,servicioLavado.servicioLavado,lavado.idgrupo,
LavadoVehiculo.idLavadoVehiculo,LavadoVehiculo.precio,lavado.placa,lavado.total
select sum(total) as suma from lavado where lavado.fecha = @fecha
end

--exec sp_ReporteLavado
--@nombre = 'jocsel',
--@fecha = '13/04/2018'

--select @suma = sum(lavado.total) from lavado
--select @msj = CONVERT(nvarchar(10),@suma)
--select @suma = @msj 
--select @msj


select lavado.idLavado,lavado.fecha,Usuarios.Usuario,empleado.nombres + ' ' + empleado.apellidos,
grupoTrabajadores.idgrupo,grupoTrabajadores.grupoTrabajadores as Area,
VehiculoLavado.idVehiculoLavado,VehiculoLavado.vehiculoLavado,
servicioLavado.idServicioLavado,servicioLavado.servicioLavado,lavado.idgrupo as Grupo_asignado,
LavadoVehiculo.idLavadoVehiculo,LavadoVehiculo.precio,lavado.placa,lavado.total
from Usuarios inner join empleado on Usuarios.idEmpleado = empleado.idEmpleado 
inner join lavado on Usuarios.Usuario = lavado.usuario
inner join grupoTrabajadores on lavado.idgrupo = grupoTrabajadores.idgrupo 
inner join LavadoVehiculo on lavado.idLavadoVehiculo = LavadoVehiculo.idLavadoVehiculo
inner join VehiculoLavado on LavadoVehiculo.idVehiculoLavado = vehiculoLavado.idVehiculoLavado
inner join servicioLavado on LavadoVehiculo.idServicioLavado = servicioLavado.idServicioLavado where lavado.fecha = '13/04/2018'
group by  lavado.idLavado,lavado.fecha,Usuarios.Usuario,empleado.nombres + ' ' + empleado.apellidos,
grupoTrabajadores.idgrupo,grupoTrabajadores.grupoTrabajadores,
VehiculoLavado.idVehiculoLavado,VehiculoLavado.vehiculoLavado,
servicioLavado.idServicioLavado,servicioLavado.servicioLavado,lavado.idgrupo,
LavadoVehiculo.idLavadoVehiculo,LavadoVehiculo.precio,lavado.placa,lavado.total
select sum(total) as suma from lavado where lavado.fecha = '13/04/2018'



GO
/****** Object:  StoredProcedure [dbo].[sp_ReporteLavadoNombre]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ReporteLavadoNombre] (
--@fecha date='',
@nombre nvarchar(200)=''
--@vehiculo nvarchar(50)='',
--@servicio nvarchar(100)=''
)
as
begin
select lavado.idLavado,lavado.fecha,Usuarios.Usuario,empleado.nombres + ' ' + empleado.apellidos,
grupoTrabajadores.idgrupo,grupoTrabajadores.grupoTrabajadores as Area,
VehiculoLavado.idVehiculoLavado,VehiculoLavado.vehiculoLavado,
servicioLavado.idServicioLavado,servicioLavado.servicioLavado,lavado.idgrupo as Grupo_asignado,
LavadoVehiculo.idLavadoVehiculo,LavadoVehiculo.precio,lavado.placa,lavado.total
from Usuarios inner join empleado on Usuarios.idEmpleado = empleado.idEmpleado 
inner join lavado on Usuarios.Usuario = lavado.usuario
inner join grupoTrabajadores on lavado.idgrupo = grupoTrabajadores.idgrupo 
inner join LavadoVehiculo on lavado.idLavadoVehiculo = LavadoVehiculo.idLavadoVehiculo
inner join VehiculoLavado on LavadoVehiculo.idVehiculoLavado = vehiculoLavado.idVehiculoLavado
inner join servicioLavado on LavadoVehiculo.idServicioLavado = servicioLavado.idServicioLavado 
where empleado.nombres = @nombre
end

--exec sp_ReporteLavado
--@nombre = 'jocsel',
--@fecha = '13/04/2018'

--select @suma = sum(lavado.total) from lavado
--select @msj = CONVERT(nvarchar(10),@suma)
--select @suma = @msj 
--select @msj






GO
/****** Object:  StoredProcedure [dbo].[sp_ReporteLavadoServicio]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ReporteLavadoServicio] (
--@fecha date='',
--@nombre nvarchar(200)=''
--@vehiculo nvarchar(50)=''
@servicio nvarchar(100)=''
)
as
begin
select lavado.idLavado,lavado.fecha,Usuarios.Usuario,empleado.nombres + ' ' + empleado.apellidos,
grupoTrabajadores.idgrupo,grupoTrabajadores.grupoTrabajadores as Area,
VehiculoLavado.idVehiculoLavado,VehiculoLavado.vehiculoLavado,
servicioLavado.idServicioLavado,servicioLavado.servicioLavado,lavado.idgrupo as Grupo_asignado,
LavadoVehiculo.idLavadoVehiculo,LavadoVehiculo.precio,lavado.placa,lavado.total
from Usuarios inner join empleado on Usuarios.idEmpleado = empleado.idEmpleado 
inner join lavado on Usuarios.Usuario = lavado.usuario
inner join grupoTrabajadores on lavado.idgrupo = grupoTrabajadores.idgrupo 
inner join LavadoVehiculo on lavado.idLavadoVehiculo = LavadoVehiculo.idLavadoVehiculo
inner join VehiculoLavado on LavadoVehiculo.idVehiculoLavado = vehiculoLavado.idVehiculoLavado
inner join servicioLavado on LavadoVehiculo.idServicioLavado = servicioLavado.idServicioLavado 
where servicioLavado.servicioLavado = @servicio
end

--exec [sp_ReporteLavadoServicio]
--@servicio = 'lavado'


--select @suma = sum(lavado.total) from lavado
--select @msj = CONVERT(nvarchar(10),@suma)
--select @suma = @msj 
--select @msj






GO
/****** Object:  StoredProcedure [dbo].[sp_ReporteLavadoVehiculo]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ReporteLavadoVehiculo] (
--@fecha date='',
--@nombre nvarchar(200)=''
@vehiculo nvarchar(50)=''
--@servicio nvarchar(100)=''
)
as
begin
select lavado.idLavado,lavado.fecha,Usuarios.Usuario,empleado.nombres + ' ' + empleado.apellidos,
grupoTrabajadores.idgrupo,grupoTrabajadores.grupoTrabajadores as Area,
VehiculoLavado.idVehiculoLavado,VehiculoLavado.vehiculoLavado,
servicioLavado.idServicioLavado,servicioLavado.servicioLavado,lavado.idgrupo as Grupo_asignado,
LavadoVehiculo.idLavadoVehiculo,LavadoVehiculo.precio,lavado.placa,lavado.total
from Usuarios inner join empleado on Usuarios.idEmpleado = empleado.idEmpleado 
inner join lavado on Usuarios.Usuario = lavado.usuario
inner join grupoTrabajadores on lavado.idgrupo = grupoTrabajadores.idgrupo 
inner join LavadoVehiculo on lavado.idLavadoVehiculo = LavadoVehiculo.idLavadoVehiculo
inner join VehiculoLavado on LavadoVehiculo.idVehiculoLavado = vehiculoLavado.idVehiculoLavado
inner join servicioLavado on LavadoVehiculo.idServicioLavado = servicioLavado.idServicioLavado 
where vehiculoLavado.vehiculoLavado = @vehiculo
end

--exec [sp_ReporteLavadoNombre]
--@vehiculo = 'jocsel'
--@fecha = '13/04/2018'

--select @suma = sum(lavado.total) from lavado
--select @msj = CONVERT(nvarchar(10),@suma)
--select @suma = @msj 
--select @msj






GO
/****** Object:  StoredProcedure [dbo].[sp_servicioLavado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_servicioLavado](
	@idServicioLavado int ='',
	@i_servicioLavado nvarchar(50) = '',
	@i_estado bit = '',
	@i_operacion char(1)
)
as
if @i_operacion = 'I'
begin
insert into Ingenieria..servicioLavado([servicioLavado],[estado])
values (@i_servicioLavado, @i_estado)
end

if @i_operacion = 'U'
begin
update servicioLavado set servicioLavado = @i_servicioLavado, estado = @i_estado
where idServicioLavado = @idServicioLavado
end

if @i_operacion = 'S'
begin
select idServicioLavado,servicioLavado, estado from servicioLavado where estado = 1
end


GO
/****** Object:  StoredProcedure [dbo].[sp_serviciomantenimiento]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_serviciomantenimiento]
(
@idServicioMantenimiento int=0,
@servicioMantenimiento nvarchar(50)='',
@estado bit=0,
@i_operacion varchar(1)
)as

if @i_operacion='I'
begin

insert into Ingenieria..servicioMantenimiento(servicioMantenimiento,estado)
values(@servicioMantenimiento,@estado)
 end

 if @i_operacion = 'U'
 begin

 update Ingenieria..servicioMantenimiento set servicioMantenimiento=@servicioMantenimiento,estado=@estado where idServicioMantenimiento=@idServicioMantenimiento

 end

 if @i_operacion = 'S'
 begin
 select idServicioMantenimiento,servicioMantenimiento,estado from Ingenieria..servicioMantenimiento where estado='True'
 end


GO
/****** Object:  StoredProcedure [dbo].[sp_ServicioVehiculo]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sp_ServicioVehiculo]
(
@idServicioVehiculo int = 0,
@idServicioMantenimiento int=0,
@idVehiculoMantenimiento int = 0,
@precio money = 0,
@estado bit=0,
@i_operacion varchar(1)=''
)
as

if @i_operacion='I'
begin
insert into Ingenieria..ServicioVehiculo(idServicioMantenimiento,idVehiculoMantenimiento,precio,estado)
values(@idServicioMantenimiento,@idVehiculoMantenimiento,@precio,@estado)
end

if @i_operacion='U'
begin
update Ingenieria..ServicioVehiculo set idServicioMantenimiento=@idServicioMantenimiento,idVehiculoMantenimiento=@idVehiculoMantenimiento,precio=@precio,estado=@estado where idServicioVehiculo=@idServicioVehiculo
end

if @i_operacion='S'
begin
select sv.idServicioVehiculo,sm.servicioMantenimiento,vm.vehiculoMantenimiento,sv.precio,sv.estado,sv.idServicioMantenimiento,sv.idVehiculoMantenimiento from ServicioVehiculo sv 
inner join servicioMantenimiento sm on sm.idServicioMantenimiento=sv.idServicioMantenimiento
inner join VehiculoMantenimiento vm on vm.idVehiculoMantenimiento=sv.idVehiculoMantenimiento
where sv.estado=1
end


GO
/****** Object:  StoredProcedure [dbo].[sp_Usuarios]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Usuarios](
	@idUsuario int = '',
	@i_usuario varchar(50)='',
	@i_password nvarchar(max)='',
	@i_idEmpleado int='',
	@i_estado nvarchar(10)='', --TABLA PERMISO
	@i_PidUsuario int='',
	@i_Pusuario varchar(50)= '',
	@i_facturar bit = '',
	@i_personas bit = '',
	@i_producto bit = '',
	@i_reporte bit = '',
	@i_mantenimiento bit = '',
	@i_lavado bit = '',
	@i_btnFacturar bit = '',
	@i_btnUsuario bit = '',
	@i_btnProducto bit = '',
	@i_btnMantenimiento bit = '',
	@i_btnLavado bit = '',
	@i_btnPersonas bit = '',
	@i_btnFacturarCompra bit = '',
	@i_logs bit = '',
	@V_usuario nvarchar(max)='',
	@V_password nvarchar(max)='',
	@i_operacion char(1)
)
as
if @i_operacion = 'I'
begin
insert into Ingenieria..Usuarios([Usuario],[Password],[idEmpleado],[estado])
values (@i_usuario,@i_password,@i_idEmpleado,@i_estado)
select @i_PidUsuario = max(idusuario) from Usuarios
--select @i_PidUsuario = ISNULL()
insert into Ingenieria..permiso([idUsuario],[facturar],[personas],[producto],[reporte],
[mantenimiento],[lavado],[btnFacturar],[btnUsuarios],[usuario],[btnProducto],[btnmantenimiento],
[btnLavado],[btnPersona],[btnFacturarCompra],[Logs]) values
(@i_PidUsuario,@i_facturar,@i_personas,@i_producto,@i_reporte,@i_mantenimiento,
@i_lavado,@i_btnFacturar,@i_btnUsuario,@i_Pusuario,@i_btnProducto,@i_btnMantenimiento,
@i_btnLavado,@i_btnPersonas,@i_btnFacturarCompra,@i_logs)
end

if @i_operacion = 'U'
begin
update Ingenieria..Usuarios 
set Usuario = @i_usuario,
Password = @i_password, 
idEmpleado = @i_idEmpleado,estado = @i_estado
where Usuarios.idUsuario = @idUsuario
--PERMISO
update Ingenieria..permiso set facturar = @i_facturar, personas = @i_personas,
producto = @i_producto, reporte  = @i_reporte, mantenimiento = @i_mantenimiento,
lavado = @i_lavado, btnFacturar = @i_btnFacturar, btnUsuarios = @i_btnUsuario,
usuario = @i_Pusuario, btnProducto = @i_btnProducto, btnmantenimiento = @i_btnMantenimiento,
btnLavado = @i_btnLavado, btnPersona = @i_btnPersonas, btnFacturarCompra = @i_btnFacturarCompra, Logs = @i_logs
 where permiso.idUsuario = @i_PidUsuario
end

if @i_operacion = 'S'
begin
select empleado.nombres + ' ' + empleado.apellidos,
empleado.cargo,Usuarios.Usuario,
Usuarios.Password,Usuarios.estado,permiso.facturar,
permiso.personas,permiso.producto,permiso.reporte,
permiso.mantenimiento,permiso.lavado,permiso.btnFacturar,
permiso.btnUsuarios,permiso.btnProducto,permiso.btnmantenimiento,
permiso.btnLavado,permiso.btnPersona,permiso.btnFacturarCompra, permiso.Logs
,Usuarios.idUsuario,permiso.idUsuario,empleado.idEmpleado from
empleado inner join Usuarios on empleado.idEmpleado = Usuarios.idEmpleado inner join
permiso on Usuarios.idUsuario = permiso.idUsuario where Usuarios.estado = 'Activo'
end

if @i_operacion = 'V'
begin
select empleado.nombres + ' ' + empleado.apellidos,empleado.cargo,
Usuarios.Usuario,
Usuarios.Password,Usuarios.estado,permiso.facturar,
permiso.personas,permiso.producto,permiso.reporte,
permiso.mantenimiento,permiso.lavado,permiso.btnFacturar,
permiso.btnUsuarios,permiso.btnProducto,permiso.btnmantenimiento,
permiso.btnLavado,permiso.btnPersona, permiso.idUsuario,permiso.btnFacturarCompra, permiso.Logs from
empleado inner join Usuarios on empleado.idEmpleado = Usuarios.idEmpleado inner join
permiso on Usuarios.idUsuario = permiso.idUsuario where permiso.usuario = @V_usuario and
Usuarios.Password = @V_password and Usuarios.estado = 'activo'

declare @fecha datetime
declare @maq nvarchar(50)
select @maq = SYSTEM_USER
select @fecha = SYSDATETIME()
insert into Control_Entrada(usuarioo,loginn,logout,maquina)
values (@V_usuario,@fecha,@fecha,@maq)
end

--exec sp_Usuarios
--	@idUsuario = 6,
--	@i_usuario ='nueeeeevo',
--	@i_password ='nuevo',
--	@i_idEmpleado = 2,
--	@i_estado ='activo', --TABLA PERMISO
--	@i_PidUsuario = 6,
--	@i_Pusuario = 'nuevo',
--	@i_facturar = 0,
--	@i_personas = 'true',
--	@i_producto = 'true',
--	@i_reporte = 'true',
--	@i_mantenimiento = 'true',
--	@i_lavado = 'true',
--	@i_btnFacturar = 'true',
--	@i_btnUsuario = 'true',
--	@i_btnProducto = 'true',
--	@i_btnMantenimiento = 'true',
--	@i_btnLavado  = 'true',
--	@i_btnPersonas = 'true',
--	--@V_usuario ='nuevo',
--	--@V_password ='nuevo',
--	@i_operacion = 'U'

--select * from Usuarios
--select * from permiso
--select * from empleado
--truncate table Usuarios




GO
/****** Object:  StoredProcedure [dbo].[sp_vehiculoLavado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_vehiculoLavado](
	@idVehiculoLavado int = '',
	@i_vehiculoLavado nvarchar(50) = '',
	@i_estado bit = '',
	@i_operacion char(1)
)
as 
if @i_operacion = 'I'
begin
insert into Ingenieria..VehiculoLavado ([vehiculoLavado],[estado])
values (@i_vehiculoLavado, @i_estado)
end
if @i_operacion = 'S'
begin
select [idVehiculoLavado],[vehiculoLavado],[estado] from VehiculoLavado where estado = 1
end
if @i_operacion = 'U'
begin
update Ingenieria..VehiculoLavado set vehiculoLavado = @i_vehiculoLavado, estado = @i_estado
where idVehiculoLavado = @idVehiculoLavado
end

--exec sp_vehiculoLavado
--	@idVehiculoLavado  = 7,
--	@i_vehiculoLavado = 'Moto',
--	@i_operacion = 'u'



GO
/****** Object:  StoredProcedure [dbo].[sp_vehiculoMantenimiento]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_vehiculoMantenimiento]
(
@idVehiculoMantenimiento int = 0,
@vehiculoMantenimiento nvarchar(50)='',
@estado bit='',
@i_operacion varchar(1)=''
)
as

if @i_operacion='S'
begin 
select idVehiculoMantenimiento,vehiculoMantenimiento,estado from VehiculoMantenimiento where estado='True'
end
if @i_operacion='I'
begin
insert into Ingenieria..VehiculoMantenimiento(vehiculoMantenimiento,estado)
values(@vehiculoMantenimiento,@estado)
end
 if @i_operacion='U'
 begin
 update VehiculoMantenimiento set vehiculoMantenimiento=@vehiculoMantenimiento,estado=@estado where idVehiculoMantenimiento=@idVehiculoMantenimiento
 end


GO
/****** Object:  Trigger [dbo].[tnewproducto]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		campbell
-- Create date: 06-11-17
-- Description:	disminuir sxistencia en la tabla
-- =============================================
create TRIGGER [dbo].[tnewproducto]
   ON   [dbo].[detallecompra]
   AFTER  INSERT 
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @cantidad int
	declare @idproducto int

    -- Insert statements for trigger here
	SELECT @cantidad=cantidad,@idproducto=idproducto from inserted
	update productos set existencia=existencia+@cantidad WHERE CodProducto=@idproducto

END

GO
ALTER TABLE [dbo].[detallecompra] ENABLE TRIGGER [tnewproducto]
GO
/****** Object:  Trigger [dbo].[tdev]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		campbell
-- Create date: 06-11-17
-- Description:	disminuir sxistencia en la tabla
-- =============================================
create TRIGGER [dbo].[tdev] 
   ON   [dbo].[Detalledevolucion]
   AFTER  INSERT 
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @cantidad int
	declare @idproducto int

    -- Insert statements for trigger here
	SELECT @cantidad=cantidad,@idproducto=idproducto from inserted
	update productos set existencia=existencia+@cantidad WHERE CodProducto=@idproducto

END


GO
ALTER TABLE [dbo].[Detalledevolucion] ENABLE TRIGGER [tdev]
GO
/****** Object:  Trigger [dbo].[tventa]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		campbell
-- Create date: 06-11-17
-- Description:	disminuir sxistencia en la tabla
-- =============================================
create TRIGGER [dbo].[tventa]
   ON   [dbo].[detalleventa]
   AFTER  INSERT 
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @cantidad int
	declare @idproducto int

    -- Insert statements for trigger here
	SELECT @cantidad=cantidad,@idproducto=idproducto from inserted
	update productos set existencia=existencia-@cantidad WHERE CodProducto=@idproducto

END


GO
ALTER TABLE [dbo].[detalleventa] ENABLE TRIGGER [tventa]
GO
/****** Object:  Trigger [dbo].[trIUservicioLavado]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create TRIGGER [dbo].[trIUservicioLavado] ON [dbo].[servicioLavado] FOR INSERT, UPDATE, DELETE
AS 

DECLARE @bit int ,	
        @field int ,	
        @maxfield int ,	
        @char int ,	
        @fieldname varchar(128) ,	
        @TableName varchar(128) ,	
        @PKCols varchar(1000) ,	
        @sql varchar(2000), 	
        @UpdateDate varchar(21) ,	
        @UserName varchar(128) ,	
        @Type char(1) ,	
        @PKSELECT varchar(1000)
	
SELECT @TableName = 'servicioLavado' --<-- cambiar el nombre de la tabla 

-- Fecha y Usuario
SELECT @UserName = SYSTEM_USER,
       @UpdateDate = convert(varchar(8), getdate(), 112) + 
                     ' ' + 
                     convert(varchar(12), getdate(), 114)

SET NoCount ON 

-- Identificar que evento se está ejecutando (Insert, Update o Delete) 
--en base a cursores especiales (inserted y deleted)
if exists (SELECT * FROM inserted) 
  if exists (SELECT * FROM deleted) --Si es un update
    SELECT @Type = 'U'
  else                              --Si es un insert
    SELECT @Type = 'I'
else                                --si es un delete
    SELECT @Type = 'D'
	
-- Obtenemos la lista de columnas de los cursores
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted
	
-- Obtener las columnas de llave primaria
SELECT @PKCols = coalesce(@PKCols + ' and', ' on') + 
       ' i.' + 
       c.COLUMN_NAME + ' = d.' + 
       c.COLUMN_NAME
 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
  JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
  ON c.TABLE_NAME = pk.TABLE_NAME
  AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
 WHERE pk.TABLE_NAME = @TableName AND 
  pk.CONSTRAINT_TYPE = 'PRIMARY KEY'
	
-- Obtener la llave primaria y columnas para la inserción en la tabla de auditoria
SELECT 
 @PKSELECT = coalesce(@PKSelect+'+','') + 
 '''' + 
 COLUMN_NAME + 
 '=''+convert(varchar(100),coalesce(i.' + 
 COLUMN_NAME +',d.' + 
 COLUMN_NAME + '))+''''' 
 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk  
 JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
  ON c.TABLE_NAME = pk.TABLE_NAME
  AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
 WHERE pk.TABLE_NAME = @TableName
  AND CONSTRAINT_TYPE = 'PRIMARY KEY'
	
if @PKCols is null --<-- Este trigger solo funciona si la tabla tiene llave primaria
 BEGIN
  RAISERROR('no PK on table %s', 16, -1, @TableName)
  RETURN
 END
	
--Loop para armar el query de inserción en la tabla de log. 
--Un registro por cada campo afectado.
SELECT 
 @field = 0, 
 @maxfield = max(ORDINAL_POSITION) 
 FROM INFORMATION_SCHEMA.COLUMNS 
 WHERE TABLE_NAME = @TableName
	
while @field < @maxfield
 BEGIN
  SELECT @field = min(ORDINAL_POSITION) 
   FROM INFORMATION_SCHEMA.COLUMNS 
   WHERE TABLE_NAME = @TableName and ORDINAL_POSITION > @field
  SELECT @bit = (@field - 1 )% 8 + 1
  SELECT @bit = power(2,@bit - 1)
  SELECT @char = ((@field - 1) / 8) + 1
  if substring(COLUMNS_UPDATED(),@char, 1) & @bit > 0 or @Type in ('I','D')
   BEGIN
     SELECT @fieldname = COLUMN_NAME 
      FROM INFORMATION_SCHEMA.COLUMNS 
	  WHERE TABLE_NAME = @TableName and ORDINAL_POSITION = @field
     SELECT @sql = 'insert LogTransacciones (TipoTrn, Tabla, PK, Campo, ValorOriginal, ValorNuevo, FechaTrn, Usuario)'
     SELECT @sql = @sql + 	' SELECT ''' + @Type + ''''
     SELECT @sql = @sql + 	',''' + @TableName + ''''
     SELECT @sql = @sql + 	',' + @PKSelect
     SELECT @sql = @sql + 	',''' + @fieldname + ''''
     SELECT @sql = @sql + 	',convert(varchar(1000),d.' + @fieldname + ')'
     SELECT @sql = @sql + 	',convert(varchar(1000),i.' + @fieldname + ')'
     SELECT @sql = @sql + 	',''' + @UpdateDate + ''''
     SELECT @sql = @sql + 	',''' + @UserName + ''''
     SELECT @sql = @sql + 	' from #ins i full outer join #del d'
     SELECT @sql = @sql + 	@PKCols
     SELECT @sql = @sql + 	' where i.' + @fieldname + ' <> d.' + @fieldname 
     SELECT @sql = @sql + 	' or (i.' + @fieldname + ' is null and  d.' + @fieldname + ' is not null)' 
     SELECT @sql = @sql + 	' or (i.' + @fieldname + ' is not null and  d.' + @fieldname + ' is null)' 
     exec (@sql)
   END
 END
	 
SET NoCount OFF 



GO
ALTER TABLE [dbo].[servicioLavado] ENABLE TRIGGER [trIUservicioLavado]
GO
/****** Object:  Trigger [dbo].[trIUServicioVehiculo]    Script Date: 25/04/2018 9:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create TRIGGER [dbo].[trIUServicioVehiculo] ON [dbo].[ServicioVehiculo] FOR INSERT, UPDATE, DELETE
AS 

DECLARE @bit int ,	
        @field int ,	
        @maxfield int ,	
        @char int ,	
        @fieldname varchar(128) ,	
        @TableName varchar(128) ,	
        @PKCols varchar(1000) ,	
        @sql varchar(2000), 	
        @UpdateDate varchar(21) ,	
        @UserName varchar(128) ,	
        @Type char(1) ,	
        @PKSELECT varchar(1000)
	
SELECT @TableName = 'ServicioVehiculo' --<-- cambiar el nombre de la tabla 

-- Fecha y Usuario
SELECT @UserName = SYSTEM_USER,
       @UpdateDate = convert(varchar(8), getdate(), 112) + 
                     ' ' + 
                     convert(varchar(12), getdate(), 114)

SET NoCount ON 

-- Identificar que evento se está ejecutando (Insert, Update o Delete) 
--en base a cursores especiales (inserted y deleted)
if exists (SELECT * FROM inserted) 
  if exists (SELECT * FROM deleted) --Si es un update
    SELECT @Type = 'U'
  else                              --Si es un insert
    SELECT @Type = 'I'
else                                --si es un delete
    SELECT @Type = 'D'
	
-- Obtenemos la lista de columnas de los cursores
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted
	
-- Obtener las columnas de llave primaria
SELECT @PKCols = coalesce(@PKCols + ' and', ' on') + 
       ' i.' + 
       c.COLUMN_NAME + ' = d.' + 
       c.COLUMN_NAME
 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
  JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
  ON c.TABLE_NAME = pk.TABLE_NAME
  AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
 WHERE pk.TABLE_NAME = @TableName AND 
  pk.CONSTRAINT_TYPE = 'PRIMARY KEY'
	
-- Obtener la llave primaria y columnas para la inserción en la tabla de auditoria
SELECT 
 @PKSELECT = coalesce(@PKSelect+'+','') + 
 '''' + 
 COLUMN_NAME + 
 '=''+convert(varchar(100),coalesce(i.' + 
 COLUMN_NAME +',d.' + 
 COLUMN_NAME + '))+''''' 
 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk  
 JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
  ON c.TABLE_NAME = pk.TABLE_NAME
  AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
 WHERE pk.TABLE_NAME = @TableName
  AND CONSTRAINT_TYPE = 'PRIMARY KEY'
	
if @PKCols is null --<-- Este trigger solo funciona si la tabla tiene llave primaria
 BEGIN
  RAISERROR('no PK on table %s', 16, -1, @TableName)
  RETURN
 END
	
--Loop para armar el query de inserción en la tabla de log. 
--Un registro por cada campo afectado.
SELECT 
 @field = 0, 
 @maxfield = max(ORDINAL_POSITION) 
 FROM INFORMATION_SCHEMA.COLUMNS 
 WHERE TABLE_NAME = @TableName
	
while @field < @maxfield
 BEGIN
  SELECT @field = min(ORDINAL_POSITION) 
   FROM INFORMATION_SCHEMA.COLUMNS 
   WHERE TABLE_NAME = @TableName and ORDINAL_POSITION > @field
  SELECT @bit = (@field - 1 )% 8 + 1
  SELECT @bit = power(2,@bit - 1)
  SELECT @char = ((@field - 1) / 8) + 1
  if substring(COLUMNS_UPDATED(),@char, 1) & @bit > 0 or @Type in ('I','D')
   BEGIN
     SELECT @fieldname = COLUMN_NAME 
      FROM INFORMATION_SCHEMA.COLUMNS 
	  WHERE TABLE_NAME = @TableName and ORDINAL_POSITION = @field
     SELECT @sql = 'insert LogTransacciones (TipoTrn, Tabla, PK, Campo, ValorOriginal, ValorNuevo, FechaTrn, Usuario)'
     SELECT @sql = @sql + 	' SELECT ''' + @Type + ''''
     SELECT @sql = @sql + 	',''' + @TableName + ''''
     SELECT @sql = @sql + 	',' + @PKSelect
     SELECT @sql = @sql + 	',''' + @fieldname + ''''
     SELECT @sql = @sql + 	',convert(varchar(1000),d.' + @fieldname + ')'
     SELECT @sql = @sql + 	',convert(varchar(1000),i.' + @fieldname + ')'
     SELECT @sql = @sql + 	',''' + @UpdateDate + ''''
     SELECT @sql = @sql + 	',''' + @UserName + ''''
     SELECT @sql = @sql + 	' from #ins i full outer join #del d'
     SELECT @sql = @sql + 	@PKCols
     SELECT @sql = @sql + 	' where i.' + @fieldname + ' <> d.' + @fieldname 
     SELECT @sql = @sql + 	' or (i.' + @fieldname + ' is null and  d.' + @fieldname + ' is not null)' 
     SELECT @sql = @sql + 	' or (i.' + @fieldname + ' is not null and  d.' + @fieldname + ' is null)' 
     exec (@sql)
   END
 END
	 
SET NoCount OFF 



GO
ALTER TABLE [dbo].[ServicioVehiculo] ENABLE TRIGGER [trIUServicioVehiculo]
GO
USE [master]
GO
ALTER DATABASE [Ingenieria] SET  READ_WRITE 
GO
