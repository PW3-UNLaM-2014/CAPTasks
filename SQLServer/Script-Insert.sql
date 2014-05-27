--USUARIO REGISTRADO:
--Email: cegisele@hotmail.com
--Contrasenia: abQW12

--CUENTA DE GMAIL GRUPAL:
--unlampw3@gmail.com
--unlam-2014

USE [CAPTasks]
GO

/***INSERT PARA TABLA USUARIOS ***/
INSERT INTO [dbo].[Usuarios]
([Nombre],[Apellido],[Email],[Contrasenia],[Estado],[FechaCreacion],[FechaActivacion],[CodigoActivacion])
VALUES
('cecilia','Vaccaro','cegisele@hotmail.com','62a5fa304f1e6fd9cd9ddede8f893a31',1,GETDATE(),GETDATE(),'c154eeb0d8a0b629fad301931eb699')


/***INSERT PARA TABLA CARPETAS ***/

--INSERT INTO [dbo].[Carpetas]
--([IdUsuario],[Nombre],[Descripcion])
--VALUES
--((SELECT IdUsuario FROM dbo.Usuarios),'Ejercicios Varios','Ejercicios de la catedra')

/***INSERT PARA TABLA TAREAS ***/

--INSERT INTO [dbo].[Tareas]
--([IdCarpeta],[IdUsuario],[Nombre],[Descripcion],[FechaFin],[Prioridad],[Estado])
--VALUES
--((SELECT IdCarpeta FROM dbo.Carpetas WHERE Nombre='Ejercicios Varios'),(SELECT IdUsuario FROM dbo.Usuarios),'Entrega TP','Fecha limite para la entrega','2014-09-11',1,2)

--INSERT INTO [dbo].[Tareas]
--([IdCarpeta],[IdUsuario],[Nombre],[Descripcion],[FechaFin],[Prioridad],[Estado])
--VALUES
--((SELECT IdCarpeta FROM dbo.Carpetas WHERE Nombre='Ejercicios Varios'),(SELECT IdUsuario FROM dbo.Usuarios),'Segundo Parcial','Solo practica','2014-07-01',2,1)
