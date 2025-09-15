DO $$
DECLARE
	entitySchemaUId UUID;
	allEmployeesId UUID := 'A29A3BA5-4B0D-DE11-9A51-005056C00008';
	administratedByRecords VARCHAR(10) := 'True';
	canReadRecord BOOL := true;
	canEditRecord BOOL := true;
	canDeleteRecord BOOL := true;
BEGIN
	IF NOT EXISTS (SELECT "Id" FROM "SysLic" LIMIT 1) THEN
		entitySchemaUId := (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'ServicePact' AND "ExtendParent" = false);
		PERFORM "tsp_AddSysEntityRecordDefaultRights"(entitySchemaUId, administratedByRecords, allEmployeesId, allEmployeesId, canReadRecord, canEditRecord, canDeleteRecord);
	END IF;
END;
$$ LANGUAGE plpgsql;