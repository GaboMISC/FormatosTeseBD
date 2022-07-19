/*
	***** Hoja de Calificaciones para Programa de Investigación *****
	+++++ FO-TESE-DA-70-PIDT04 +++++
*/

/*
	Tablas:
		- [Programa]
		- [CargoPersona]
		- [Persona]
		- [ProyectosPrograma]
		- [Proyecto]
		- [HojaAnalisis]
		- [Evaluacion]
		- [HojaCalificaciones]
		- [Evaluadores]
*/

-- Consulta General
SELECT PG.Nombre, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno) AS [Coordinador del Programa]
FROM [FormatosTESE].[dbo].[Programa] AS PG
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = PG.NumCoordinador
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE ON PE.Id = CP.NumPersona
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Proyectos del Programa
SELECT CONCAT(PG.Clave, ', ', PG.Nombre) AS [Nombre del Programa], CONCAT(PY.Clave, ', ', PY.Nombre) AS [Nombre del Proyecto]
FROM [FormatosTESE].[dbo].[Programa] AS PG
	INNER JOIN [FormatosTESE].[dbo].[ProyectosPrograma] AS PP ON PP.NumPrograma = PG.Id
	INNER JOIN [FormatosTESE].[dbo].[Proyecto] AS PY ON PY.Id = PP.NumProyecto
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Calificaciones Proyecto
SELECT CONCAT(PY.Clave, ', ', PY.Nombre) AS [Nombre del Proyecto], EV.Calificacion AS [Calificacion del Proyecto]
FROM [FormatosTESE].[dbo].[Proyecto] AS PY
	INNER JOIN [FormatosTESE].[dbo].[HojaAnalisis] AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN [FormatosTESE].[dbo].[Evaluacion] AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN [FormatosTESE].[dbo].[ProyectosPrograma] AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN [FormatosTESE].[dbo].[Programa] AS PG ON PG.Id = PP.NumPrograma
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Calculos
SELECT SUM(EV.Calificacion) AS [Sumatoria de Calificaciones], COUNT(PY.Id) AS [Numero de Proyectos], AVG(EV.Calificacion) AS [Promedio Proyectos]
FROM [FormatosTESE].[dbo].[Proyecto] AS PY
	INNER JOIN [FormatosTESE].[dbo].[HojaAnalisis] AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN [FormatosTESE].[dbo].[Evaluacion] AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN [FormatosTESE].[dbo].[ProyectosPrograma] AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN [FormatosTESE].[dbo].[Programa] AS PG ON PG.Id = PP.NumPrograma
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Criterio de Aceptacion o Rechazo del Programa
SELECT CONCAT(PG.Clave, ' ', PG.Nombre) AS Programa, HC.AceptacionPrograma
FROM [FormatosTESE].[dbo].[Programa] AS PG
	INNER JOIN [FormatosTESE].[dbo].[HojaCalificaciones] AS HC ON HC.NumPrograma = PG.Id
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Evaluadores del Programa
SELECT PE.Nombre, PE.Paterno, PE.Materno, CONCAT(PG.Clave, ' ', PG.Nombre) AS Programa, CONCAT(PY.Clave, ' ', PY.Nombre) AS Proyecto
FROM [FormatosTESE].[dbo].[Programa] AS PG
	INNER JOIN [FormatosTESE].[dbo].[ProyectosPrograma] AS PP ON PP.NumPrograma = PG.Id
	INNER JOIN [FormatosTESE].[dbo].[Proyecto] AS PY ON PY.Id = PP.NumProyecto
	INNER JOIN [FormatosTESE].[dbo].[HojaAnalisis] AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN [FormatosTESE].[dbo].[Evaluacion] AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN [FormatosTESE].[dbo].[Evaluadores] AS EVS ON EVS.NumEvaluacion = EV.Id
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS CP ON CP.Id = EVS.NumCargoPersona
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PE ON PE.Id = CP.NumPersona
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';

-- Personas
SELECT CONCAT(PRESP.Nombre, ' ', PRESP.Paterno, ' ', PRESP.Materno) AS [Responsable],
	CONCAT(PJEF.Nombre, ' ', PJEF.Paterno, ' ', PJEF.Materno) AS [Jefe],
	CONCAT(PDIR.Nombre, ' ', PDIR.Paterno, ' ', PDIR.Materno) AS [Director],
	CONCAT(PG.Clave, ' ', PG.Nombre) AS Programa
FROM [FormatosTESE].[dbo].[Programa] AS PG
	INNER JOIN [FormatosTESE].[dbo].[HojaCalificaciones] AS HC ON HC.NumPrograma = PG.Id
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS RESP ON RESP.Id = HC.NumResponsable
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PRESP ON PRESP.Id = RESP.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS JEF ON JEF.Id = HC.NumJefe
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PJEF ON PJEF.Id = JEF.NumPersona
	INNER JOIN [FormatosTESE].[dbo].[CargoPersona] AS DIR ON DIR.Id = HC.NumDirector
	INNER JOIN [FormatosTESE].[dbo].[Persona] AS PDIR ON PDIR.Id = DIR.NumPersona
WHERE PG.Nombre = 'Maestría en Ingeniería en Sistemas Computacionales';