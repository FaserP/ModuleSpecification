USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[UpdateTutors]    Script Date: 15/08/2014 14:06:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Update a course
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTutors]
	-- Add the parameters for the stored procedure here
	@TutorID int,
	@TutorName varchar(100),
	@DeptID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [tutor] 
	SET [TutorName] = @TutorName, [DeptID] = @DeptID 
	WHERE [TutorID] = @TutorID

END

GO

