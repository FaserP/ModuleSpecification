USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertModuleTutor]    Script Date: 15/08/2014 13:59:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert a new tutor linked to a module in the modulestutor table
-- =============================================
CREATE PROCEDURE [dbo].[InsertModuleTutor]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@TutorID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert a new tutor in the modulestutor table
	INSERT INTO [modulestutor] ([ModuleID], [TutorID]) 
	VALUES		(@ModuleID, @TutorID)

END

GO

