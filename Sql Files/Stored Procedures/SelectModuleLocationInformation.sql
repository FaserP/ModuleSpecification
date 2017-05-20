USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectModuleLocationInformation]    Script Date: 15/08/2014 14:03:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select location linked to a module in the moduleslocation table
-- =============================================
CREATE PROCEDURE [dbo].[SelectModuleLocationInformation]
	-- Add the parameters for the stored procedure here
	@ModuleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select all location linked to a module
SELECT        moduleslocation.ModuleID, moduleslocation.LocationID, location.LocationName + char(10) AS LocationName
FROM            module INNER JOIN
                         moduleslocation ON module.ModuleID = moduleslocation.ModuleID INNER JOIN
                         location ON moduleslocation.LocationID = location.LocationID
WHERE        (moduleslocation.ModuleID = @ModuleID)

END

GO

