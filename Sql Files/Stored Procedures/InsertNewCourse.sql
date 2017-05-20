USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertNewCourse]    Script Date: 15/08/2014 13:59:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert a new course to course table
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewCourse]
	-- Add the parameters for the stored procedure here
	@CourseName varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [course] ([CourseName]) 
	VALUES (@CourseName)

END

GO

