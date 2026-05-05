USE [Superstore]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 5/5/2026
-- Update date: 
-- Description:	Delete or Deactivate Product
-- EXEC DeleteProduct @ProductID = 1
-- EXEC DeleteProduct @ProductID = 1, @Delete = 1
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProduct]
	@ProductID INT,
	@Delete BIT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		IF @Delete = 1
			BEGIN
				DELETE FROM dbo.Product
				WHERE ProductID = @ProductID;
			END
		ELSE 
			BEGIN
   				SELECT @ProductID AS ProductID, 'Product deactivated' AS Message;
			END
	END TRY
	BEGIN CATCH
   		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END
