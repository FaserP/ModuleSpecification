USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[GetTutors]    Script Date: 15/08/2014 13:58:53 ******/
DROP PROCEDURE [dbo].[GetTutors]
GO

/****** Object:  StoredProcedure [dbo].[GetTutors]    Script Date: 15/08/2014 13:58:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Faser Parvez
-- Create date: 14 ‎August ‎2014
-- Description:	Select everything from the tutor table
-- =============================================
CREATE PROCEDURE [dbo].[GetTutors]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT		tutor.TutorID, TutorName, tutor.DeptID

		FROM		tutor

END

GO

