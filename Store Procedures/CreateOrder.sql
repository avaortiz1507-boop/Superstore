USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 5/31/2026 2:32:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 5/31/2026
-- Description:	Create a Order
-- EXEC CreateOrder @CustomerID = 1, @SalesPrice = 500.67, @Quantity = 5, @Discount = 0.00, @Profit = 200.90, @ShipModeID = 1
-- =============================================
ALTER PROCEDURE [dbo].[CreateOrder]
    @CustomerID INT,
    @SalesPrice DECIMAL(18,2),
    @Quantity INT,
    @Discount DECIMAL(18,2),
    @Profit DECIMAL(18,2),
    @ShipModeID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if an identical order already exists
        IF EXISTS (
            SELECT 1
            FROM dbo.[Order]
            WHERE CustomerID = @CustomerID
              AND SalesPrice = @SalesPrice
              AND Quantity = @Quantity
              AND Discount = @Discount
              AND Profit = @Profit
              AND ShipModeID = @ShipModeID
        )
        BEGIN
            DECLARE @ExistingOrderID INT = (
                SELECT OrderID
                FROM dbo.[Order]
                WHERE CustomerID = @CustomerID
                  AND SalesPrice = @SalesPrice
                  AND Quantity = @Quantity
                  AND Discount = @Discount
                  AND Profit = @Profit
                  AND ShipModeID = @ShipModeID
            );

            EXEC GetOrder @OrderID = @ExistingOrderID;
            RETURN;
        END

        -- Insert new order
        INSERT INTO dbo.[Order]
        (
            CustomerID,
            SalesPrice,
            Quantity,
            Discount,
            Profit,
            ShipModeID
        )
        VALUES
        (
            @CustomerID,
            @SalesPrice,
            @Quantity,
            @Discount,
            @Profit,
            @ShipModeID
        );

        -- Return the newly created order
        DECLARE @NewOrderID INT = SCOPE_IDENTITY();

        EXEC GetOrder @OrderID = @NewOrderID;

    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH;
END;

