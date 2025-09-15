IF NOT EXISTS (SELECT TOP 1 1 FROM SysLic)
BEGIN
	DECLARE @SCHEMAUID UNIQUEIDENTIFIER = (SELECT TOP 1 Uid FROM SysSchema WHERE Name = 'Case' AND ExtendParent = 0);
	DECLARE @ALL_EMPLOYEES UNIQUEIDENTIFIER = 'A29A3BA5-4B0D-DE11-9A51-005056C00008'
	DECLARE @PORTAL_USERS UNIQUEIDENTIFIER = '720b771c-e7a7-4f31-9cfb-52cd21c3739f'
	DECLARE @AdministratedByRecords nvarchar(5) = 'True';
	DECLARE @CanReadRecord BIT = 1;
	DECLARE @CanEditRecord BIT = 1;
	DECLARE @CanDeleteRecord BIT = 1;
	EXEC [dbo].[tsp_AddSysEntityRecordDefaultRights] @SCHEMAUID, @AdministratedByRecords, @ALL_EMPLOYEES, @ALL_EMPLOYEES, @CanReadRecord, @CanEditRecord, @CanDeleteRecord;
	EXEC [dbo].[tsp_AddSysEntityRecordDefaultRights] @SCHEMAUID, @AdministratedByRecords, @PORTAL_USERS, @ALL_EMPLOYEES, @CanReadRecord, @CanEditRecord, @CanDeleteRecord;
END;
