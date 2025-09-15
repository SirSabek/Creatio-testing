DECLARE
	schemaUId VARCHAR2(38);
	allEmployees VARCHAR2(38) := '{A29A3BA5-4B0D-DE11-9A51-005056C00008}';
	administratedByRecords VARCHAR2(38) := 'True';
	canReadRecord NUMBER := 1;
	canEditRecord NUMBER := 1;
	canDeleteRecord NUMBER := 1;
BEGIN

	SELECT ss."UId"
	INTO schemaUId
	FROM "SysSchema" ss
	WHERE ss."Name" = 'ServicePact'
		AND ss."ExtendParent" = 0
		AND ROWNUM = 1;

	"tsp_AddSERecDefRights" (schemaUId, administratedByRecords, allEmployees, allEmployees, canReadRecord, canEditRecord, canDeleteRecord);
	
END;