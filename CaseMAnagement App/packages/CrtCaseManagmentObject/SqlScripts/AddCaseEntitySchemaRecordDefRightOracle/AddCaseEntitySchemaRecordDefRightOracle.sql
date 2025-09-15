DECLARE
	schemaUId VARCHAR2(38);
	allEmployees VARCHAR2(38) := '{A29A3BA5-4B0D-DE11-9A51-005056C00008}';
	portalUsers VARCHAR2(38) := '{720b771c-e7a7-4f31-9cfb-52cd21c3739f}';
	administratedByRecords VARCHAR2(38) := 'True';
	canReadRecord NUMBER := 1;
	canEditRecord NUMBER := 1;
	canDeleteRecord NUMBER := 1;
BEGIN

	SELECT ss."UId"
	INTO schemaUId
	FROM "SysSchema" ss
	WHERE ss."Name" = 'Case'
		AND ss."ExtendParent" = 0
		AND ROWNUM = 1;

	"tsp_AddSERecDefRights" (schemaUId, administratedByRecords, allEmployees, allEmployees, canReadRecord, canEditRecord, canDeleteRecord);
	"tsp_AddSERecDefRights" (schemaUId, administratedByRecords, portalUsers, allEmployees, canReadRecord, canEditRecord, canDeleteRecord);
	
END;