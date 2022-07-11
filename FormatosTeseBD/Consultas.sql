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

-- SELECT TOP(5) * FROM [FormatosTESE].[dbo].[aaaaaaa] WITH (NOLOCK);