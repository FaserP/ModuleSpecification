USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[DeleteComments]    Script Date: 15/08/2014 13:55:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Delete all comments linking to the module
-- =============================================
ALTER PROCEDURE [dbo].[DeleteComments]
	-- Add the parameters for the stored procedure here
	@ProgressID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [approvalprogress] WHERE [ProgressID] = @ProgressID

END

GO

