USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SearchApprovalProgress]    Script Date: 15/08/2014 14:01:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Get all approval progress for a module
-- =============================================
CREATE PROCEDURE [dbo].[SearchApprovalProgress]
	-- Add the parameters for the stored procedure here
	@ModuleCode varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ProgressID, ModuleCode, ApprovalStatus, UsernameFrom, RoleFrom, EmailFrom, UserNameTo, RoleTo, EmailTo, 
	CAST(TimeDate AS nvarchar(30)) AS timedate, Comments 
	FROM approvalprogress 
	WHERE (ModuleCode = @ModuleCode)
END

GO

