USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[GetSAVPList]    Script Date: 15/08/2014 13:58:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Gets all from the temptablemodule which are waiting to be approved by SAVP Admin
-- =============================================
CREATE PROCEDURE [dbo].[GetSAVPList]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ModuleID, ModuleCode, ModuleTitle, Approval, ApprovalStatus, ApprovalPerson 
	FROM temptablemodule 
	WHERE ApprovalStatus = 3
END

GO

