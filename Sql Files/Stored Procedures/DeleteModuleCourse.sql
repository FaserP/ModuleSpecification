USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[DeleteModuleCourse]    Script Date: 15/08/2014 13:55:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Delete a course linked to a module
-- =============================================
CREATE PROCEDURE [dbo].[DeleteModuleCourse]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@CourseID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete course linked to module in modulespec table
DELETE FROM [modulespec] 
WHERE [ModuleID] = @ModuleID AND [CourseID] = @CourseID

END

GO

