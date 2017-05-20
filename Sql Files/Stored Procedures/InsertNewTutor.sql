USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertNewTutor]    Script Date: 15/08/2014 14:00:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert a new course to course table
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewTutor]
	-- Add the parameters for the stored procedure here
	@TutorName varchar(100),
	@DeptID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [tutor] ([TutorName], [DeptID]) 
	VALUES (@TutorName, @DeptID)

END

GO

