USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[ApprovalProcess]    Script Date: 15/08/2014 13:52:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ?August ?2014
-- Description:	The Approval Process of checking a module by certain people and updating the final tables
--				at the end of the process
-- =============================================
CREATE PROCEDURE [dbo].[ApprovalProcess]
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
	@SchoolName varchar(200) = NULL,

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
	@ModuleStatus varchar(1000) = NULL,

	@Approval int,
	@ApprovalStatus int,
	@ApprovalPerson int,

	@Comment varchar(MAX) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Checks to see if Approval is "Approved (2)" and the ApprovalStatus is from is at "1 (meaning subject leader checking)"
IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '2' AND @ApprovalStatus = '1')
BEGIN
	-- Update the approval to the next person by pending (Approval = 1), to Head of Dept (approvalperson = 2) and 
	-- and the approvalstatus is at "2".
	Update temptablemodule
	SET Approval = '1',
		ApprovalStatus = '2',
		ApprovalPerson = '2',
		Comment = NULL
	WHERE [ModuleID] = @ModuleID
END

    -- Checks to see if Approval is "Rejected (3)" and the ApprovalStatus is from "1 (meaning subject leader checking)"
	-- and sending to Module Leader (Approvalperson = 0)
IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '3' AND @ApprovalStatus = '1' AND @ApprovalPerson = '0')
BEGIN
	-- Update the approval to the back by rejecting (Approval = 0), to Module Leader (approvalperson = 0) and 
	-- and the approvalstatus is at "0".
	UPDATE [temptablemodule] 
	SET [Approval] = @Approval,
		ApprovalStatus = '0',
		ApprovalPerson = '0',
		Comment = @Comment
	WHERE [ModuleID] = @ModuleID 

   UPDATE module 
   SET		LockedStatus = '3'
   WHERE	ModuleID = @ModuleID

END

    -- Checks to see if Approval is "Approved (2)" and the ApprovalStatus is from is at "2 (meaning Head of Dept checking)"
IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '2' AND @ApprovalStatus = '2')
BEGIN
	-- Update the approval to the next person by pending (Approval = 1), to SAVP Admin (approvalperson = 3) and 
	-- and the approvalstatus is at "3".
 	Update temptablemodule
	SET Approval = '1',
		ApprovalStatus = '3',
		ApprovalPerson = '3',
		Comment = NULL
	WHERE [ModuleID] = @ModuleID
END

    -- Checks to see if Approval is "Rejected (3)" and the ApprovalStatus is from "2 (meaning Head of dept checking)"
	-- and sending to Module Leader (Approvalperson = 0)
IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '3' AND @ApprovalStatus = '2' AND @ApprovalPerson = '0')
	BEGIN
		-- Update the approval to the back by rejecting (Approval = 0), to Module Leader (approvalperson = 0) and 
		-- and the approvalstatus is at "0".
		UPDATE [temptablemodule] 
		SET [Approval] = @Approval,
			ApprovalStatus = '0',
			ApprovalPerson = '0',
			Comment = @Comment
		WHERE [ModuleID] = @ModuleID

		UPDATE module 
		SET		LockedStatus = '3'
		WHERE	ModuleID = @ModuleID

	END
    -- Checks to see if Approval is "Rejected (3)" and the ApprovalStatus is from "2 (meaning Head of dept checking)"
	-- and sending to Subject Leader (Approvalperson = 1)
ELSE IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '3' AND @ApprovalStatus = '2' AND @ApprovalPerson = '1')
	BEGIN
		-- Update the approval to the back by rejecting (Approval = 0), to Subject Leader (approvalperson = 1) and 
		-- and the approvalstatus is at "1".
		UPDATE [temptablemodule] 
		SET [Approval] = @Approval,
			ApprovalStatus = '1',
			ApprovalPerson = '1',
			Comment = @Comment
		WHERE [ModuleID] = @ModuleID
	END

    -- Checks to see if Approval is "Approved (2)" and the ApprovalStatus is from is at "3 (meaning SAVP Admin checking)"
IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '2' AND @ApprovalStatus = '3')
BEGIN
	-- Update the approval to the next person by pending (Approval = 1), to SAVP Admin (approvalperson = 4) and 
	-- and the approvalstatus is at "4".
 	Update temptablemodule
	SET Approval = '1',
		ApprovalStatus = '4',
		ApprovalPerson = '4',
		Comment = NULL
	WHERE [ModuleID] = @ModuleID
END

    -- Checks to see if Approval is "Rejected (3)" and the ApprovalStatus is from "3 (meaning SAVP Admin checking)"
	-- and sending to Module Leader (Approvalperson = 0)
IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '3' AND @ApprovalStatus = '3' AND @ApprovalPerson = '0')
BEGIN
		-- Update the approval to the back by rejecting (Approval = 0), to Module Leader (approvalperson = 0) and 
		-- and the approvalstatus is at "0".
	UPDATE [temptablemodule] 
	SET [Approval] = @Approval,
		ApprovalStatus = '0',
		ApprovalPerson = '0',
			Comment = @Comment
	WHERE [ModuleID] = @ModuleID

   UPDATE module 
   SET		LockedStatus = '3'
   WHERE	ModuleID = @ModuleID
END
    -- Checks to see if Approval is "Rejected (3)" and the ApprovalStatus is from "3 (meaning SAVP Admin checking)"
	-- and sending to Subject Leader (Approvalperson = 1)
ELSE IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '3' AND @ApprovalStatus = '3' AND @ApprovalPerson = '1')
BEGIN
		-- Update the approval to the back by rejecting (Approval = 0), to Subject Leader (approvalperson = 1) and 
		-- and the approvalstatus is at "1".
	UPDATE [temptablemodule] 
	SET [Approval] = @Approval,
		ApprovalStatus = '1',
		ApprovalPerson = '1',
			Comment = @Comment
	WHERE [ModuleID] = @ModuleID
END
    -- Checks to see if Approval is "Rejected (3)" and the ApprovalStatus is from "3 (meaning SAVP Admin checking)"
	-- and sending to SAVP Admin (Approvalperson = 2)
ELSE IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '3' AND @ApprovalStatus = '3' AND @ApprovalPerson = '2')
BEGIN
		-- Update the approval to the back by rejecting (Approval = 0), to Head of Dept (approvalperson = 2) and 
		-- and the approvalstatus is at "2".
	UPDATE [temptablemodule] 
	SET [Approval] = @Approval,
		ApprovalStatus = '2',
		ApprovalPerson = '2',
			Comment = @Comment
	WHERE [ModuleID] = @ModuleID
END

    -- Checks to see if Approval is "Approved (2)" and the ApprovalStatus is from is at "4 (meaning Chair of SAVP checking)"
IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '2' AND @ApprovalStatus = '4')
BEGIN
	--Update the main module, learningoutcomes, assessment, summative, moduletype, learningmethods, otherinfo,
	--modulespec, moduleslocation, and modulestutors by using the temp tables data. Deletes all temp table
	-- data after this.
   Update module 
   SET ModuleCode=@ModuleCode,
	   ModuleTitle=@ModuleTitle,
	   CreditRating=@CreditRating,
	   ModuleRating=@ModuleRating,
	   Pre_Requisites=@Pre_Requisites,
	   R_P_S=@R_P_S,
	   Co_Requisites=@Co_Requisites,
	   SharedTeaching=@SharedTeaching,
	   P_B_R=@P_B_R,
	   Graded=@Graded,
	   BarredCombination=@BarredCombination,
	   Synopsis=@Synopsis,
	   Syllabus=@Syllabus,
	   Strategy=@Strategy,
	   ResourcesRequired=@ResourcesRequired,
	   ReadingList=@ReadingList,
	   Approved=@Approved,
	   LockedStatus = '1',
	   SchoolID = @SchoolID
	WHERE ModuleID = @ModuleID

   Update learningoutcomes 
   SET LearningOutcomes=@LearningOutcomes,
	   Knowledge=@Knowledge,
	   Abilities=@Abilities
      FROM learningoutcomes 
INNER JOIN module ON learningoutcomes.OutcomesID = module.OutcomesID 
     WHERE module.ModuleCode = @ModuleCode

   Update assessment 
   SET AssessmentStrategy=@AssessmentStrategy,
	   Formative=@Formative,
	   Summative=@Summative,
	   Tasks=@Tasks,
	   Criteria=@Criteria
      FROM assessment 
INNER JOIN module ON assessment.AssessmentID = module.AssessmentID 
     WHERE module.ModuleCode = @ModuleCode
	
   Update moduletype 
   SET Compulsory=@Compulsory,
	   Core=@Core,
	   Optional=@Optional,
	   StandAlone=@StandAlone
      FROM moduletype 
INNER JOIN module ON moduletype.TypeID = module.TypeID 
     WHERE module.ModuleCode = @ModuleCode

   Update learningmethods 
   SET Lecture=@Lecture,
	   Seminar=@Seminar,
	   TutorialAndProject=@TutorialAndProject,
	   PracticalAndDemonstrations=@PracticalAndDemonstrations,
	   StudioAndWorkshop=@StudioAndWorkshop,
	   FieldworkAndExternal=@FieldworkAndExternal,
	   WorkbasedLearning=@WorkbasedLearning,
	   Placement=@Placement,
	   IndependentStudy=@IndependentStudy,
	   @TotalHours=@TotalHours
      FROM learningmethods 
INNER JOIN module ON learningmethods.MethodsID = module.MethodsID 
     WHERE module.ModuleCode = @ModuleCode

	   Update otherinfos 
   SET ModuleAims=@ModuleAims,
	   ModuleScheme=@ModuleScheme,
	   OtherInfo=@OtherInfo,
	   ModuleStatus=@ModuleStatus
      FROM otherinfos 
INNER JOIN module ON otherinfos.InfoID = module.InfoID 
     WHERE module.ModuleCode = @ModuleCode

	DELETE FROM [modulespec] WHERE ModuleID = @ModuleID

	INSERT INTO modulespec (ModuleID, CourseID)
	SELECT ModuleID, CourseID
	FROM temptablecourse
	WHERE temptablecourse.ModuleID = @ModuleID

	DELETE FROM [temptablecourse] WHERE [ModuleID] = @ModuleID


	DELETE FROM [moduleslocation] WHERE ModuleID = @ModuleID

	INSERT INTO moduleslocation (ModuleID, LocationID)
	SELECT ModuleID, LocationID
	FROM temptablelocation
	WHERE temptablelocation.ModuleID = @ModuleID

	DELETE FROM [temptablelocation] WHERE [ModuleID] = @ModuleID



	DELETE FROM [modulestutor] WHERE ModuleID = @ModuleID

	INSERT INTO modulestutor(ModuleID, TutorID)
	SELECT ModuleID, TutorID
	FROM temptabletutor
	WHERE temptabletutor.ModuleID = @ModuleID

	DELETE FROM [temptabletutor] WHERE [ModuleID] = @ModuleID


	DELETE FROM [summative] WHERE AssessmentID = @ModuleID

	INSERT INTO summative(AssessmentID, AssessmentType, LO, Summary, Component, FE, TR, AM)
	SELECT temptableassessment.AssessmentID, temptableassessment.AssessmentType, temptableassessment.LO, 
			temptableassessment.Summary, temptableassessment.Component, 
			temptableassessment.FE, temptableassessment.TR, temptableassessment.AM FROM temptableassessment
	WHERE	temptableassessment.AssessmentID = @ModuleID

	INSERT INTO approvalfinal (ModuleCode, ApprovalStatus, UsernameFrom, RoleFrom, EmailFrom, UserNameTo, RoleTo, EmailTo, TimeDate, Comments)
	SELECT ModuleCode, ApprovalStatus, UsernameFrom, RoleFrom, EmailFrom, UserNameTo, RoleTo, EmailTo, TimeDate, Comments
	FROM approvalfinal
	WHERE ModuleCode = @ModuleCode AND ApprovalStatus = 'Final Approval'

	DELETE FROM [approvalprogress] WHERE ModuleCode = @ModuleCode

	DELETE FROM [temptableassessment] WHERE AssessmentID = @ModuleID

	DELETE FROM [temptablemodule] WHERE [ModuleID] = @ModuleID
END

    -- Checks to see if Approval is "Rejected (3)" and the ApprovalStatus is from "4 (meaning Chair of SAVP checking)"
	-- and sending to Module Leader (Approvalperson = 0)
IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '3' AND @ApprovalStatus = '4' AND @ApprovalPerson = '0')
BEGIN
		-- Update the approval to the back by rejecting (Approval = 0), to Module Leader (approvalperson = 0) and 
		-- and the approvalstatus is at "0".
	UPDATE [temptablemodule] 
	SET [Approval] = @Approval,
		ApprovalStatus = '0',
		ApprovalPerson = '0',
			Comment = @Comment
	WHERE [ModuleID] = @ModuleID

   UPDATE module 
   SET		LockedStatus = '3'
   WHERE	ModuleID = @ModuleID

END
    -- Checks to see if Approval is "Rejected (3)" and the ApprovalStatus is from "4 (meaning Chair of SAVP checking)"
	-- and sending to Subject Leader (Approvalperson = 1)
ELSE IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '3' AND @ApprovalStatus = '4' AND @ApprovalPerson = '1')
BEGIN
		-- Update the approval to the back by rejecting (Approval = 0), to Subject Leader (approvalperson = 1) and 
		-- and the approvalstatus is at "1".
	UPDATE [temptablemodule] 
	SET [Approval] = @Approval,
		ApprovalStatus = '1',
		ApprovalPerson = '1',
			Comment = @Comment
	WHERE [ModuleID] = @ModuleID
END
    -- Checks to see if Approval is "Rejected (3)" and the ApprovalStatus is from "4 (meaning Chair of SAVP checking)"
	-- and sending to Head of Dept (Approvalperson = 2)
ELSE IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '3' AND @ApprovalStatus = '4' AND @ApprovalPerson = '2')
BEGIN
		-- Update the approval to the back by rejecting (Approval = 0), to Head of Dept (approvalperson = 2) and 
		-- and the approvalstatus is at "2".
	UPDATE [temptablemodule] 
	SET [Approval] = @Approval,
		ApprovalStatus = '2',
		ApprovalPerson = '2',
			Comment = @Comment
	WHERE [ModuleID] = @ModuleID
END
    -- Checks to see if Approval is "Rejected (3)" and the ApprovalStatus is from "4 (meaning Chair of SAVP checking)"
	-- and sending to SAVP Admin (Approvalperson = 3)
ELSE IF EXISTS(SELECT * FROM temptablemodule WHERE ModuleID = @ModuleID AND @Approval = '3' AND @ApprovalStatus = '4' AND @ApprovalPerson = '3')
BEGIN
		-- Update the approval to the back by rejecting (Approval = 0), to SAVP Admin (approvalperson = 3) and 
		-- and the approvalstatus is at "3".
	UPDATE [temptablemodule] 
	SET [Approval] = @Approval,
		ApprovalStatus = '3',
		ApprovalPerson = '3',
			Comment = @Comment
	WHERE [ModuleID] = @ModuleID
END
END

GO


