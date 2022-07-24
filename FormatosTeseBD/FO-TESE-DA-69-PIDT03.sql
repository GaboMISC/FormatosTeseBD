/*
	***** Protocolo para la Evaluación de Proyectos de Investigación *****
	+++++ FO-TESE-DA-69-PIDT03 +++++
*/

/*
	Tablas:
		- Evaluacion
		- HojaAnalisis
		- Prioridad
		- CargoPersona
		- Persona
		- Evaluadores
		- Proyecto
		- ProyectosPrograma
		- Programa
*/

-- Evaluadores del Proyecto
SELECT PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, EVS.NumEvaluacion AS EvaluaciónId, CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS Evaluador
FROM Proyecto AS PY
	INNER JOIN HojaAnalisis AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN Evaluacion AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN Evaluadores AS EVS ON EVS.NumEvaluacion = EV.Id
	INNER JOIN CargoPersona AS CP ON CP.Id = EVS.NumCargoPersona
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;
WHERE PY.Clave = 'Proy-01';

-- Consulta General
SELECT PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, HA.Total AS TotalHojaDeAnalisis, EV.Calificacion, CONCAT(PR.Letra, ', ', PR.Descripcion) AS Prioridad,
	CONCAT(P.Nombre, ' ',  P.Paterno, ' ', P.Materno) AS Responsable,
	CONCAT(PJEF.Nombre, ' ',  PJEF.Paterno, ' ', PJEF.Materno) AS JefeDeDivision,
	CONCAT(PDIR.Nombre, ' ',  PDIR.Paterno, ' ', PDIR.Materno) AS DirectorAcademico
FROM Evaluacion AS EV	
	INNER JOIN HojaAnalisis AS HA ON HA.Id = EV.NumHojaAnalisis
	INNER JOIN Proyecto AS PY ON PY.Id = HA.NumProyecto
	INNER JOIN Prioridad AS PR ON PR.Id = EV.NumPrioridad
	INNER JOIN CargoPersona AS RESP ON RESP.Id = EV.NumResponsable
	INNER JOIN Persona AS P ON P.Id = RESP.NumPersona
	INNER JOIN CargoPersona AS JEF ON JEF.Id = EV.NumJefe
	INNER JOIN Persona AS PJEF ON PJEF.Id = JEF.NumPersona
	INNER JOIN CargoPersona AS DIR ON DIR.Id = EV.NumDirector
	INNER JOIN Persona AS PDIR ON PDIR.Id = DIR.NumPersona
WHERE PY.Clave = 'Proy-01';

-- Hoja de Analisis Tecnico al Proyeccto de Investigación
SELECT CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno, ' - ', CA.Descripcion) AS Coordinador, CONCAT(PG.Clave, ', ',  PG.Nombre) AS Programa
FROM Proyecto AS PY
	INNER JOIN CargoPersona AS CP ON CP.Id = PY.NumCoordinador
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona
	INNER JOIN Cargo AS CA ON CA.Id = CP.NumCargo
	INNER JOIN ProyectosPrograma AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN Programa AS PG ON PG.Id = PP.NumPrograma
WHERE PY.Clave = 'Proy-01';

-- Criterios Generales de la Evaluacion (Calidad de la Propuesta, Factibilidad y Viabilidad de la Propuesta)
SELECT HA.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, HA.AntecedentesJustificacion, HA.Metodologia, HA.Objetivos, HA.Impacto, HA.SectorPublico, HA.FormacionRH, HA.SubtotalCriterios, HA.cInfraestructura, HA.cActividades, HA.cRH, HA.cProgramacion, HA.cPresupuesto, HA.SubtotalViabilidad, HA.Total
FROM HojaAnalisis AS HA
	INNER JOIN Proyecto AS PY ON PY.Id = HA.NumProyecto
WHERE PY.Clave = 'Proy-01';