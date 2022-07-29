USE FormatosTESE;

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

-- Consulta con la Vista
-- SELECT * FROM vFormato69 WHERE ClaveProyecto = 'Proy-01';

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

-- Consulta con la Vista
-- SELECT * FROM vEvaluadoresProyecto WHERE ClaveProyecto = 'Proy-01';

-- Hoja de Analisis Tecnico al Proyecto de Investigación
CREATE VIEW vFormato69HojaAnalisisProyecto
AS
SELECT PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno, ' - ', CA.Descripcion) AS Coordinador, PG.Clave AS ClavePrograma, PG.Nombre AS NombrePrograma
FROM Proyecto AS PY
	INNER JOIN CargoPersona AS CP ON CP.Id = PY.NumCoordinador
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona
	INNER JOIN Cargo AS CA ON CA.Id = CP.NumCargo
	INNER JOIN ProyectosPrograma AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN Programa AS PG ON PG.Id = PP.NumPrograma;

-- Consulta con la Vista
-- SELECT * FROM vFormato69HojaAnalisisProyecto WHERE ClaveProyecto = 'Proy-01';

-- Criterios Generales de la Evaluacion (Calidad de la Propuesta, Factibilidad y Viabilidad de la Propuesta)
CREATE VIEW vFormato69PuntuacionCriteriosGeneralesEvaluacion
AS
SELECT HA.Id, PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, HA.AntecedentesJustificacion, HA.Metodologia, HA.Objetivos, HA.Impacto, HA.SectorPublico, HA.FormacionRH, HA.SubtotalCriterios, HA.cInfraestructura, HA.cActividades, HA.cRH, HA.cProgramacion, HA.cPresupuesto, HA.SubtotalViabilidad, HA.Total
FROM HojaAnalisis AS HA
	INNER JOIN Proyecto AS PY ON PY.Id = HA.NumProyecto;

-- Consulta con la Vista
-- SELECT * FROM vFormato69PuntuacionCriteriosGeneralesEvaluacion WHERE ClaveProyecto = 'Proy-01';

/* ***** FO-TESE-DA-70-PIDT04 ***** */

-- Consulta General
CREATE VIEW vFormato70
AS
SELECT PG.Clave AS ClavePrograma, PG.Nombre AS NombrePrograma, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno) AS CoordinadorPrograma
FROM Programa AS PG
	INNER JOIN CargoPersona AS CP ON CP.Id = PG.NumCoordinador
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato70 WHERE ClavePrograma = 'MISC-02';

-- Proyectos del Programa
CREATE VIEW vFormato70ProyectosPrograma
AS
SELECT PG.Clave AS ClavePrograma, PG.Nombre AS NombrePrograma, CONCAT(PY.Clave, ', ', PY.Nombre) AS NombreProyecto
FROM Programa AS PG
	INNER JOIN ProyectosPrograma AS PP ON PP.NumPrograma = PG.Id
	INNER JOIN Proyecto AS PY ON PY.Id = PP.NumProyecto;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato70ProyectosPrograma WHERE ClavePrograma = 'MISC-02';

-- Calificaciones Proyecto
CREATE VIEW vFormato70CalificacionesProyecto
AS
SELECT PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, EV.Calificacion AS CalificacionProyecto
FROM Proyecto AS PY
	INNER JOIN HojaAnalisis AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN Evaluacion AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN ProyectosPrograma AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN Programa AS PG ON PG.Id = PP.NumPrograma;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato70CalificacionesProyecto WHERE ClaveProyecto = 'Proy-01';

-- Calculos
CREATE VIEW vFormato70CalculosProyecto
AS
SELECT PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, SUM(EV.Calificacion) AS SumatoriaCalificaciones, COUNT(PY.Id) AS NumeroProyectos, AVG(EV.Calificacion) AS PromedioProyectos
FROM Proyecto AS PY
	INNER JOIN HojaAnalisis AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN Evaluacion AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN ProyectosPrograma AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN Programa AS PG ON PG.Id = PP.NumPrograma;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato70CalculosProyecto WHERE ClaveProyecto = 'Proy-01';

-- Criterio de Aceptacion o Rechazo del Programa
CREATE VIEW vFormato70CriteriosAceptacion
AS
SELECT PG.Clave AS ClavePrograma, PG.Nombre AS NombrePrograma, HC.AceptacionPrograma
FROM Programa AS PG
	INNER JOIN HojaCalificaciones AS HC ON HC.NumPrograma = PG.Id;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato70CriteriosAceptacion WHERE ClavePrograma = 'MISC-02';

-- Evaluadores del Programa
CREATE VIEW vFormato70EvaluadoresPrograma
AS
SELECT PG.Clave AS ClavePrograma, PG.Nombre AS NombrePrograma, PE.Nombre, PE.Paterno, PE.Materno, PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto
FROM Programa AS PG
	INNER JOIN ProyectosPrograma AS PP ON PP.NumPrograma = PG.Id
	INNER JOIN Proyecto AS PY ON PY.Id = PP.NumProyecto
	INNER JOIN HojaAnalisis AS HA ON HA.NumProyecto = PY.Id
	INNER JOIN Evaluacion AS EV ON EV.NumHojaAnalisis = HA.Id
	INNER JOIN Evaluadores AS EVS ON EVS.NumEvaluacion = EV.Id
	INNER JOIN CargoPersona AS CP ON CP.Id = EVS.NumCargoPersona
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato70EvaluadoresPrograma WHERE ClaveProyecto = 'Proy-01';

-- Personas
CREATE VIEW vFormato70Personas
AS
SELECT PG.Clave AS ClavePrograma, PG.Nombre AS NombrePrograma,
	CONCAT(PRESP.Nombre, ' ', PRESP.Paterno, ' ', PRESP.Materno) AS Responsable,
	CONCAT(PJEF.Nombre, ' ', PJEF.Paterno, ' ', PJEF.Materno) AS Jefe,
	CONCAT(PDIR.Nombre, ' ', PDIR.Paterno, ' ', PDIR.Materno) AS Director
FROM Programa AS PG
	INNER JOIN HojaCalificaciones AS HC ON HC.NumPrograma = PG.Id
	INNER JOIN CargoPersona AS RESP ON RESP.Id = HC.NumResponsable
	INNER JOIN Persona AS PRESP ON PRESP.Id = RESP.NumPersona
	INNER JOIN CargoPersona AS JEF ON JEF.Id = HC.NumJefe
	INNER JOIN Persona AS PJEF ON PJEF.Id = JEF.NumPersona
	INNER JOIN CargoPersona AS DIR ON DIR.Id = HC.NumDirector
	INNER JOIN Persona AS PDIR ON PDIR.Id = DIR.NumPersona;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato70Personas WHERE ClavePrograma = 'MISC-02';

/* ***** FO-TESE-DA-71-PIDT05 ***** */

-- vFormato71
CREATE VIEW vFormato71
AS
SELECT PY.Nombre AS NombreProyecto, PY.Clave AS ClaveProyecto, OD.NoOficio, CURRENT_DATE() AS FechaOficio, CONCAT(P.Nombre, ' ', P.Paterno, ' ', P.Materno) AS PersonaDocumento, OD.FechaOficio AS FechaComite
FROM OficioDictamen AS OD
	INNER JOIN Proyecto AS PY ON PY.Id = OD.NumProyecto
	INNER JOIN CargoPersona AS CP ON CP.Id = PY.NumCoordinador
	INNER JOIN Persona AS P ON P.Id = CP.NumPersona;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato71 WHERE ClaveProyecto = 'Proy-01';

-- Division Academica
CREATE VIEW vFormato71DivisionAcademica
AS
SELECT PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, DA.Descripcion AS DivisionAcademica
FROM Proyecto AS PY
	INNER JOIN ProyectosPrograma AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN Programa AS PG ON PG.Id = PP.NumPrograma
	INNER JOIN ProgramasDivision AS PD ON PD.NumPrograma = PG.Id
	INNER JOIN DivisionAcademica AS DA ON DA.Id = PD.NumDivision;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato71DivisionAcademica WHERE ClaveProyecto = 'Proy-01';

-- Comite Evaluador
CREATE VIEW vFormato71ComiteEvaluador
AS
SELECT PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, OD.NoOficio, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno) AS IntegranteComiteEvaluador
FROM Proyecto AS PY
	INNER JOIN OficioDictamen AS OD ON OD.NumProyecto = PY.Id
	INNER JOIN ComiteEvaluador AS CE ON CE.NumOficioDictamen = OD.Id
	INNER JOIN CargoPersona AS CP ON CP.Id = CE.NumIntegranteComite
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato71ComiteEvaluador WHERE ClaveProyecto = 'Proy-01';

/* ***** FO-TESE-DA-72-PIDT06 ***** */

-- vFormato72
CREATE VIEW vFormato72
AS
SELECT PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, CURRENT_DATE() AS FechaReporte, C.Descripcion AS Cargo, CONCAT(P.Nombre, ' ',  P.Paterno, ' ', P.Materno) AS CoordinadorProyecto
FROM Proyecto AS PY
	INNER JOIN CargoPersona AS CP ON CP.Id = PY.NumCoordinador
	INNER JOIN Cargo AS C ON C.Id = CP.NumCargo
	INNER JOIN Persona AS P ON P.Id = CP.NumPersona;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato72 WHERE ClaveProyecto = 'Proy-01';

-- Cronograma del Proyecto
CREATE VIEW vFormato72CronogramaProyecto
AS
SELECT PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, CP.Numero, CP.Actividad, CP.PorcentajeAvance
FROM CronogramaProyecto AS CP
INNER JOIN Proyecto AS PY ON PY.Id = CP.NumProyecto;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato72CronogramaProyecto WHERE ClaveProyecto = 'Proy-01';

-- Personas
CREATE VIEW vFormato72Personas
AS
SELECT C.Descripcion AS Cargo, P.Nombre, P.Paterno, P.Materno, DA.Descripcion AS DivisionAcademica
FROM CargoPersona AS CP
	INNER JOIN Cargo AS C ON C.Id = CP.NumCargo
	INNER JOIN Persona AS P ON P.Id = CP.NumPersona
	INNER JOIN DivisionAcademica AS DA ON DA.Id = CP.NumDivisionAcademica;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato72Personas WHERE DivisionAcademica = 'División de Ingeniería en Sistemas Computacionales' AND Cargo IN ('Responsable de la Función de Investigación', 'Jefe de División', 'Director Académico');

-- Persona Opcion 2
CREATE VIEW vFormato72PersonaOpcion2
AS
SELECT PY.Clave AS ClaveProyecto, PY.Nombre AS NombreProyecto, CURRENT_DATE() AS FechaReporte,
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
	INNER JOIN Persona AS PDIR ON PDIR.Id = DIR.NumPersona;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato72PersonaOpcion2 WHERE ClaveProyecto = 'Proy-01';

/* ***** FO-TESE-DA-73-PIDT07 ***** */

-- vFormato73
CREATE VIEW vFormato73
AS
SELECT OD.NoOficio, OD.FechaOficio AS FechaOficio, PY.Nombre AS NombreProyecto, PY.Clave AS ClaveProyecto, CONCAT(P.Nombre, ' ', P.Paterno, ' ', P.Materno) AS PersonaEnvioDocumento
FROM OficioDictamen AS OD
	INNER JOIN Proyecto AS PY ON PY.Id = OD.NumProyecto
	INNER JOIN CargoPersona AS CP ON CP.Id = PY.NumCoordinador
	INNER JOIN Persona AS P ON P.Id = CP.NumPersona;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato73 WHERE ClaveProyecto = 'Proy-01';

-- Division Academica
CREATE VIEW vFormato73DivisionAcademica
AS
SELECT DA.Descripcion AS DivisionAcademica, PY.Nombre AS NombreProyecto, PY.Clave AS ClaveProyecto
FROM Proyecto AS PY
	INNER JOIN ProyectosPrograma AS PP ON PP.NumProyecto = PY.Id
	INNER JOIN ProgramasDivision AS PD ON PD.NumPrograma = PP.NumPrograma
	INNER JOIN DivisionAcademica AS DA ON DA.Id = PD.NumDivision;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato73DivisionAcademica WHERE ClaveProyecto = 'Proy-01';

-- Comite Evaluador
CREATE VIEW vFormato73ComiteEvaluador
AS
SELECT OD.NoOficio, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno) AS IntegranteComiteEvaluador,  PY.Nombre AS NombreProyecto, PY.Clave AS ClaveProyecto
FROM Proyecto AS PY
	INNER JOIN OficioDictamen AS OD ON OD.NumProyecto = PY.Id
	INNER JOIN ComiteEvaluador AS CE ON CE.NumOficioDictamen = OD.Id
	INNER JOIN CargoPersona AS CP ON CP.Id = CE.NumIntegranteComite
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;

-- Se ejecuta la Vista
-- SELECT * FROM vFormato73ComiteEvaluador WHERE ClaveProyecto = 'Proy-01';