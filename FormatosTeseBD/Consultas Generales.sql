USE [FormatosTESE];
GO
/* ***** Catalogos ***** */
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[DivisionAcademica] WITH (NOLOCK);
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[Cargo] WITH (NOLOCK);
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[LineaInvestigacion] WITH (NOLOCK);
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[AreaInvestigacion] WITH (NOLOCK);
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[NivelAcademico] WITH (NOLOCK);
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[Prioridad] WITH (NOLOCK);
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[PeriodoEscolar] WITH (NOLOCK);
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[EstadoProceso] WITH (NOLOCK);

/* ***** Datos de Prueba ***** */

-- Usuario
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[Usuario] WITH (NOLOCK);
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[Persona] WITH (NOLOCK);

-- Cargo Persona
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[CargoPersona] WITH (NOLOCK);

-- Cargo Persona Detallado
SELECT TOP(5) CP.Id, C.Descripcion AS Puesto, P.Nombre, P.Paterno, P.Materno, DA.Descripcion AS Division, PE.Descripcion AS Periodo, CP.PuestoVigente 
FROM [FormatosTESE].[dbo].[CargoPersona] AS CP
INNER JOIN [FormatosTESE].[dbo].[Cargo] AS C ON C.Id = CP.NumCargo
INNER JOIN [FormatosTESE].[dbo].[Persona] AS P ON P.Id = CP.NumPersona
INNER JOIN [FormatosTESE].[dbo].[DivisionAcademica] AS DA ON DA.Id = CP.NumDivisionAcademica
INNER JOIN [FormatosTESE].[dbo].[PeriodoEscolar] AS PE ON PE.Id = CP.NumPeriodoEscolar
WHERE CP.PuestoVigente = 1;

-- Programa
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[Programa] WITH (NOLOCK);

-- Programa Detallado
SELECT TOP(5) P.Clave, P.Nombre, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno, ' - ', CA.Descripcion) AS Coordinador, AI.Descripcion AS [Area de Investigacion], LI.Descripcion AS [Linea de Investigacion], P.PosibleResultado, P.Justificacion, P.Resumen, P.Objetivos, P.Metodologia, P.Metas, P.CV
FROM [FormatosTESE].[dbo].[Programa] AS P
INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = P.NumCoordinador
INNER JOIN [FormatosTESE].[dbo].[Cargo] AS CA ON CA.Id = CP.NumCargo
INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE ON PE.Id = CP.NumPersona
INNER JOIN [FormatosTESE].[dbo].[AreaInvestigacion] AS AI ON AI.Id = P.NumAreaInvestigacion
INNER JOIN [FormatosTESE].[dbo].[LineaInvestigacion] AS LI ON LI.Id = P.NumLineaInvestigacion;

-- Cronograma del Programa
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[CronogramaPrograma] WITH (NOLOCK);

-- Cronograma del Programa Detallado
SELECT TOP(5) CP.Id, P.Clave, P.Nombre, CP.Numero, CP.Actividad, CP.Unidad, CP.Cantidad, CP.FechaInicio, CP.FechaFin, CP.Meses
FROM [FormatosTESE].[dbo].[CronogramaPrograma] AS CP
INNER JOIN [FormatosTESE].[dbo].[Programa] AS P ON P.Id = CP.NumPrograma;

-- Proyecto
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[Proyecto] WITH (NOLOCK);

-- Proyecto Detallado
SELECT TOP(5) P.Clave, P.Nombre, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno, ' - ', CA.Descripcion) AS Coordinador, AI.Descripcion AS [Area de Investigacion], LI.Descripcion AS [Linea de Investigacion], NA.Descripcion AS [Nivel Academico], P.PosibleResultado, P.Justificacion, P.Resumen, P.Objetivos, P.Metodologia, P.Metas, P.CV
FROM [FormatosTESE].[dbo].[Proyecto] AS P
INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = P.NumCoordinador
INNER JOIN [FormatosTESE].[dbo].[Cargo] AS CA ON CA.Id = CP.NumCargo
INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE ON PE.Id = CP.NumPersona
INNER JOIN [FormatosTESE].[dbo].[AreaInvestigacion] AS AI ON AI.Id = P.NumAreaInvestigacion
INNER JOIN [FormatosTESE].[dbo].[LineaInvestigacion] AS LI ON LI.Id = P.NumLineaInvestigacion
INNER JOIN [FormatosTESE].[dbo].[NivelAcademico] AS NA ON NA.Id = P.NumNivelAcademico;

-- Recusos Materiales
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[RecusosMateriales] WITH (NOLOCK);

-- Recusos Materiales Detalle
SELECT TOP(5) RM.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, RM.Cantidad, RM.Descripcion
FROM [FormatosTESE].[dbo].[RecusosMateriales] AS RM
INNER JOIN [FormatosTESE].[dbo].[Proyecto] AS PY ON PY.Id = RM.NumProyecto;

-- Servicios
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[Servicios] WITH (NOLOCK);

-- Servicios Detalle
SELECT TOP(5) S.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, S.Cantidad, S.Descripcion
FROM [FormatosTESE].[dbo].[Servicios] AS S
INNER JOIN [FormatosTESE].[dbo].[Proyecto] AS PY ON PY.Id = S.NumProyecto;

-- Bienes Muebles
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[BienesMuebles] WITH (NOLOCK);

-- Bienes Muebles Detalle
SELECT TOP(5) BM.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, BM.Cantidad, BM.Descripcion
FROM [FormatosTESE].[dbo].[BienesMuebles] AS BM
INNER JOIN [FormatosTESE].[dbo].[Proyecto] AS PY ON PY.Id = BM.NumProyecto;

-- Honorarios
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[Honorarios] WITH (NOLOCK);

-- Honorarios Detalle
SELECT TOP(5) H.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, H.NumPersonalExterno, H.NumPersonalInterno, H.Dedicacionhoras
FROM [FormatosTESE].[dbo].[Honorarios] AS H
INNER JOIN [FormatosTESE].[dbo].[Proyecto] AS PY ON PY.Id = H.NumProyecto;

-- Cronograma del Proyecto
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[CronogramaProyecto] WITH (NOLOCK);

-- Cronograma del Proyecto Detalle
SELECT TOP(5) CP.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, CP.Numero, CP.Actividad, CP.Unidad, CP.Cantidad, CP.FechaInicio, CP.FechaFin, CP.PorcentajeAvance
FROM [FormatosTESE].[dbo].[CronogramaProyecto] AS CP
INNER JOIN [FormatosTESE].[dbo].[Proyecto] AS PY ON PY.Id = CP.NumProyecto;

-- Hoja de Analisis
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[HojaAnalisis] WITH (NOLOCK);

-- Hoja de Analisis Detalle
SELECT TOP(5) HA.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, HA.AntecedentesJustificacion, HA.Metodologia, HA.Objetivos, HA.Impacto, HA.SectorPublico, HA.FormacionRH, HA.SubtotalCriterios, HA.cInfraestructura, HA.cActividades, HA.cRH, HA.cProgramacion, HA.cPresupuesto, HA.SubtotalViabilidad, HA.Total
FROM [FormatosTESE].[dbo].[HojaAnalisis] AS HA
INNER JOIN [FormatosTESE].[dbo].[Proyecto] AS PY ON PY.Id = HA.NumProyecto;

-- Evaluacion
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[Evaluacion] WITH (NOLOCK);

-- Evaluacion Detalle
SELECT TOP(5) E.Id, E.Calificacion, PR.Letra, PR.Descripcion, 
	CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS [Responsable],
	CONCAT(PE1.Nombre, ' ',  PE1.Paterno, ' ', PE1.Materno) AS [Jefe de Division],
	CONCAT(PE2.Nombre, ' ',  PE2.Paterno, ' ', PE2.Materno) AS [Directo Academico]
FROM [FormatosTESE].[dbo].[Evaluacion] AS E
	INNER JOIN [FormatosTESE].[dbo].[Prioridad] AS PR ON PR.Id = E.NumPrioridad
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = E.NumResponsable
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP1 ON CP1.Id = E.NumJefe
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP2 ON CP2.Id = E.NumDirector
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE ON PE.Id = CP.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE1 ON PE1.Id = CP1.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE2 ON PE2.Id = CP2.NumPersona;

-- Evaluadores
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[Evaluadores] WITH (NOLOCK);

-- Evaluadores Detalle
SELECT TOP(5) ES.NumEvaluacion AS [Evaluación Id], CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS [Evaluador]
FROM [FormatosTESE].[dbo].[Evaluadores] AS ES
INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = ES.NumCargoPersona
INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE ON PE.Id = CP.NumPersona;

-- Hoja de Calificaciones
SELECT TOP(5) * FROM [FormatosTESE].[dbo].[HojaCalificaciones] WITH (NOLOCK);

-- Hoja de Calificaciones Detalle
SELECT TOP(5) HC.TotalProyectos, HC.PromedioProyectos, HC.AceptacionPrograma,
	CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS [Responsable],
	CONCAT(PE1.Nombre, ' ',  PE1.Paterno, ' ', PE1.Materno) AS [Jefe de Division],
	CONCAT(PE2.Nombre, ' ',  PE2.Paterno, ' ', PE2.Materno) AS [Directo Academico],
	PR.Clave, PR.Nombre
FROM [FormatosTESE].[dbo].[HojaCalificaciones] AS HC
	INNER JOIN [FormatosTESE].[dbo].[Programa] AS PR ON PR.Id = HC.NumPrograma
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = HC.NumResponsable
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP1 ON CP1.Id = HC.NumJefe
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP2 ON CP2.Id = HC.NumDirector
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE ON PE.Id = CP.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE1 ON PE1.Id = CP1.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE2 ON PE2.Id = CP2.NumPersona;

-- SELECT TOP(5) * FROM [FormatosTESE].[dbo].[aaaaaaa] WITH (NOLOCK);