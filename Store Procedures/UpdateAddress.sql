USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[CreateAddress]    Script Date: 4/23/2026 1:43:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 4/23/2026
-- Update date:
-- Description:	Update an Address
-- EXEC UpdateAddress @AddressLine1 = '567 Side Street', @AddressLine2 = 'Apt 4, '@City = 'Burlington', @StateID = 48, @CountryID = 228, @PostalCode = 5408, @RegionID = 1, @AddressTypeID = 2, @CustomerID = 7
-- =============================================
CREATE PROCEDURE [dbo].[UpdateAddress]
	@AddressID INT,
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
	UPDATE dbo.Address
	SET AddressLine1 = @AddressLine1,
	AddressLine2 = @AddressLine2,
	City = @City,
	StateID = @StateID,
	CountryID = @CountryID,
	PostalCode = @PostalCode,
	RegionID = @RegionID,
	AddressTypeID = @AddressTypeID,
	CustomerID = @CustomerID,
	DateUpdated = GETDATE()
	WHERE AddressID = @AddressID;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

END
