USE [FormatosTESE];
GO
-- ======================================================
-- Descripción: Administración de Catálogos.
-- 2022-05-29 Gmartinez: Creación del Stored Procedure.
-- ======================================================
CREATE PROCEDURE [dbo].[pObtenerCatalogos]
(
	@Opcion				INT,
	@CodigoError		INT				OUTPUT,	-- Código de error
	@MensajeError		VARCHAR(2048)	OUTPUT	-- Mensaje de error
)
AS
BEGIN
	-- Desactiva los mensajes
	SET NOCOUNT ON;

	-- Transaccion
	DECLARE @Transaccion VARCHAR(20) = 'ObtenerCatalogos';
		
	BEGIN TRY
		BEGIN TRANSACTION @Transaccion;

		SET @CodigoError = 0;
		SET @MensajeError = '';

		IF (@Opcion = 1)
		BEGIN
			SELECT * FROM [FormatosTESE].[dbo].[DivisionAcademica] WITH (NOLOCK);
		END;

		IF (@Opcion = 2)
		BEGIN
			SELECT * FROM [FormatosTESE].[dbo].[EstadoProceso] WITH (NOLOCK);
		END;

		IF (@Opcion = 3)
		BEGIN
			SELECT * FROM [FormatosTESE].[dbo].[AreaInvestigacion] WITH (NOLOCK);
		END;

		IF (@Opcion = 4)
		BEGIN
			SELECT * FROM [FormatosTESE].[dbo].[NivelAcademico] WITH (NOLOCK);
		END;
			
		-- Confirma la transaccion
		COMMIT TRANSACTION @Transaccion;		
	END TRY
	BEGIN CATCH
		-- Obtiene el error
		SET @CodigoError = ERROR_NUMBER();
		SET @MensajeError = ERROR_MESSAGE();

		-- Rechaza la transaccion
		ROLLBACK TRANSACTION;
	END CATCH;
END;

-- EXECUTE [FormatosTESE].[dbo].[pObtenerCatalogos] @Opcion = 2, @CodigoError = 0, @MensajeError = '';