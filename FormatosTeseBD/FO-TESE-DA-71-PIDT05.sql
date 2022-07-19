/*
	***** Dictamen de Programa y/o Proyecto de Investigación *****
	+++++ FO-TESE-DA-71-PIDT05 +++++
*/

/*
	Tablas:
		- [OficioDictamen]
		- [Proyecto]
		- [CargoPersona]
		- [Persona]
		- [ProyectosPrograma]
		- [ProgramasDivision]
		- [DivisionAcademica]
		- [ComiteEvaluador]
*/

-- Consulta General
SELECT OD.NoOficio, GETDATE() AS [Fecha Oficio], CONCAT(P.Nombre, ' ', P.Paterno, ' ', P.Materno) AS [Persona Documento], OD.FechaOficio AS [Fecha Comite], PY.Nombre AS [Nombre Proyecto], PY.Clave AS [Clave Proyecto]
FROM [FormatosTESE].[dbo].[OficioDictamen] AS OD
	INNER JOIN [FormatosTESE].[dbo].[Proyecto] AS PY ON PY.Id = OD.NumProyecto
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = PY.NumCoordinador
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS P ON P.Id = CP.NumPersona
WHERE PY.Clave = 'Proy-01';

-- Division Academica
SELECT DA.Descripcion AS [Division Academica]
FROM [FormatosTESE].[dbo].[Proyecto] AS PY
	INNER JOIN [FormatosTESE].[dbo].[ProyectosPrograma] AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN [FormatosTESE].[dbo].[Programa] AS PG ON PG.Id = PP.NumPrograma
	INNER JOIN [FormatosTESE].[dbo].[ProgramasDivision] AS PD ON PD.NumPrograma = PG.Id
	INNER JOIN [FormatosTESE].[dbo].[DivisionAcademica] AS DA ON DA.Id = PD.NumDivision
WHERE PY.Clave = 'Proy-01';

-- Comite Evaluador
SELECT OD.NoOficio, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno) AS [Integrante del Comite Evaluador]
FROM [FormatosTESE].[dbo].[Proyecto] AS PY
	INNER JOIN [FormatosTESE].[dbo].[OficioDictamen] AS OD ON OD.NumProyecto = PY.Id
	INNER JOIN [FormatosTESE].[dbo].[ComiteEvaluador] AS CE ON CE.NumOficioDictamen = OD.Id
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = CE.NumIntegranteComite
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE ON PE.Id = CP.NumPersona
WHERE PY.Clave = 'Proy-01';