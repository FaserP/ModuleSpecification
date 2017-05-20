USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SearchModuleInformation]    Script Date: 15/08/2014 14:02:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Search for modules in the search page and
--				allows to filter the search by school and active module
-- =============================================
CREATE PROCEDURE [dbo].[SearchModuleInformation]
	-- Add the parameters for the stored procedure here
	@SchoolsID int, 
	@ActiveModule int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Search the module and school table
	SELECT DISTINCT module.ModuleID, module.ModuleCode, LOWER(module.ModuleTitle) AS ModuleTitle, 
					module.ModuleDoc, schools.SchoolsID, schools.SchoolName 
	
	FROM module INNER JOIN schools ON module.SchoolsID = schools.SchoolsID 
	
	--Filter by school and active module
	WHERE (schools.SchoolsID = CASE WHEN @SchoolsID = - 1 THEN schools.SchoolsID ELSE @SchoolsID END) 
	AND	  (module.ActiveModule = CASE WHEN @ActiveModule = 0 THEN module.ActiveModule ELSE @ActiveModule END) 
	
	--Order by module code
	ORDER BY module.ModuleCode

END

GO

