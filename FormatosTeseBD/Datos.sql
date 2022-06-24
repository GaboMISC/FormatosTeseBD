USE [FormatosTESE];
GO
/* ***** Catalogos ***** */
-- Division Academica
INSERT INTO DivisionAcademica (Descripcion) VALUES ('Ingeniería en Sistemas Computacionales');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('Ingeniería Industrial');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('Ingeniería Química');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('Ingeniería Electrónica');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('Ingeniería Bioquímica');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('Ingeniería Mecatrónica');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('Contador Público');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('Ingeniería Mecánica');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('Ingeniería Gestión Empresarial');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('Ingeniería Informática');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('Ingeniería Aeronáutica');
GO
-- Estado Proceso
INSERT INTO EstadoProceso (Descripcion) VALUES ('Iniciado');
INSERT INTO EstadoProceso (Descripcion) VALUES ('En Proceso');
INSERT INTO EstadoProceso (Descripcion) VALUES ('Concluido');
GO
-- Area de Investigacion
INSERT INTO AreaInvestigacion (Descripcion) VALUES ('Investigación Básica');
INSERT INTO AreaInvestigacion (Descripcion) VALUES ('Investigación Aplicada');
INSERT INTO AreaInvestigacion (Descripcion) VALUES ('Investigación Tecnológica');
INSERT INTO AreaInvestigacion (Descripcion) VALUES ('Desarrollo Tecnológico');
INSERT INTO AreaInvestigacion (Descripcion) VALUES ('Desarrollo Experimental');
GO
-- Nivel Academico
INSERT INTO NivelAcademico (Descripcion) VALUES ('Interinstitucional');
INSERT INTO NivelAcademico (Descripcion) VALUES ('Institucional');
INSERT INTO NivelAcademico (Descripcion) VALUES ('Divisional');
GO
/* ***** Datos de Prueba ***** */
-- Coordinador
INSERT INTO Coordinador (Nombre, Cargo, Telefono) 
VALUES ('Dra. Griselda Cortes Barrera', 'Coordinador', '5555555555');
GO
-- Proyecto
INSERT INTO Proyecto (Clave, Nombre, NumCoordinador) 
VALUES ('Folio0001', 'Mineria de Datos', 1);
GO
-- Detalle Proyecto
INSERT INTO DetalleProyecto (NumProyecto, NumAreaInvestigacion, LineaInvestigacion, NumNivelAcademico, PosibleResultado, Justificacion, Resumen, InfoTecnica, CV) 
VALUES (1, 4, 'Ciencia de Datos', 2, 'Obtencion de gráficos', 'Justificación', 'Resúmen', 'Información Técnica', 'Curriculum Vitae');
GO
-- Cronograma Proyecto
INSERT INTO CronogramaProyecto (NumProyecto, Numero, Actividad, Unidad, Cantidad, Meses, PorcentajeAvance)
VALUES
	(1, 1, 'Analisis de Requerimientos', 'Requerimientos', 9, 1, NULL),
	(1, 2, 'Desarrollo del Proyecto', 'Lineas de Codigo', 4500, 4, NULL),
	(1, 3, 'Pruebas Unitarias e Integrales', 'Test', 7, 1, NULL);
GO
-- Recusos Materiales
INSERT INTO RecusosMateriales (NumProyecto, Cantidad, Descripcion)
VALUES
	(1, 1, 'Laptop OMEN'),
	(1, 3, 'Marcadores para Pizarron');
GO
-- Servicios
INSERT INTO Servicios (NumProyecto, Cantidad, Descripcion) VALUES (1, 1, 'Conexion a Internet');
GO
-- Bienes Muebles
INSERT INTO BienesMuebles (NumProyecto, Cantidad, Descripcion)
VALUES
	(1, 1, 'Escritorio'),
	(1, 1, 'Silla');
GO
-- Honorarios
INSERT INTO Honorarios (NumProyecto, EspecialidadPersonal, NumPersonalExterno, NumPersonalInterno, Dedicacionhoras)
VALUES (1, 'Informatica', NULL, '202020855', 40);
GO
-- Programa
INSERT INTO Programa (Clave, Nombre, NumCoordinador) 
VALUES ('Clave0001', 'Programa de enseñanza de bases de datos', 1);
GO
-- Detalle Programa
INSERT INTO DetallePrograma (NumPrograma, NumAreaInvestigacion, LineaInvestigacion, PosibleResultado, Justificacion, Resumen, InfoTecnica, CV) 
VALUES (1, 2, 'Bases de Datos', 'Obtencion de un modelo de datos', 'Justificación', 'Resúmen', 'Información Técnica', 'Curriculum Vitae');
GO
-- Cronograma
INSERT INTO CronogramaPrograma (NumPrograma, Numero, Actividad, Unidad, Cantidad, Meses)
VALUES
	(1, 1, 'Analisis', 'Objetivos', 5, 1),
	(1, 2, 'Codificacion', 'KDC', 4500, 4),
	(1, 3, 'Pruebas y mantenimiento', 'Errores', 17, 1);
GO
-- Proyectos Programa
INSERT INTO ProyectosPrograma (NumProyecto, NumPrograma) VALUES (1, 1);
GO

/*
-- aaaaaaaaaaa
INSERT INTO aaaaaaaaaaa (aaaaaaaaaaa) VALUES ('aaaaaaaaaaa');
GO
-- aaaaaaaaaaa
INSERT INTO aaaaaaaaaaa (aaaaaaaaaaa, aaaaaaaaaaa, aaaaaaaaaaa, aaaaaaaaaaa, aaaaaaaaaaa) 
VALUES ('aaaaaaaaaaa', 'aaaaaaaaaaa', 'aaaaaaaaaaa', 'aaaaaaaaaaa', 'aaaaaaaaaaa');
GO
*/