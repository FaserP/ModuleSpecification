USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertModuleCourse]    Script Date: 15/08/2014 13:59:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert a new course linked to a module
-- =============================================
CREATE PROCEDURE [dbo].[InsertModuleCourse]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@CourseID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Inserting a new course to a module in the modulespec table
BEGIN

	INSERT INTO [modulespec] ([ModuleID], [CourseID])
	VALUES		(@ModuleID, @CourseID)
END

END

GO

