/*
	***** Protocolo para la Evaluación de Proyectos de Investigación *****
	+++++ FO-TESE-DA-69-PIDT03 +++++
*/

/*
	Tablas:
		- [Evaluacion]
		- [HojaAnalisis]
		- [Prioridad]
		- [CargoPersona]
		- [Persona]
		- [Evaluadores]
		- [Proyecto]
		- [ProyectosPrograma]
		- [Programa]
*/

-- Consulta General
SELECT HA.Total AS [Total Hoja de Analisis], EV.Calificacion, CONCAT(PR.Letra, ', ', PR.Descripcion) AS Prioridad,
	CONCAT(P.Nombre, ' ',  P.Paterno, ' ', P.Materno) AS [Responsable],
	CONCAT(PJEF.Nombre, ' ',  PJEF.Paterno, ' ', PJEF.Materno) AS [Jefe de Division],
	CONCAT(PDIR.Nombre, ' ',  PDIR.Paterno, ' ', PDIR.Materno) AS [Director Academico]
FROM [FormatosTESE].[dbo].[Evaluacion] AS EV
	INNER JOIN [FormatosTESE].[dbo].[HojaAnalisis] AS HA ON HA.Id = EV.NumHojaAnalisis
	INNER JOIN [FormatosTESE].[dbo].[Prioridad] AS PR ON PR.Id = EV.NumPrioridad
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS RESP ON RESP.Id = EV.NumResponsable
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS P ON P.Id = RESP.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS JEF ON JEF.Id = EV.NumJefe
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PJEF ON PJEF.Id = JEF.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS DIR ON DIR.Id = EV.NumDirector
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PDIR ON PDIR.Id = DIR.NumPersona;

-- Evaluadores
SELECT TOP(5) ES.NumEvaluacion AS [Evaluación Id], CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS [Evaluador]
FROM [FormatosTESE].[dbo].[Evaluadores] AS ES
INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = ES.NumCargoPersona
INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE ON PE.Id = CP.NumPersona;

-- Hoja de Analisis Tecnico al Proyeccto de Investigación
SELECT CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno, ' - ', CA.Descripcion) AS Coordinador, CONCAT(PG.Clave, ', ',  PG.Nombre) AS Programa
FROM [FormatosTESE].[dbo].[Proyecto] AS PY
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = PY.NumCoordinador
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE ON PE.Id = CP.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[Cargo] AS CA ON CA.Id = CP.NumCargo
	INNER JOIN [FormatosTESE].[dbo].[ProyectosPrograma] AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN [FormatosTESE].[dbo].[Programa] AS PG ON PG.Id = PP.NumPrograma;

-- Criterios Generales de la Evaluacion (Calidad de la Propuesta, Factibilidad y Viabilidad de la Propuesta)
SELECT TOP(5) HA.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, HA.AntecedentesJustificacion, HA.Metodologia, HA.Objetivos, HA.Impacto, HA.SectorPublico, HA.FormacionRH, HA.SubtotalCriterios, HA.cInfraestructura, HA.cActividades, HA.cRH, HA.cProgramacion, HA.cPresupuesto, HA.SubtotalViabilidad, HA.Total
FROM [FormatosTESE].[dbo].[HojaAnalisis] AS HA
INNER JOIN [FormatosTESE].[dbo].[Proyecto] AS PY ON PY.Id = HA.NumProyecto;

-- Evaluadores del Proyecto
SELECT TOP(5) ES.NumEvaluacion AS [Evaluación Id], CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS [Evaluador]
FROM [FormatosTESE].[dbo].[Proyecto] AS PY
	INNER JOIN [FormatosTESE].[dbo].[HojaAnalisis] AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN [FormatosTESE].[dbo].[Evaluacion] AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN [FormatosTESE].[dbo].[Evaluadores] AS ES ON ES.NumEvaluacion = EV.Id
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = ES.NumCargoPersona
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE ON PE.Id = CP.NumPersona;