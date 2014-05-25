USE [CAPTasks]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='p_ListarTareas')
BEGIN
DROP PROCEDURE [dbo].[p_ListarTareas]
END
GO

CREATE PROCEDURE [dbo].[p_ListarTareas] 
	@USUARIOID int
AS
BEGIN
	
	SELECT * FROM [dbo].[Tareas]
	WHERE [IdUsuario] = @USUARIOID
	AND [Estado] = 1
	ORDER BY [FechaFin] DESC
END
GO
