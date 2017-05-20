USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SearchActiveAndLocked]    Script Date: 15/08/2014 14:01:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select module information such as code, title, active module and locked status
--				and filtered by school
-- =============================================
CREATE PROCEDURE [dbo].[SearchActiveAndLocked]
	-- Add the parameters for the stored procedure here
	@SchoolsID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT module.ModuleID, module.ModuleCode, LOWER(module.ModuleTitle) AS ModuleTitle, 
					module.ActiveModule, module.LockedStatus, schools.SchoolsID, schools.SchoolName
	
	FROM module INNER JOIN schools ON module.SchoolsID = schools.SchoolsID 
	
	WHERE (schools.SchoolsID = CASE WHEN @SchoolsID = - 1 THEN schools.SchoolsID ELSE @SchoolsID END) 
	
	ORDER BY module.ModuleCode
END

GO

