USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertNewTempModule]    Script Date: 15/08/2014 14:00:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Inserting a new temp module to check for approval
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewTempModule]
	-- Add the parameters for the stored procedure here
	@ModuleID int,
	@ModuleCode varchar(10) = NULL,
	@ModuleTitle varchar(200) = NULL,
	@CreditRating varchar(50) = NULL,
	@ModuleRating varchar(50) = NULL,
	@Pre_Requisites varchar(200) = NULL,
	@R_P_S varchar(1000) = NULL,
	@Co_Requisites varchar(200) = NULL,
	@SharedTeaching varchar(200) = NULL,
	@P_B_R varchar(1000) = NULL,
	@Graded varchar(200) = NULL,
	@BarredCombination varchar(200) = NULL,
	@Synopsis varchar(4000) = NULL,
	@Syllabus varchar(4000) = NULL,
	@Strategy varchar(4000) = NULL,
	@ResourcesRequired varchar(4000) = NULL,
	@ReadingList varchar(200) = NULL,
	@Approved varchar(200) = NULL,
	 
	@LearningOutcomes varchar(4000) = NULL,
	@Knowledge varchar(4000) = NULL,
	@Abilities varchar(4000) = NULL,
	
	@AssessmentStrategy varchar(4000) = NULL,
	@Formative varchar(4000) = NULL,
	@Summative varchar(4000) = NULL,
	@Tasks varchar(4000) = NULL,
	@Criteria text = NULL,

	@SchoolName varchar(200),

    @Compulsory varchar(300) = NULL,
    @Core varchar(300) = NULL,
    @Optional varchar(300) = NULL,
	@StandAlone varchar(300) = NULL,

	@Lecture decimal(18, 1)= NULL,
	@Seminar decimal(18, 1) = NULL,
	@TutorialAndProject decimal(18, 1) = NULL,
	@PracticalAndDemonstrations decimal(18, 1) = NULL,
	@StudioAndWorkshop decimal(18, 1) = NULL,
	@FieldworkAndExternal decimal(18, 1) = NULL,
	@WorkbasedLearning decimal(18, 1) = NULL,
	@Placement decimal(18, 1) = NULL,
	@IndependentStudy decimal(18, 1) = NULL,
	@TotalHours decimal(18, 1) = NULL,

	@ModuleAims varchar(1000) = NULL,
	@ModuleScheme varchar(100) = NULL,
	@OtherInfo varchar(1000) = NULL,
	@ModuleStatus varchar(1000) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO temptablemodule
 (ModuleID, ModuleCode, ModuleTitle, CreditRating, ModuleRating, Pre_Requisites, R_P_S,
  Co_Requisites, SharedTeaching, P_B_R, Graded, BarredCombination, Synopsis, Syllabus,
  Strategy, ResourcesRequired, ReadingList, Approved,
  
  LearningOutcomes, Knowledge, Abilities,
  
  AssessmentStrategy, Formative, Summative, Tasks, Criteria, 
  
  SchoolID,
  
  Compulsory, Core, Optional, StandAlone,
  
  Lecture, Seminar, TutorialAndProject, PracticalAndDemonstrations, StudioAndWorkshop, FieldworkAndExternal,
  WorkbasedLearning, Placement, IndependentStudy,
  
  ModuleAims, ModuleScheme, OtherInfo, ModuleStatus, Approval, ApprovalStatus, ApprovalPerson)
 
  SELECT ModuleID, ModuleCode, ModuleTitle, CreditRating, ModuleRating, Pre_Requisites, R_P_S,
  Co_Requisites, SharedTeaching, P_B_R, Graded, BarredCombination, Synopsis, Syllabus,
  Strategy, ResourcesRequired, ReadingList, Approved,
  
  LearningOutcomes, Knowledge, Abilities,
  
  AssessmentStrategy, Formative, Summative, Tasks, Criteria, 
  
  SchoolID,
  
  Compulsory, Core, Optional, StandAlone,
  
  Lecture, Seminar, TutorialAndProject, PracticalAndDemonstrations, StudioAndWorkshop, FieldworkAndExternal,
  WorkbasedLearning, Placement, IndependentStudy,
  
  ModuleAims, ModuleScheme, OtherInfo, ModuleStatus, '1', '1', '1'

  FROM module
  INNER JOIN learningoutcomes ON module.OutcomesID = learningoutcomes.OutcomesID
  INNER JOIN assessment  ON module.AssessmentID = assessment.AssessmentID
  INNER JOIN moduletype ON module.TypeID = moduletype.TypeID
  INNER JOIN learningmethods ON module.MethodsID = learningmethods.MethodsID
  INNER JOIN otherinfos ON module.InfoID = otherinfos.InfoID

  WHERE ModuleID = @ModuleID

  UPDATE module
  SET LockedStatus = '2'
  WHERE ModuleID = @ModuleID

  exec tempcourseinsert @ModuleID
  exec templocationinsert @ModuleID
  exec temptutorinsert @ModuleID

END

GO

