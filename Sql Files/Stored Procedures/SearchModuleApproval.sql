USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SearchModuleApproval]    Script Date: 15/08/2014 14:02:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Search all modules for approval
-- =============================================
CREATE PROCEDURE [dbo].[SearchModuleApproval]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT module.ModuleCode, LOWER(module.ModuleTitle) AS ModuleTitle
    FROM module
END

GO

