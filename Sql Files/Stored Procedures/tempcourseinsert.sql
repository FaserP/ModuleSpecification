USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[tempcourseinsert]    Script Date: 15/08/2014 14:05:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[tempcourseinsert]

@ModuleID int

AS
BEGIN

BEGIN
DELETE FROM temptablecourse WHERE ModuleID = @ModuleID

IF NOT EXISTS (
SELECT * FROM temptablecourse WHERE ModuleID = @ModuleID
)
INSERT INTO temptablecourse (ModuleID, CourseID, CourseName)

SELECT DISTINCT modulespec.ModuleID, modulespec.CourseID, course.CourseName FROM modulespec
		INNER JOIN course ON modulespec.CourseID = course.CourseID

WHERE ModuleID = @ModuleID and modulespec.CourseID = modulespec.CourseID
END
END
GO

