USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[temptableinsert]    Script Date: 15/08/2014 14:05:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[temptableinsert]

@AssessmentID int

AS
BEGIN
DELETE FROM [temptableassessment] WHERE @AssessmentID = @AssessmentID
BEGIN
IF NOT EXISTS (
SELECT * FROM temptableassessment WHERE AssessmentID = @AssessmentID
)
INSERT INTO temptableassessment(ModuleID, AssessmentID, AssessmentType, LO, Summary, Component, FE, TR, AM)
SELECT module.ModuleID, summative.AssessmentID, summative.AssessmentType, summative.LO, summative.Summary, summative.Component, 
	   summative.FE, summative.TR, summative.AM 
	   FROM summative INNER JOIN assessment ON assessment.AssessmentID = summative.AssessmentID
	   INNER JOIN module ON module.AssessmentID = assessment.AssessmentID
WHERE summative.AssessmentID = @AssessmentID
END
END
GO

