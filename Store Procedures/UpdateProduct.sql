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
-- Description:	Update a Product
-- EXEC UpdateProduct @ProductID, @ProductName = 'New Product', @CategoryID = 1, @SubCategoryID = 1, @UnitPrice = 0.00, @Quantity = 10
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProduct]
	@ProductID INT,
	@ProductName NVARCHAR(150),
	@CategoryID INT,
	@SubCategoryID INT,
    @UnitPrice DECIMAL(18,2),
	@Quantity INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
   		UPDATE dbo.Product
       	SET ProductName = @ProductName,
            CategoryID = @CategoryID,
            SubCategoryID = @SubCategoryID,
            UnitPrice = @UnitPrice,
			Quantity = @Quantity
        WHERE ProductID = @ProductID;
	END TRY
	BEGIN CATCH
   		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END