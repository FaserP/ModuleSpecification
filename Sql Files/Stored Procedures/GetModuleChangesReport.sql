USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[GetModuleChangesReport]    Script Date: 15/08/2014 13:58:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Gets all module information about what has been changed for a report
-- =============================================
Create PROCEDURE [dbo].[GetModuleChangesReport]
	-- Add the parameters for the stored procedure here
	@ModuleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
	module.ModuleCode, temptablemodule.ModuleCode AS TempModuleCode, 
	module.ModuleTitle, temptablemodule.ModuleTitle AS TempModuleTitle, 
	module.CreditRating, temptablemodule.CreditRating AS TempCreditRating, 
	module.ModuleRating, temptablemodule.ModuleRating AS TempModuleRating, 
	module.Pre_Requisites, temptablemodule.Pre_Requisites AS TempPre_Requisites, 
	module.R_P_S, temptablemodule.R_P_S AS TempR_P_S, 
	module.Co_Requisites, temptablemodule.Co_Requisites AS TempCo_Requisities, 
	module.SharedTeaching, temptablemodule.SharedTeaching AS TempSharedTeaching, 
	module.P_B_R, temptablemodule.P_B_R AS TempP_B_R, 
	module.Graded, temptablemodule.Graded AS TempGraded, 
	module.BarredCombination, temptablemodule.BarredCombination AS TempBarredCombination, 
	module.Synopsis, temptablemodule.Synopsis AS TempSynopsis, 
	module.Syllabus, temptablemodule.Syllabus AS TempSyllabus, 
	module.Strategy, temptablemodule.Strategy AS TempStrategy, 
	module.ResourcesRequired, temptablemodule.ResourcesRequired AS TempResourcesRequired, 
	module.ReadingList, temptablemodule.ReadingList AS TempReadingList, 
	module.Approved, temptablemodule.Approved AS TempApproved, 
	learningoutcomes.LearningOutcomes, temptablemodule.LearningOutcomes AS TempLearningOutcomes, 
	learningoutcomes.Knowledge, temptablemodule.Knowledge AS TempKnowledge, 
	learningoutcomes.Abilities, temptablemodule.Abilities AS TempAbilities, 
	assessment.AssessmentStrategy, temptablemodule.AssessmentStrategy AS TempAssessmentStrategy, 
	assessment.Formative, temptablemodule.Formative AS TempFormative, 
	assessment.Summative, temptablemodule.Summative AS TempSummative, 
	assessment.Tasks, temptablemodule.Tasks AS TempTasks, 
	assessment.Criteria, temptablemodule.Criteria AS TempCriteria, 
	moduletype.Compulsory, temptablemodule.Compulsory AS TempCompulsory, 
	moduletype.Core, temptablemodule.Core AS TempCore, 
	moduletype.Optional, temptablemodule.Optional AS TempOptional, 
	moduletype.StandAlone, temptablemodule.StandAlone AS TempStandAlone, 
	learningmethods.Lecture, temptablemodule.Lecture AS lm1, 
	learningmethods.Seminar, temptablemodule.Seminar AS lm2, 
	learningmethods.TutorialAndProject, temptablemodule.TutorialAndProject AS lm3, 
	learningmethods.PracticalAndDemonstrations, temptablemodule.PracticalAndDemonstrations AS lm4, 
	learningmethods.StudioAndWorkshop, temptablemodule.StudioAndWorkshop AS lm5, 
	learningmethods.FieldworkAndExternal, temptablemodule.FieldworkAndExternal AS lm6, 
	learningmethods.WorkbasedLearning, temptablemodule.WorkbasedLearning AS lm7, 
	learningmethods.Placement, temptablemodule.Placement AS lm8, 
	learningmethods.IndependentStudy, temptablemodule.IndependentStudy AS lm9,
	learningmethods.Lecture + learningmethods.Seminar + learningmethods.TutorialAndProject + learningmethods.PracticalAndDemonstrations + 
	learningmethods.StudioAndWorkshop + learningmethods.FieldworkAndExternal + learningmethods.WorkbasedLearning + learningmethods.Placement +
	learningmethods.IndependentStudy AS TotalHours,
	temptablemodule.Lecture + temptablemodule.Seminar + temptablemodule.TutorialAndProject + temptablemodule.PracticalAndDemonstrations + 
	temptablemodule.StudioAndWorkshop + temptablemodule.FieldworkAndExternal + temptablemodule.WorkbasedLearning + temptablemodule.Placement +
	temptablemodule.IndependentStudy AS TempTotalHours,
	otherinfos.ModuleAims, temptablemodule.ModuleAims AS TempAims, 
	otherinfos.ModuleScheme, temptablemodule.ModuleScheme AS TempScheme, 
	otherinfos.OtherInfo, temptablemodule.OtherInfo AS TempOtherinfo, 
	otherinfos.ModuleStatus, temptablemodule.ModuleStatus AS TempStatus 
	
	FROM module 
	INNER JOIN assessment ON module.AssessmentID = assessment.AssessmentID 
	INNER JOIN learningoutcomes ON module.OutcomesID = learningoutcomes.OutcomesID 
	INNER JOIN learningmethods ON module.MethodsID = learningmethods.MethodsID 
	INNER JOIN moduletype ON module.TypeID = moduletype.TypeID 
	INNER JOIN otherinfos ON module.InfoID = otherinfos.InfoID 
	INNER JOIN temptablemodule ON module.ModuleID = temptablemodule.ModuleID

	WHERE module.ModuleID = @ModuleID
END

GO

