IF EXISTS (SELECT 1 FROM SysSettingsValue WHERE SysSettingsId IN (SELECT Id FROM SysSettings WHERE Code = 'CustomerId') and (TextValue = '111' or TextValue is null or TextValue = ''))
BEGIN
	DECLARE @AllPortalUsersId uniqueidentifier = '720B771C-E7A7-4F31-9CFB-52CD21C3739F';
	DECLARE @AllSystemUsersId uniqueidentifier = 'A29A3BA5-4B0D-DE11-9A51-005056C00008';
	
	IF OBJECT_ID('tempdb..#TableList') IS NOT NULL
	BEGIN
		DROP TABLE [#TableList]
	END
	CREATE TABLE [#TableList] (
		[Name] nvarchar(255) NOT NULL, 
		[AdministratedByOperation] nvarchar(10),
		[ReadOperation] BIT,
		[AppendOperation] BIT,
		[EditOperation] BIT,
		[DeleteOperation] BIT,
		[AdministratedByRecords] nvarchar(10),
		[CanReadRecord] BIT,
		[CanEditRecord] BIT,
		[CanDeleteRecord] BIT,
		[AuthorId] uniqueidentifier,
		[GranteeId] uniqueidentifier,
	);

	INSERT INTO [#TableList] ([Name], 
		[AdministratedByOperation], [ReadOperation], [AppendOperation], [EditOperation], [DeleteOperation], 
		[AdministratedByRecords], [CanReadRecord], [CanEditRecord], [CanDeleteRecord], [AuthorId], [GranteeId]) 
	VALUES 
	('Case',								'True', 1, 1, 1, 0, 'True',  1, 1,1, @AllPortalUsersId, @AllSystemUsersId),
	('CaseFile',							'True', 1, 1, 1, 1, 'False', 0, 0,0, @AllPortalUsersId, @AllSystemUsersId),
	('CaseFolder',							'True', 1, 1, 1, 1, 'True',  0, 0,0, @AllPortalUsersId, @AllSystemUsersId),
	('CaseTag',								'True', 1, 1, 0, 0, 'True',  0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('CaseInTag',							'True', 1, 1, 1, 1, 'True',  1, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('CaseLifecycle',						'True', 1, 1, 0, 0, 'False', 1, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('CaseStatus',							'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('CasePriority',						'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('CaseOrigin',							'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('ClosureCode',							'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('SatisfactionLevel',					'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('CaseCategory',						'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('ServiceItem',							'True', 1, 0, 0, 0, 'True',  1, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('RoleInServiceTeam',					'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('RunButtonProcessList',				'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('ServiceStatus',						'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('SupportLevel',						'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('TimeToPrioritize',					'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('PortalMessage',						'True', 0, 1, 1, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('PriorityinSupportLevel',				'True', 1, 0, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('CaseMessageHistory',					'True', 1, 1, 0, 0, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
	('PortalMessageType',					'True', 1, 1, 0, 1, 'False', 0, 0,0, @AllSystemUsersId, @AllPortalUsersId),
		('LocalMessage',						'True', 1, 1, 0, 0, 'False', 0, 0, 0,@AllSystemUsersId, @AllPortalUsersId);

	IF OBJECT_ID('tempdb..#SysEntitySchemaList') IS NOT NULL
	BEGIN
		DROP TABLE #SysEntitySchemaList
	END
	CREATE TABLE [#SysEntitySchemaList] (
		[UId] UNIQUEIDENTIFIER,
		[Name] nvarchar(255) NOT NULL, 
		[AdministratedByOperation] nvarchar(10),
		[ReadOperation] BIT,
		[AppendOperation] BIT,
		[EditOperation] BIT,
		[DeleteOperation] BIT,
		[AdministratedByRecords] nvarchar(10),
		[CanReadRecord] BIT,
		[CanEditRecord] BIT,
		[CanDeleteRecord] BIT,
		[AuthorId] uniqueidentifier,
		[GranteeId] uniqueidentifier,
	);

	INSERT INTO [#SysEntitySchemaList] (
			[UId],
			[Name],	
			[AdministratedByOperation], 
			[ReadOperation], 
			[AppendOperation], 
			[EditOperation], 
			[DeleteOperation], 
			[AdministratedByRecords], 
			[CanReadRecord], 
			[CanEditRecord], 
			[CanDeleteRecord],
			[AuthorId],
			[GranteeId])
	SELECT	[ss].[UId], 
			[ss].[Name], 
			[tl].[AdministratedByOperation], 
			[tl].[ReadOperation], 
			[tl].[AppendOperation], 
			[tl].[EditOperation], 
			[tl].[DeleteOperation], 
			[tl].[AdministratedByRecords], 
			[tl].[CanReadRecord], 
			[tl].[CanEditRecord], 
			[tl].[CanDeleteRecord],
			[tl].[AuthorId],
			[tl].[GranteeId]
	FROM [SysSchema] [ss]
			LEFT JOIN [dbo].[SysPackage] [sp] ON [ss].[SysPackageId] = [sp].[Id]
			LEFT JOIN [dbo].[SysWorkspace] [sw] ON [sp].[SysWorkspaceId] = [sw].[Id]
			JOIN [#TableList] [tl] ON tl.[Name] COLLATE Cyrillic_General_CI_AI = [ss].Name
			WHERE [sw].[Id] = (SELECT Id FROM SysWorkspace WHERE IsDefault = 1) AND 
				[ss].ExtendParent = 0
		
	DECLARE @Supervisor uniqueidentifier = '410006E1-CA4E-4502-A9EC-E54D922D2C00';
	DECLARE @Name nvarchar(250);
	DECLARE @UId uniqueidentifier;
	DECLARE @AdministratedByOperation nvarchar(10);
	DECLARE @ReadOperation BIT;
	DECLARE @AppendOperation BIT;
	DECLARE @EditOperation BIT;
	DECLARE @DeleteOperation BIT;
	DECLARE @AdministratedByRecords nvarchar(10);
	DECLARE @CanReadRecord BIT;
	DECLARE @CanEditRecord BIT;
	DECLARE @CanDeleteRecord BIT;
	DECLARE @AuthorId uniqueidentifier;
	DECLARE @GranteeId uniqueidentifier;
	
	DECLARE schemaCursor CURSOR FAST_FORWARD FOR
	select 
		[UId],
		[Name],	
		[AdministratedByOperation], 
		[ReadOperation], 
		[AppendOperation], 
		[EditOperation], 
		[DeleteOperation], 
		[AdministratedByRecords], 
		[CanReadRecord], 
		[CanEditRecord], 
		[CanDeleteRecord], 
		[AuthorId],
		[GranteeId]
	FROM [#SysEntitySchemaList]

	OPEN schemaCursor
	FETCH NEXT FROM schemaCursor INTO 
		@UId, 
		@Name, 
		@AdministratedByOperation,
		@ReadOperation, 
		@AppendOperation, 
		@EditOperation, 
		@DeleteOperation, 
		@AdministratedByRecords, 
		@CanReadRecord, 
		@CanEditRecord, 
		@CanDeleteRecord,
		@AuthorId,
		@GranteeId
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC [tsp_AddSysEntityToSSPEntitySchemaAccessList] @UId, @Supervisor; 
		EXEC [tsp_AddSysEntityOperationDefaultPortalRights] @UId, @AdministratedByOperation, @ReadOperation, @AppendOperation, @EditOperation, @DeleteOperation;
		EXEC [tsp_AddSysEntityRecordDefaultRights] @UId, @AdministratedByRecords, @AuthorId, @GranteeId, @CanReadRecord, @CanEditRecord, @CanDeleteRecord;
			 
		FETCH NEXT FROM schemaCursor INTO 
			@UId, 
			@Name, 
			@AdministratedByOperation,
			@ReadOperation, 
			@AppendOperation, 
			@EditOperation, 
			@DeleteOperation, 
			@AdministratedByRecords, 
			@CanReadRecord, 
			@CanEditRecord, 
			@CanDeleteRecord,
			@AuthorId,
			@GranteeId
	END

	CLOSE schemaCursor
	DEALLOCATE schemaCursor

	IF OBJECT_ID('tempdb..#TableList') IS NOT NULL
	BEGIN
		DROP TABLE [#TableList]
	END

	IF OBJECT_ID('tempdb..#SysEntitySchemaList') IS NOT NULL
	BEGIN
		DROP TABLE [#SysEntitySchemaList]
	END
END