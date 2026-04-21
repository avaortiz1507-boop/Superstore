USE [Superstore]
GO
/****** Object:  StoredProcedure [dbo].[GetAllAddresses]    Script Date: 4/21/2026 1:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ava Ortiz
-- Create date: 4/21/2026
-- Update date:
-- Description:	Get all Addresses for Customer
-- EXEC GetAllAddresses @CustomerID = 1
-- =============================================
CREATE PROCEDURE [dbo].[GetAllAddresses]
	@CustomerID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
BEGIN TRY
	-- Return TOP 10 addresses with segment information
	SELECT TOP 10 a.AddressID, a.AddressLine1, a.AddressLine2, a.City, s.State,
	c.Country, r.Region, at.AddressType, a.CustomerID
	FROM dbo.Address AS a
	JOIN dbo.AddressType AS at
	ON a.AddressTypeID = at.AddressTypeID
	JOIN dbo.Country as c
	ON a.CountryID = c.CountryID
	JOIN dbo.Region as r
	ON a.RegionID = r.RegionID
	JOIN dbo.State as s
	ON a.StateID = s.StateID
	WHERE IsActive = 1 AND CustomerID = @CustomerID;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH

END