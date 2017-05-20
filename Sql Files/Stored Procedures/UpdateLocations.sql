USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[UpdateLocations]    Script Date: 15/08/2014 14:06:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Update a location to location table
-- =============================================
CREATE PROCEDURE [dbo].[UpdateLocations]
	-- Add the parameters for the stored procedure here
	@LocationID int,
	@LocationName varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [location] 
	SET [LocationName] = @LocationName 
	WHERE [LocationID] = @LocationID

END

GO

