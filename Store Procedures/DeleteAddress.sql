USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAddress]    Script Date: 4/21/2026 1:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 4/21/2026
-- Update date:
-- Description:	Delete an Address
-- EXEC DeleteAddress @AddressID = 1
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAddress]
	@AddressID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
BEGIN TRY
	UPDATE dbo.Address
	SET IsActive = 0,
	DateUpdated = GETDATE ()
	WHERE AddressID= @AddressID;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

END

