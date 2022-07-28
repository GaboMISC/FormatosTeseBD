/*
	***** Hoja de Calificaciones para Programa de Investigación *****
	+++++ FO-TESE-DA-70-PIDT04 +++++
*/

/*
	Tablas:
		- Programa
		- CargoPersona
		- Persona
		- ProyectosPrograma
		- Proyecto
		- HojaAnalisis
		- Evaluacion
		- HojaCalificaciones
		- Evaluadores
*/

-- Consulta General
SELECT PG.Nombre, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno) AS CoordinadorPrograma
FROM Programa AS PG
	INNER JOIN CargoPersona AS CP ON CP.Id = PG.NumCoordinador
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Proyectos del Programa
SELECT CONCAT(PG.Clave, ', ', PG.Nombre) AS NombrePrograma, CONCAT(PY.Clave, ', ', PY.Nombre) AS NombreProyecto
FROM Programa AS PG
	INNER JOIN ProyectosPrograma AS PP ON PP.NumPrograma = PG.Id
	INNER JOIN Proyecto AS PY ON PY.Id = PP.NumProyecto
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Calificaciones Proyecto
SELECT CONCAT(PY.Clave, ', ', PY.Nombre) AS NombreProyecto, EV.Calificacion AS CalificacionProyecto
FROM Proyecto AS PY
	INNER JOIN HojaAnalisis AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN Evaluacion AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN ProyectosPrograma AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN Programa AS PG ON PG.Id = PP.NumPrograma
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Calculos
SELECT SUM(EV.Calificacion) AS SumatoriaCalificaciones, COUNT(PY.Id) AS NumeroProyectos, AVG(EV.Calificacion) AS PromedioProyectos
FROM Proyecto AS PY
	INNER JOIN HojaAnalisis AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN Evaluacion AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN ProyectosPrograma AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN Programa AS PG ON PG.Id = PP.NumPrograma
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Criterio de Aceptacion o Rechazo del Programa
SELECT CONCAT(PG.Clave, ' ', PG.Nombre) AS Programa, HC.AceptacionPrograma
FROM Programa AS PG
	INNER JOIN HojaCalificaciones AS HC ON HC.NumPrograma = PG.Id
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Evaluadores del Programa
SELECT PE.Nombre, PE.Paterno, PE.Materno, CONCAT(PG.Clave, ' ', PG.Nombre) AS Programa, CONCAT(PY.Clave, ' ', PY.Nombre) AS Proyecto
FROM Programa AS PG
	INNER JOIN ProyectosPrograma AS PP ON PP.NumPrograma = PG.Id
	INNER JOIN Proyecto AS PY ON PY.Id = PP.NumProyecto
	INNER JOIN HojaAnalisis AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN Evaluacion AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN Evaluadores AS EVS ON EVS.NumEvaluacion = EV.Id
	INNER JOIN CargoPersona AS CP ON CP.Id = EVS.NumCargoPersona
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Personas
SELECT CONCAT(PRESP.Nombre, ' ', PRESP.Paterno, ' ', PRESP.Materno) AS Responsable,
	CONCAT(PJEF.Nombre, ' ', PJEF.Paterno, ' ', PJEF.Materno) AS Jefe,
	CONCAT(PDIR.Nombre, ' ', PDIR.Paterno, ' ', PDIR.Materno) AS Director,
	CONCAT(PG.Clave, ' ', PG.Nombre) AS Programa
FROM Programa AS PG
	INNER JOIN HojaCalificaciones AS HC ON HC.NumPrograma = PG.Id
	INNER JOIN CargoPersona AS RESP ON RESP.Id = HC.NumResponsable
	INNER JOIN Persona AS PRESP ON PRESP.Id = RESP.NumPersona
	INNER JOIN CargoPersona AS JEF ON JEF.Id = HC.NumJefe
	INNER JOIN Persona AS PJEF ON PJEF.Id = JEF.NumPersona
	INNER JOIN CargoPersona AS DIR ON DIR.Id = HC.NumDirector
	INNER JOIN Persona AS PDIR ON PDIR.Id = DIR.NumPersona
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';