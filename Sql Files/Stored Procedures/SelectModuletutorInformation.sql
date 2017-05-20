USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectModuleTutorInformation]    Script Date: 15/08/2014 14:03:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select tutor details linked to a module
-- =============================================
Create PROCEDURE [dbo].[SelectModuleTutorInformation]
	-- Add the parameters for the stored procedure here
	@ModuleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select tutor details and also Concat both tutor and department into one field
SELECT		modulestutor.ModuleID, modulestutor.TutorID, tutor.DeptID, 
			CONCAT ( tutor.TutorName, ISNULL(', ' + department.DeptName, ''), CHAR(10)) AS ModuleLeader,
			TutorName AS TutorLogin

FROM		module 
			INNER JOIN modulestutor ON module.ModuleID = modulestutor.ModuleID 
			INNER JOIN tutor ON modulestutor.TutorID = tutor.TutorID 
			INNER JOIN department ON tutor.DeptID = department.DeptID
			
WHERE		(modulestutor.ModuleID = @ModuleID)

END

GO

