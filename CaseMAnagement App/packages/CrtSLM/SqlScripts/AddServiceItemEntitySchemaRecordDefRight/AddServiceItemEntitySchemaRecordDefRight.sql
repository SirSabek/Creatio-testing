IF NOT EXISTS (SELECT TOP 1 1 FROM SysLic)
BEGIN
	DECLARE @SCHEMAUID UNIQUEIDENTIFIER = (SELECT TOP 1 Uid FROM SysSchema WHERE Name = 'ServiceItem' AND ExtendParent = 0);
	DECLARE @ALL_EMPLOYEES UNIQUEIDENTIFIER = 'A29A3BA5-4B0D-DE11-9A51-005056C00008';
	DECLARE @AdministratedByRecords nvarchar(5) = 'True';
	DECLARE @CanReadRecord BIT = 1;
	DECLARE @CanEditRecord BIT = 1;
	DECLARE @CanDeleteRecord BIT = 1;
	EXEC [dbo].[tsp_AddSysEntityRecordDefaultRights] @SCHEMAUID, @AdministratedByRecords, @ALL_EMPLOYEES, @ALL_EMPLOYEES, @CanReadRecord, @CanEditRecord, @CanDeleteRecord;
END;
