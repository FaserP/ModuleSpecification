USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[UpdateCourses]    Script Date: 15/08/2014 14:06:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Update courses to course table
-- =============================================
CREATE PROCEDURE [dbo].[UpdateCourses]
	-- Add the parameters for the stored procedure here
	@CourseID int,
	@CourseName varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [course] 
	SET [CourseName] = @CourseName 
	WHERE [CourseID] = @CourseID

END

GO

