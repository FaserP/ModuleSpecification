USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertNewLocation]    Script Date: 15/08/2014 14:00:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert a new location to location table
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewLocation]
	-- Add the parameters for the stored procedure here
	@LocationName varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [location] ([LocationName]) 
	VALUES (@LocationName)

END

GO

