DECLARE 
	cnt INTEGER := 0;
BEGIN
	SELECT COUNT(*)
	INTO cnt
	FROM "SysSettingsValue"
	WHERE "Id" = '{87B4ACF3-191A-4393-8948-3DCE970A47A7}';
	IF (cnt = 0)
		THEN
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
				'{87B4ACF3-191A-4393-8948-3DCE970A47A7}',
				'{EBE71F0E-427E-4385-AD88-8CE677E6448C}',
				'{720B771C-E7A7-4F31-9CFB-52CD21C3739F}',
				1,
				'{AE5F2F10-F46B-1410-FD9A-0050BA5D6C38}',
				2147483647
			);
	END IF;		
	SELECT COUNT(*)
	INTO cnt
	FROM "SysSettingsValue"
	WHERE "Id" = '{DD187930-0DDC-427C-BD67-A07C6FC8979E}';
	IF (cnt = 0)
		THEN
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
				'{DD187930-0DDC-427C-BD67-A07C6FC8979E}',
				'{027BDD82-A28E-42A2-9A91-56D8C6D54973}',
				'{720B771C-E7A7-4F31-9CFB-52CD21C3739F}',
				1,
				'{D9BD322C-F46B-1410-EE8C-0050BA5D6C38}',
				2147483647
			);		
	END IF;		
	SELECT COUNT(*)
	INTO cnt
	FROM "SysSettingsValue"
	WHERE "Id" = '{86CDDA8F-F75B-40F6-9E9E-555F2209845E}';
	IF (cnt = 0)
		THEN
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
				'{86CDDA8F-F75B-40F6-9E9E-555F2209845E}',
				'{10C5C0CF-6C94-4470-9164-502E63BB01E0}',
				'{720B771C-E7A7-4F31-9CFB-52CD21C3739F}',
				1,
				'{5E5E202A-F46B-1410-3692-0050BA5D6C38}',
				2147483647
			);
	END IF;
	SELECT COUNT(*)
	INTO cnt
	FROM "SysSettingsValue"
	WHERE "Id" = '{B94F241A-DA9D-46D9-907F-7B6F50B3AE2E}';
	IF (cnt = 0)
		THEN
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
				'{B94F241A-DA9D-46D9-907F-7B6F50B3AE2E}',
				'{388860C2-98B3-4276-A508-FA87C33450DB}',
				'{720B771C-E7A7-4F31-9CFB-52CD21C3739F}',
				1,
				'{B69F315C-F36B-1410-159B-0050BA5D6C38}',
				2147483647
			);
	END IF;
END;