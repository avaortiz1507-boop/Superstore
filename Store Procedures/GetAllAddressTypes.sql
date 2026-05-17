USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[GetAllAddressTypes]    Script Date: 5/14/2026 2:25:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 5/14/2026
-- Update date: 
-- Description:	Get all address types
-- EXEC GetAllAddressTypes
-- =============================================
CREATE PROCEDURE [dbo].[GetAllAddressTypes]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
   		
		SELECT AddressType, AddressType
		FROM dbo.AddressType
	END TRY
	BEGIN CATCH
   		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END