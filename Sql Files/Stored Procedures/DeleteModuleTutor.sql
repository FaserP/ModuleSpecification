USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[DeleteModuleTutor]    Script Date: 15/08/2014 13:56:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Delete a tutor linked to a module in the modulestutor table
-- =============================================
CREATE PROCEDURE [dbo].[DeleteModuleTutor]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@TutorID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete a tutor in the modulestutor table
	DELETE FROM [modulestutor] 
	WHERE [ModuleID] = @ModuleID AND [TutorID] = @TutorID

END

GO

