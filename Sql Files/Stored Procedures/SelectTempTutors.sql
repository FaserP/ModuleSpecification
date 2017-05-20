USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectTempTutors]    Script Date: 15/08/2014 14:04:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select all tutors to a module in temp tutor course
-- =============================================
CREATE PROCEDURE [dbo].[SelectTempTutors]
	-- Add the parameters for the stored procedure here
	@ModuleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT temptabletutor.ModuleID, temptabletutor.TutorID, 
	CONCAT (tutor.TutorName, ISNULL(', ' + department.DeptName, ''), CHAR(10)) AS ModuleLeader
			
	FROM module INNER JOIN temptabletutor ON module.ModuleID = temptabletutor.ModuleID 
				INNER JOIN tutor ON temptabletutor.TutorID = tutor.TutorID 
				INNER JOIN department ON tutor.DeptID = department.DeptID 
	WHERE (temptabletutor.ModuleID = @ModuleID)
END

GO

