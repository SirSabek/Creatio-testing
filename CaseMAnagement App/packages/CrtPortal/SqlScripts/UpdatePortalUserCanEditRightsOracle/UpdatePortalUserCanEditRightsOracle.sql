DECLARE
	AllPortalUsersId VARCHAR2(38) := '{720B771C-E7A7-4F31-9CFB-52CD21C3739F}';
BEGIN
	/*Case 
		"CanAppend"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanAppend" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'Case') AND "SysAdminUnitId" = AllPortalUsersId;
	/*CaseTag 
		"CanAppend"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanAppend" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'CaseTag') AND "SysAdminUnitId" = AllPortalUsersId;
	/*CaseInTag 
		"CanAppend" "CanDelete"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanAppend" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'CaseInTag') AND "SysAdminUnitId" = AllPortalUsersId;
	UPDATE "SysEntitySchemaOperationRight" SET "CanDelete" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'CaseInTag') AND "SysAdminUnitId" = AllPortalUsersId;

	/*KnowledgeBaseTagV2 
		"CanAppend"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanAppend" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'KnowledgeBaseTagV2') AND "SysAdminUnitId" = AllPortalUsersId;
	/*KnowledgeBaseInTagV2 
		"CanAppend" "CanDelete"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanAppend" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'KnowledgeBaseInTagV2') AND "SysAdminUnitId" = AllPortalUsersId;
	UPDATE "SysEntitySchemaOperationRight" SET "CanDelete" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'KnowledgeBaseInTagV2') AND "SysAdminUnitId" = AllPortalUsersId;
	
	/*SocialMessage 
		"CanAppend" "CanEdit" "CanDelete"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanAppend" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'SocialMessage') AND "SysAdminUnitId" = AllPortalUsersId;
	UPDATE "SysEntitySchemaOperationRight" SET "CanEdit" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'SocialMessage') AND "SysAdminUnitId" = AllPortalUsersId;
	UPDATE "SysEntitySchemaOperationRight" SET "CanDelete" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'SocialMessage') AND "SysAdminUnitId" = AllPortalUsersId;

	/*SocialLike 
		"CanAppend" "CanDelete"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanAppend" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'SocialLike') AND "SysAdminUnitId" = AllPortalUsersId;
	UPDATE "SysEntitySchemaOperationRight" SET "CanDelete" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'SocialLike') AND "SysAdminUnitId" = AllPortalUsersId;

	/*Like 
		"CanAppend" "CanDelete"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanAppend" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'Like') AND "SysAdminUnitId" = AllPortalUsersId;
	UPDATE "SysEntitySchemaOperationRight" SET "CanDelete" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'Like') AND "SysAdminUnitId" = AllPortalUsersId;

	/*SocialChannel 
		"CanAppend"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanAppend" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'SocialChannel') AND "SysAdminUnitId" = AllPortalUsersId;

	/*SocialSubscription 
		"CanAppend"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanAppend" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'SocialSubscription') AND "SysAdminUnitId" = AllPortalUsersId;

	/*CaseFile 
		"CanAppend" "CanEdit" "CanDelete"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanAppend" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'CaseFile') AND "SysAdminUnitId" = AllPortalUsersId;
	UPDATE "SysEntitySchemaOperationRight" SET "CanEdit" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'CaseFile') AND "SysAdminUnitId" = AllPortalUsersId;
	UPDATE "SysEntitySchemaOperationRight" SET "CanDelete" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'CaseFile') AND "SysAdminUnitId" = AllPortalUsersId;

	/*ESNNotification 
		"CanEdit" "CanDelete"*/
	UPDATE "SysEntitySchemaOperationRight" SET "CanEdit" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'ESNNotification') AND "SysAdminUnitId" = AllPortalUsersId;
	UPDATE "SysEntitySchemaOperationRight" SET "CanDelete" = '1' WHERE "SubjectSchemaUId" IN (SELECT "UId" FROM "SysSchema" WHERE "Name" = 'ESNNotification') AND "SysAdminUnitId" = AllPortalUsersId;
END;