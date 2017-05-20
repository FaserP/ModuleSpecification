USE [ModuleSpecDatabase]
GO

/****** Object:  StoredProcedure [dbo].[templocationinsert]    Script Date: 15/08/2014 14:05:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[templocationinsert]

@ModuleID int

AS
BEGIN
DELETE FROM temptablelocation WHERE ModuleID = @ModuleID
BEGIN
IF NOT EXISTS (
SELECT * FROM temptablelocation WHERE ModuleID = @ModuleID
)
INSERT INTO temptablelocation (ModuleID, LocationID, LocationName)
SELECT moduleslocation.ModuleID, moduleslocation.LocationID, location.LocationName FROM moduleslocation
		INNER JOIN location ON moduleslocation.LocationID = location.LocationID
WHERE ModuleID = @ModuleID
END
END
GO

