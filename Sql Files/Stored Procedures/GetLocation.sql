USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[GetLocation]    Script Date: 15/08/2014 13:57:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select everything from the location table
-- =============================================
CREATE PROCEDURE [dbo].[GetLocation]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT		location.LocationID, location.LocationName
	FROM		location

END

GO

