/*
** Project: BPMonline
** DBMS   : PostgreSql
** Type   : Stored Procedure
** Name   : tsp_ActualizePortalUsersRights
*/
CREATE OR REPLACE FUNCTION "tsp_ActualizePortalUsersRights" (
	action BOOL, 
	recordId UUID, 
	sysAdminUnitId UUID,
	operation INTEGER,
	rightLevel INTEGER
) 
RETURNS VOID
AS $$
DECLARE
	sysEntitySchemaRecRightSourceManualName VARCHAR(10) := 'Manual';
	sysEntitySchemaRecRightSourceManualId UUID;
BEGIN
	IF (action = FALSE) THEN
		DELETE FROM "SysCaseRight"
		WHERE "RecordId" = recordId 
			AND "Operation" = operation 
			AND "SysAdminUnitId" = sysAdminUnitId;
	ELSE
		SELECT "Id" INTO sysEntitySchemaRecRightSourceManualId
		FROM "SysEntitySchemaRecRightSource"
		WHERE "Name" = sysEntitySchemaRecRightSourceManualName LIMIT 1;
		IF NOT EXISTS (
			SELECT NULL
			FROM "SysCaseRight" WHERE "RecordId" = recordId
				AND "SysAdminUnitId" = sysAdminUnitId
				AND "Operation" = operation
				AND "RightLevel" = rightLevel
				AND "SourceId" = sysEntitySchemaRecRightSourceManualId
			LIMIT 1
		) THEN
			INSERT INTO "SysCaseRight" (
				"RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId"
			)
			VALUES (
				recordId, sysAdminUnitId, operation, rightLevel, sysEntitySchemaRecRightSourceManualId
			);
		END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;
