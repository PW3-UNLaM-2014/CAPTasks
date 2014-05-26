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
	
	SELECT t.IdTarea, t.IdUsuario, c.Nombre AS NombreCarpeta, t.Nombre AS NombreTarea, t.Descripcion, t.FechaFin, 
	CASE t.Prioridad
	WHEN 0 THEN 'Baja'
	WHEN 1 THEN 'Media'
	WHEN 2 THEN 'Alta'
	WHEN 3 THEN 'Urgente'
	END AS Prioridad,
	CASE t.Estado
	WHEN 0 THEN 'Completada'
	WHEN 1 THEN 'En curso'
	END AS Estado
	FROM Tareas t, Carpetas c
	WHERE t.IdCarpeta = c.IdCarpeta
	AND t.IdUsuario = @USUARIOID
	AND Estado = 1
	ORDER BY t.FechaFin DESC
END
GO

-------------------------------------------------------------------
USE [CAPTasks]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='p_ListarTodasLasTareas')
BEGIN
DROP PROCEDURE [dbo].[p_ListarTodasLasTareas]
END
GO

CREATE PROCEDURE [dbo].[p_ListarTodasLasTareas] 
	@USUARIOID int
AS
BEGIN
	
	SELECT t.IdTarea, t.IdUsuario, c.Nombre AS NombreCarpeta, t.Nombre AS NombreTarea, t.Descripcion, t.FechaFin, 
	CASE t.Prioridad
	WHEN 0 THEN 'Baja'
	WHEN 1 THEN 'Media'
	WHEN 2 THEN 'Alta'
	WHEN 3 THEN 'Urgente'
	END AS Prioridad,
	CASE t.Estado
	WHEN 0 THEN 'Completada'
	WHEN 1 THEN 'En curso'
	END AS Estado
	FROM Tareas t, Carpetas c
	WHERE t.IdCarpeta = c.IdCarpeta
	AND t.IdUsuario = @USUARIOID
	ORDER BY t.FechaFin DESC
END
GO

-------------------------------------------------------------------
USE [CAPTasks]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='p_CompletaLaTarea')
BEGIN
DROP PROCEDURE [dbo].[p_CompletaLaTarea]
END
GO

CREATE PROCEDURE [dbo].[p_CompletaLaTarea] 
	@TAREAID int
AS
BEGIN
	UPDATE [dbo].[Tareas]
	SET [Estado] = 0
	WHERE [IdTarea] = @TAREAID
END
GO