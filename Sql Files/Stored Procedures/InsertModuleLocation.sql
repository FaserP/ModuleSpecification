USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertModuleLocation]    Script Date: 15/08/2014 13:59:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert a new location linked to a module in the moduleslocation table
-- =============================================
CREATE PROCEDURE [dbo].[InsertModuleLocation]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@LocationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [moduleslocation] ([ModuleID], [LocationID])
	VALUES		(@ModuleID, @LocationID)

END

GO

