USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectTempCourses]    Script Date: 15/08/2014 14:04:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select all courses to a module in temp course table
-- =============================================
CREATE PROCEDURE [dbo].[SelectTempCourses]
	-- Add the parameters for the stored procedure here
	@ModuleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ModuleID, CourseID, CourseName + CHAR(10) AS CourseName 
	FROM temptablecourse 
	WHERE (ModuleID = @ModuleID)
END

GO

