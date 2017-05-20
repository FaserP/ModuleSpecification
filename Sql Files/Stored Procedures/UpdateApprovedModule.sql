USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[UpdateApprovedModule]    Script Date: 15/08/2014 14:06:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Update a module that will enter a approval process.
--				If the module is already in approval then it will get the information from tempmoduletable
--				else it gets the information from the module table.
-- =============================================
CREATE PROCEDURE [dbo].[UpdateApprovedModule]
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

	@SchoolID int,

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
	IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID)
  BEGIN 
    --exists perform update
	UPDATE [temptablemodule] 
	SET [ModuleCode] = @ModuleCode, [ModuleTitle] = @ModuleTitle, [CreditRating] = @CreditRating, [ModuleRating] = @ModuleRating, 
		[Pre_Requisites] = @Pre_Requisites, [R_P_S] = @R_P_S, [Co_Requisites] = @Co_Requisites, [SharedTeaching] = @SharedTeaching,
		[P_B_R] = @P_B_R, [Graded] = @Graded, [BarredCombination] = @BarredCombination, [Synopsis] = @Synopsis, 
		[Syllabus] = @Syllabus, [Strategy] = @Strategy, [ResourcesRequired] = @ResourcesRequired, [ReadingList] = @ReadingList, 
		[Approved] = @Approved, [LearningOutcomes] = @LearningOutcomes, [Knowledge] = @Knowledge, [Abilities] = @Abilities, 
		[AssessmentStrategy] = @AssessmentStrategy, [Formative] = @Formative, [Summative] = @Summative, [Tasks] = @Tasks, 
		[Criteria] = @Criteria, SchoolID = @SchoolID, [Compulsory] = @Compulsory, [Core] = @Core, [Optional] = @Optional, 
		[StandAlone] = @StandAlone, [Lecture] = @Lecture, [Seminar] = @Seminar, [TutorialAndProject] = @TutorialAndProject, 
		[PracticalAndDemonstrations] = @PracticalAndDemonstrations, [StudioAndWorkshop] = @StudioAndWorkshop, 
		[FieldworkAndExternal] = @FieldworkAndExternal, [WorkbasedLearning] = @WorkbasedLearning, [Placement] = @Placement, 
		[IndependentStudy] = @IndependentStudy, [ModuleAims] = @ModuleAims, 
		[ModuleScheme] = @ModuleScheme, [OtherInfo] = @OtherInfo, [ModuleStatus] = @ModuleStatus, [Approval] = '1', [ApprovalStatus] = '1', [ApprovalPerson] = '1',
		@TotalHours = @TotalHours, [Comment] = ''
		
		WHERE [ModuleID] = @ModuleID

  UPDATE module
  SET LockedStatus = '2'
  WHERE ModuleID = @ModuleID

  END

ELSE
  BEGIN
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
 
 VALUES 
 (@ModuleID, @ModuleCode, @ModuleTitle, @CreditRating, @ModuleRating, @Pre_Requisites, @R_P_S,
  @Co_Requisites, @SharedTeaching, @P_B_R, @Graded, @BarredCombination, @Synopsis, @Syllabus,
  @Strategy, @ResourcesRequired, @ReadingList, @Approved, 
  
  @LearningOutcomes, @Knowledge, @Abilities,
  
  @AssessmentStrategy, @Formative, @Summative, @Tasks, @Criteria, 
  
  @SchoolID,
  
  @Compulsory, @Core, @Optional, @StandAlone,
  
  @Lecture, @Seminar, @TutorialAndProject, @PracticalAndDemonstrations, @StudioAndWorkshop, @FieldworkAndExternal,
  @WorkbasedLearning, @Placement, @IndependentStudy,

  @ModuleAims, @ModuleScheme, @OtherInfo, @ModuleStatus, '1', '1', '1')

  UPDATE module
  SET LockedStatus = '2'
  WHERE ModuleID = @ModuleID

    END 
END

GO

