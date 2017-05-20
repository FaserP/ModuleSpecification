USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertNewComment]    Script Date: 15/08/2014 13:59:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert a new comment that will be tracked in the approval progress
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewComment]
	-- Add the parameters for the stored procedure here
	@ModuleCode varchar(200),
	@ApprovalStatus varchar(200),
	@UsernameFrom varchar(200),
	@RoleFrom varchar(200),
	@EmailFrom varchar(300),
	@UserNameTo varchar(200),
	@RoleTo varchar(200),
	@EmailTo varchar(300)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO approvalprogress
    (ModuleCode, ApprovalStatus, UsernameFrom, RoleFrom, EmailFrom, UserNameTo, RoleTo, EmailTo, TimeDate, Comments)
	VALUES        
	(@ModuleCode,
	@ApprovalStatus,
	@UsernameFrom,
	@RoleFrom,
	@EmailFrom,
	@UserNameTo,
	@RoleTo,
	@EmailTo,CURRENT_TIMESTAMP, 
	NULL)

END

GO

