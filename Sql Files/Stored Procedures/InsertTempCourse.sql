USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertTempCourse]    Script Date: 15/08/2014 14:01:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert new course into temp course table
-- =============================================
CREATE PROCEDURE [dbo].[InsertTempCourse]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@CourseID int,
	@CourseName varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO temptablecourse(ModuleID, CourseID, CourseName) 
	VALUES (@ModuleID, @CourseID, @CourseName)
END

GO

