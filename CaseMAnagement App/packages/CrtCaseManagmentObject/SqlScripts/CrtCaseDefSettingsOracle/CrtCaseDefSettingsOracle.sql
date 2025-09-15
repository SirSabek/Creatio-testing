DECLARE 
	cnt INTEGER := 0;
BEGIN
	SELECT COUNT(*)
	INTO cnt
	FROM "SysSettings"
	WHERE "Code" = 'CaseStatusDef';
	IF (cnt = 0)
		THEN
			INSERT
			INTO "SysSettings" (
				"Id", 
				"Name",
				"ValueTypeName",
				"IsPersonal",
				"IsCacheable",
				"SysFolderId",
				"Code",
				"Description",
				"ProcessListeners",
				"ReferenceSchemaUId",
				"IsSSPAvailable"
			)
			VALUES 
			(
				'{EBE71F0E-427E-4385-AD88-8CE677E6448C}',
				'Case default state',
				'Lookup',
				0,
				1,
				NULL,
				'CaseStatusDef',
				'',
				0,
				'{99F35013-6B7A-47D6-B440-E3F1A0BA991C}',
				1
			);			
			INSERT 
			INTO "SysSettingsValue" (
				"Id",
				"SysSettingsId", 
				"SysAdminUnitId",
				"IsDef",
				"GuidValue",
				"Position"
			)
			VALUES 
			(
				'{B6F916B6-843A-480E-BAB1-3A6B16517E86}',
				'{EBE71F0E-427E-4385-AD88-8CE677E6448C}',
				'{A29A3BA5-4B0D-DE11-9A51-005056C00008}',
				1,
				'{AE5F2F10-F46B-1410-FD9A-0050BA5D6C38}',
				2147483647
			);
	END IF;		
	SELECT COUNT(*)
	INTO cnt
	FROM "SysSettings"
	WHERE "Code" = 'CasePriorityDef';
	IF (cnt = 0)
		THEN
			INSERT
			INTO "SysSettings" (
				"Id", 
				"Name",
				"ValueTypeName",
				"IsPersonal",
				"IsCacheable",
				"SysFolderId",
				"Code",
				"Description",
				"ProcessListeners",
				"ReferenceSchemaUId",
				"IsSSPAvailable"
			)
			VALUES
			(
				'{027BDD82-A28E-42A2-9A91-56D8C6D54973}',
				'Case default priority',
				'Lookup',
				0,
				1,
				NULL,
				'CasePriorityDef',
				'',
				0,
				'{E662865C-728F-40DB-B3DD-15DCF46D47DF}',
				1
			);
			INSERT
			INTO "SysSettingsValue" (
				"Id",
				"SysSettingsId", 
				"SysAdminUnitId",
				"IsDef",
				"GuidValue",
				"Position"
			)
			VALUES
			(
				'{0705DA0B-EE72-4F8F-A164-FD0428A62C9E}',
				'{027BDD82-A28E-42A2-9A91-56D8C6D54973}',
				'{A29A3BA5-4B0D-DE11-9A51-005056C00008}',
				1,
				'{D9BD322C-F46B-1410-EE8C-0050BA5D6C38}',
				2147483647
			);		
	END IF;		
	SELECT COUNT(*)
	INTO cnt
	FROM "SysSettings"
	WHERE "Code" = 'ServiceItemStatusDef';
	IF (cnt = 0)	
		THEN	
			INSERT
			INTO "SysSettings" (
				"Id", 
				"Name",
				"ValueTypeName",
				"IsPersonal",
				"IsCacheable",
				"SysFolderId",
				"Code",
				"Description",
				"ProcessListeners",
				"ReferenceSchemaUId",
				"IsSSPAvailable"
			)
			VALUES
			(
				'{3C20B4B7-FD20-49C9-9737-A1021437CCC1}',
				'Default service status',
				'Lookup',
				0,
				1,
				NULL,
				'ServiceItemStatusDef',
				'',
				0,
				'{4FCD6C56-2C34-4F37-9C39-35DD78CC6C0A}',
				0
			);
			INSERT
			INTO "SysSettingsValue" (
				"Id",
				"SysSettingsId", 
				"SysAdminUnitId",
				"IsDef",
				"GuidValue",
				"Position"
			)
			VALUES
			(
				'{EBEE370C-7C13-41D2-A52C-CB3599D243D7}',
				'{3C20B4B7-FD20-49C9-9737-A1021437CCC1}',
				'{A29A3BA5-4B0D-DE11-9A51-005056C00008}',
				1,
				'{9A32E65F-7D52-49AC-AEF5-836A9A01F14E}',
				2147483647
			);
	END IF;
	SELECT COUNT(*)
	INTO cnt
	FROM "SysSettings"
	WHERE "Code" = 'CaseOriginDef';
	IF (cnt = 0)
		THEN
			INSERT
			INTO "SysSettings" (
				"Id", 
				"Name",
				"ValueTypeName",
				"IsPersonal",
				"IsCacheable",
				"SysFolderId",
				"Code",
				"Description",
				"ProcessListeners",
				"ReferenceSchemaUId",
				"IsSSPAvailable"
			)
			VALUES
			(
				'{10C5C0CF-6C94-4470-9164-502E63BB01E0}',
				'Default case source',
				'Lookup',
				0,
				1,
				NULL,
				'CaseOriginDef',
				'',
				0,
				'{B17869FE-43F9-487A-AF82-B7626F1FC810}',
				1
			);
			INSERT
			INTO "SysSettingsValue" (
				"Id",
				"SysSettingsId", 
				"SysAdminUnitId",
				"IsDef",
				"GuidValue",
				"Position"
			)
			VALUES
			(
				'{19931FB9-EDD2-4641-AE78-A528631D564B}',
				'{10C5C0CF-6C94-4470-9164-502E63BB01E0}',
				'{A29A3BA5-4B0D-DE11-9A51-005056C00008}',
				1,
				'{5E5E202A-F46B-1410-3692-0050BA5D6C38}',
				2147483647
			);
	END IF;
	SELECT COUNT(*)
	INTO cnt
	FROM "SysSettings"
	WHERE "Code" = 'CaseClosureCodeDef';
	IF (cnt = 0)
		THEN
			INSERT
			INTO "SysSettings" (
				"Id", 
				"Name",
				"ValueTypeName",
				"IsPersonal",
				"IsCacheable",
				"SysFolderId",
				"Code",
				"Description",
				"ProcessListeners",
				"ReferenceSchemaUId",
				"IsSSPAvailable"
			)
			VALUES
			(
				'{388860C2-98B3-4276-A508-FA87C33450DB}',
				'Case closure code by default',
				'Lookup',
				0,
				1,
				NULL,
				'CaseClosureCodeDef',
				'',
				0,
				'{66827E0A-27D4-4616-B69A-AC6321B7BE52}',
				1
			);
			INSERT
			INTO "SysSettingsValue" (
				"Id",
				"SysSettingsId", 
				"SysAdminUnitId",
				"IsDef",
				"GuidValue",
				"Position"
			)
			VALUES
			(
				'{4C4E277F-F440-436D-B7EC-515390640354}',
				'{388860C2-98B3-4276-A508-FA87C33450DB}',
				'{A29A3BA5-4B0D-DE11-9A51-005056C00008}',
				1,
				'{B69F315C-F36B-1410-159B-0050BA5D6C38}',
				2147483647
			);
	END IF;
	SELECT COUNT(*)
	INTO cnt
	FROM "SysSettings"
	WHERE "Code" = 'CaseGroupDef';
	IF (cnt = 0)
		THEN
			INSERT		
			INTO "SysSettings" (
				"Id", 
				"Name",
				"ValueTypeName",
				"IsPersonal",
				"IsCacheable",
				"SysFolderId",
				"Code",
				"Description",
				"ProcessListeners",
				"ReferenceSchemaUId",
				"IsSSPAvailable"
			)
			VALUES
			(
				'{E1DB7752-E51F-40D0-8D01-70859B3D7BB3}',
				'Case default folder',
				'Lookup',
				0,
				1,
				NULL,
				'CaseGroupDef',
				'',
				0,
				'{84F44B9A-4BC3-4CBF-A1A8-CEC02C1C029C}',
				1
			);
			INSERT
			INTO "SysSettingsValue" (
				"Id",
				"SysSettingsId", 
				"SysAdminUnitId",
				"IsDef",
				"GuidValue",
				"Position"
			)
			VALUES
			(
				'{63EE60CB-8BAC-40EE-9BDE-C1017BBCD4EF}',
				'{E1DB7752-E51F-40D0-8D01-70859B3D7BB3}',
				'{A29A3BA5-4B0D-DE11-9A51-005056C00008}',
				1,
				'{B5D51A2D-C0DD-477B-B2AA-58034367BA26}',
				2147483647
			);
	END IF;
	SELECT COUNT(*)
	INTO cnt
	FROM "SysSettings"
	WHERE "Code" = 'CaseServiceLevelDef';
	IF (cnt = 0)
		THEN
			INSERT	
			INTO "SysSettings" (
				"Id", 
				"Name",
				"ValueTypeName",
				"IsPersonal",
				"IsCacheable",
				"SysFolderId",
				"Code",
				"Description",
				"ProcessListeners",
				"ReferenceSchemaUId",
				"IsSSPAvailable"
			)
			VALUES
			(
				'{DEEC88B3-ED7C-4B40-99FA-643B2FD0DF0B}',
				'Default support line for case',
				'Lookup',
				0,
				1,
				NULL,
				'CaseServiceLevelDef',
				'',
				0,
				'{4C2E1B60-EE12-4846-A38E-04204DE6FB14}',
				1
			);
			INSERT
			INTO "SysSettingsValue" (
				"Id",
				"SysSettingsId", 
				"SysAdminUnitId",
				"IsDef",
				"GuidValue",
				"Position"
			)
			VALUES
			(
				'{803EA510-3B5A-4571-8F9E-A9580F5658C9}',
				'{DEEC88B3-ED7C-4B40-99FA-643B2FD0DF0B}',
				'{A29A3BA5-4B0D-DE11-9A51-005056C00008}',
				1,
				'{FF7F2F92-F36B-1410-3D9C-0050BA5D6C38}',
				2147483647
			);
	END IF;
END;