USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 4/28/2026 10:46:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 5/5/2026
-- Update date: 
-- Description:	Get a Product by ID
-- EXEC GetProduct @ProductID = 1
-- =============================================
CREATE PROCEDURE [dbo].[GetProduct]
	@ProductID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
   		
		SELECT TOP 1 ProductID,
			ProductName,
			CategoryID,
			SubCategoryID,
			UnitPrice,
			ProductKey,
			Quantity
			FROM dbo.Product
			WHERE ProductID = @ProductID; --IsActive = 1;
	END TRY
	BEGIN CATCH
   		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END