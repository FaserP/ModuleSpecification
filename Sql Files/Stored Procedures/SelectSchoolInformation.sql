USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectSchoolInformation]    Script Date: 15/08/2014 14:03:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select everything from the school table
-- =============================================
CREATE PROCEDURE [dbo].[SelectSchoolInformation]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT school.SchoolID, school.SchoolName
	FROM [school]

END

GO

