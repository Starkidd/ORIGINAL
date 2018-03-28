USE [master]
GO
/****** Object:  Database [Ingenieria]    Script Date: 27/03/2018 11:19:47 p.m. ******/
CREATE DATABASE [Ingenieria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ingenieria', FILENAME = N'D:\10mo Cuatrimestres\Ingenieria de software\Proyecto final\Ingenieria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ingenieria_log', FILENAME = N'D:\10mo Cuatrimestres\Ingenieria de software\Proyecto final\Ingenieria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[almacen]    Script Date: 27/03/2018 11:19:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[almacen](
	[idalmacen] [int] NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[ubicacion] [nvarchar](100) NULL,
	[descripcion] [nvarchar](100) NULL,
	[idcategoria] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idalmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[area]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
/****** Object:  Table [dbo].[categoria]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[idcategoria] [int] NOT NULL,
	[CodProducto] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[clientes]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
/****** Object:  Table [dbo].[compra]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[idProveedor] [int] NULL,
	[total] [numeric](18, 2) NULL,
	[fechaCompra] [datetime] NULL,
	[Aplicada] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detallecompra]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallecompra](
	[Id] [int] NOT NULL,
	[idCompra] [int] NULL,
	[idProducto] [nvarchar](20) NULL,
	[cantidad] [numeric](18, 2) NOT NULL,
	[total] [numeric](18, 2) NOT NULL,
	[Margen] [numeric](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detallepago]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
/****** Object:  Table [dbo].[detalleventa]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleventa](
	[cantidad] [int] NULL,
	[idVenta] [int] NULL,
	[idProducto] [nvarchar](20) NULL,
	[totaldetalle] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[devolucion]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[devolucion](
	[Iddevolucion] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NULL,
	[NumVenta] [int] NULL,
	[fecha] [date] NULL,
	[observacion] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Iddevolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[empleado]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
/****** Object:  Table [dbo].[grupoTrabajadores]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
/****** Object:  Table [dbo].[lavado]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
/****** Object:  Table [dbo].[LavadoVehiculo]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
/****** Object:  Table [dbo].[mantenimiento]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[idMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[CodMarca] [nvarchar](5) NOT NULL,
	[Marca] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pago]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
/****** Object:  Table [dbo].[permiso]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso](
	[idUsuario] [int] NULL,
	[venta] [bit] NULL,
	[mantenimiento] [bit] NULL,
	[lavado] [bit] NULL,
	[compra] [bit] NULL,
	[empleado] [bit] NULL,
	[Tusuario] [bit] NULL,
	[producto] [bit] NULL,
	[proveedor] [bit] NULL,
	[Password] [bit] NULL,
	[usuario] [varchar](50) NULL,
UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Productos]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[CodProducto] [nvarchar](20) NOT NULL,
	[Producto] [nvarchar](50) NULL,
	[CodMarca] [nvarchar](5) NULL,
	[CodSAC] [nvarchar](20) NULL,
	[Existencia] [numeric](18, 2) NULL,
	[Costo] [numeric](18, 2) NULL,
	[Precio] [numeric](18, 2) NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[idProveedor] [int] NOT NULL,
	[apellidos] [nvarchar](120) NULL,
	[nombres] [nvarchar](80) NOT NULL,
	[nombreempresa] [nvarchar](80) NULL,
	[direccion] [nvarchar](max) NOT NULL,
	[RUC] [nvarchar](50) NULL,
	[telefono] [nvarchar](12) NULL,
	[correo] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicioLavado]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicioLavado](
	[idServicioLavado] [int] IDENTITY(1,1) NOT NULL,
	[servicioLavado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idServicioLavado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicioMantenimiento]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicioMantenimiento](
	[idServicioMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[servicioMantenimiento] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idServicioMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServicioVehiculo]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicioVehiculo](
	[idServicioVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[idServicioMantenimiento] [int] NULL,
	[idVehiculoMantenimiento] [int] NULL,
	[precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[idServicioVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipopago]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipopago](
	[codigotipopago] [nvarchar](50) NOT NULL,
	[Moneda] [nvarchar](15) NULL,
	[tarjeta] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[codigotipopago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VehiculoLavado]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiculoLavado](
	[idVehiculoLavado] [int] IDENTITY(1,1) NOT NULL,
	[vehiculoLavado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idVehiculoLavado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VehiculoMantenimiento]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiculoMantenimiento](
	[idVehiculoMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[vehiculoMantenimiento] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idVehiculoMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[venta]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[NumVenta] [int] NOT NULL,
	[idCliente] [int] NULL,
	[idUsuario] [int] NULL,
	[fechaFac] [datetime] NULL,
	[Subtotal] [numeric](18, 2) NULL,
	[Descuento] [numeric](18, 2) NULL,
	[total] [numeric](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[NumVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[almacen]  WITH CHECK ADD FOREIGN KEY([idcategoria])
REFERENCES [dbo].[categoria] ([idcategoria])
GO
ALTER TABLE [dbo].[categoria]  WITH CHECK ADD FOREIGN KEY([CodProducto])
REFERENCES [dbo].[Productos] ([CodProducto])
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD FOREIGN KEY([idProveedor])
REFERENCES [dbo].[proveedor] ([idProveedor])
GO
ALTER TABLE [dbo].[detallecompra]  WITH CHECK ADD FOREIGN KEY([idCompra])
REFERENCES [dbo].[compra] ([idCompra])
GO
ALTER TABLE [dbo].[detallecompra]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([CodProducto])
GO
ALTER TABLE [dbo].[detallepago]  WITH CHECK ADD FOREIGN KEY([codigotipopago])
REFERENCES [dbo].[tipopago] ([codigotipopago])
GO
ALTER TABLE [dbo].[detalleventa]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([CodProducto])
GO
ALTER TABLE [dbo].[detalleventa]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[venta] ([NumVenta])
GO
ALTER TABLE [dbo].[devolucion]  WITH CHECK ADD FOREIGN KEY([idcliente])
REFERENCES [dbo].[clientes] ([idCliente])
GO
ALTER TABLE [dbo].[devolucion]  WITH CHECK ADD FOREIGN KEY([NumVenta])
REFERENCES [dbo].[venta] ([NumVenta])
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
ALTER TABLE [dbo].[mantenimiento]  WITH CHECK ADD FOREIGN KEY([idgrupo])
REFERENCES [dbo].[grupoTrabajadores] ([idgrupo])
GO
ALTER TABLE [dbo].[mantenimiento]  WITH CHECK ADD FOREIGN KEY([idservicioVehiculo])
REFERENCES [dbo].[ServicioVehiculo] ([idServicioVehiculo])
GO
ALTER TABLE [dbo].[pago]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[permiso]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([CodMarca])
REFERENCES [dbo].[Marcas] ([CodMarca])
GO
ALTER TABLE [dbo].[ServicioVehiculo]  WITH CHECK ADD FOREIGN KEY([idServicioMantenimiento])
REFERENCES [dbo].[servicioMantenimiento] ([idServicioMantenimiento])
GO
ALTER TABLE [dbo].[ServicioVehiculo]  WITH CHECK ADD FOREIGN KEY([idVehiculoMantenimiento])
REFERENCES [dbo].[VehiculoMantenimiento] ([idVehiculoMantenimiento])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[clientes] ([idCliente])
GO
ALTER TABLE [dbo].[venta]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
/****** Object:  StoredProcedure [dbo].[sp_Area]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_empleado]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_grupoTrabajadores]    Script Date: 27/03/2018 11:19:49 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Usuarios]    Script Date: 27/03/2018 11:19:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_Usuarios](
	@idUsuario int = '',
	@i_usuario varchar(50)='',
	@i_password nvarchar(max)='',
	@i_idEmpleado int='',
	@i_estado nvarchar(10)='',
	@i_PidUsuario int='',
	@i_Pusuario nvarchar(100)= '',
	@i_venta bit= '',
	@i_mantenimiento bit= '',
	@i_lavado bit= '',
	@i_compra bit= '',
	@i_empleado bit= '',
	@i_Tusuario bit= '',
	@i_producto bit= '',
	@i_proveedor bit= '',
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
insert into Ingenieria..permiso([idUsuario],[venta],[mantenimiento],
[lavado],[compra],[empleado],
[Tusuario],[producto],[proveedor],[usuario]) values
(@i_PidUsuario,@i_venta,@i_mantenimiento,@i_lavado,@i_compra,
@i_empleado,@i_Tusuario,@i_producto,
@i_proveedor,@i_Pusuario)
end

if @i_operacion = 'U'
begin
update Ingenieria..Usuarios 
set Usuario = @i_usuario,
Password = @i_password, 
idEmpleado = @i_idEmpleado,estado = @i_estado
where Usuarios.idUsuario = @idUsuario
update Ingenieria..permiso set venta = @i_venta,
 mantenimiento = @i_mantenimiento, lavado = @i_lavado,
compra = @i_compra, empleado = @i_empleado, Tusuario = @i_Tusuario, 
producto = @i_producto, 
proveedor = @i_proveedor, usuario = @i_Pusuario
 where permiso.idUsuario = @i_PidUsuario
end

if @i_operacion = 'S'
begin
select empleado.nombres + ' ' + empleado.apellidos,
empleado.cargo,Usuarios.Usuario,
Usuarios.Password,Usuarios.estado,permiso.venta,
permiso.mantenimiento,permiso.lavado,
permiso.compra,permiso.empleado,permiso.Tusuario,
permiso.producto,permiso.proveedor,Usuarios.idUsuario,permiso.idUsuario,empleado.idEmpleado from
empleado inner join Usuarios on empleado.idEmpleado = Usuarios.idEmpleado inner join
permiso on Usuarios.idUsuario = permiso.idUsuario
end

if @i_operacion = 'V'
begin
select empleado.nombres + ' ' + empleado.apellidos,empleado.cargo,
Usuarios.Usuario,
Usuarios.Password,Usuarios.estado,permiso.venta,permiso.mantenimiento,
permiso.lavado,
permiso.compra,permiso.empleado,permiso.Tusuario,permiso.producto,
permiso.proveedor from
empleado inner join Usuarios on empleado.idEmpleado = Usuarios.idEmpleado inner join
permiso on Usuarios.idUsuario = permiso.idUsuario where permiso.usuario = @V_usuario and
Usuarios.Password = @V_password
end

/*exec sp_Usuarios
	@idUsuario  = 1,
	@i_usuario ='jocsel',
	@i_password ='joc',
	@i_idEmpleado = 1,
	@i_estado ='activo',
	@i_PidUsuario ='1',
	@i_Pusuario = 'joc',
	@i_venta = 1,
	@i_mantenimiento = 1,
	@i_lavado = 1,
	@i_compra = 1,
	@i_empleado = 1,
	@i_Tusuario = 1,
	@i_producto = 1,
	@i_proveedor = 1,
	--@V_usuario = 'joc',
	--@V_password = 'joc',
	@i_operacion = 'u'


select * from Usuarios
select * from permiso*/
GO
USE [master]
GO
ALTER DATABASE [Ingenieria] SET  READ_WRITE 
GO
