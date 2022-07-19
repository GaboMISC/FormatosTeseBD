/*
	***** Reporte de Avance del Proyecto de Investigación *****
	+++++ FO-TESE-DA-72-PIDT06 +++++
*/

-- Consulta General
SELECT CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, GETDATE() AS [Fecha del Reporte], C.Descripcion AS Cargo, CONCAT(P.Nombre, ' ',  P.Paterno, ' ', P.Materno) AS [Coordinador Proyecto]
FROM [FormatosTESE].[dbo].[Proyecto] AS PY
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = PY.NumCoordinador
	INNER JOIN [FormatosTESE].[dbo].[Cargo] AS C ON C.Id = CP.NumCargo
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS P ON P.Id = CP.NumPersona;

-- Cronograma del Proyecto
SELECT TOP(5) CP.Numero, CP.Actividad, CP.PorcentajeAvance
FROM [FormatosTESE].[dbo].[CronogramaProyecto] AS CP
INNER JOIN [FormatosTESE].[dbo].[Proyecto] AS PY ON PY.Id = CP.NumProyecto;

-- Personas
SELECT C.Descripcion AS Cargo, P.Nombre, P.Paterno, P.Materno, DA.Descripcion AS [Division Academica]
FROM [FormatosTESE].[dbo].[CargoPersona] AS CP
	INNER JOIN [FormatosTESE].[dbo].[Cargo] AS C ON C.Id = CP.NumCargo
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS P ON P.Id = CP.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[DivisionAcademica] AS DA ON DA.Id = CP.NumDivisionAcademica
WHERE DA.Descripcion = 'División de Ingeniería en Sistemas Computacionales'
AND C.Descripcion IN ('Responsable de la Función de Investigación', 'Jefe de División', 'Director Académico');

-- Persona Opcion 2
SELECT CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, GETDATE() AS [Fecha del Reporte],
	CONCAT(P.Nombre, ' ',  P.Paterno, ' ', P.Materno) AS [Responsable],
	CONCAT(PJEF.Nombre, ' ',  PJEF.Paterno, ' ', PJEF.Materno) AS [Jefe de Division],
	CONCAT(PDIR.Nombre, ' ',  PDIR.Paterno, ' ', PDIR.Materno) AS [Director Academico]
FROM [FormatosTESE].[dbo].[Proyecto] AS PY
	INNER JOIN [FormatosTESE].[dbo].[HojaAnalisis] AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN [FormatosTESE].[dbo].[Evaluacion] AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS RESP ON RESP.Id = EV.NumResponsable
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS P ON P.Id = RESP.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS JEF ON JEF.Id = EV.NumJefe
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PJEF ON PJEF.Id = JEF.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS DIR ON DIR.Id = EV.NumDirector
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PDIR ON PDIR.Id = DIR.NumPersona;