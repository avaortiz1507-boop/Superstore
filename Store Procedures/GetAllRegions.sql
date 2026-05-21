USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[GetAllRegions]    Script Date: 5/19/2026 1:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 5/19/2026
-- Update date: 
-- Description:	Get all regions
-- EXEC GetAllRegions
-- =============================================
CREATE PROCEDURE [dbo].[GetAllRegions]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
   		
		SELECT RegionID, Region
		FROM dbo.Region
	END TRY
	BEGIN CATCH
   		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END