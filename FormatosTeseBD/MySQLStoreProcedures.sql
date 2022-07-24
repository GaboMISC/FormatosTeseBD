USE FormatosTESE;

-- ======================================================
-- Descripción: Hoja de Analisis.
-- 2022-07-23 GMartinez: Creación del Stored Procedure.
-- ======================================================
DELIMITER $

CREATE PROCEDURE pInsertarHojaAnalisis
(
	IN ClaveProyecto VARCHAR(100),
	IN cAntecedentesJustificacion INT,
	IN cMetodologia INT,
	IN cObjetivos INT,
	IN cImpacto INT,
	IN cSectorPublico INT,
	IN cFormacionRH INT,
	IN cInfraestructura INT,
	IN cActividades INT,
	IN cRH INT,
	IN cProgramacion INT,
	IN cPresupuesto INT,
	OUT respuesta VARCHAR(100)
)
BEGIN
	DECLARE SubtotalCriterios INT;
	DECLARE SubtotalViabilidad INT;
	DECLARE Total INT;
	DECLARE ProyectoId INT;

	IF EXISTS(SELECT * FROM Proyecto WHERE Clave = ClaveProyecto) THEN
								
		SELECT Id INTO ProyectoId
		FROM Proyecto 
		WHERE Clave = ClaveProyecto;

		SET SubtotalCriterios = (cAntecedentesJustificacion + cMetodologia + cObjetivos + cImpacto + cSectorPublico + cFormacionRH);
		SET SubtotalViabilidad = (cInfraestructura + cActividades + cRH + cProgramacion + cPresupuesto);
		SET Total = (SubtotalCriterios + SubtotalViabilidad);

		INSERT INTO HojaAnalisis (NumProyecto, AntecedentesJustificacion, Metodologia, Objetivos, Impacto, SectorPublico, FormacionRH, SubtotalCriterios, cInfraestructura, cActividades, cRH, cProgramacion, cPresupuesto, SubtotalViabilidad, Total) 
		VALUES (ProyectoId, cAntecedentesJustificacion, cMetodologia, cObjetivos, cImpacto, cSectorPublico, cFormacionRH, SubtotalCriterios, cInfraestructura, cActividades, cRH, cProgramacion, cPresupuesto, SubtotalViabilidad, Total);

		SELECT '¡Datos Registrados con Exito!' INTO respuesta;			

	ELSE
		SELECT 'El Proyecto No Existe.' INTO respuesta;
	END IF; -- if (Existe)
	
END $
DELIMITER ;

-- Ejecucion del Procedimiento Almacenado
CALL pInsertarHojaAnalisis ('Proy-03', 9, 7, 8, 9, 7, 7, 4, 2, 1, 3, 5, @res);
SELECT @res AS Respuesta;