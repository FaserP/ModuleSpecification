USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectTempLocations]    Script Date: 15/08/2014 14:04:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select all locations to a module in temp location table
-- =============================================
CREATE PROCEDURE [dbo].[SelectTempLocations]
	-- Add the parameters for the stored procedure here
	@ModuleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ModuleID, LocationID, LocationName + CHAR(10) AS LocationName 
	FROM temptablelocation WHERE (ModuleID = @ModuleID)
END

GO

