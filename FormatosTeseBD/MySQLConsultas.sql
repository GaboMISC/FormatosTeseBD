USE FormatosTESE;

/* ***** Catalogos ***** */
SELECT * FROM DivisionAcademica;
SELECT * FROM Cargo;
SELECT * FROM LineaInvestigacion;
SELECT * FROM AreaInvestigacion;
SELECT * FROM NivelAcademico;
SELECT * FROM Prioridad;
SELECT * FROM PeriodoEscolar;
SELECT * FROM EstadoProceso;

/* ***** Datos de Prueba ***** */

-- Usuario
SELECT * FROM Usuario;
SELECT * FROM Persona;

-- Cargo Persona
SELECT * FROM CargoPersona;

-- Cargo Persona Detallado
SELECT CP.Id, C.Descripcion AS Puesto, P.Nombre, P.Paterno, P.Materno, DA.Descripcion AS Division, PE.Descripcion AS Periodo, CP.PuestoVigente 
FROM CargoPersona AS CP
INNER JOIN Cargo AS C ON C.Id = CP.NumCargo
INNER JOIN Persona AS P ON P.Id = CP.NumPersona
INNER JOIN DivisionAcademica AS DA ON DA.Id = CP.NumDivisionAcademica
INNER JOIN PeriodoEscolar AS PE ON PE.Id = CP.NumPeriodoEscolar
WHERE CP.PuestoVigente = 1;

-- Programa
SELECT * FROM Programa;

-- Programa Detallado
SELECT P.Clave, P.Nombre, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno, ' - ', CA.Descripcion) AS Coordinador, AI.Descripcion AS AreaDeInvestigacion, LI.Descripcion AS LineaDeInvestigacion, P.PosibleResultado, P.Justificacion, P.Resumen, P.Objetivos, P.Metodologia, P.Metas, P.CV
FROM Programa AS P
INNER JOIN CargoPersona AS CP ON CP.Id = P.NumCoordinador
INNER JOIN Cargo AS CA ON CA.Id = CP.NumCargo
INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona
INNER JOIN AreaInvestigacion AS AI ON AI.Id = P.NumAreaInvestigacion
INNER JOIN LineaInvestigacion AS LI ON LI.Id = P.NumLineaInvestigacion;

-- Cronograma del Programa
SELECT * FROM CronogramaPrograma;

-- Cronograma del Programa Detallado
SELECT CP.Id, P.Clave, P.Nombre, CP.Numero, CP.Actividad, CP.Unidad, CP.Cantidad, CP.FechaInicio, CP.FechaFin, CP.Meses
FROM CronogramaPrograma AS CP
INNER JOIN Programa AS P ON P.Id = CP.NumPrograma;

-- Proyecto
SELECT * FROM Proyecto;

-- Proyecto Detallado
SELECT P.Clave, P.Nombre, CONCAT(PE.Nombre, ' ', PE.Paterno, ' ', PE.Materno, ' - ', CA.Descripcion) AS Coordinador, AI.Descripcion AS AreaDeInvestigacion, LI.Descripcion AS LineaDeInvestigacion, NA.Descripcion AS NivelAcademico, P.PosibleResultado, P.Justificacion, P.Resumen, P.Objetivos, P.Metodologia, P.Metas, P.CV
FROM Proyecto AS P
INNER JOIN CargoPersona AS CP ON CP.Id = P.NumCoordinador
INNER JOIN Cargo AS CA ON CA.Id = CP.NumCargo
INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona
INNER JOIN AreaInvestigacion AS AI ON AI.Id = P.NumAreaInvestigacion
INNER JOIN LineaInvestigacion AS LI ON LI.Id = P.NumLineaInvestigacion
INNER JOIN NivelAcademico AS NA ON NA.Id = P.NumNivelAcademico;

-- Recusos Materiales
SELECT * FROM RecusosMateriales;

-- Recusos Materiales Detalle
SELECT RM.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, RM.Cantidad, RM.Descripcion
FROM RecusosMateriales AS RM
INNER JOIN Proyecto AS PY ON PY.Id = RM.NumProyecto;

-- Servicios
SELECT * FROM Servicios;

-- Servicios Detalle
SELECT S.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, S.Cantidad, S.Descripcion
FROM Servicios AS S
INNER JOIN Proyecto AS PY ON PY.Id = S.NumProyecto;

-- Bienes Muebles
SELECT * FROM BienesMuebles;

-- Bienes Muebles Detalle
SELECT BM.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, BM.Cantidad, BM.Descripcion
FROM BienesMuebles AS BM
INNER JOIN Proyecto AS PY ON PY.Id = BM.NumProyecto;

-- Honorarios
SELECT * FROM Honorarios;

-- Honorarios Detalle
SELECT H.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, H.NumPersonalExterno, H.NumPersonalInterno, H.Dedicacionhoras
FROM Honorarios AS H
INNER JOIN Proyecto AS PY ON PY.Id = H.NumProyecto;

-- Cronograma del Proyecto
SELECT * FROM CronogramaProyecto;

-- Cronograma del Proyecto Detalle
SELECT CP.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, CP.Numero, CP.Actividad, CP.Unidad, CP.Cantidad, CP.FechaInicio, CP.FechaFin, CP.PorcentajeAvance
FROM CronogramaProyecto AS CP
INNER JOIN Proyecto AS PY ON PY.Id = CP.NumProyecto;

-- Hoja de Analisis
SELECT * FROM HojaAnalisis;

-- Hoja de Analisis Detalle
SELECT HA.Id, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, HA.AntecedentesJustificacion, HA.Metodologia, HA.Objetivos, HA.Impacto, HA.SectorPublico, HA.FormacionRH, HA.SubtotalCriterios, HA.cInfraestructura, HA.cActividades, HA.cRH, HA.cProgramacion, HA.cPresupuesto, HA.SubtotalViabilidad, HA.Total
FROM HojaAnalisis AS HA
INNER JOIN Proyecto AS PY ON PY.Id = HA.NumProyecto;

-- Evaluacion
SELECT * FROM Evaluacion;

-- Evaluacion Detalle
SELECT E.Id, E.Calificacion, PR.Letra, PR.Descripcion, 
	CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS Responsable,
	CONCAT(PE1.Nombre, ' ',  PE1.Paterno, ' ', PE1.Materno) AS JefeDeDivision,
	CONCAT(PE2.Nombre, ' ',  PE2.Paterno, ' ', PE2.Materno) AS DirectorAcademico
FROM Evaluacion AS E
	INNER JOIN Prioridad AS PR ON PR.Id = E.NumPrioridad
	INNER JOIN CargoPersona AS CP ON CP.Id = E.NumResponsable
	INNER JOIN CargoPersona AS CP1 ON CP1.Id = E.NumJefe
	INNER JOIN CargoPersona AS CP2 ON CP2.Id = E.NumDirector
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona
	INNER JOIN Persona AS PE1 ON PE1.Id = CP1.NumPersona
	INNER JOIN Persona AS PE2 ON PE2.Id = CP2.NumPersona;

-- Evaluadores
SELECT * FROM Evaluadores;

-- Evaluadores Detalle
SELECT ES.NumEvaluacion AS EvaluaciónId, CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS Evaluador
FROM Evaluadores AS ES
INNER JOIN CargoPersona AS CP ON CP.Id = ES.NumCargoPersona
INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;

-- Hoja de Calificaciones
SELECT * FROM HojaCalificaciones;

-- Hoja de Calificaciones Detalle
SELECT HC.TotalProyectos, HC.PromedioProyectos, HC.AceptacionPrograma,
	CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS Responsable,
	CONCAT(PE1.Nombre, ' ',  PE1.Paterno, ' ', PE1.Materno) AS JefeDeDivision,
	CONCAT(PE2.Nombre, ' ',  PE2.Paterno, ' ', PE2.Materno) AS DirectoAcademico,
	PR.Clave, PR.Nombre
FROM HojaCalificaciones AS HC
	INNER JOIN Programa AS PR ON PR.Id = HC.NumPrograma
	INNER JOIN CargoPersona AS CP ON CP.Id = HC.NumResponsable
	INNER JOIN CargoPersona AS CP1 ON CP1.Id = HC.NumJefe
	INNER JOIN CargoPersona AS CP2 ON CP2.Id = HC.NumDirector
	INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona
	INNER JOIN Persona AS PE1 ON PE1.Id = CP1.NumPersona
	INNER JOIN Persona AS PE2 ON PE2.Id = CP2.NumPersona;

-- Oficio Dictamen
SELECT * FROM OficioDictamen;

-- Oficio Dictamen Detalle
SELECT OD.NoOficio, OD.FechaOficio, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto
FROM OficioDictamen AS OD
INNER JOIN Proyecto AS PY ON PY.Id = OD.NumProyecto;

-- Comite Evaluador
SELECT * FROM ComiteEvaluador;

-- Comite Evaluador Detalle
SELECT CE.NumOficioDictamen AS NumeroDeOficio, CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS IntegranteDelComite
FROM ComiteEvaluador AS CE
INNER JOIN CargoPersona AS CP ON CP.Id = CE.NumIntegranteComite
INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;

-- Carta de Liberacion
SELECT * FROM CartaLiberacion;

-- Carta de Liberacion
SELECT D.Descripcion AS Division, CL.NoOficio, CL.FechaOficio, CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS NombrePersona, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto
FROM CartaLiberacion AS CL
INNER JOIN DivisionAcademica AS D ON D.Id = CL.NumDivision
INNER JOIN Proyecto AS PY ON PY.Id = CL.NumProyecto
INNER JOIN CargoPersona AS CP ON CP.Id = CL.NombrePersona
INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;

-- Comite de Liberacion
SELECT * FROM ComiteLiberacion;

-- Comite de Liberacion Detalle
SELECT CL.NumCartaLiberacion, CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS IntegranteComite
FROM ComiteLiberacion AS CL
INNER JOIN CargoPersona AS CP ON CP.Id = CL.NumIntegranteComite
INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;

-- Informe
SELECT * FROM Informe;

-- Informe Detalle
SELECT I.Id, I.FechaInforme, PE.Descripcion AS Periodo, DA.Descripcion AS Division,
	CONCAT(P.Nombre, ' ',  P.Paterno, ' ', P.Materno) AS ResponsableDivision,
	I.PeriodoReportado, I.NoInforme, I.FormatosRequisitados, I.FormatosAprobadosComite, I.ProyectosEnProceso, I.ProyectosFinanciamientoExterno, I.ProyectosConcluidos, I.FormatosMes, I.Articulos, I.Libros, I.Patentes, I.Congresos, I.Estancias, I.ProfesorSNI, I.Convenios, I.ActividadesInherentes,
	CONCAT(P.Nombre, ' ',  P.Paterno, ' ', P.Materno) AS Responsable,
	CONCAT(PJEF.Nombre, ' ',  PJEF.Paterno, ' ', PJEF.Materno) AS Jefe,
	CONCAT(PDIR.Nombre, ' ',  PDIR.Paterno, ' ', PDIR.Materno) AS Director
FROM Informe AS I
	INNER JOIN PeriodoEscolar AS PE ON PE.Id = I.PeriodoEscolar
	INNER JOIN DivisionAcademica AS DA ON DA.Id = I.NumDivision
	INNER JOIN CargoPersona AS RESP ON RESP.Id = I.NumResponsableDivision
	INNER JOIN Persona AS P ON P.Id = RESP.NumPersona
	INNER JOIN CargoPersona AS JEF ON JEF.Id = I.NumJefe
	INNER JOIN Persona AS PJEF ON PJEF.Id = JEF.NumPersona
	INNER JOIN CargoPersona AS DIR ON DIR.Id = I.NumDirector
	INNER JOIN Persona AS PDIR ON PDIR.Id = DIR.NumPersona;

-- Articulos Publicados
SELECT * FROM ArticulosPublicados;

-- Articulos Publicados Detalle
SELECT AP.NumInforme AS InformeId, AP.Articulo, AP.Revista,
	CASE
		WHEN AP.Arbitraje = 0 THEN 'Sin Arbitraje'
		WHEN AP.Arbitraje = 1 THEN 'Con Arbitraje'
	END AS Arbitraje,
	CASE
		WHEN AP.Nacional = 0 THEN 'Extranjero'
		WHEN AP.Nacional = 1 THEN 'Nacional'
	END AS Arbitraje
FROM ArticulosPublicados AS AP;

-- Libros Publicados
SELECT * FROM LibrosPublicados;

-- Patentes Informe
SELECT * FROM Patentes;

-- Congresos Informe
SELECT * FROM Congresos;

-- Congresos Detalle
SELECT CO.NumInforme, CO.Titulo, CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS Responsable, CO.Evento
FROM Congresos AS CO
INNER JOIN CargoPersona AS CP ON CP.Id = CO.Responsable
INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;

-- Estancias Informe
SELECT * FROM Estancias;

-- Profesor SNI Informe
SELECT * FROM ProfesorSNI;

-- Profesor SNI Detalle
SELECT SNI.NumInforme, CONCAT(PE.Nombre, ' ',  PE.Paterno, ' ', PE.Materno) AS Profesor, SNI.Nivel, SNI.NoRegistro
FROM ProfesorSNI AS SNI
INNER JOIN CargoPersona AS CP ON CP.Id = SNI.NumProfesor
INNER JOIN Persona AS PE ON PE.Id = CP.NumPersona;

-- Convenios Informe
SELECT * FROM Convenios;

-- Problematica Informe
SELECT * FROM Problematica;

-- Proyectos del Programa
SELECT * FROM ProyectosPrograma;

-- Proyectos del Programa Detalle
SELECT CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, CONCAT(PG.Clave, ', ',  PG.Nombre) AS Programa
FROM ProyectosPrograma AS PP
INNER JOIN Proyecto AS PY ON PY.Id = PP.NumProyecto
INNER JOIN Programa AS PG ON PG.Id = PP.NumPrograma;

-- Programas de la Division
SELECT * FROM ProgramasDivision;

-- Programas de la Division Detalle
SELECT DA.Descripcion AS DivisionAcademica, CONCAT(PG.Clave, ', ',  PG.Nombre) AS Programa
FROM ProgramasDivision AS PD
INNER JOIN DivisionAcademica AS DA ON DA.Id = PD.NumDivision
INNER JOIN Programa AS PG ON PG.Id = PD.NumPrograma;

-- Proceso
SELECT * FROM Proceso;

-- Proceso Detalle
SELECT EP.Descripcion, CONCAT(PY.Clave, ', ',  PY.Nombre) AS Proyecto, CONCAT(PG.Clave, ', ',  PG.Nombre) AS Programa, EV.Calificacion AS CalificacionEvaluacion, HC.AceptacionPrograma AS HojaDeCalificaciones, CONCAT('Id: ', OD.NoOficio, ', Fecha: ',  OD.FechaOficio) AS OficioDictamen, CONCAT('Id: ', CL.Id, ', Fecha: ',  CL.FechaOficio) AS CartaDeLiberacion, CONCAT('Id: ', I.NoInforme
, ', Fecha: ',  I.FechaInforme) AS Informe
FROM Proceso AS PC
	INNER JOIN EstadoProceso AS EP ON EP.Id = PC.NumEstadoProceso
	INNER JOIN Proyecto AS PY ON PY.Id = PC.NumProyecto
	INNER JOIN Programa AS PG ON PG.Id = PC.NumPrograma
	INNER JOIN Evaluacion AS EV ON EV.Id = PC.NumEvaluacion
	INNER JOIN HojaCalificaciones AS HC ON HC.Id = PC.NumHojaCalificaciones
	INNER JOIN OficioDictamen AS OD ON OD.Id = PC.NumOficioDictamen
	INNER JOIN CartaLiberacion AS CL ON CL.Id = PC.NumCartaLiberacion
	INNER JOIN Informe AS I ON I.Id = PC.NumInforme;

/* ***** Consultas Adicionales ***** */

-- Obtiene los datos del Personal
SELECT C.Descripcion AS Cargo, P.Nombre, P.Paterno, P.Materno, DA.Descripcion AS DivisionAcademica, PE.Descripcion, CP.PuestoVigente
FROM CargoPersona AS CP
	INNER JOIN Cargo AS C ON C.Id = CP.NumCargo
	INNER JOIN Persona AS P ON P.Id = CP.NumPersona
	INNER JOIN DivisionAcademica AS DA ON DA.Id = CP.NumDivisionAcademica
	INNER JOIN PeriodoEscolar AS PE ON PE.Id = CP.NumPeriodoEscolar
WHERE C.Descripcion = 'Administrador'
AND PE.Descripcion = '2022-2';