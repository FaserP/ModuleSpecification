USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SearchFinalApproval]    Script Date: 15/08/2014 14:02:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Get all Final Approval for a module
-- =============================================
CREATE PROCEDURE [dbo].[SearchFinalApproval]
	-- Add the parameters for the stored procedure here
	@ModuleCode varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT FinalApprovedID, ModuleCode, ApprovalStatus, UsernameFrom, RoleFrom, EmailFrom, UserNameTo,
	RoleTo, EmailTo, CAST(TimeDate AS nvarchar(30)) AS timedate, Comments 
	FROM approvalfinal
	WHERE ModuleCode = @ModuleCode
END

GO

