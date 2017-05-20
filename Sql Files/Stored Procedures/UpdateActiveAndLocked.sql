USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[UpdateActiveAndLocked]    Script Date: 15/08/2014 14:05:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Update Active modules and Locked modules
-- =============================================
CREATE PROCEDURE [dbo].[UpdateActiveAndLocked]
	-- Add the parameters for the stored procedure here
	@ModuleCode varchar(10),
	@ModuleTitle varchar(200),
	@ActiveModule bit,
	@LockedStatus int,
	@ModuleID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [module] 
	SET [ModuleCode] = @ModuleCode, 
		[ModuleTitle] = @ModuleTitle, 
		[ActiveModule] = @ActiveModule, 
		[LockedStatus] = @LockedStatus 
	WHERE [ModuleID] = @ModuleID

END

GO

