CREATE OR REPLACE PROCEDURE "tsp_ActualizePortalUsersRights"(
	Action IN NUMBER,
	RecordId IN VARCHAR2,
	SysAdminUnitId IN VARCHAR2,
	Operation IN NUMBER,
	RightLevel IN NUMBER)
	IS
		SourceId VARCHAR2(38);
		SelectedRowsCount NUMBER;
	BEGIN
		IF
			Action = 0
		THEN
			DELETE FROM "SysCaseRight"
				WHERE "RecordId" = RecordId
					AND "Operation" = Operation
					AND "SysAdminUnitId" = SysAdminUnitId;
		ELSE
			SELECT "Id"
				INTO SourceId
				FROM "SysEntitySchemaRecRightSource"
				WHERE "Name" = 'Manual';

			SELECT COUNT("Id")
				INTO SelectedRowsCount
				FROM "SysCaseRight"
				WHERE "RecordId" = RecordId
					AND "SysAdminUnitId" = SysAdminUnitId
					AND "Operation" = Operation
					AND "RightLevel" = RightLevel
					AND "SourceId" = SourceId;

			IF (SelectedRowsCount = 0)
			THEN
				INSERT INTO "SysCaseRight" (
					"RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId"
				)
				VALUES (RecordId, SysAdminUnitId, Operation, RightLevel, SourceId);
			END IF;
		END IF;

	END "tsp_ActualizePortalUsersRights";
/