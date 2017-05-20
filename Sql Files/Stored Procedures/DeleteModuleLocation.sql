USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[DeleteModuleLocation]    Script Date: 15/08/2014 13:56:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Delete a location linked to a module in the moduleslocation table
-- =============================================
CREATE PROCEDURE [dbo].[DeleteModuleLocation]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@LocationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Deletes a location linked to a module in the moduleslocation table
	DELETE FROM moduleslocation
	WHERE        (ModuleID = @ModuleID) AND (LocationID = @LocationID)

END

GO

