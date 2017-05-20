USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[temptutorinsert]    Script Date: 15/08/2014 14:05:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[temptutorinsert]

@ModuleID int

AS
BEGIN
DELETE FROM temptabletutor WHERE ModuleID = @ModuleID
BEGIN
IF NOT EXISTS (
SELECT * FROM temptabletutor WHERE ModuleID = @ModuleID
)
INSERT INTO temptabletutor(ModuleID, TutorID, TutorName, DeptName)
SELECT		module.ModuleID, tutor.TutorID, tutor.TutorName, department.DeptName

FROM		module 
			INNER JOIN modulestutor ON module.ModuleID = modulestutor.ModuleID 
			INNER JOIN tutor ON modulestutor.TutorID = tutor.TutorID 
			INNER JOIN department ON tutor.DeptID = department.DeptID
WHERE		module.ModuleID = @ModuleID
END
END
GO

