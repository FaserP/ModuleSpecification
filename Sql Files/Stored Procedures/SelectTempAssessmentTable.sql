USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectTempAssessmentTable]    Script Date: 15/08/2014 14:04:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select Assessment Table for module from temp assessment table
-- =============================================
CREATE PROCEDURE [dbo].[SelectTempAssessmentTable]
	-- Add the parameters for the stored procedure here
	@ModuleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [temptableassessment] WHERE ModuleID = @ModuleID
END

GO

