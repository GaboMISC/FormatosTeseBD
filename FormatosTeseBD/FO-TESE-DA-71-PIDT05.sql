/*
	***** Dictamen de Programa y/o Proyecto de Investigación *****
	+++++ FO-TESE-DA-71-PIDT05 +++++
*/

/*
	Tablas:
		- OficioDictamen
		- Proyecto
		- CargoPersona
		- Persona
		- ProyectosPrograma
		- ProgramasDivision
		- DivisionAcademica
		- ComiteEvaluador
*/

-- Consulta General
SELECT OD.NoOficio, CURRENT_DATE() AS FechaOficio, CONCAT(P.Nombre, ' ', P.Paterno, ' ', P.Materno) AS PersonaDocumento, OD.FechaOficio AS FechaComite, PY.Nombre AS NombreProyecto, PY.Clave AS ClaveProyecto
FROM OficioDictamen AS OD
	INNER JOIN Proyecto AS PY ON PY.Id = OD.NumProyecto
	INNER JOIN CargoPersona AS CP ON CP.Id = PY.NumCoordinador
	INNER JOIN Persona AS P ON P.Id = CP.NumPersona
WHERE PY.Clave = 'Proy-01';

-- Division Academica
SELECT DA.Descripcion AS DivisionAcademica
FROM Proyecto AS PY
	INNER JOIN ProyectosPrograma AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN Programa AS PG ON PG.Id = PP.NumPrograma
	INNER JOIN ProgramasDivision AS PD ON PD.NumPrograma = PG.Id
	INNER JOIN DivisionAcademica AS DA ON DA.Id = PD.NumDivision
WHERE PY.Clave = 'Proy-01';

-- Comite Evaluador
SELECT OD.NoOficio, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno) AS IntegranteComiteEvaluador
FROM Proyecto AS PY
	INNER JOIN OficioDictamen AS OD ON OD.NumProyecto = PY.Id
	INNER JOIN ComiteEvaluador AS CE ON CE.NumOficioDictamen = OD.Id
	INNER JOIN CargoPersona AS CP ON CP.Id = CE.NumIntegranteComite
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona
WHERE PY.Clave = 'Proy-01';