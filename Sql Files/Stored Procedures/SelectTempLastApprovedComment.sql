USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectTempLastApprovedComment]    Script Date: 15/08/2014 14:04:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	SELECT the last approval progress that was inserted for the module
-- =============================================
CREATE PROCEDURE [dbo].[SelectTempLastApprovedComment]
	-- Add the parameters for the stored procedure here
	@ModuleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 * 
	FROM approvalprogress 
	WHERE @ModuleID = @ModuleID
	ORDER BY ProgressID DESC
END

GO

