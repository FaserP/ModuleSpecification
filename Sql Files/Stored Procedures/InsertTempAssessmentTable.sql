USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertTempAssessmentTable]    Script Date: 15/08/2014 14:00:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert a new assessment table from temp assessment table
-- =============================================
CREATE PROCEDURE [dbo].[InsertTempAssessmentTable]
	-- Add the parameters for the stored procedure here
	@SummativeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [temptableassessment] WHERE [SummativeID] = @SummativeID
END

GO

