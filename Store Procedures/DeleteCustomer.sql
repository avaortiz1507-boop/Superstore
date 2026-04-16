USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[GetCustomer]    Script Date: 4/16/2026 1:12:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 4/16/2026
-- Update date:
-- Description:	Delete a Customer
-- EXEC DeleteCustomer @CustomerID = 1
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCustomer]
	@CustomerID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
BEGIN TRY
	UPDATE dbo.Customer
	SET IsActive = 0,
	DateUpdated = GETDATE ()
	WHERE CustomerID= @CustomerID;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

END

