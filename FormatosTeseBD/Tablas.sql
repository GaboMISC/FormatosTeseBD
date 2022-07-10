/* ***** Base de Datos ***** */
USE master;
GO
IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME='FormatosTESE')
	BEGIN
		-- Si Existe
		DROP DATABASE FormatosTESE;
		CREATE DATABASE FormatosTESE;
	END
ELSE
	BEGIN
		-- No Existe
		CREATE DATABASE FormatosTESE;
	END -- if (Existe)
GO
-- Pone en Uso la Base de Datos
USE [FormatosTESE];
GO
/* ***** Tablas ***** */

-- Fuertes (Catalogos)
CREATE TABLE DivisionAcademica
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,
	UNIQUE (Descripcion)
);
GO
CREATE TABLE Cargo
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL	
);
GO
CREATE TABLE LineaInvestigacion
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(200) NOT NULL
);
GO
CREATE TABLE AreaInvestigacion
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,
	UNIQUE (Descripcion)
);
GO
CREATE TABLE NivelAcademico
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,
	UNIQUE (Descripcion)
);
GO
CREATE TABLE Prioridad
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	Letra VARCHAR(10) NOT NULL,
	Descripcion VARCHAR(500) NOT NULL
);
GO
CREATE TABLE PeriodoEscolar
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,
	FechaInicio DATETIME NULL,
	FechaFin DATETIME NULL
);
GO
CREATE TABLE Usuario
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NombreUsuario VARCHAR(100) NOT NULL,
	Contrasena VARCHAR(100) NOT NULL,
	UNIQUE (NombreUsuario)
);
GO
CREATE TABLE EstadoProceso
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,
	UNIQUE (Descripcion)
);
GO
-- Medias (Dependen de los Catalogos)
CREATE TABLE Persona
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,	
	Nombre VARCHAR(100) NOT NULL,
	Paterno VARCHAR(100) NULL,
	Materno VARCHAR(100) NULL,
	Telefono VARCHAR(50) NULL,
	Correo VARCHAR(50) NULL,
	NumUsuario INT NOT NULL,
	FOREIGN KEY (NumUsuario) REFERENCES Usuario(Id)
);
GO
CREATE TABLE CargoPersona
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumCargo INT NOT NULL,
	NumPersona INT NOT NULL,
	NumDivisionAcademica INT NOT NULL,
	NumPeriodoEscolar INT NOT NULL,
	PuestoVigente BIT NOT NULL,
	FOREIGN KEY (NumCargo) REFERENCES Cargo(Id),
	FOREIGN KEY (NumPeriodoEscolar) REFERENCES PeriodoEscolar(Id),
	FOREIGN KEY (NumPersona) REFERENCES Persona(Id),
	FOREIGN KEY (NumDivisionAcademica) REFERENCES DivisionAcademica(Id)
);
GO
-- Debiles (Dependen de otras Tablas para Existir)
CREATE TABLE Proyecto
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	Clave VARCHAR(100) NULL,
	Nombre VARCHAR(200) NULL,
	NumCoordinador INT NOT NULL,
	NumAreaInvestigacion INT NOT NULL,
	NumLineaInvestigacion INT NOT NULL,
	NumNivelAcademico INT NOT NULL,
	PosibleResultado VARCHAR(8000) NULL,
	Justificacion VARCHAR(8000) NULL,
	Resumen VARCHAR(8000) NULL,
	Objetivos VARCHAR(8000) NULL,
	Metodologia VARCHAR(8000) NULL,
	Metas VARCHAR(8000) NULL,
	CV VARBINARY(MAX) NULL,
	FOREIGN KEY (NumAreaInvestigacion) REFERENCES AreaInvestigacion(Id),
	FOREIGN KEY (NumLineaInvestigacion) REFERENCES LineaInvestigacion(Id),
	FOREIGN KEY (NumNivelAcademico) REFERENCES NivelAcademico(Id),
	FOREIGN KEY (NumCoordinador) REFERENCES CargoPersona(Id)
);
GO
CREATE TABLE RecusosMateriales
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumProyecto INT NOT NULL,
	Cantidad INT DEFAULT 0 NOT NULL,
	Descripcion VARCHAR(100) NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);
GO
CREATE TABLE Servicios
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumProyecto INT NOT NULL,
	Cantidad INT DEFAULT 0 NOT NULL,
	Descripcion VARCHAR(100) NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);
GO
CREATE TABLE BienesMuebles
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumProyecto INT NOT NULL,
	Cantidad INT DEFAULT 0 NOT NULL,
	Descripcion VARCHAR(100) NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);
GO
CREATE TABLE Honorarios
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumProyecto INT NOT NULL,
	EspecialidadPersonal VARCHAR(50) NULL,
	NumPersonalExterno INT DEFAULT 0 NULL,
	NumPersonalInterno INT DEFAULT 0 NULL,
	Dedicacionhoras INT DEFAULT 0 NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);
GO
CREATE TABLE CronogramaProyecto
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumProyecto INT NOT NULL,
	Numero INT NOT NULL,
	Actividad VARCHAR(200) NOT NULL,
	Unidad VARCHAR(50) NOT NULL,
	Cantidad INT NOT NULL,
	FechaInicio DATETIME NULL,
	FechaFin DATETIME NULL,
	Meses INT NULL,
	PorcentajeAvance INT DEFAULT 0 NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);
GO
CREATE TABLE Programa
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	Clave VARCHAR(100) NULL,
	Nombre VARCHAR(200) NULL,
	NumCoordinador INT NOT NULL,
	NumAreaInvestigacion INT NOT NULL,
	NumLineaInvestigacion INT NOT NULL,
	PosibleResultado VARCHAR(8000) NULL,
	Justificacion VARCHAR(8000) NULL,
	Resumen VARCHAR(8000) NULL,
	Objetivos VARCHAR(8000) NULL,
	Metodologia VARCHAR(8000) NULL,
	Metas VARCHAR(8000) NULL,
	CV VARBINARY(MAX) NULL,
	FOREIGN KEY (NumAreaInvestigacion) REFERENCES AreaInvestigacion(Id),
	FOREIGN KEY (NumLineaInvestigacion) REFERENCES LineaInvestigacion(Id),
	FOREIGN KEY (NumCoordinador) REFERENCES CargoPersona(Id)
);
GO
CREATE TABLE CronogramaPrograma
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumPrograma INT NOT NULL,
	Numero INT NOT NULL,
	Actividad VARCHAR(200) NOT NULL,
	Unidad VARCHAR(50) NOT NULL,
	Cantidad INT NOT NULL,
	FechaInicio DATETIME NULL,
	FechaFin DATETIME NULL,
	Meses INT NULL,
	FOREIGN KEY (NumPrograma) REFERENCES Programa(Id)
);
GO
CREATE TABLE HojaAnalisis
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumProyecto INT NULL,
	AntecedentesJustificacion INT NULL,
	Metodologia INT NULL,
	Objetivos INT NULL,
	Impacto INT NULL,
	SectorPublico INT NULL,
	FormacionRH INT NULL,
	SubtotalCriterios INT NULL,
	cInfraestructura INT NULL,
	cActividades INT NULL,
	cRH INT NULL,
	cProgramacion INT NULL,
	cPresupuesto INT NULL,
	SubtotalViabilidad INT NULL,
	Total INT NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);
GO
CREATE TABLE Evaluacion
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	Calificacion FLOAT NULL,
	NumPrioridad INT NOT NULL,
	NumResponsable INT NOT NULL,
	NumJefe INT NOT NULL,
	NumDirector INT NOT NULL,
	NumHojaAnalisis INT NOT NULL,
	FOREIGN KEY (NumHojaAnalisis) REFERENCES HojaAnalisis(Id),
	FOREIGN KEY (NumPrioridad) REFERENCES Prioridad(Id),
	FOREIGN KEY (NumResponsable) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumJefe) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumDirector) REFERENCES CargoPersona(Id)
);
GO
CREATE TABLE Evaluadores
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumEvaluacion INT NOT NULL,	
	NumCargoPersona INT NOT NULL,	
	FOREIGN KEY (NumCargoPersona) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumEvaluacion) REFERENCES Evaluacion(Id)
);
GO
CREATE TABLE HojaCalificaciones
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	TotalProyectos INT DEFAULT 0 NULL,
	PromedioProyectos FLOAT DEFAULT 0 NULL,
	AceptacionPrograma VARCHAR(500) NULL,
	NumResponsable INT NOT NULL,
	NumJefe INT NOT NULL,
	NumDirector INT NOT NULL,
	NumPrograma INT NOT NULL,
	FOREIGN KEY (NumPrograma) REFERENCES Programa(Id),
	FOREIGN KEY (NumResponsable) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumJefe) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumDirector) REFERENCES CargoPersona(Id)
);
GO
CREATE TABLE OficioDictamen
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NoOficio VARCHAR(100) NULL,
	FechaOficio DATE NULL,
	NumProyecto INT NOT NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);
GO
CREATE TABLE ComiteEvaluador
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumOficioDictamen INT NOT NULL,
	NumIntegranteComite INT NOT NULL,	
	FOREIGN KEY (NumIntegranteComite) REFERENCES CargoPersona(Id),	
	FOREIGN KEY (NumOficioDictamen) REFERENCES OficioDictamen(Id)
);
GO
CREATE TABLE CartaLiberacion
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumDivision INT NOT NULL,
	NoOficio VARCHAR(100) NULL,
	FechaOficio DATE NULL,
	NombrePersona VARCHAR(200) NULL,
	NumProyecto INT NOT NULL,
	FOREIGN KEY (NumDivision) REFERENCES DivisionAcademica(Id),
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);
GO
CREATE TABLE ComiteLiberacion
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumCartaLiberacion INT NOT NULL,
	NumIntegranteComite INT NOT NULL,
	FOREIGN KEY (NumIntegranteComite) REFERENCES CargoPersona(Id),	
	FOREIGN KEY (NumCartaLiberacion) REFERENCES CartaLiberacion(Id)
);
GO
CREATE TABLE Informe
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	FechaInforme DATE NULL,
	PeriodoEscolar VARCHAR(100) NULL,
	NumDivision INT NOT NULL,
	NumResponsableDivision INT NOT NULL,
	PeriodoReportado VARCHAR(100) NULL,
	NoInforme VARCHAR(100) NULL,
	FormatosRequisitados INT DEFAULT 0 NULL,
	FormatosAprobadosComite INT DEFAULT 0 NULL,
	ProyectosEnProceso INT DEFAULT 0 NULL,
	ProyectosFinanciamientoExterno INT DEFAULT 0 NULL,
	ProyectosConcluidos INT DEFAULT 0 NULL,
	FormatosMes INT DEFAULT 0 NULL,
	Articulos BIT DEFAULT 0 NULL,
	Libros BIT DEFAULT 0 NULL,
	Patentes BIT DEFAULT 0 NULL,
	Congresos BIT DEFAULT 0 NULL,
	Estancias BIT DEFAULT 0 NULL,
	ProfesorSNI BIT DEFAULT 0 NULL,
	Convenios BIT DEFAULT 0 NULL,
	ActividadesInherentes VARCHAR(8000) NULL,
	NumResponsable INT NOT NULL,
	NumJefe INT NOT NULL,
	NumDirector INT NOT NULL,
	FOREIGN KEY (NumDivision) REFERENCES DivisionAcademica(Id),
	FOREIGN KEY (NumResponsableDivision) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumResponsable) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumJefe) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumDirector) REFERENCES CargoPersona(Id)
);
GO
CREATE TABLE ArticulosPublicados
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Articulo VARCHAR(100) NULL,
	Revista VARCHAR(100) NULL,
	Arbitraje BIT DEFAULT 0 NULL,
	Nacional BIT DEFAULT 0 NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);
GO
CREATE TABLE LibrosPublicados
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Titulo VARCHAR(200) NULL,
	Editorial VARCHAR(100) NULL,
	ISBN VARCHAR(100) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);
GO
CREATE TABLE Patentes
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Descripcion VARCHAR(200) NULL,
	NoPatente VARCHAR(100) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);
GO
CREATE TABLE Congresos
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Titulo VARCHAR(200) NULL,
	Responsable VARCHAR(200) NULL,
	Evento VARCHAR(200) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);
GO
CREATE TABLE Estancias
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Empresa VARCHAR(200) NULL,
	Profesor VARCHAR(200) NULL,
	Trabajo VARCHAR(200) NULL,
	Duracion VARCHAR(100) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);
GO
CREATE TABLE ProfesorSNI
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	NumProfesor INT NOT NULL,
	Nivel VARCHAR(100) NULL,
	NoRegistro VARCHAR(100) NULL,		
	FOREIGN KEY (NumProfesor) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);
GO
CREATE TABLE Convenios
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Institucion VARCHAR(200) NULL,
	ProyectoColaborativo VARCHAR(200) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);
GO
CREATE TABLE Problematica
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Problema VARCHAR(2000) NULL,
	SolucionAccion VARCHAR(2000) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);
GO
CREATE TABLE Proceso
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumEstadoProceso INT NOT NULL,
	NumProyecto INT NULL,
	NumPrograma INT NULL,
	NumEvaluacion INT NULL,
	NumHojaCalificaciones INT NULL,
	NumOficioDictamen INT NULL,
	NumCartaLiberacion INT NULL,
	NumInforme INT NULL,
	FOREIGN KEY (NumEstadoProceso) REFERENCES EstadoProceso(Id),
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id),
	FOREIGN KEY (NumPrograma) REFERENCES Programa(Id),
	FOREIGN KEY (NumEvaluacion) REFERENCES Evaluacion(Id),
	FOREIGN KEY (NumHojaCalificaciones) REFERENCES HojaCalificaciones(Id),
	FOREIGN KEY (NumOficioDictamen) REFERENCES OficioDictamen(Id),
	FOREIGN KEY (NumCartaLiberacion) REFERENCES CartaLiberacion(Id),
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);
GO
-- Tablas de Muchos a Muchos (N:M)
CREATE TABLE ProyectosPrograma
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumProyecto INT NOT NULL,
	NumPrograma INT NOT NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id),
	FOREIGN KEY (NumPrograma) REFERENCES Programa(Id)
);
GO
CREATE TABLE ProgramasDivision
(
	Id INT IDENTITY PRIMARY KEY NOT NULL,
	NumDivision INT NOT NULL,
	NumPrograma INT NOT NULL,
	FOREIGN KEY (NumDivision) REFERENCES DivisionAcademica(Id),
	FOREIGN KEY (NumPrograma) REFERENCES Programa(Id)
);
GO