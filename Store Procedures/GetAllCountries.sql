USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[GetAllAddressTypes]    Script Date: 5/17/2026 1:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 5/18/2026
-- Update date: 
-- Description:	Get all countries
-- EXEC GetAllCountries
-- =============================================
CREATE PROCEDURE [dbo].[GetAllCountries]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
   		
		SELECT CountryID, Country, Latitude, Longitude, Name
		FROM dbo.Country
	END TRY
	BEGIN CATCH
   		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END