DO $$
DECLARE
	allSystemUsersId UUID := '{A29A3BA5-4B0D-DE11-9A51-005056C00008}';
	allPortalUsersId UUID := '{720B771C-E7A7-4F31-9CFB-52CD21C3739F}';
	supervisorId UUID := '{410006E1-CA4E-4502-A9EC-E54D922D2C00}';
	schemaCursor CURSOR
		FOR SELECT 
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
		FROM "#SysEntitySchemaList";
	uId UUID;
	name VARCHAR(255); 
	administratedByOperation VARCHAR(10);
	readOperation BOOL;
	appendOperation BOOL;
	editOperation BOOL;
	deleteOperation BOOL;
	administratedByRecords VARCHAR(10);
	canReadRecord BOOL;
	canEditRecord BOOL;
	canDeleteRecord BOOL;
	authorId UUID;	
	granteeId UUID;
	defaultCustomerId VARCHAR(3) = '111';
	BEGIN
		IF EXISTS (SELECT "Id" FROM "SysSettingsValue" WHERE "SysSettingsId" IN (
					SELECT "Id" FROM "SysSettings" WHERE "Code" = 'CustomerId'
				) AND ("TextValue" = defaultCustomerId OR "TextValue" = '')) THEN
			DROP TABLE IF EXISTS "#TableList";
			CREATE TEMP TABLE "#TableList" (
				"Name" VARCHAR(255) NOT NULL, 
				"AdministratedByOperation" VARCHAR(10),
				"ReadOperation" BOOL,
				"AppendOperation" BOOL,
				"EditOperation" BOOL,
				"DeleteOperation" BOOL,
				"AdministratedByRecords" VARCHAR(10),
				"CanReadRecord" BOOL,
				"CanEditRecord" BOOL,
				"CanDeleteRecord" BOOL,
				"AuthorId" UUID,
				"GranteeId" UUID
			);
			INSERT INTO "#TableList" ("Name", "AdministratedByOperation", "ReadOperation", "AppendOperation", "EditOperation", "DeleteOperation", 
				"AdministratedByRecords", "CanReadRecord", "CanEditRecord", "CanDeleteRecord", "AuthorId", "GranteeId") 
			VALUES 
				('Case',								'True', true, true,  true,  false, 'True',  true,  true,  true,  allPortalUsersId, allSystemUsersId),
				('CaseFile',							'True', true, true,  true,  true,  'False', false, false, false, allPortalUsersId, allSystemUsersId),
				('CaseFolder',							'True', true, true,  true,  true,  'True',  false, false, false, allPortalUsersId, allSystemUsersId),
				('CaseTag',								'True', true, true,  false, false, 'True',  false, false, false, allSystemUsersId, allPortalUsersId),
				('CaseInTag',							'True', true, true,  true,  true,  'True',  true,  false, false, allSystemUsersId, allPortalUsersId),
				('CaseLifecycle',						'True', true, true,  false, false, 'False', true,  false, false, allSystemUsersId, allPortalUsersId),
				('CaseStatus',							'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('CasePriority',						'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('CaseOrigin',							'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('ClosureCode',							'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('SatisfactionLevel',					'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('CaseCategory',						'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('ServiceItem',							'True', true, false, false, false, 'True',  true,  false, false, allSystemUsersId, allPortalUsersId),
				('RoleInServiceTeam',					'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('RunButtonProcessList',				'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('ServiceStatus',						'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('SupportLevel',						'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('TimeToPrioritize',					'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('PortalMessage',						'True', false, true,  true,  false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('PriorityinSupportLevel',				'True', true, false, false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('CaseMessageHistory',					'True', true, true,  false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('PortalMessageType',					'True', true, true,  false, true,  'False', false, false, false, allSystemUsersId, allPortalUsersId),
				('LocalMessage',						'True', true, true,  false, false, 'False', false, false, false, allSystemUsersId, allPortalUsersId);
			DROP TABLE IF EXISTS "#SysEntitySchemaList";
			CREATE TEMP TABLE "#SysEntitySchemaList" (
				"UId" UUID,
				"Name" VARCHAR(255) NOT NULL, 
				"AdministratedByOperation" VARCHAR(10),
				"ReadOperation" BOOL,
				"AppendOperation" BOOL,
				"EditOperation" BOOL,
				"DeleteOperation" BOOL,
				"AdministratedByRecords" VARCHAR(10),
				"CanReadRecord" BOOL,
				"CanEditRecord" BOOL,
				"CanDeleteRecord" BOOL,
				"AuthorId" UUID,
				"GranteeId" UUID
			);
		
			INSERT INTO "#SysEntitySchemaList" (
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
			SELECT	ss."UId", 
					ss."Name", 
					tl."AdministratedByOperation", 
					tl."ReadOperation", 
					tl."AppendOperation", 
					tl."EditOperation", 
					tl."DeleteOperation", 
					tl."AdministratedByRecords", 
					tl."CanReadRecord", 
					tl."CanEditRecord", 
					tl."CanDeleteRecord",
					tl."AuthorId",
					tl."GranteeId"
			FROM "SysSchema" ss
				LEFT JOIN "SysPackage" sp ON ss."SysPackageId" = sp."Id"
				LEFT JOIN "SysWorkspace" sw ON sp."SysWorkspaceId" = sw."Id"
				JOIN "#TableList" tl ON tl."Name" = ss."Name"
					WHERE sw."Id" = (SELECT "Id" FROM "SysWorkspace" WHERE "IsDefault" = true) AND 
						ss."ExtendParent" = false;
			OPEN schemaCursor;

			LOOP
			FETCH schemaCursor INTO 
				uId, name, administratedByOperation, readOperation, appendOperation, editOperation, 
				deleteOperation, administratedByRecords, canReadRecord, canEditRecord, canDeleteRecord,
				authorId, granteeId;
			EXIT WHEN NOT FOUND;
				PERFORM "tsp_AddSysEntityToSSPEntitySchemaAccessList"(uId, supervisorId); 
				PERFORM "tsp_AddSysEntityOperationDefaultPortalRights"(uId, administratedByOperation, readOperation, appendOperation, editOperation, deleteOperation);
				PERFORM "tsp_AddSysEntityRecordDefaultRights"(uId, administratedByRecords, authorId, granteeId, canReadRecord, canEditRecord, canDeleteRecord);
			END LOOP;
  
			CLOSE schemaCursor;
			DROP TABLE IF EXISTS "#TableList";
			DROP TABLE IF EXISTS "#SysEntitySchemaList";
		END IF;
    END;
$$ LANGUAGE plpgsql;
