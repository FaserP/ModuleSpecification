USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectModuleCourseInformation]    Script Date: 15/08/2014 14:03:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Gets the course details linked to the module
-- =============================================
CREATE PROCEDURE [dbo].[SelectModuleCourseInformation]
	-- Add the parameters for the stored procedure here
	@ModuleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select the course information linked to the modulespec(coursemodule table) and module table
	SELECT		modulespec.ModuleID, modulespec.CourseID, course.CourseName + char(10) AS CourseName

	FROM		course 
				INNER JOIN modulespec ON course.CourseID = modulespec.CourseID 
				INNER JOIN module ON modulespec.ModuleID = module.ModuleID 
	WHERE		modulespec.ModuleID = @ModuleID

END

GO

