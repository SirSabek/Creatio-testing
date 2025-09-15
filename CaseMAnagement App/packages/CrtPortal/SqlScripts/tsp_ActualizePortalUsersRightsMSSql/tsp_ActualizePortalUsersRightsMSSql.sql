IF NOT OBJECT_ID('[dbo].[tsp_ActualizePortalUsersRights]') IS NULL
BEGIN
	DROP PROCEDURE [dbo].[tsp_ActualizePortalUsersRights]
END
GO
CREATE PROCEDURE [dbo].[tsp_ActualizePortalUsersRights] 
	@Action bit, 
	@RecordId uniqueidentifier, 
	@SysAdminUnitId uniqueidentifier,
	@Operation tinyint,
	@RightLevel tinyint
AS
BEGIN
	IF @Action = 0  
		BEGIN
			DELETE FROM SysCaseRight
			WHERE RecordId = @RecordId 
			AND operation = @Operation 
			AND SysAdminUnitId = @SysAdminUnitId;
		END
	ELSE
		BEGIN
			DECLARE @SourceId uniqueidentifier = (
				SELECT id FROM SysEntitySchemaRecRightSource
				WHERE name = 'Manual')
			IF NOT EXISTS (SELECT TOP 1 1 FROM SysCaseRight
				WHERE RecordId = @RecordId
				AND SysAdminUnitId = @SysAdminUnitId
				AND Operation = @Operation
				AND RightLevel = @RightLevel
				AND SourceId = @SourceId)
				BEGIN
					INSERT INTO SysCaseRight (
						RecordId, 
						SysAdminUnitId, 
						Operation, 
						RightLevel, 
						SourceId)
					VALUES (
						@RecordId,
						@SysAdminUnitId,
						@Operation,
						@RightLevel,
						@SourceId)
				END
		END
END;
