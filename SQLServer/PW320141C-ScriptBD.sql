USE [CAPTasks]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 05/17/2014 16:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Apellido] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](20) NOT NULL,
	[Contrasenia] [nvarchar](50) NOT NULL,
	[Estado] [smallint] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaActivacion] [datetime] NOT NULL,
	[CodigoActivacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carpetas]    Script Date: 05/17/2014 16:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carpetas](
	[IdCarpeta] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Descripcion] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Carpetas] PRIMARY KEY CLUSTERED 
(
	[IdCarpeta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tareas]    Script Date: 05/17/2014 16:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tareas](
	[IdTarea] [int] IDENTITY(1,1) NOT NULL,
	[IdCarpeta] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Descripcion] [nvarchar](200) NULL,
	[FechaFin] [datetime] NULL,
	[Prioridad] [smallint] NOT NULL,
	[Estado] [smallint] NOT NULL,
 CONSTRAINT [PK_Tareas] PRIMARY KEY CLUSTERED 
(
	[IdTarea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Carpetas_Usuarios]    Script Date: 05/17/2014 16:25:59 ******/
ALTER TABLE [dbo].[Carpetas]  WITH CHECK ADD  CONSTRAINT [FK_Carpetas_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Carpetas] CHECK CONSTRAINT [FK_Carpetas_Usuarios]
GO
/****** Object:  ForeignKey [FK_Tareas_Carpetas]    Script Date: 05/17/2014 16:25:59 ******/
ALTER TABLE [dbo].[Tareas]  WITH CHECK ADD  CONSTRAINT [FK_Tareas_Carpetas] FOREIGN KEY([IdCarpeta])
REFERENCES [dbo].[Carpetas] ([IdCarpeta])
GO
ALTER TABLE [dbo].[Tareas] CHECK CONSTRAINT [FK_Tareas_Carpetas]
GO
/****** Object:  ForeignKey [FK_Tareas_Usuarios]    Script Date: 05/17/2014 16:25:59 ******/
ALTER TABLE [dbo].[Tareas]  WITH CHECK ADD  CONSTRAINT [FK_Tareas_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Tareas] CHECK CONSTRAINT [FK_Tareas_Usuarios]
GO
