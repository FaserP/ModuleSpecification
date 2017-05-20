USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectAssessmentTableInformation]    Script Date: 15/08/2014 14:02:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select the summative assessment table which is linked to a module
-- =============================================
CREATE PROCEDURE [dbo].[SelectAssessmentTableInformation]
	-- Add the parameters for the stored procedure here
	@AssessmentID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        SummativeID, AssessmentType, LO, Summary, Component, FE, TR, AM, AssessmentID
	FROM          summative
	WHERE         (AssessmentID = @AssessmentID)


END

GO

