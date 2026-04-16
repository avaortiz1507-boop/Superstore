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
-- Description:	Create a Customer
-- EXEC CreateCustomer @FirstName = 'Ava', @LastName = 'Ortiz', @SegmentID = 1
-- =============================================
CREATE PROCEDURE [dbo].[CreateCustomer]
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@SegmentID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
BEGIN TRY
	INSERT INTO dbo.Customer(FirstName, LastName, SegmentID)
	VALUES(@FirstName, @LastName, @SegmentID);
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

END