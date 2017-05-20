USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[InsertNewModule]    Script Date: 15/08/2014 14:00:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Insert a new module by inserting module, learningoutcomes, assessment, moduletype, learningmethods and otherinfo details.
--				Takes the last id that was inserted into the module table and uses it for the other tables.
-- =============================================
ALTER PROCEDURE [dbo].[InsertNewModule]
	-- Add the parameters for the stored procedure here
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
	@ResourcesRequired varchar(200) = NULL,
	@ReadingList varchar(200) = NULL,
	@Approved varchar(200) = NULL,
    @SchoolID int,
	 
	@LearningOutcomes varchar(4000) = NULL,
	@Knowledge varchar(4000) = NULL,
	@Abilities varchar(4000) = NULL,
	
	@AssessmentStrategy varchar(4000) = NULL,
	@Formative varchar(4000) = NULL,
	@Summative varchar(4000) = NULL,
	@Tasks varchar(4000) = NULL,
	@Criteria text = NULL,

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

	@ModuleAims varchar(1000) = NULL,
	@ModuleScheme varchar(100) = NULL,
	@OtherInfo varchar(1000) = NULL,
	@ModuleStatus varchar(1000) = NULL,

	@ModuleID integer output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert into the tables
INSERT INTO module (ModuleCode, ModuleTitle, CreditRating, ModuleRating, Pre_Requisites, R_P_S, Co_Requisites, P_B_R,
					Graded, BarredCombination, Synopsis, Syllabus, Strategy, ResourcesRequired, ReadingList, Approved, ActiveModule, SchoolID, SchoolsID, LockedStatus)
VALUES			   (@ModuleCode, @ModuleTitle, @CreditRating, @ModuleRating, @Pre_Requisites, @R_P_S, @Co_Requisites, @P_B_R, 
					@Graded, @BarredCombination, @Synopsis, @Syllabus, @Strategy, @ResourcesRequired, 'http://library3.hud.ac.uk/myreading/lists/' + @ModuleCode, @Approved, 'True', @SchoolID, '7', '1')

-- Store the last ID inserted
SET @ModuleID = SCOPE_IDENTITY();

INSERT INTO learningoutcomes(LearningOutcomes, Knowledge,Abilities)
VALUES (@LearningOutcomes, @Knowledge, @Abilities)

-- Uses the last ID stored
UPDATE module
SET		OutcomesID = SCOPE_IDENTITY()
WHERE ModuleID = @ModuleID


INSERT INTO assessment(AssessmentStrategy, Formative,Summative, Tasks, Criteria)
VALUES (@AssessmentStrategy, @Formative, @Summative, @Tasks, @Criteria)

UPDATE module
SET		AssessmentID = SCOPE_IDENTITY()
WHERE ModuleID = @ModuleID


INSERT INTO moduletype(Compulsory, Core, Optional, StandAlone)
VALUES (@Compulsory, @Core, @Optional, @StandAlone)

UPDATE module
SET		TypeID = SCOPE_IDENTITY()
WHERE ModuleID = @ModuleID


INSERT INTO learningmethods (Lecture, Seminar, TutorialAndProject, PracticalAndDemonstrations, StudioAndWorkshop,
							FieldworkAndExternal, WorkbasedLearning, Placement, IndependentStudy)
VALUES (@Lecture, @Seminar, @TutorialAndProject, @PracticalAndDemonstrations, @StudioAndWorkshop, @FieldworkAndExternal,
		@WorkbasedLearning, @Placement, @IndependentStudy)

UPDATE module
SET		MethodsID = SCOPE_IDENTITY()
WHERE ModuleID = @ModuleID


INSERT INTO otherinfos(ModuleAims, ModuleScheme, OtherInfo, ModuleStatus)
VALUES (@ModuleAims, @ModuleScheme, @OtherInfo, @ModuleStatus)

UPDATE module
SET		InfoID = SCOPE_IDENTITY()
WHERE ModuleID = @ModuleID

END

GO

