USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[DeleteTempLocations]    Script Date: 15/08/2014 13:56:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Delete locations from temp location table
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTempLocations]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@LocationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [temptablelocation] WHERE [ModuleID] = @ModuleID AND [LocationID] = @LocationID
END

GO

