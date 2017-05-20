USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[SelectTempModuleInformation]    Script Date: 15/08/2014 14:04:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select all the module information from temp module table
-- =============================================
CREATE PROCEDURE [dbo].[SelectTempModuleInformation]
	-- Add the parameters for the stored procedure here
	@ModuleID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT temptablemodule.ModuleID, temptablemodule.SchoolID, temptablemodule.ModuleCode, 
			temptablemodule.ModuleTitle, temptablemodule.CreditRating, temptablemodule.ModuleRating, 
			temptablemodule.Pre_Requisites, temptablemodule.R_P_S, temptablemodule.Co_Requisites, 
			temptablemodule.SharedTeaching, temptablemodule.P_B_R, temptablemodule.Graded, 
			temptablemodule.BarredCombination, temptablemodule.Synopsis, temptablemodule.Syllabus, 
			temptablemodule.Strategy, temptablemodule.ResourcesRequired, temptablemodule.ReadingList, 
			temptablemodule.Approved, temptablemodule.LearningOutcomes, temptablemodule.Knowledge, 
			temptablemodule.Abilities, temptablemodule.AssessmentStrategy, temptablemodule.Formative, 
			temptablemodule.Summative, temptablemodule.Tasks, temptablemodule.Criteria, temptablemodule.Compulsory, 
			temptablemodule.Core, temptablemodule.Optional, temptablemodule.StandAlone, temptablemodule.Lecture, 
			temptablemodule.Seminar, temptablemodule.TutorialAndProject, temptablemodule.PracticalAndDemonstrations,
			temptablemodule.StudioAndWorkshop, temptablemodule.FieldworkAndExternal, 
			temptablemodule.WorkbasedLearning, temptablemodule.Placement, temptablemodule.IndependentStudy, 
			temptablemodule.Lecture + temptablemodule.Seminar + temptablemodule.TutorialAndProject + 
			temptablemodule.PracticalAndDemonstrations + temptablemodule.StudioAndWorkshop + 
			temptablemodule.FieldworkAndExternal + temptablemodule.WorkbasedLearning + 
			temptablemodule.Placement + temptablemodule.IndependentStudy AS TotalHours, 
			temptablemodule.ModuleAims, temptablemodule.ModuleScheme, temptablemodule.OtherInfo, 
			temptablemodule.ModuleStatus, temptablemodule.Approval, temptablemodule.ApprovalStatus, 
			temptablemodule.ApprovalPerson, school.SchoolName, temptablemodule.Comment 
			
			FROM temptablemodule INNER JOIN school ON temptablemodule.SchoolID = school.SchoolID 
			
			WHERE (temptablemodule.ModuleID = @ModuleID)

END

GO

