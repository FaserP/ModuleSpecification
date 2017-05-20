USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertTempLocation]    Script Date: 15/08/2014 14:01:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert new location into temp location table
-- =============================================
CREATE PROCEDURE [dbo].[InsertTempLocation]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@LocationID int,
	@LocationName varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO temptablelocation(ModuleID, LocationID, LocationName)
	VALUES (@ModuleID, @LocationID, @LocationName)
END

GO

