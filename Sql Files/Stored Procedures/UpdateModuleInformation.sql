USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[UpdateModuleInformation]    Script Date: 15/08/2014 14:06:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Update all module information from module, learningoutcomes, assessment, moduletype,
--				learningmethods and otherinfo table
-- =============================================
CREATE PROCEDURE [dbo].[UpdateModuleInformation]
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
	@ActiveModule bit = NULL,

	@OutcomesID int,
	@LearningOutcomes varchar(4000) = NULL,
	@Knowledge varchar(4000) = NULL,
	@Abilities varchar(4000) = NULL,

	@AssessmentID int,
	@AssessmentStrategy varchar(4000) = NULL,
	@Formative varchar(4000) = NULL,
	@Summative varchar(4000) = NULL,
	@Tasks varchar(4000) = NULL,
	@Criteria text = NULL,

	@SchoolID int,

	@TypeID int,
    @Compulsory varchar(300) = NULL,
    @Core varchar(300) = NULL,
    @Optional varchar(300) = NULL,
	@StandAlone varchar(300) = NULL,

	@MethodsID int,
	@Lecture decimal(18, 1) = NULL,
	@Seminar decimal(18, 1) = NULL,
	@TutorialAndProject decimal(18, 1) = NULL,
	@PracticalAndDemonstrations decimal(18, 1) = NULL,
	@StudioAndWorkshop decimal(18, 1) = NULL,
	@FieldworkAndExternal decimal(18, 1) = NULL,
	@WorkbasedLearning decimal(18, 1) = NULL,
	@Placement decimal(18, 1) = NULL,
	@IndependentStudy decimal(18, 1) = NULL,
	@TotalHours decimal(18, 1) = NULL,

	@InfoID int,
	@ModuleAims varchar(1000) = NULL,
	@ModuleScheme varchar(100) = NULL,
	@OtherInfo varchar(1000) = NULL,
	@ModuleStatus varchar(1000) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Update each table
	UPDATE module
	SET ModuleCode =ISNULL(@ModuleCode,ModuleCode),
		ModuleTitle =ISNULL(@ModuleTitle,ModuleTitle),
		CreditRating =ISNULL(@CreditRating,CreditRating),
		ModuleRating =ISNULL(@ModuleRating,ModuleRating),
		Pre_Requisites =ISNULL(@Pre_Requisites,Pre_Requisites),
		R_P_S =ISNULL(@R_P_S,R_P_S),
		Co_Requisites =ISNULL(@Co_Requisites,Co_Requisites),
		SharedTeaching =ISNULL(@SharedTeaching,SharedTeaching),
		P_B_R =ISNULL(@P_B_R,P_B_R),
		Graded =ISNULL(@Graded,Graded),
		BarredCombination =ISNULL(@BarredCombination,BarredCombination),
		Synopsis =ISNULL(@Synopsis,Synopsis),
		Syllabus =ISNULL(@Syllabus,Syllabus),
		Strategy =ISNULL(@Strategy,Strategy),
		ResourcesRequired = @ResourcesRequired,
		ReadingList =ISNULL(@ReadingList,ReadingList),
		Approved = ISNULL(@Approved,Approved),
		SchoolID=@SchoolID,
		ActiveModule = @ActiveModule
	WHERE (ModuleID=@ModuleID)

	UPDATE learningoutcomes 
	SET LearningOutcomes = @LearningOutcomes,
		Knowledge = @Knowledge, 
		Abilities = @Abilities
	WHERE (OutcomesID=@OutcomesID)

	UPDATE assessment
	SET AssessmentStrategy = @AssessmentStrategy,
		Formative = @Formative,
		Summative = @Summative,
		Tasks = @Tasks,
		Criteria = @Criteria
	WHERE (AssessmentID=@AssessmentID)

	UPDATE moduletype
    SET Compulsory = @Compulsory,
        Core = @Core, 
        Optional = @Optional,
		StandAlone = @StandAlone
    WHERE (TypeID=@TypeID)

	UPDATE learningmethods
	SET Lecture = ISNULL(@Lecture,Lecture),
		Seminar = ISNULL(@Seminar,Seminar),
		TutorialAndProject = ISNULL(@TutorialAndProject,TutorialAndProject),
		PracticalAndDemonstrations = ISNULL(@PracticalAndDemonstrations,PracticalAndDemonstrations),
		StudioAndWorkshop = ISNULL(@StudioAndWorkshop,StudioAndWorkshop),
		FieldworkAndExternal = ISNULL(@FieldworkAndExternal,FieldworkAndExternal),
		WorkbasedLearning = ISNULL(@WorkbasedLearning,WorkbasedLearning),
		Placement = ISNULL(@Placement,Placement),
		IndependentStudy = ISNULL(@IndependentStudy,IndependentStudy),
		@TotalHours = @TotalHours
	WHERE (MethodsID=@MethodsID)

	UPDATE otherinfos 
	SET	ModuleAims =  @ModuleAims,
		ModuleScheme =  @ModuleScheme,
		OtherInfo =  @OtherInfo,
		ModuleStatus = @ModuleStatus
	WHERE (InfoID=@InfoID)

END

GO

