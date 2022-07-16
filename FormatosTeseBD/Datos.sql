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
INSERT INTO [FormatosTESE].[dbo].[Usuario] (NombreUsuario, Contrasena) VALUES ('jcuevas', 'jcuevas');
INSERT INTO [FormatosTESE].[dbo].[Usuario] (NombreUsuario, Contrasena) VALUES ('epacheco', 'epacheco');
INSERT INTO [FormatosTESE].[dbo].[Usuario] (NombreUsuario, Contrasena) VALUES ('dperez', 'dperez');
INSERT INTO [FormatosTESE].[dbo].[Usuario] (NombreUsuario, Contrasena) VALUES ('acuevas', 'acuevas');
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
INSERT INTO [FormatosTESE].[dbo].[Persona] (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Jesus', 'Cuevas', 'Perafan', '5555555555', 'jcuevas@tese.edu.mx', 6);
INSERT INTO [FormatosTESE].[dbo].[Persona] (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Edgar', 'Pacheco', 'Antonio', '5555555555', 'epacheco@tese.edu.mx', 7);
INSERT INTO [FormatosTESE].[dbo].[Persona] (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Daniel', 'Perez', 'Cantillo', '5555555555', 'dperez@tese.edu.mx', 8);
INSERT INTO [FormatosTESE].[dbo].[Persona] (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Alejandro', 'Cuevas', 'Perafan', '5555555555', 'acuevas@tese.edu.mx', 9);
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
INSERT INTO [FormatosTESE].[dbo].[CargoPersona] (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (1, 6, 10, 2, 1);
INSERT INTO [FormatosTESE].[dbo].[CargoPersona] (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (1, 7, 4, 2, 1);
INSERT INTO [FormatosTESE].[dbo].[CargoPersona] (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (1, 8, 6, 2, 1);
INSERT INTO [FormatosTESE].[dbo].[CargoPersona] (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (1, 9, 10, 2, 1);
GO
-- Programa
INSERT INTO [FormatosTESE].[dbo].[Programa] (Clave, Nombre, NumCoordinador, NumAreaInvestigacion, NumLineaInvestigacion, PosibleResultado, Justificacion, Resumen, Objetivos, Metodologia, Metas, CV) 
VALUES ('ISC-01', 'Ingeniería Sistemas Computacionales', 4, 2, 2, 'Descripción de los Resultados del Programa', 'Descripción de la Justificación del Programa', 'Descripción del Resumen del Programa', 'Descripción de los Objetivos del Programa', 'Descripción de la Metodlogía del Programa', 'Descripción de las Metas del Programa', NULL);
INSERT INTO [FormatosTESE].[dbo].[Programa] (Clave, Nombre, NumCoordinador, NumAreaInvestigacion, NumLineaInvestigacion, PosibleResultado, Justificacion, Resumen, Objetivos, Metodologia, Metas, CV) 
VALUES ('MISC-02', 'Maestría en Ingeniería en Sistemas Computacionales  ', 4, 3, 1, 'Descripción de los Resultados del Programa', 'Descripción de la Justificación del Programa', 'Descripción del Resumen del Programa', 'Descripción de los Objetivos del Programa', 'Descripción de la Metodlogía del Programa', 'Descripción de las Metas del Programa', NULL);
GO
-- Cronograma del Programa
INSERT INTO [FormatosTESE].[dbo].[CronogramaPrograma] (NumPrograma, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses) 
VALUES (1, 1, 'Analisis', 'Dias', 5, '2022-04-01 00:00:00.000', '2022-04-06 00:00:00.000', 1);
INSERT INTO [FormatosTESE].[dbo].[CronogramaPrograma] (NumPrograma, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses) 
VALUES (1, 2, 'Construccion', 'Horas', 5, '2022-04-07 00:12:00.000', '2022-04-07 00:17:00.000', 1);
INSERT INTO [FormatosTESE].[dbo].[CronogramaPrograma] (NumPrograma, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses) 
VALUES (2, 1, 'Revision', 'Meses', 6, '2022-05-01 00:00:00.000', '2022-10-01 00:00:00.000', 6);
GO
-- Proyecto
INSERT INTO [FormatosTESE].[dbo].[Proyecto] (Clave, Nombre, NumCoordinador, NumAreaInvestigacion, NumLineaInvestigacion, NumNivelAcademico, PosibleResultado, Justificacion, Resumen, Objetivos, Metodologia, Metas, CV) 
VALUES ('Proy-01', 'Redes Neuronales Convolucionales', 4, 2, 1, 2, 'Descripción de los Resultados del Proyecto', 'Descripción de la Justificación del Proyecto', 'Descripción del Resumen del Proyecto', 'Descripción de los Objetivos del Proyecto', 'Descripción de la Metodlogía del Proyecto', 'Descripción de las Metas del Proyecto', NULL);
GO
-- Recusos Materiales
INSERT INTO [FormatosTESE].[dbo].[RecusosMateriales] (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 1, 'Equipo de Computo');
INSERT INTO [FormatosTESE].[dbo].[RecusosMateriales] (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 2, 'Licencias dde Software');
INSERT INTO [FormatosTESE].[dbo].[RecusosMateriales] (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 4, 'Plumones para Pizarrón');
GO
-- Servicios
INSERT INTO [FormatosTESE].[dbo].[Servicios] (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 1, 'Internet');
INSERT INTO [FormatosTESE].[dbo].[Servicios] (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 1, 'Agua Potable');
INSERT INTO [FormatosTESE].[dbo].[Servicios] (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 1, 'Comedor');
GO
-- BienesMuebles
INSERT INTO [FormatosTESE].[dbo].[BienesMuebles] (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 2, 'Escritorio');
INSERT INTO [FormatosTESE].[dbo].[BienesMuebles] (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 2, 'Silla para Escritorio');
INSERT INTO [FormatosTESE].[dbo].[BienesMuebles] (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 2, 'Departamento u Oficina de Investigacion y Desarrollo');
GO
-- Honorarios
INSERT INTO [FormatosTESE].[dbo].[Honorarios] (NumProyecto, EspecialidadPersonal, NumPersonalExterno, NumPersonalInterno, Dedicacionhoras) 
VALUES (1, 'Asesor Tecnico', 1, NULL, 120);
INSERT INTO [FormatosTESE].[dbo].[Honorarios] (NumProyecto, EspecialidadPersonal, NumPersonalExterno, NumPersonalInterno, Dedicacionhoras) 
VALUES (1, 'Asesor Metodologico', NULL, 1, 60);
GO
-- Cronograma del Proyecto
INSERT INTO [FormatosTESE].[dbo].[CronogramaProyecto] (NumProyecto, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses, PorcentajeAvance) 
VALUES (1, 1, 'Etapa 1', 'Dias', 5, '2022-04-01 00:00:00.000', '2022-04-06 00:00:00.000', 1, NULL);
INSERT INTO [FormatosTESE].[dbo].[CronogramaProyecto] (NumProyecto, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses, PorcentajeAvance)
VALUES (1, 2, 'Etapa 2', 'Horas', 5, '2022-04-07 00:12:00.000', '2022-04-07 00:17:00.000', 1, NULL);
INSERT INTO [FormatosTESE].[dbo].[CronogramaProyecto] (NumProyecto, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses, PorcentajeAvance)
VALUES (1, 3, 'Etapa 3', 'Meses', 6, '2022-05-01 00:00:00.000', '2022-10-01 00:00:00.000', 1, NULL);
GO
-- Hoja de Analisis
INSERT INTO [FormatosTESE].[dbo].[HojaAnalisis] (NumProyecto, AntecedentesJustificacion, Metodologia, Objetivos, Impacto, SectorPublico, FormacionRH, SubtotalCriterios, cInfraestructura, cActividades, cRH, cProgramacion, cPresupuesto, SubtotalViabilidad, Total) 
VALUES (1, 9, 7, 8, 9, 7, 7, 47, 4, 2, 1, 3, 5, 15, 62);
GO
-- Evaluacion
INSERT INTO [FormatosTESE].[dbo].[Evaluacion] (Calificacion, NumPrioridad, NumResponsable, NumJefe, NumDirector, NumHojaAnalisis) 
VALUES (8, 3, 3, 5, 6, 1);
GO
-- Evaluadores
INSERT INTO [FormatosTESE].[dbo].[Evaluadores] (NumEvaluacion, NumCargoPersona) 
VALUES (1, 1);
INSERT INTO [FormatosTESE].[dbo].[Evaluadores] (NumEvaluacion, NumCargoPersona) 
VALUES (1, 2);
GO
-- Hoja de Calificaciones
INSERT INTO [FormatosTESE].[dbo].[HojaCalificaciones] (TotalProyectos, PromedioProyectos, AceptacionPrograma, NumResponsable, NumJefe, NumDirector, NumPrograma)
VALUES (1, 8, 'El proyecto es viable y cuenta con los criterios de aceptacion necesarios.', 3, 5, 6, 1);
GO
-- Oficio Dictamen
INSERT INTO [FormatosTESE].[dbo].[OficioDictamen] (NoOficio, FechaOficio, NumProyecto) 
VALUES (1, GETDATE(), 1);
GO
-- Comite Evaluador
INSERT INTO [FormatosTESE].[dbo].[ComiteEvaluador] (NumOficioDictamen, NumIntegranteComite) 
VALUES (1, 1);
INSERT INTO [FormatosTESE].[dbo].[ComiteEvaluador] (NumOficioDictamen, NumIntegranteComite) 
VALUES (1, 2);
GO
-- Carta de Liberacion
INSERT INTO [FormatosTESE].[dbo].[CartaLiberacion] (NumDivision, NoOficio, FechaOficio, NombrePersona, NumProyecto) 
VALUES (1, 1, GETDATE(), 2, 1);
GO
-- Comite de Liberacion
INSERT INTO [FormatosTESE].[dbo].[ComiteLiberacion] (NumCartaLiberacion, NumIntegranteComite) 
VALUES (1, 1);
INSERT INTO [FormatosTESE].[dbo].[ComiteLiberacion] (NumCartaLiberacion, NumIntegranteComite) 
VALUES (1, 2);
GO
-- Informe
INSERT INTO [FormatosTESE].[dbo].[Informe] (FechaInforme, PeriodoEscolar, NumDivision, NumResponsableDivision, PeriodoReportado, NoInforme, FormatosRequisitados, FormatosAprobadosComite, ProyectosEnProceso, ProyectosFinanciamientoExterno, ProyectosConcluidos, FormatosMes, Articulos, Libros, Patentes, Congresos, Estancias, ProfesorSNI, Convenios, ActividadesInherentes, NumResponsable, NumJefe, NumDirector) 
VALUES (GETDATE(), 1, 1, 3, 'Julio - Agosto', 1, 2, 1, 1, 0, 0, 3, 2, 3, 3, 2, 1, 1, 2, 'Descripción de Actividades Inherentes', 3, 5, 6);
GO
-- Articulos Publicados
INSERT INTO [FormatosTESE].[dbo].[ArticulosPublicados] (NumInforme, Articulo, Revista, Arbitraje, Nacional) 
VALUES (1, 'Redes Neuronales', 'TESE', 0, 1);
INSERT INTO [FormatosTESE].[dbo].[ArticulosPublicados] (NumInforme, Articulo, Revista, Arbitraje, Nacional) 
VALUES (1, 'Mineria de Datos', 'Politecnico', 1, 0);
GO
-- Libros Publicados
INSERT INTO [FormatosTESE].[dbo].[LibrosPublicados] (NumInforme, Titulo, Editorial, ISBN) 
VALUES (1, 'Bases de Datos', 'TESE', '1530-4789-1204');
INSERT INTO [FormatosTESE].[dbo].[LibrosPublicados] (NumInforme, Titulo, Editorial, ISBN) 
VALUES (1, 'Inteligencia', 'UNAM', '7456-8596-1122');
INSERT INTO [FormatosTESE].[dbo].[LibrosPublicados] (NumInforme, Titulo, Editorial, ISBN) 
VALUES (1, 'Modelos de Datos', 'Politecnico', '2345-7865-1010');
GO
-- Patentes Informe
INSERT INTO [FormatosTESE].[dbo].[Patentes] (NumInforme, Descripcion, NoPatente) 
VALUES (1, 'Mano Robotica', 'Folio 0001');
INSERT INTO [FormatosTESE].[dbo].[Patentes] (NumInforme, Descripcion, NoPatente) 
VALUES (1, 'Tarjeta NFT', 'Folio 0002');
INSERT INTO [FormatosTESE].[dbo].[Patentes] (NumInforme, Descripcion, NoPatente) 
VALUES (1, 'Placa de Circuitos', 'Folio 0003');
GO
-- Congresos Informe
INSERT INTO [FormatosTESE].[dbo].[Congresos] (NumInforme, Titulo, Responsable, Evento) 
VALUES (1, 'Congreso de Robotica', 3, 'Evento en Valle de Bravo');
INSERT INTO [FormatosTESE].[dbo].[Congresos] (NumInforme, Titulo, Responsable, Evento) 
VALUES (1, 'Congreso Regional XXI', 3, 'Evento en Ecatepec de Morelos');
GO
-- Estancias Informe
INSERT INTO [FormatosTESE].[dbo].[Estancias] (NumInforme, Empresa, Profesor, Trabajo, Duracion) 
VALUES (1, 'Empresa SA de CV', 'Carlos Rodriguez Gonzalez', 'Elaboracion del Capitulo 1', '3 Meses');
GO
-- Profesor SNI Informe
INSERT INTO [FormatosTESE].[dbo].[ProfesorSNI] (NumInforme, NumProfesor, Nivel, NoRegistro) 
VALUES (1, 2, 'Nivel SNI', 'Folio 001');
GO
-- Convenios Informe
INSERT INTO [FormatosTESE].[dbo].[Convenios] (NumInforme, Institucion, ProyectoColaborativo) 
VALUES (1, 'Politenico', 'Medidor de Gases Nocivos');
INSERT INTO [FormatosTESE].[dbo].[Convenios] (NumInforme, Institucion, ProyectoColaborativo) 
VALUES (1, 'UNAM', 'Reconocimiento Facial');
GO
-- Problematica Informe
INSERT INTO [FormatosTESE].[dbo].[Problematica] (NumInforme, Problema, SolucionAccion) 
VALUES (1, 'Descripción de la Problematica del Informe', 'Descripción de la Solución del Informe');
GO
-- Proyectos del Programa
INSERT INTO [FormatosTESE].[dbo].[ProyectosPrograma] (NumProyecto, NumPrograma) VALUES (1, 2);
GO
-- Programas de la Division
INSERT INTO [FormatosTESE].[dbo].[ProgramasDivision] (NumDivision, NumPrograma) VALUES (1, 1);
INSERT INTO [FormatosTESE].[dbo].[ProgramasDivision] (NumDivision, NumPrograma) VALUES (1, 2);
GO
/*
-- aaaaaaaaaaa
INSERT INTO [FormatosTESE].[dbo].[aaaaaaaaaaa] (aaaaaaaaaaa) VALUES ('aaaaaaaaaaa');
GO
-- aaaaaaaaaaa
INSERT INTO [FormatosTESE].[dbo].[aaaaaaaaaaa] (aaaaaaaaaaa, aaaaaaaaaaa, aaaaaaaaaaa, aaaaaaaaaaa, aaaaaaaaaaa) 
VALUES ('aaaaaaaaaaa', 'aaaaaaaaaaa', 'aaaaaaaaaaa', 'aaaaaaaaaaa', 'aaaaaaaaaaa');
GO
*/