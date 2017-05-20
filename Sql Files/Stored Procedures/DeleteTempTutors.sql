USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[DeleteTempTutors]    Script Date: 15/08/2014 13:57:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Delete all tutors to a module in temp tutor course
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTempTutors]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@TutorID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM temptabletutor WHERE (ModuleID = @ModuleID) AND (TutorID = @TutorID)
END

GO

