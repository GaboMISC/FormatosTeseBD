/* ***** Base de Datos ***** */

-- Existe la Base de Datos
SELECT SCHEMA_NAME AS BaseDeDatos FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'FormatosTESE';

-- Pone en Uso la Base de Datos Principal
USE mysql;

-- Elimina la Base de Datos Si Existe
DROP DATABASE IF EXISTS FormatosTESE;

-- Se Crea la Base de Datos
CREATE DATABASE IF NOT EXISTS FormatosTESE;

-- Se pone en Uso la Base de Datos
USE FormatosTESE;

/* ***** Tablas ***** */

-- Fuertes (Catalogos)
CREATE TABLE DivisionAcademica
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,
	UNIQUE (Descripcion)
);

CREATE TABLE Cargo
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL	
);

CREATE TABLE LineaInvestigacion
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(200) NOT NULL
);

CREATE TABLE AreaInvestigacion
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,
	UNIQUE (Descripcion)
);

CREATE TABLE NivelAcademico
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,
	UNIQUE (Descripcion)
);

CREATE TABLE Prioridad
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Letra VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(500) NOT NULL
);

CREATE TABLE PeriodoEscolar
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,
	FechaInicio DATETIME NULL,
	FechaFin DATETIME NULL
);

CREATE TABLE EstadoProceso
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Descripcion VARCHAR(100) NOT NULL,
	UNIQUE (Descripcion)
);

CREATE TABLE Usuario
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NombreUsuario VARCHAR(100) NOT NULL,
	Contrasena VARCHAR(100) NOT NULL,
	UNIQUE (NombreUsuario)
);

-- Medias (Dependen de los Catalogos)
CREATE TABLE Persona
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,	
	Nombre VARCHAR(100) NOT NULL,
	Paterno VARCHAR(100) NULL,
	Materno VARCHAR(100) NULL,
	Telefono VARCHAR(50) NULL,
	Correo VARCHAR(50) NULL,
	NumUsuario INT NOT NULL,
	FOREIGN KEY (NumUsuario) REFERENCES Usuario(Id)
);

CREATE TABLE CargoPersona
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
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

-- Debiles (Dependen de otras Tablas para Existir)
CREATE TABLE Programa
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Clave VARCHAR(100) NULL,
	Nombre VARCHAR(200) NULL,
	NumCoordinador INT NOT NULL,
	NumAreaInvestigacion INT NOT NULL,
	NumLineaInvestigacion INT NOT NULL,
	PosibleResultado VARCHAR(2500) NULL,
	Justificacion VARCHAR(2500) NULL,
	Resumen VARCHAR(2500) NULL,
	Objetivos VARCHAR(2500) NULL,
	Metodologia VARCHAR(2500) NULL,
	Metas VARCHAR(2500) NULL,
	CV VARBINARY(2500) NULL,
	FOREIGN KEY (NumAreaInvestigacion) REFERENCES AreaInvestigacion(Id),
	FOREIGN KEY (NumLineaInvestigacion) REFERENCES LineaInvestigacion(Id),
	FOREIGN KEY (NumCoordinador) REFERENCES CargoPersona(Id)
);

CREATE TABLE CronogramaPrograma
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
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

CREATE TABLE Proyecto
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Clave VARCHAR(100) NULL,
	Nombre VARCHAR(200) NULL,
	NumCoordinador INT NOT NULL,
	NumAreaInvestigacion INT NOT NULL,
	NumLineaInvestigacion INT NOT NULL,
	NumNivelAcademico INT NOT NULL,
	PosibleResultado VARCHAR(2500) NULL,
	Justificacion VARCHAR(2500) NULL,
	Resumen VARCHAR(2500) NULL,
	Objetivos VARCHAR(2500) NULL,
	Metodologia VARCHAR(2500) NULL,
	Metas VARCHAR(2500) NULL,
	CV VARBINARY(2500) NULL,
	FOREIGN KEY (NumAreaInvestigacion) REFERENCES AreaInvestigacion(Id),
	FOREIGN KEY (NumLineaInvestigacion) REFERENCES LineaInvestigacion(Id),
	FOREIGN KEY (NumNivelAcademico) REFERENCES NivelAcademico(Id),
	FOREIGN KEY (NumCoordinador) REFERENCES CargoPersona(Id)
);

CREATE TABLE RecusosMateriales
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumProyecto INT NOT NULL,
	Cantidad INT DEFAULT 0 NOT NULL,
	Descripcion VARCHAR(100) NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);

CREATE TABLE Servicios
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumProyecto INT NOT NULL,
	Cantidad INT DEFAULT 0 NOT NULL,
	Descripcion VARCHAR(100) NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);

CREATE TABLE BienesMuebles
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumProyecto INT NOT NULL,
	Cantidad INT DEFAULT 0 NOT NULL,
	Descripcion VARCHAR(100) NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);

CREATE TABLE Honorarios
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumProyecto INT NOT NULL,
	EspecialidadPersonal VARCHAR(50) NULL,
	NumPersonalExterno INT DEFAULT 0 NULL,
	NumPersonalInterno INT DEFAULT 0 NULL,
	Dedicacionhoras INT DEFAULT 0 NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);

CREATE TABLE CronogramaProyecto
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
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

CREATE TABLE HojaAnalisis
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
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

CREATE TABLE Evaluacion
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
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

CREATE TABLE Evaluadores
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumEvaluacion INT NOT NULL,	
	NumCargoPersona INT NOT NULL,	
	FOREIGN KEY (NumCargoPersona) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumEvaluacion) REFERENCES Evaluacion(Id)
);

CREATE TABLE HojaCalificaciones
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
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

CREATE TABLE OficioDictamen
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NoOficio VARCHAR(100) NULL,
	FechaOficio DATE NULL,
	NumProyecto INT NOT NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);

CREATE TABLE ComiteEvaluador
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumOficioDictamen INT NOT NULL,
	NumIntegranteComite INT NOT NULL,	
	FOREIGN KEY (NumIntegranteComite) REFERENCES CargoPersona(Id),	
	FOREIGN KEY (NumOficioDictamen) REFERENCES OficioDictamen(Id)
);

CREATE TABLE CartaLiberacion
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumDivision INT NOT NULL,
	NoOficio VARCHAR(100) NULL,
	FechaOficio DATE NULL,
	NombrePersona VARCHAR(200) NULL,
	NumProyecto INT NOT NULL,
	FOREIGN KEY (NumDivision) REFERENCES DivisionAcademica(Id),
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id)
);

CREATE TABLE ComiteLiberacion
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumCartaLiberacion INT NOT NULL,
	NumIntegranteComite INT NOT NULL,
	FOREIGN KEY (NumIntegranteComite) REFERENCES CargoPersona(Id),	
	FOREIGN KEY (NumCartaLiberacion) REFERENCES CartaLiberacion(Id)
);

CREATE TABLE Informe
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
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
	ActividadesInherentes VARCHAR(2500) NULL,
	NumResponsable INT NOT NULL,
	NumJefe INT NOT NULL,
	NumDirector INT NOT NULL,
	FOREIGN KEY (NumDivision) REFERENCES DivisionAcademica(Id),
	FOREIGN KEY (NumResponsableDivision) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumResponsable) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumJefe) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumDirector) REFERENCES CargoPersona(Id)
);

CREATE TABLE ArticulosPublicados
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Articulo VARCHAR(100) NULL,
	Revista VARCHAR(100) NULL,
	Arbitraje BIT DEFAULT 0 NULL,
	Nacional BIT DEFAULT 0 NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);

CREATE TABLE LibrosPublicados
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Titulo VARCHAR(200) NULL,
	Editorial VARCHAR(100) NULL,
	ISBN VARCHAR(100) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);

CREATE TABLE Patentes
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Descripcion VARCHAR(200) NULL,
	NoPatente VARCHAR(100) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);

CREATE TABLE Congresos
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Titulo VARCHAR(200) NULL,
	Responsable VARCHAR(200) NULL,
	Evento VARCHAR(200) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);

CREATE TABLE Estancias
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Empresa VARCHAR(200) NULL,
	Profesor VARCHAR(200) NULL,
	Trabajo VARCHAR(200) NULL,
	Duracion VARCHAR(100) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);

CREATE TABLE ProfesorSNI
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	NumProfesor INT NOT NULL,
	Nivel VARCHAR(100) NULL,
	NoRegistro VARCHAR(100) NULL,		
	FOREIGN KEY (NumProfesor) REFERENCES CargoPersona(Id),
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);

CREATE TABLE Convenios
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Institucion VARCHAR(200) NULL,
	ProyectoColaborativo VARCHAR(200) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);

CREATE TABLE Problematica
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumInforme INT NOT NULL,
	Problema VARCHAR(2000) NULL,
	SolucionAccion VARCHAR(2000) NULL,
	FOREIGN KEY (NumInforme) REFERENCES Informe(Id)
);

-- Tablas de Muchos a Muchos (N:M)
CREATE TABLE ProyectosPrograma
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumProyecto INT NOT NULL,
	NumPrograma INT NOT NULL,
	FOREIGN KEY (NumProyecto) REFERENCES Proyecto(Id),
	FOREIGN KEY (NumPrograma) REFERENCES Programa(Id)
);

CREATE TABLE ProgramasDivision
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	NumDivision INT NOT NULL,
	NumPrograma INT NOT NULL,
	FOREIGN KEY (NumDivision) REFERENCES DivisionAcademica(Id),
	FOREIGN KEY (NumPrograma) REFERENCES Programa(Id)
);

-- Proceso General
CREATE TABLE Proceso
(
	Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
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