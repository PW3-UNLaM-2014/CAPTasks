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
 IF EXISTS(SELECT 1 FROM [dbo].[Usuarios] WHERE [Email] = @EMAIL AND [Estado] = 0)
  UPDATE [dbo].[Usuarios]
  SET [Nombre]=@NOMBRE, [Apellido]=@APELLIDO, [Contrasenia]=@CONTRASENIA,[FechaCreacion]=GETDATE(),Estado = 0
  WHERE [Email]=@EMAIL
 ELSE
   BEGIN
INSERT INTO [dbo].[Usuarios]
--IdUsuario es identity
([Nombre],[Apellido],[Email],[Contrasenia],[Estado],[FechaCreacion],[FechaActivacion],[CodigoActivacion])
VALUES
(@NOMBRE,@APELLIDO,@EMAIL,@CONTRASENIA,0,GETDATE(),GETDATE(),@CODIGOACTIVACION)
END
END
GO
------------------------------------------------------------------------------------------
--CREATE PROCEDURE [dbo].[p_Login]
--@EMAIL nvarchar (20),
--@CONTRASENIA nvarchar(50)
--AS
--BEGIN
-- SELECT * FROM [dbo].[Usuarios] WHERE Email=@EMAIL AND Contrasenia=@CONTRASENIA AND Estado = 1
-- END
--GO
------------------------------------------------------------------------------------------
--CREATE PROCEDURE [dbo].[p_ConfirmarRegistro]
--@EMAIL nvarchar(20),
--@CODIGOACTIVACION nvarchar(30)
--AS
--BEGIN 
--IF EXISTS(SELECT 1 FROM [dbo].[Usuarios] WHERE [Email]=@EMAIL AND [CodigoActivacion]=@CODIGOACTIVACION)
--BEGIN
--UPDATE [dbo].[Usuarios]
--SET [Estado]=1, [FechaActivacion]=GETDATE(),[CodigoActivacion]=NULL
--WHERE [Email]=@EMAIL AND [CodigoActivacion]=@CODIGOACTIVACION 
--AND DATEDIFF(MINUTE,[FechaCreacion],GETDATE())<15  ----EL LINK DE ACTIVACION ES VALIDO POR 15" 
--END
--END
--GO

