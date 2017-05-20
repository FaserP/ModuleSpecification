USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[DeleteTempCourses]    Script Date: 15/08/2014 13:56:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Delete courses from temp course table
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTempCourses]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@CourseID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM temptablecourse WHERE ModuleID = @ModuleID AND [CourseID] = @CourseID
END

GO

