/*
	***** Reporte de Avance del Proyecto de Investigación *****
	+++++ FO-TESE-DA-72-PIDT06 +++++
*/

/*
	Tablas:
		- Proyecto
		- CargoPersona
		- Cargo
		- Persona
		- CronogramaProyecto
		- DivisionAcademica
*/

-- Consulta General
SELECT CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, CURRENT_DATE() AS FechaReporte, C.Descripcion AS Cargo, CONCAT(P.Nombre, ' ',  P.Paterno, ' ', P.Materno) AS CoordinadorProyecto
FROM Proyecto AS PY
	INNER JOIN CargoPersona AS CP ON CP.Id = PY.NumCoordinador
	INNER JOIN Cargo AS C ON C.Id = CP.NumCargo
	INNER JOIN Persona AS P ON P.Id = CP.NumPersona
WHERE PY.Clave = 'Proy-01';

-- Cronograma del Proyecto
SELECT CP.Numero, CP.Actividad, CP.PorcentajeAvance
FROM CronogramaProyecto AS CP
INNER JOIN Proyecto AS PY ON PY.Id = CP.NumProyecto
WHERE PY.Clave = 'Proy-01';

-- Personas
SELECT C.Descripcion AS Cargo, P.Nombre, P.Paterno, P.Materno, DA.Descripcion AS DivisionAcademica
FROM CargoPersona AS CP
	INNER JOIN Cargo AS C ON C.Id = CP.NumCargo
	INNER JOIN Persona AS P ON P.Id = CP.NumPersona
	INNER JOIN DivisionAcademica AS DA ON DA.Id = CP.NumDivisionAcademica
WHERE DA.Descripcion = 'División de Ingeniería en Sistemas Computacionales'
AND C.Descripcion IN ('Responsable de la Función de Investigación', 'Jefe de División', 'Director Académico');

-- Persona Opcion 2
SELECT CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, CURRENT_DATE() AS FechaReporte,
	CONCAT(P.Nombre, ' ',  P.Paterno, ' ', P.Materno) AS Responsable,
	CONCAT(PJEF.Nombre, ' ',  PJEF.Paterno, ' ', PJEF.Materno) AS JefeDivision,
	CONCAT(PDIR.Nombre, ' ',  PDIR.Paterno, ' ', PDIR.Materno) AS DirectorAcademico
FROM Proyecto AS PY
	INNER JOIN HojaAnalisis AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN Evaluacion AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN CargoPersona AS RESP ON RESP.Id = EV.NumResponsable
	INNER JOIN Persona AS P ON P.Id = RESP.NumPersona
	INNER JOIN CargoPersona AS JEF ON JEF.Id = EV.NumJefe
	INNER JOIN Persona AS PJEF ON PJEF.Id = JEF.NumPersona
	INNER JOIN CargoPersona AS DIR ON DIR.Id = EV.NumDirector
	INNER JOIN Persona AS PDIR ON PDIR.Id = DIR.NumPersona
WHERE PY.Clave = 'Proy-01';