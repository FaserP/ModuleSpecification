USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[GetDepartment]    Script Date: 15/08/2014 13:57:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select all department detao;s
-- =============================================
CREATE PROCEDURE [dbo].[GetDepartment]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT department.DeptID, department.DeptName
	FROM [department]

END

GO

