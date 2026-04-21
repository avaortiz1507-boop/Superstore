USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[CreateAddress]    Script Date: 4/21/2026 1:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 4/21/2026
-- Update date:
-- Description:	Create an Address
-- EXEC CreateAddress @AddressLine1 = '567 Side Street', @AddressLine2 = 'Apt 4, '@City = 'Burlington', @StateID = 48, @CountryID = 228, @PostalCode = 5408, @RegionID = 1, @AddressTypeID = 2, @CustomerID = 7
-- =============================================
CREATE PROCEDURE [dbo].[CreateAddress]
	@AddressLine1 NVARCHAR(25),
	@AddressLine2 NVARCHAR(25),
	@City NVARCHAR(50),
	@StateID INT,
	@CountryID INT,
	@PostalCode INT,
	@RegionID INT,
	@AddressTypeID INT,
	@CustomerID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
BEGIN TRY
	INSERT INTO dbo.Address(AddressLine1,AddressLine2, City,StateID,CountryID,PostalCode,RegionID,AddressTypeID)
	VALUES(@AddressLine1,@AddressLine2,@City,@StateID,@CountryID,@PostalCode,@RegionID,@AddressTypeID);
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

END
