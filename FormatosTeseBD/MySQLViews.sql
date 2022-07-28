USE FormatosTESE;

-- Evaluadores del Proyecto
CREATE VIEW vEvaluadoresProyecto
AS
SELECT PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, EVS.NumEvaluacion AS EvaluaciónId, CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS Evaluador
FROM Proyecto AS PY
	INNER JOIN HojaAnalisis AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN Evaluacion AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN Evaluadores AS EVS ON EVS.NumEvaluacion = EV.Id
	INNER JOIN CargoPersona AS CP ON CP.Id = EVS.NumCargoPersona
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;

-- Se ejecuta la Vista
-- SELECT * FROM vEvaluadoresProyecto WHERE ClaveProyecto = 'Proy-01';

-- Datos Generales Formato 69
CREATE VIEW vFormato69
AS
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
	INNER JOIN Persona AS PDIR ON PDIR.Id = DIR.NumPersona;

-- SELECT * FROM vFormato69 WHERE ClaveProyecto = 'Proy-01';