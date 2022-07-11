USE [FormatosTESE];
GO
/* ***** Catalogos ***** */
-- Division Academica
INSERT INTO [FormatosTESE].[dbo].[DivisionAcademica] (Descripcion) VALUES ('División de Ingeniería en Sistemas Computacionales');
INSERT INTO [FormatosTESE].[dbo].[DivisionAcademica] (Descripcion) VALUES ('División de Ingeniería Industrial');
INSERT INTO [FormatosTESE].[dbo].[DivisionAcademica] (Descripcion) VALUES ('División de Ingeniería Química');
INSERT INTO [FormatosTESE].[dbo].[DivisionAcademica] (Descripcion) VALUES ('División de Ingeniería Electrónica');
INSERT INTO [FormatosTESE].[dbo].[DivisionAcademica] (Descripcion) VALUES ('División de Ingeniería Bioquímica');
INSERT INTO [FormatosTESE].[dbo].[DivisionAcademica] (Descripcion) VALUES ('División de Ingeniería Mecatrónica');
INSERT INTO [FormatosTESE].[dbo].[DivisionAcademica] (Descripcion) VALUES ('División de Contaduría Pública');
INSERT INTO [FormatosTESE].[dbo].[DivisionAcademica] (Descripcion) VALUES ('División de Ingeniería Mecánica');
INSERT INTO [FormatosTESE].[dbo].[DivisionAcademica] (Descripcion) VALUES ('División de Ingeniería Gestión Empresarial');
INSERT INTO [FormatosTESE].[dbo].[DivisionAcademica] (Descripcion) VALUES ('División de Ingeniería Informática');
INSERT INTO [FormatosTESE].[dbo].[DivisionAcademica] (Descripcion) VALUES ('División de Ingeniería Aeronáutica');
GO
-- Cargo
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Administrador');
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Responsable de la Función de Investigación');
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Jefe de División');
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Director Académico');
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Personal Docente');
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Personal Administrativo');
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Coordinador del Programa');
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Coordinador de Residencias Profesionales');
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Coordinador de Asesorías');
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Coordinador de Titulación');
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Coordinador de Tutorías');
INSERT INTO [FormatosTESE].[dbo].[Cargo] (Descripcion) VALUES ('Coordinador Administrativo');
GO
-- Linea de Investigacion
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Inteligencia Artificial');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Redes, Gestión de Datos y Conectividad');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Sistemas de Información Contable - Fiscal y Auditoría');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Contabilidad Integral para el Sector Empresarial y Gubernamental');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Automatización y Contol');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Análisis, Diseño, Modelado y Simulación de Sistemas');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Gestión e Innovación de Procesos');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Optimización de Productos y Procesos');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Control Digital, Robótica y Automatización');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Desarrollo y Experimentación en Sistemas Mecatrónicos');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Nuevas Tecnologías para el Desarrollo Sustentable');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Energías Convencionales y Eficiencia Energética');
INSERT INTO [FormatosTESE].[dbo].[LineaInvestigacion] (Descripcion) VALUES ('Energías Alternas Renovables');
GO
-- Area de Investigacion
INSERT INTO [FormatosTESE].[dbo].[AreaInvestigacion] (Descripcion) VALUES ('Investigación Básica');
INSERT INTO [FormatosTESE].[dbo].[AreaInvestigacion] (Descripcion) VALUES ('Investigación Aplicada');
INSERT INTO [FormatosTESE].[dbo].[AreaInvestigacion] (Descripcion) VALUES ('Investigación Tecnológica');
INSERT INTO [FormatosTESE].[dbo].[AreaInvestigacion] (Descripcion) VALUES ('Desarrollo Tecnológico');
INSERT INTO [FormatosTESE].[dbo].[AreaInvestigacion] (Descripcion) VALUES ('Desarrollo Experimental');
GO
-- Nivel Academico
INSERT INTO [FormatosTESE].[dbo].[NivelAcademico] (Descripcion) VALUES ('Interinstitucional');
INSERT INTO [FormatosTESE].[dbo].[NivelAcademico] (Descripcion) VALUES ('Institucional');
INSERT INTO [FormatosTESE].[dbo].[NivelAcademico] (Descripcion) VALUES ('Divisional');
GO
-- Prioridad
INSERT INTO [FormatosTESE].[dbo].[Prioridad] (Letra, Descripcion) VALUES ('Prioridad A', 'El proyecto es de carácter relevante, de acuerdo con el impacto de sus resultados en la resolución a corto plazo de una problemática a nivel regional o institucional.');
INSERT INTO [FormatosTESE].[dbo].[Prioridad] (Letra, Descripcion) VALUES ('Prioridad B', 'El proyecto representa una alternativa viable para el mejoramiento de una situación a nivel institucional o regional a mediano plazo.');
INSERT INTO [FormatosTESE].[dbo].[Prioridad] (Letra, Descripcion) VALUES ('Prioridad C', 'El proyecto plantea respuestas a problemas específicos del Departamento en el corto plazo.');
INSERT INTO [FormatosTESE].[dbo].[Prioridad] (Letra, Descripcion) VALUES ('Prioridad D', 'aaaaaaaaaa');
GO
-- Periodo Escolar
INSERT INTO [FormatosTESE].[dbo].[PeriodoEscolar] (Descripcion, FechaInicio, FechaFin) VALUES ('2022-1', '2022-03-07 00:00:00.000', '2022-08-13 00:00:00.000');
INSERT INTO [FormatosTESE].[dbo].[PeriodoEscolar] (Descripcion, FechaInicio, FechaFin) VALUES ('2022-2', '2022-09-01 00:00:00.000', '2022-12-27 00:00:00.000');
GO
-- Estado Proceso
INSERT INTO [FormatosTESE].[dbo].[EstadoProceso] (Descripcion) VALUES ('Iniciado');
INSERT INTO [FormatosTESE].[dbo].[EstadoProceso] (Descripcion) VALUES ('En Proceso');
INSERT INTO [FormatosTESE].[dbo].[EstadoProceso] (Descripcion) VALUES ('Concluido');
GO
/* ***** Datos de Prueba ***** */
-- Usuario
INSERT INTO [FormatosTESE].[dbo].[Usuario] (NombreUsuario, Contrasena) VALUES ('gmartinez', 'gmartinez');
INSERT INTO [FormatosTESE].[dbo].[Usuario] (NombreUsuario, Contrasena) VALUES ('gcortes', 'gcortes');
INSERT INTO [FormatosTESE].[dbo].[Usuario] (NombreUsuario, Contrasena) VALUES ('ecorona', 'ecorona');
INSERT INTO [FormatosTESE].[dbo].[Usuario] (NombreUsuario, Contrasena) VALUES ('jchavez', 'jchavez');
INSERT INTO [FormatosTESE].[dbo].[Usuario] (NombreUsuario, Contrasena) VALUES ('areyes', 'areyes');
GO
-- Persona
INSERT INTO [FormatosTESE].[dbo].[Persona] (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Gabriel', 'Martínez', 'Flores', '5555555555', 'gmartinez@tese.edu.mx', 1);
INSERT INTO [FormatosTESE].[dbo].[Persona] (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Griselda', 'Cortés', 'Barrera', '5555555555', 'gcortes@tese.edu.mx', 2);
INSERT INTO [FormatosTESE].[dbo].[Persona] (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Edgar', 'Corona', 'Organiche', '5555555555', 'ecorona@tese.edu.mx', 3);
INSERT INTO [FormatosTESE].[dbo].[Persona] (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('José Luis', 'Chavez', 'Rojas', '5555555555', 'jchavez@tese.edu.mx', 4);
INSERT INTO [FormatosTESE].[dbo].[Persona] (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Alfonso', 'Martinez', 'Reyes', '5555555555', 'areyes@tese.edu.mx', 5);
GO
-- CargoPersona
INSERT INTO [FormatosTESE].[dbo].[CargoPersona] (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (1, 1, 1, 1, 1);
INSERT INTO [FormatosTESE].[dbo].[CargoPersona] (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (5, 2, 1, 1, 1);
INSERT INTO [FormatosTESE].[dbo].[CargoPersona] (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (2, 3, 1, 1, 1);
INSERT INTO [FormatosTESE].[dbo].[CargoPersona] (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (7, 3, 1, 1, 1);
INSERT INTO [FormatosTESE].[dbo].[CargoPersona] (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (3, 4, 1, 1, 1);
INSERT INTO [FormatosTESE].[dbo].[CargoPersona] (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (4, 5, 1, 1, 1);
GO
-- Programa
INSERT INTO Programa (Clave, Nombre, NumCoordinador, NumAreaInvestigacion, NumLineaInvestigacion, PosibleResultado, Justificacion, Resumen, Objetivos, Metodologia, Metas, CV) 
VALUES ('ISC-01', 'Ingeniería Sistemas Computacionales', 4, 2, 2, 'Descripción de los Resultados del Programa', 'Descripción de la Justificación del Programa', 'Descripción del Resumen del Programa', 'Descripción de los Objetivos del Programa', 'Descripción de la Metodlogía del Programa', 'Descripción de las Metas del Programa', NULL);
INSERT INTO Programa (Clave, Nombre, NumCoordinador, NumAreaInvestigacion, NumLineaInvestigacion, PosibleResultado, Justificacion, Resumen, Objetivos, Metodologia, Metas, CV) 
VALUES ('MISC-02', 'Maestría en Ingeniería en Sistemas Computacionales  ', 4, 3, 1, 'Descripción de los Resultados del Programa', 'Descripción de la Justificación del Programa', 'Descripción del Resumen del Programa', 'Descripción de los Objetivos del Programa', 'Descripción de la Metodlogía del Programa', 'Descripción de las Metas del Programa', NULL);
GO
-- Cronograma del Programa
INSERT INTO CronogramaPrograma (NumPrograma, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses) 
VALUES (1, 1, 'Analisis', 'Dias', 5, '2022-04-01 00:00:00.000', '2022-04-06 00:00:00.000', 1);
INSERT INTO CronogramaPrograma (NumPrograma, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses) 
VALUES (1, 2, 'Construccion', 'Horas', 5, '2022-04-07 00:12:00.000', '2022-04-07 00:17:00.000', 1);
INSERT INTO CronogramaPrograma (NumPrograma, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses) 
VALUES (2, 1, 'Revision', 'Meses', 6, '2022-05-01 00:00:00.000', '2022-10-01 00:00:00.000', 6);
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