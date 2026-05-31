USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerOrderDetail]    Script Date: 5/31/2026 2:01:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 5/31/2026
-- Description:	Get all Orders
-- EXEC GetCustomerOrderDetail @CustomerID = 1
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomerOrderDetail]
@CustomerID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

      BEGIN TRY
        SELECT
            od.OrderID,
            od.ProductID,
            p.ProductName,
            p.CategoryID,
            p.SubCategoryID,
            p.UnitPrice,
            p.Inventory,
            o.CustomerID,
            c.FirstName,
            c.LastName
        FROM dbo.OrderDetail AS od
        INNER JOIN dbo.[Order] AS o
            ON od.OrderID = o.OrderID
        INNER JOIN dbo.Product AS p
            ON od.ProductID = p.ProductID
        INNER JOIN dbo.Customer AS c
            ON o.CustomerID = c.CustomerID
        WHERE o.CustomerID = @CustomerID
        ORDER BY od.OrderID DESC, od.ProductID;
    END TRY
	BEGIN CATCH
   		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
END