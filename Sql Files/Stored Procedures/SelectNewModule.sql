USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectNewMoulde]    Script Date: 15/08/2014 14:03:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select all the module information from module, learningoutcomes, assessment, moduletype, otherinfo and school
--				for a new module when it has been inserted.
-- =============================================
CREATE PROCEDURE [dbo].[SelectNewMoulde]
	-- Add the parameters for the stored procedure here
	@ModuleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Select all module information where moduleid will equal to @ModuleID
SELECT        module.ModuleID, module.ModuleCode, module.ModuleTitle, module.CreditRating, module.ModuleRating, module.Pre_Requisites, module.R_P_S, 
              module.Co_Requisites, module.SharedTeaching, module.P_B_R, module.Graded, module.BarredCombination, module.Synopsis, module.Syllabus, module.Strategy, 
              module.ResourcesRequired, module.ReadingList, module.Approved, module.SchoolID, module.LockedStatus, module.ActiveModule,
			  
			  learningoutcomes.OutcomesID, learningoutcomes.LearningOutcomes, learningoutcomes.Knowledge, learningoutcomes.Abilities,

			  assessment.AssessmentID, assessment.AssessmentStrategy, assessment.Formative, assessment.Summative, assessment.Tasks, assessment.Criteria, 
			  
			  learningmethods.MethodsID, learningmethods.Lecture, learningmethods.Seminar, learningmethods.TutorialAndProject, learningmethods.PracticalAndDemonstrations, 
			  learningmethods.StudioAndWorkshop, learningmethods.FieldworkAndExternal, learningmethods.WorkbasedLearning, learningmethods.Placement, 
			  learningmethods.IndependentStudy, learningmethods.Lecture + learningmethods.Seminar + learningmethods.TutorialAndProject + learningmethods.PracticalAndDemonstrations + 
			  learningmethods.StudioAndWorkshop + learningmethods.FieldworkAndExternal + learningmethods.WorkbasedLearning + learningmethods.Placement +
			  learningmethods.IndependentStudy AS TotalHours,
			  
			  moduletype.TypeID, moduletype.Compulsory, moduletype.Core, moduletype.Optional, moduletype.StandAlone,

			  otherinfos.InfoID, otherinfos.ModuleAims, otherinfos.ModuleScheme, otherinfos.OtherInfo, otherinfos.ModuleStatus,

			  school.SchoolName

FROM            module INNER JOIN
                         learningoutcomes ON module.OutcomesID = learningoutcomes.OutcomesID INNER JOIN
                         assessment ON module.AssessmentID = assessment.AssessmentID INNER JOIN
                         learningmethods ON module.MethodsID = learningmethods.MethodsID INNER JOIN
                         moduletype ON module.TypeID = moduletype.TypeID INNER JOIN
                         otherinfos ON module.InfoID = otherinfos.InfoID INNER JOIN
						 school ON module.SchoolID = school.SchoolID

WHERE		module.ModuleID = @ModuleID

END

GO

