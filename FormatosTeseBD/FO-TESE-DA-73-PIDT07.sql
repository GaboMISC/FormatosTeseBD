/*
	***** Dictamen y Carta de Liberación del Programa y/o Proyecto de Investigación *****
	+++++ FO-TESE-DA-73-PIDT07 +++++
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
SELECT OD.NoOficio, OD.FechaOficio AS FechaOficio, PY.Nombre AS NombreProyecto, PY.Clave AS ClaveProyecto, CONCAT(P.Nombre, ' ', P.Paterno, ' ', P.Materno) AS PersonaEnvioDocumento
FROM OficioDictamen AS OD
	INNER JOIN Proyecto AS PY ON PY.Id = OD.NumProyecto
	INNER JOIN CargoPersona AS CP ON CP.Id = PY.NumCoordinador
	INNER JOIN Persona AS P ON P.Id = CP.NumPersona
WHERE PY.Clave = 'Proy-01';

-- Division Academica
SELECT DA.Descripcion AS DivisionAcademica, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto
FROM Proyecto AS PY
	INNER JOIN ProyectosPrograma AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN ProgramasDivision AS PD ON PD.NumPrograma = PP.NumPrograma
	INNER JOIN DivisionAcademica AS DA ON DA.Id = PD.NumDivision
WHERE PY.Clave = 'Proy-01';

-- Comite Evaluador
SELECT OD.NoOficio, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno) AS IntegranteComiteEvaluador, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto
FROM Proyecto AS PY
	INNER JOIN OficioDictamen AS OD ON OD.NumProyecto = PY.Id
	INNER JOIN ComiteEvaluador AS CE ON CE.NumOficioDictamen = OD.Id
	INNER JOIN CargoPersona AS CP ON CP.Id = CE.NumIntegranteComite
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona
WHERE PY.Clave = 'Proy-01';