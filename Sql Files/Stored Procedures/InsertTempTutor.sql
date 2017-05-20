USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertTempTutor]    Script Date: 15/08/2014 14:01:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert a new tutors to a module in temp tutor course
-- =============================================
CREATE PROCEDURE [dbo].[InsertTempTutor]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@TutorID int,
	@TutorName varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO temptabletutor(ModuleID, TutorID, TutorName) 
	VALUES (@ModuleID, @TutorID, @TutorName)
END

GO

