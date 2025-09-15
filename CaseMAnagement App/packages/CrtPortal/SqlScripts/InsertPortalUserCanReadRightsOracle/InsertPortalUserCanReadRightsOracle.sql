DECLARE
	v_sql VARCHAR2(100);
	CURSOR c_tab_exists IS
 		SELECT table_name
 		FROM user_tables
 		WHERE table_name IN ('TableList', 'SysEntitySchemaList');

BEGIN
	FOR r_tab IN c_tab_exists LOOP
		v_sql := 'drop table "' || r_tab.TABLE_NAME || '"';
		EXECUTE IMMEDIATE v_sql;
	END LOOP;
END;
/

CREATE GLOBAL TEMPORARY TABLE "TableList" ( 
	"Name" NVARCHAR2 (255) NOT NULL,
	"AdministratedByOperation" NVARCHAR2 (10) NOT NULL, 
	"ReadOperation" VARCHAR2(1),
	"AppendOperation" VARCHAR2(1),
	"EditOperation" VARCHAR2(1),
	"DeleteOperation" VARCHAR2(1),
	"AdministratedByRecords" NVARCHAR2 (10),
	"CanReadRecord" VARCHAR2(1),
	"CanEditRecord" VARCHAR2(1),
	"CanDeleteRecord" VARCHAR2(1),
	"AuthorId" VARCHAR2(38),
	"GranteeId" VARCHAR2(38)  
) ON COMMIT DELETE ROWS
/

CREATE GLOBAL TEMPORARY TABLE "SysEntitySchemaList" ( 
	"UId" VARCHAR2(38),
	"Name" VARCHAR2(255) NOT NULL, 
	"AdministratedByOperation" VARCHAR2(10),
	"ReadOperation" VARCHAR2(1),
	"AppendOperation" VARCHAR2(1),
	"EditOperation" VARCHAR2(1),
	"DeleteOperation" VARCHAR2(1),
	"AdministratedByRecords" VARCHAR2(10),
	"CanReadRecord" VARCHAR2(1),
	"CanEditRecord" VARCHAR2(1),
	"CanDeleteRecord" VARCHAR2(1),
	"AuthorId" VARCHAR2(38),
	"GranteeId" VARCHAR2(38)
) ON COMMIT DELETE ROWS
/

DECLARE
	LicenseCount NUMBER(10);
	AllPortalUsersId VARCHAR2(38) := '{720B771C-E7A7-4F31-9CFB-52CD21C3739F}';
	AllSystemUsersId VARCHAR2(38) := '{A29A3BA5-4B0D-DE11-9A51-005056C00008}';
	Supervisor VARCHAR2(38) := '{410006E1-CA4E-4502-A9EC-E54D922D2C00}';

BEGIN
	SELECT COUNT(*)
	INTO LicenseCount
	FROM "SysSettingsValue"
	WHERE "SysSettingsId" IN
		(SELECT "Id" FROM "SysSettings" WHERE "Code" = 'CustomerId')
		AND (dbms_lob.compare(NVL("TextValue", 'Null'), TO_NCLOB('111')) = 0 OR "TextValue" IS NULL OR dbms_lob.compare(NVL("TextValue", 'Null'), TO_NCLOB('')) = 0);
	IF LicenseCount = 0 
	THEN
		RETURN;
	END IF;

	INSERT INTO "TableList" ("Name", "AdministratedByOperation", "ReadOperation", "AppendOperation", "EditOperation", "DeleteOperation",
		"AdministratedByRecords", "CanReadRecord", "CanEditRecord", "CanDeleteRecord", "AuthorId", "GranteeId")
	SELECT	'Case',									'True', 1, 1, 1, 0, 'True',  1, 1,1, AllPortalUsersId, AllSystemUsersId FROM DUAL
	UNION ALL SELECT	'CaseFile',							'True', 1, 1, 1, 1, 'False', 0, 0,0, AllPortalUsersId, AllSystemUsersId FROM DUAL
	UNION ALL SELECT	'CaseFolder',							'True', 1, 1, 1, 1, 'True', 0, 0,0, AllPortalUsersId, AllSystemUsersId FROM DUAL
	UNION ALL SELECT	'CaseTag',							'True', 1, 1, 0, 0, 'True',  0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'CaseInTag',						'True', 1, 1, 1, 1, 'True',  1, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'CaseLifecycle',				'True', 1, 1, 0, 0, 'False', 1, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'CaseStatus',						'True', 1, 0, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'CasePriority',					'True', 1, 0, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'CaseOrigin',						'True', 1, 0, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'ClosureCode',					'True', 1, 0, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'SatisfactionLevel',		'True', 1, 0, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'CaseCategory',					'True', 1, 0, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'ServiceItem',					'True', 1, 0, 0, 0, 'True',  1, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'RoleInServiceTeam',		'True', 1, 0, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'RunButtonProcessList',	'True', 1, 0, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'ServiceStatus',				'True', 1, 0, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'TimeToPrioritize',			'True', 1, 0, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'PortalMessage',						'True', 0, 1, 1, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'PriorityinSupportLevel','True', 1, 0, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'CaseMessageHistory',		'True', 1, 1, 0, 0, 'False', 0, 0,0, AllSystemUsersId, AllPortalUsersId FROM DUAL
	UNION ALL SELECT	'LocalMessage',					'True', 1, 1, 0, 0, 'False', 0, 0, 0,AllSystemUsersId, AllPortalUsersId FROM DUAL;
	

	INSERT INTO "SysEntitySchemaList" (
		"UId",
		"Name",	
		"AdministratedByOperation", 
		"ReadOperation", 
		"AppendOperation", 
		"EditOperation", 
		"DeleteOperation", 
		"AdministratedByRecords", 
		"CanReadRecord", 
		"CanEditRecord", 
		"CanDeleteRecord",
		"AuthorId",
		"GranteeId")
	SELECT "ss"."UId", 
		"ss"."Name", 
		"tl"."AdministratedByOperation", 
		"tl"."ReadOperation", 
		"tl"."AppendOperation", 
		"tl"."EditOperation", 
		"tl"."DeleteOperation", 
		"tl"."AdministratedByRecords", 
		"tl"."CanReadRecord", 
		"tl"."CanEditRecord", 
		"tl"."CanDeleteRecord",
		"tl"."AuthorId",
		"tl"."GranteeId"
	FROM "SysSchema" "ss"
		LEFT JOIN "SysPackage" "sp" ON "ss"."SysPackageId" = "sp"."Id"
		LEFT JOIN "SysWorkspace" "sw" ON "sp"."SysWorkspaceId" = "sw"."Id"
		JOIN "TableList" "tl" ON "tl"."Name" = "ss"."Name"
	WHERE "sw"."Id" = (SELECT "Id" FROM "SysWorkspace" WHERE "IsDefault" = 1) AND 
		"ss"."ExtendParent" = 0;

	DECLARE
		schemaCursorRec "SysEntitySchemaList"%ROWTYPE;
		CURSOR schemaCursor RETURN "SysEntitySchemaList"%ROWTYPE IS
			SELECT
				"UId",
				"Name",
				"AdministratedByOperation",
				"ReadOperation",
				"AppendOperation",
				"EditOperation",
				"DeleteOperation",
				"AdministratedByRecords",
				"CanReadRecord",
				"CanEditRecord",
				"CanDeleteRecord",
				"AuthorId",
				"GranteeId"
			FROM "SysEntitySchemaList";
	BEGIN
		OPEN schemaCursor;
		LOOP
			FETCH schemaCursor INTO schemaCursorRec;
			EXIT WHEN schemaCursor%NOTFOUND;
				"tsp_AddSEToSSPESAccessList"(schemaCursorRec."UId", Supervisor);
				"tsp_AddPortalOpDefRights"(schemaCursorRec."UId", schemaCursorRec."AdministratedByOperation", schemaCursorRec."ReadOperation",
					schemaCursorRec."AppendOperation", schemaCursorRec."EditOperation", schemaCursorRec."DeleteOperation");
				"tsp_AddSERecDefRights"(schemaCursorRec."UId", schemaCursorRec."AdministratedByRecords", schemaCursorRec."AuthorId", schemaCursorRec."GranteeId",
					schemaCursorRec."CanReadRecord", schemaCursorRec."CanEditRecord", schemaCursorRec."CanDeleteRecord");
		END LOOP;
		CLOSE schemaCursor;
	END;
END;
/