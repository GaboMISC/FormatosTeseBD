USE FormatosTESE;

/* ***** Catalogos ***** */
-- Division Academica
INSERT INTO DivisionAcademica (Descripcion) VALUES ('División de Ingeniería en Sistemas Computacionales');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('División de Ingeniería Industrial');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('División de Ingeniería Química');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('División de Ingeniería Electrónica');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('División de Ingeniería Bioquímica');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('División de Ingeniería Mecatrónica');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('División de Contaduría Pública');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('División de Ingeniería Mecánica');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('División de Ingeniería Gestión Empresarial');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('División de Ingeniería Informática');
INSERT INTO DivisionAcademica (Descripcion) VALUES ('División de Ingeniería Aeronáutica');

-- Cargo
INSERT INTO Cargo (Descripcion) VALUES ('Administrador');
INSERT INTO Cargo (Descripcion) VALUES ('Responsable de la Función de Investigación');
INSERT INTO Cargo (Descripcion) VALUES ('Jefe de División');
INSERT INTO Cargo (Descripcion) VALUES ('Director Académico');
INSERT INTO Cargo (Descripcion) VALUES ('Personal Docente');
INSERT INTO Cargo (Descripcion) VALUES ('Personal Administrativo');
INSERT INTO Cargo (Descripcion) VALUES ('Coordinador del Programa');
INSERT INTO Cargo (Descripcion) VALUES ('Coordinador de Residencias Profesionales');
INSERT INTO Cargo (Descripcion) VALUES ('Coordinador de Asesorías');
INSERT INTO Cargo (Descripcion) VALUES ('Coordinador de Titulación');
INSERT INTO Cargo (Descripcion) VALUES ('Coordinador de Tutorías');
INSERT INTO Cargo (Descripcion) VALUES ('Coordinador Administrativo');

-- Linea de Investigacion
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Inteligencia Artificial');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Redes, Gestión de Datos y Conectividad');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Sistemas de Información Contable - Fiscal y Auditoría');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Contabilidad Integral para el Sector Empresarial y Gubernamental');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Automatización y Contol');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Análisis, Diseño, Modelado y Simulación de Sistemas');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Gestión e Innovación de Procesos');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Optimización de Productos y Procesos');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Control Digital, Robótica y Automatización');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Desarrollo y Experimentación en Sistemas Mecatrónicos');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Nuevas Tecnologías para el Desarrollo Sustentable');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Energías Convencionales y Eficiencia Energética');
INSERT INTO LineaInvestigacion (Descripcion) VALUES ('Energías Alternas Renovables');

-- Area de Investigacion
INSERT INTO AreaInvestigacion (Descripcion) VALUES ('Investigación Básica');
INSERT INTO AreaInvestigacion (Descripcion) VALUES ('Investigación Aplicada');
INSERT INTO AreaInvestigacion (Descripcion) VALUES ('Investigación Tecnológica');
INSERT INTO AreaInvestigacion (Descripcion) VALUES ('Desarrollo Tecnológico');
INSERT INTO AreaInvestigacion (Descripcion) VALUES ('Desarrollo Experimental');

-- Nivel Academico
INSERT INTO NivelAcademico (Descripcion) VALUES ('Interinstitucional');
INSERT INTO NivelAcademico (Descripcion) VALUES ('Institucional');
INSERT INTO NivelAcademico (Descripcion) VALUES ('Divisional');

-- Prioridad
INSERT INTO Prioridad (Letra, Descripcion) VALUES ('Prioridad A', 'El proyecto es de carácter relevante, de acuerdo con el impacto de sus resultados en la resolución a corto plazo de una problemática a nivel regional o institucional.');
INSERT INTO Prioridad (Letra, Descripcion) VALUES ('Prioridad B', 'El proyecto representa una alternativa viable para el mejoramiento de una situación a nivel institucional o regional a mediano plazo.');
INSERT INTO Prioridad (Letra, Descripcion) VALUES ('Prioridad C', 'El proyecto plantea respuestas a problemas específicos del Departamento en el corto plazo.');
INSERT INTO Prioridad (Letra, Descripcion) VALUES ('Prioridad D', 'aaaaaaaaaa');

-- Periodo Escolar
INSERT INTO PeriodoEscolar (Descripcion, FechaInicio, FechaFin) VALUES ('2022-1', '2022-03-07 00:00:00.000', '2022-08-13 00:00:00.000');
INSERT INTO PeriodoEscolar (Descripcion, FechaInicio, FechaFin) VALUES ('2022-2', '2022-09-01 00:00:00.000', '2022-12-27 00:00:00.000');

-- Estado Proceso
INSERT INTO EstadoProceso (Descripcion) VALUES ('Iniciado');
INSERT INTO EstadoProceso (Descripcion) VALUES ('En Proceso');
INSERT INTO EstadoProceso (Descripcion) VALUES ('Concluido');

/* ***** Datos de Prueba ***** */
-- Usuario
INSERT INTO Usuario (NombreUsuario, Contrasena) VALUES ('gmartinez', 'gmartinez');
INSERT INTO Usuario (NombreUsuario, Contrasena) VALUES ('gcortes', 'gcortes');
INSERT INTO Usuario (NombreUsuario, Contrasena) VALUES ('ecorona', 'ecorona');
INSERT INTO Usuario (NombreUsuario, Contrasena) VALUES ('jchavez', 'jchavez');
INSERT INTO Usuario (NombreUsuario, Contrasena) VALUES ('areyes', 'areyes');
INSERT INTO Usuario (NombreUsuario, Contrasena) VALUES ('jcuevas', 'jcuevas');
INSERT INTO Usuario (NombreUsuario, Contrasena) VALUES ('epacheco', 'epacheco');
INSERT INTO Usuario (NombreUsuario, Contrasena) VALUES ('dperez', 'dperez');
INSERT INTO Usuario (NombreUsuario, Contrasena) VALUES ('acuevas', 'acuevas');

-- Persona
INSERT INTO Persona (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Gabriel', 'Martínez', 'Flores', '5555555555', 'gmartinez@tese.edu.mx', 1);
INSERT INTO Persona (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Griselda', 'Cortés', 'Barrera', '5555555555', 'gcortes@tese.edu.mx', 2);
INSERT INTO Persona (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Edgar', 'Corona', 'Organiche', '5555555555', 'ecorona@tese.edu.mx', 3);
INSERT INTO Persona (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('José Luis', 'Chavez', 'Rojas', '5555555555', 'jchavez@tese.edu.mx', 4);
INSERT INTO Persona (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Alfonso', 'Martinez', 'Reyes', '5555555555', 'areyes@tese.edu.mx', 5);
INSERT INTO Persona (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Jesus', 'Cuevas', 'Perafan', '5555555555', 'jcuevas@tese.edu.mx', 6);
INSERT INTO Persona (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Edgar', 'Pacheco', 'Antonio', '5555555555', 'epacheco@tese.edu.mx', 7);
INSERT INTO Persona (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Daniel', 'Perez', 'Cantillo', '5555555555', 'dperez@tese.edu.mx', 8);
INSERT INTO Persona (Nombre, Paterno, Materno, Telefono, Correo, NumUsuario) 
VALUES ('Alejandro', 'Cuevas', 'Perafan', '5555555555', 'acuevas@tese.edu.mx', 9);

-- CargoPersona
INSERT INTO CargoPersona (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (1, 1, 1, 1, 1);
INSERT INTO CargoPersona (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (5, 2, 1, 1, 1);
INSERT INTO CargoPersona (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (2, 3, 1, 1, 1);
INSERT INTO CargoPersona (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (7, 3, 1, 1, 1);
INSERT INTO CargoPersona (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (3, 4, 1, 1, 1);
INSERT INTO CargoPersona (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (4, 5, 1, 1, 1);
INSERT INTO CargoPersona (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (1, 6, 10, 2, 1);
INSERT INTO CargoPersona (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (1, 7, 4, 2, 1);
INSERT INTO CargoPersona (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (1, 8, 6, 2, 1);
INSERT INTO CargoPersona (NumCargo, NumPersona, NumDivisionAcademica, NumPeriodoEscolar, PuestoVigente) 
VALUES (1, 9, 10, 2, 1);

-- Programa
INSERT INTO Programa (Clave, Nombre, NumCoordinador, NumAreaInvestigacion, NumLineaInvestigacion, PosibleResultado, Justificacion, Resumen, Objetivos, Metodologia, Metas, CV) 
VALUES ('ISC-01', 'Ingeniería Sistemas Computacionales', 4, 2, 2, 'Descripción de los Resultados del Programa', 'Descripción de la Justificación del Programa', 'Descripción del Resumen del Programa', 'Descripción de los Objetivos del Programa', 'Descripción de la Metodlogía del Programa', 'Descripción de las Metas del Programa', NULL);
INSERT INTO Programa (Clave, Nombre, NumCoordinador, NumAreaInvestigacion, NumLineaInvestigacion, PosibleResultado, Justificacion, Resumen, Objetivos, Metodologia, Metas, CV) 
VALUES ('MISC-02', 'Maestría en Ingeniería en Sistemas Computacionales', 4, 3, 1, 'Descripción de los Resultados del Programa', 'Descripción de la Justificación del Programa', 'Descripción del Resumen del Programa', 'Descripción de los Objetivos del Programa', 'Descripción de la Metodlogía del Programa', 'Descripción de las Metas del Programa', NULL);

-- Cronograma del Programa
INSERT INTO CronogramaPrograma (NumPrograma, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses) 
VALUES (1, 1, 'Analisis', 'Dias', 5, '2022-04-01 00:00:00.000', '2022-04-06 00:00:00.000', 1);
INSERT INTO CronogramaPrograma (NumPrograma, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses) 
VALUES (1, 2, 'Construccion', 'Horas', 5, '2022-04-07 00:12:00.000', '2022-04-07 00:17:00.000', 1);
INSERT INTO CronogramaPrograma (NumPrograma, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses) 
VALUES (2, 1, 'Revision', 'Meses', 6, '2022-05-01 00:00:00.000', '2022-10-01 00:00:00.000', 6);

-- Proyecto
INSERT INTO Proyecto (Clave, Nombre, NumCoordinador, NumAreaInvestigacion, NumLineaInvestigacion, NumNivelAcademico, PosibleResultado, Justificacion, Resumen, Objetivos, Metodologia, Metas, CV) 
VALUES ('Proy-01', 'Redes Neuronales Convolucionales', 4, 2, 1, 2, 'Descripción de los Resultados del Proyecto', 'Descripción de la Justificación del Proyecto', 'Descripción del Resumen del Proyecto', 'Descripción de los Objetivos del Proyecto', 'Descripción de la Metodlogía del Proyecto', 'Descripción de las Metas del Proyecto', NULL);
INSERT INTO Proyecto (Clave, Nombre, NumCoordinador, NumAreaInvestigacion, NumLineaInvestigacion, NumNivelAcademico, PosibleResultado, Justificacion, Resumen, Objetivos, Metodologia, Metas, CV) 
VALUES ('Proy-02', 'Autenticacion con Inteligencia Artifial', 4, 3, 1, 2, 'Descripción de los Resultados del Proyecto', 'Descripción de la Justificación del Proyecto', 'Descripción del Resumen del Proyecto', 'Descripción de los Objetivos del Proyecto', 'Descripción de la Metodlogía del Proyecto', 'Descripción de las Metas del Proyecto', NULL);
INSERT INTO Proyecto (Clave, Nombre, NumCoordinador, NumAreaInvestigacion, NumLineaInvestigacion, NumNivelAcademico, PosibleResultado, Justificacion, Resumen, Objetivos, Metodologia, Metas, CV) 
VALUES ('Proy-03', 'Punto de Venta para Muebleria', 4, 4, 11, 3, 'Descripción de los Resultados del Proyecto', 'Descripción de la Justificación del Proyecto', 'Descripción del Resumen del Proyecto', 'Descripción de los Objetivos del Proyecto', 'Descripción de la Metodlogía del Proyecto', 'Descripción de las Metas del Proyecto', NULL);

-- Recusos Materiales
INSERT INTO RecusosMateriales (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 1, 'Equipo de Computo');
INSERT INTO RecusosMateriales (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 2, 'Licencias dde Software');
INSERT INTO RecusosMateriales (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 4, 'Plumones para Pizarrón');
INSERT INTO RecusosMateriales (NumProyecto, Cantidad, Descripcion) 
VALUES (2, 1, 'Equipo de Computo');
INSERT INTO RecusosMateriales (NumProyecto, Cantidad, Descripcion) 
VALUES (2, 2, 'Licencias dde Software');
INSERT INTO RecusosMateriales (NumProyecto, Cantidad, Descripcion) 
VALUES (2, 4, 'Plumones para Pizarrón');
INSERT INTO RecusosMateriales (NumProyecto, Cantidad, Descripcion) 
VALUES (3, 1, 'Equipo de Computo');
INSERT INTO RecusosMateriales (NumProyecto, Cantidad, Descripcion) 
VALUES (3, 2, 'Licencias dde Software');
INSERT INTO RecusosMateriales (NumProyecto, Cantidad, Descripcion) 
VALUES (3, 4, 'Plumones para Pizarrón');

-- Servicios
INSERT INTO Servicios (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 1, 'Internet');
INSERT INTO Servicios (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 1, 'Agua Potable');
INSERT INTO Servicios (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 1, 'Comedor');
INSERT INTO Servicios (NumProyecto, Cantidad, Descripcion) 
VALUES (2, 1, 'Internet');
INSERT INTO Servicios (NumProyecto, Cantidad, Descripcion) 
VALUES (2, 1, 'Agua Potable');
INSERT INTO Servicios (NumProyecto, Cantidad, Descripcion) 
VALUES (2, 1, 'Comedor');
INSERT INTO Servicios (NumProyecto, Cantidad, Descripcion) 
VALUES (3, 1, 'Internet');
INSERT INTO Servicios (NumProyecto, Cantidad, Descripcion) 
VALUES (3, 1, 'Agua Potable');
INSERT INTO Servicios (NumProyecto, Cantidad, Descripcion) 
VALUES (3, 1, 'Comedor');

-- BienesMuebles
INSERT INTO BienesMuebles (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 2, 'Escritorio');
INSERT INTO BienesMuebles (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 2, 'Silla para Escritorio');
INSERT INTO BienesMuebles (NumProyecto, Cantidad, Descripcion) 
VALUES (1, 2, 'Departamento u Oficina de Investigacion y Desarrollo');
INSERT INTO BienesMuebles (NumProyecto, Cantidad, Descripcion) 
VALUES (2, 2, 'Escritorio');
INSERT INTO BienesMuebles (NumProyecto, Cantidad, Descripcion) 
VALUES (2, 2, 'Silla para Escritorio');
INSERT INTO BienesMuebles (NumProyecto, Cantidad, Descripcion) 
VALUES (2, 2, 'Departamento u Oficina de Investigacion y Desarrollo');
INSERT INTO BienesMuebles (NumProyecto, Cantidad, Descripcion) 
VALUES (3, 2, 'Escritorio');
INSERT INTO BienesMuebles (NumProyecto, Cantidad, Descripcion) 
VALUES (3, 2, 'Silla para Escritorio');
INSERT INTO BienesMuebles (NumProyecto, Cantidad, Descripcion) 
VALUES (3, 2, 'Departamento u Oficina de Investigacion y Desarrollo');

-- Honorarios
INSERT INTO Honorarios (NumProyecto, EspecialidadPersonal, NumPersonalExterno, NumPersonalInterno, Dedicacionhoras) 
VALUES (1, 'Asesor Tecnico', 1, NULL, 120);
INSERT INTO Honorarios (NumProyecto, EspecialidadPersonal, NumPersonalExterno, NumPersonalInterno, Dedicacionhoras) 
VALUES (1, 'Asesor Metodologico', NULL, 1, 60);
INSERT INTO Honorarios (NumProyecto, EspecialidadPersonal, NumPersonalExterno, NumPersonalInterno, Dedicacionhoras) 
VALUES (2, 'Asesor Tecnico', 1, NULL, 120);
INSERT INTO Honorarios (NumProyecto, EspecialidadPersonal, NumPersonalExterno, NumPersonalInterno, Dedicacionhoras) 
VALUES (2, 'Asesor Metodologico', NULL, 1, 60);
INSERT INTO Honorarios (NumProyecto, EspecialidadPersonal, NumPersonalExterno, NumPersonalInterno, Dedicacionhoras) 
VALUES (3, 'Asesor Tecnico', 1, NULL, 120);
INSERT INTO Honorarios (NumProyecto, EspecialidadPersonal, NumPersonalExterno, NumPersonalInterno, Dedicacionhoras) 
VALUES (3, 'Asesor Metodologico', NULL, 1, 60);

-- Cronograma del Proyecto
INSERT INTO CronogramaProyecto (NumProyecto, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses, PorcentajeAvance) 
VALUES (1, 1, 'Etapa 1', 'Dias', 5, '2022-04-01 00:00:00.000', '2022-04-06 00:00:00.000', 1, 20);
INSERT INTO CronogramaProyecto (NumProyecto, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses, PorcentajeAvance)
VALUES (1, 2, 'Etapa 2', 'Horas', 40, '2022-04-07 00:12:00.000', '2022-04-07 00:17:00.000', 1, 40);
INSERT INTO CronogramaProyecto (NumProyecto, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses, PorcentajeAvance)
VALUES (1, 3, 'Etapa 3', 'Meses', 6, '2022-05-01 00:00:00.000', '2022-10-01 00:00:00.000', 1, 40);
INSERT INTO CronogramaProyecto (NumProyecto, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses, PorcentajeAvance) 
VALUES (2, 1, 'Etapa 1', 'Dias', 5, '2022-04-01 00:00:00.000', '2022-04-06 00:00:00.000', 1, 10);
INSERT INTO CronogramaProyecto (NumProyecto, Numero, Actividad, Unidad, Cantidad, FechaInicio, FechaFin, Meses, PorcentajeAvance) 
VALUES (3, 1, 'Etapa 1', 'Dias', 5, '2022-04-01 00:00:00.000', '2022-04-06 00:00:00.000', 1, 10);

-- Hoja de Analisis
INSERT INTO HojaAnalisis (NumProyecto, AntecedentesJustificacion, Metodologia, Objetivos, Impacto, SectorPublico, FormacionRH, SubtotalCriterios, cInfraestructura, cActividades, cRH, cProgramacion, cPresupuesto, SubtotalViabilidad, Total) 
VALUES (1, 9, 7, 8, 9, 7, 7, 47, 4, 2, 1, 3, 5, 15, 62);
INSERT INTO HojaAnalisis (NumProyecto, AntecedentesJustificacion, Metodologia, Objetivos, Impacto, SectorPublico, FormacionRH, SubtotalCriterios, cInfraestructura, cActividades, cRH, cProgramacion, cPresupuesto, SubtotalViabilidad, Total) 
VALUES (2, 9, 7, 8, 5, 7, 5, 41, 4, 2, 1, 3, 5, 10, 57);
INSERT INTO HojaAnalisis (NumProyecto, AntecedentesJustificacion, Metodologia, Objetivos, Impacto, SectorPublico, FormacionRH, SubtotalCriterios, cInfraestructura, cActividades, cRH, cProgramacion, cPresupuesto, SubtotalViabilidad, Total) 
VALUES (3, 9, 7, 7, 5, 7, 5, 40, 4, 2, 1, 3, 5, 8, 55);

-- Evaluacion
INSERT INTO Evaluacion (Calificacion, NumPrioridad, NumResponsable, NumJefe, NumDirector, NumHojaAnalisis) 
VALUES (8, 3, 3, 5, 6, 1);
INSERT INTO Evaluacion (Calificacion, NumPrioridad, NumResponsable, NumJefe, NumDirector, NumHojaAnalisis) 
VALUES (9, 1, 3, 5, 6, 2);
INSERT INTO Evaluacion (Calificacion, NumPrioridad, NumResponsable, NumJefe, NumDirector, NumHojaAnalisis) 
VALUES (7, 2, 3, 5, 6, 3);

-- Evaluadores
INSERT INTO Evaluadores (NumEvaluacion, NumCargoPersona) 
VALUES (1, 1);
INSERT INTO Evaluadores (NumEvaluacion, NumCargoPersona) 
VALUES (1, 2);
INSERT INTO Evaluadores (NumEvaluacion, NumCargoPersona) 
VALUES (2, 7);
INSERT INTO Evaluadores (NumEvaluacion, NumCargoPersona) 
VALUES (2, 10);
INSERT INTO Evaluadores (NumEvaluacion, NumCargoPersona) 
VALUES (3, 7);
INSERT INTO Evaluadores (NumEvaluacion, NumCargoPersona) 
VALUES (3, 10);

-- Hoja de Calificaciones
INSERT INTO HojaCalificaciones (TotalProyectos, PromedioProyectos, AceptacionPrograma, NumResponsable, NumJefe, NumDirector, NumPrograma)
VALUES (2, 8, 'El programa es viable y cuenta con los criterios de aceptacion necesarios.', 3, 5, 6, 2);
INSERT INTO HojaCalificaciones (TotalProyectos, PromedioProyectos, AceptacionPrograma, NumResponsable, NumJefe, NumDirector, NumPrograma)
VALUES (1, 7, 'El programa es viable y cuenta con los criterios de aceptacion necesarios.', 3, 5, 6, 1);

-- Oficio Dictamen
INSERT INTO OficioDictamen (NoOficio, FechaOficio, NumProyecto) 
VALUES (1, CURRENT_DATE(), 1);
INSERT INTO OficioDictamen (NoOficio, FechaOficio, NumProyecto) 
VALUES (2, CURRENT_DATE(), 2);
INSERT INTO OficioDictamen (NoOficio, FechaOficio, NumProyecto) 
VALUES (3, CURRENT_DATE(), 3);

-- Comite Evaluador
INSERT INTO ComiteEvaluador (NumOficioDictamen, NumIntegranteComite) 
VALUES (1, 1);
INSERT INTO ComiteEvaluador (NumOficioDictamen, NumIntegranteComite) 
VALUES (1, 2);
INSERT INTO ComiteEvaluador (NumOficioDictamen, NumIntegranteComite) 
VALUES (2, 7);
INSERT INTO ComiteEvaluador (NumOficioDictamen, NumIntegranteComite) 
VALUES (2, 10);
INSERT INTO ComiteEvaluador (NumOficioDictamen, NumIntegranteComite) 
VALUES (3, 7);
INSERT INTO ComiteEvaluador (NumOficioDictamen, NumIntegranteComite) 
VALUES (3, 10);

-- Carta de Liberacion
INSERT INTO CartaLiberacion (NumDivision, NoOficio, FechaOficio, NombrePersona, NumProyecto) 
VALUES (1, 1, CURRENT_DATE(), 2, 1);
INSERT INTO CartaLiberacion (NumDivision, NoOficio, FechaOficio, NombrePersona, NumProyecto) 
VALUES (1, 2, CURRENT_DATE(), 7, 2);
INSERT INTO CartaLiberacion (NumDivision, NoOficio, FechaOficio, NombrePersona, NumProyecto) 
VALUES (1, 3, CURRENT_DATE(), 10, 3);

-- Comite de Liberacion
INSERT INTO ComiteLiberacion (NumCartaLiberacion, NumIntegranteComite) 
VALUES (1, 1);
INSERT INTO ComiteLiberacion (NumCartaLiberacion, NumIntegranteComite) 
VALUES (1, 2);
INSERT INTO ComiteLiberacion (NumCartaLiberacion, NumIntegranteComite) 
VALUES (2, 7);
INSERT INTO ComiteLiberacion (NumCartaLiberacion, NumIntegranteComite) 
VALUES (2, 10);

-- Informe
INSERT INTO Informe (FechaInforme, PeriodoEscolar, NumDivision, NumResponsableDivision, PeriodoReportado, NoInforme, FormatosRequisitados, FormatosAprobadosComite, ProyectosEnProceso, ProyectosFinanciamientoExterno, ProyectosConcluidos, FormatosMes, Articulos, Libros, Patentes, Congresos, Estancias, ProfesorSNI, Convenios, ActividadesInherentes, NumResponsable, NumJefe, NumDirector) 
VALUES (CURRENT_DATE(), 1, 1, 3, 'Julio - Agosto', 1, 2, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 'Descripción de Actividades Inherentes', 3, 5, 6);

-- Articulos Publicados
INSERT INTO ArticulosPublicados (NumInforme, Articulo, Revista, Arbitraje, Nacional) 
VALUES (1, 'Redes Neuronales', 'TESE', 0, 1);
INSERT INTO ArticulosPublicados (NumInforme, Articulo, Revista, Arbitraje, Nacional) 
VALUES (1, 'Mineria de Datos', 'Politecnico', 1, 0);

-- Libros Publicados
INSERT INTO LibrosPublicados (NumInforme, Titulo, Editorial, ISBN) 
VALUES (1, 'Bases de Datos', 'TESE', '1530-4789-1204');
INSERT INTO LibrosPublicados (NumInforme, Titulo, Editorial, ISBN) 
VALUES (1, 'Inteligencia', 'UNAM', '7456-8596-1122');
INSERT INTO LibrosPublicados (NumInforme, Titulo, Editorial, ISBN) 
VALUES (1, 'Modelos de Datos', 'Politecnico', '2345-7865-1010');

-- Patentes Informe
INSERT INTO Patentes (NumInforme, Descripcion, NoPatente) 
VALUES (1, 'Mano Robotica', 'Folio 0001');
INSERT INTO Patentes (NumInforme, Descripcion, NoPatente) 
VALUES (1, 'Tarjeta NFT', 'Folio 0002');
INSERT INTO Patentes (NumInforme, Descripcion, NoPatente) 
VALUES (1, 'Placa de Circuitos', 'Folio 0003');

-- Congresos Informe
INSERT INTO Congresos (NumInforme, Titulo, Responsable, Evento) 
VALUES (1, 'Congreso de Robotica', 3, 'Evento en Valle de Bravo');
INSERT INTO Congresos (NumInforme, Titulo, Responsable, Evento) 
VALUES (1, 'Congreso Regional XXI', 3, 'Evento en Ecatepec de Morelos');

-- Estancias Informe
INSERT INTO Estancias (NumInforme, Empresa, Profesor, Trabajo, Duracion) 
VALUES (1, 'Empresa SA de CV', 'Carlos Rodriguez Gonzalez', 'Elaboracion del Capitulo 1', '3 Meses');

-- Profesor SNI Informe
INSERT INTO ProfesorSNI (NumInforme, NumProfesor, Nivel, NoRegistro) 
VALUES (1, 2, 'Nivel SNI', 'Folio 001');

-- Convenios Informe
INSERT INTO Convenios (NumInforme, Institucion, ProyectoColaborativo) 
VALUES (1, 'Politenico', 'Medidor de Gases Nocivos');
INSERT INTO Convenios (NumInforme, Institucion, ProyectoColaborativo) 
VALUES (1, 'UNAM', 'Reconocimiento Facial');

-- Problematica Informe
INSERT INTO Problematica (NumInforme, Problema, SolucionAccion) 
VALUES (1, 'Descripción de la Problematica del Informe', 'Descripción de la Solución del Informe');

-- Proyectos del Programa
INSERT INTO ProyectosPrograma (NumProyecto, NumPrograma) VALUES (1, 2);
INSERT INTO ProyectosPrograma (NumProyecto, NumPrograma) VALUES (2, 2);
INSERT INTO ProyectosPrograma (NumProyecto, NumPrograma) VALUES (3, 1);

-- Programas de la Division
INSERT INTO ProgramasDivision (NumDivision, NumPrograma) VALUES (1, 1);
INSERT INTO ProgramasDivision (NumDivision, NumPrograma) VALUES (1, 2);

-- Proceso
INSERT INTO Proceso (NumEstadoProceso, NumProyecto, NumPrograma, NumEvaluacion, NumHojaCalificaciones, NumOficioDictamen, NumCartaLiberacion, NumInforme) 
VALUES (1, 1, 2, 1, 1, 1, 1, 1);
INSERT INTO Proceso (NumEstadoProceso, NumProyecto, NumPrograma, NumEvaluacion, NumHojaCalificaciones, NumOficioDictamen, NumCartaLiberacion, NumInforme) 
VALUES (1, 2, 2, 2, 1, 2, 2, 1);
INSERT INTO Proceso (NumEstadoProceso, NumProyecto, NumPrograma, NumEvaluacion, NumHojaCalificaciones, NumOficioDictamen, NumCartaLiberacion, NumInforme) 
VALUES (1, 3, 1, 3, 2, 3, 3, 1);