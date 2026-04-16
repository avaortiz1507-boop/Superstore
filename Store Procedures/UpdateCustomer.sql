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
-- Description:	Update a Customer
-- EXEC UpdateCustomer @FirstName = 'Ava', @LastName = 'Ortiz', @SegmentID = 1, @CustomerID = 1
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCustomer]
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@SegmentID INT,
	@CustomerID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
BEGIN TRY
	UPDATE dbo.Customer
	SET FirstName = @FirstName,
	LastName = @LastName, 
	SegmentID = @SegmentID,
	DateUpdated = GETDATE()
	WHERE CustomerID= @CustomerID;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

END

