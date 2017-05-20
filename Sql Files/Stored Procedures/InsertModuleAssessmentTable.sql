USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertModuleAssessmentTable]    Script Date: 15/08/2014 13:59:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select a new summative assessment table which is linked to a module
-- =============================================
CREATE PROCEDURE [dbo].[InsertModuleAssessmentTable]
	-- Add the parameters for the stored procedure here
	@AssessmentType varchar(200),
	@LO varchar(200),
	@Summary varchar(2000),
	@Component varchar(200),
	@FE bit,
	@TR bit,
	@AM bit,
	@AssessmentID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO			summative
						(AssessmentType, LO, Summary, Component, FE, TR, AM, AssessmentID)
	VALUES				(@AssessmentType,@LO,@Summary,@Component,@FE,@TR,@AM,@AssessmentID)

END

GO

