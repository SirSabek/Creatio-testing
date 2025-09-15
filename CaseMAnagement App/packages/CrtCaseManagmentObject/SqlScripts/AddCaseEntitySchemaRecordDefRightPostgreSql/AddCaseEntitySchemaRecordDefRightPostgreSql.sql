DO $$
DECLARE
	entitySchemaUId UUID;
	allEmployeesId UUID := 'A29A3BA5-4B0D-DE11-9A51-005056C00008';
	portalUsersId UUID := '720b771c-e7a7-4f31-9cfb-52cd21c3739f';
	administratedByRecords VARCHAR(10) := 'True';
	canReadRecord BOOL := true;
	canEditRecord BOOL := true;
	canDeleteRecord BOOL := true;
BEGIN
	IF NOT EXISTS (SELECT "Id" FROM "SysLic" LIMIT 1) THEN
		entitySchemaUId := (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'Case' AND "ExtendParent" = false);
		PERFORM "tsp_AddSysEntityRecordDefaultRights"(entitySchemaUId, administratedByRecords, allEmployeesId, allEmployeesId, canReadRecord, canEditRecord, canDeleteRecord);
		PERFORM "tsp_AddSysEntityRecordDefaultRights"(entitySchemaUId, administratedByRecords, portalUsersId, allEmployeesId, canReadRecord, canEditRecord, canDeleteRecord);
	END IF;
END;
$$ LANGUAGE plpgsql;