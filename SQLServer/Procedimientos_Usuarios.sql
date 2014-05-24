USE [CAPTasks]
GO
-----------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[p_CrearUsuario]
@NOMBRE nvarchar(20),
@APELLIDO nvarchar(20),
@EMAIL nvarchar(20),
@CONTRASENIA nvarchar(50),
@CODIGOACTIVACION nvarchar(30)
--@ESTADO smallint : Se inserta por defecto en 0=Inactivo y luego pasa a 1=Activo
AS
BEGIN
 IF EXISTS(SELECT 1 FROM [dbo].[Usuarios] WHERE [Email] = @EMAIL AND [Estado] <> 1)
  UPDATE [dbo].[Usuarios]
  SET [Nombre]=@NOMBRE, [Apellido]=@APELLIDO, [Contrasenia]=@CONTRASENIA,[FechaCreacion]=GETDATE(),Estado = 0
  WHERE [Email]=@EMAIL
 ELSE
   BEGIN
INSERT INTO [dbo].[Usuarios]
--IdUsuario es identity
([Nombre],[Apellido],[Email],[Contrasenia],[Estado],[FechaCreacion],[FechaActivacion],[CodigoActivacion])
VALUES
(@NOMBRE,@APELLIDO,@EMAIL,@CONTRASENIA,0,GETDATE(),'00:00:00',@CODIGOACTIVACION)
END
END
GO
------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[p_Login]
@EMAIL nvarchar (20)
AS
BEGIN
 SELECT * FROM [dbo].[Usuarios] WHERE Email=@EMAIL 
 END
GO
------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[p_ConfirmaRegistro]
@CODIGOACTIVACION nvarchar(30)
AS
BEGIN 
IF EXISTS(SELECT 1 FROM [dbo].[Usuarios] WHERE [CodigoActivacion]=@CODIGOACTIVACION)
BEGIN
UPDATE [dbo].[Usuarios]
SET [Estado]=1, [FechaActivacion]=GETDATE()
WHERE  [CodigoActivacion]=@CODIGOACTIVACION 
AND DATEDIFF(MINUTE,[FechaCreacion],GETDATE())<15  ----EL LINK DE ACTIVACION ES VALIDO POR 15" 
IF(@@ROWCOUNT = 0)
BEGIN
 RAISERROR('Vencio el plazo de validez del enlace',16,1)
END
END
END
GO
--------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[p_VerificarEmail]
@EMAIL nvarchar(20)
AS
BEGIN 
SELECT * FROM [dbo].[Usuarios] WHERE [Email]=@EMAIL AND [Estado]<>0
END
GO
--------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[p_CrearCarpetaGeneral]
@ID int,
@NOMBRE nvarchar(20),
@DESCRIPCION nvarchar(200)
AS
BEGIN 
IF NOT EXISTS(SELECT 1 FROM [dbo].[Carpetas] WHERE [Nombre]=@NOMBRE AND [IdUsuario]=@ID)
BEGIN
INSERT INTO [dbo].[Carpetas]
(IdUsuario,Nombre,Descripcion)
VALUES(@ID,@NOMBRE,@DESCRIPCION)
END
END
GO

