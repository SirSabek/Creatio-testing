DECLARE
    existsObject NUMBER;
    existsFolder1 NUMBER;
    existsFolder2 NUMBER;
	existsFolder3 NUMBER;
	existsFolder4 NUMBER;
	existsFolder5 NUMBER;
    allEmployersId VARCHAR(38) := '{A29A3BA5-4B0D-DE11-9A51-005056C00008}';
    sysAdminId VARCHAR(38) := '{83A43EBC-F36B-1410-298D-001E8C82BCAD}';
    folder1Id VARCHAR(38) := '{83B4270C-A48C-69F0-4B81-A460FC4CD391}';
    folder2Id VARCHAR(38) := '{80693192-75D3-7B2E-8E61-2471CAC759C2}';
	folder3Id VARCHAR(38) := '{1ED84104-209E-7F91-DD1F-606E19855122}';
	folder4Id VARCHAR(38) := '{15666532-224B-C7B0-7B87-D7DC01B672CF}';
	folder5Id VARCHAR(38) := '{C651A067-8639-F779-0323-E1133CC4CB76}';
    sourceId VARCHAR(38) := '{8A248A03-E9A5-DF11-9989-485B39C18470}';
BEGIN
	SELECT COUNT(1) INTO existsObject
	FROM user_objects
	WHERE object_name = 'SysFolderTreeRight';
	IF existsObject > 0 THEN
		SELECT COUNT(1) INTO existsFolder1
		FROM "FolderTree"
		WHERE "Id" = folder1Id;
		IF existsFolder1 > 0 THEN
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder1Id, allEmployersId, 0, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder1Id, sysAdminId, 0, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder1Id, sysAdminId, 1, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder1Id, sysAdminId, 1, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder1Id, sysAdminId, 2, 2, sourceId);
		END IF;    
		SELECT COUNT(1) INTO existsFolder2
		FROM "FolderTree"
		WHERE "Id" = folder2Id;
		IF existsFolder2 > 0 THEN
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder2Id, allEmployersId, 0, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder2Id, sysAdminId, 0, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder2Id, sysAdminId, 1, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder2Id, sysAdminId, 1, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder2Id, sysAdminId, 2, 2, sourceId);
		END IF;
				SELECT COUNT(1) INTO existsFolder3
		FROM "FolderTree"
		WHERE "Id" = folder3Id;
		IF existsFolder3 > 0 THEN
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder3Id, allEmployersId, 0, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder3Id, sysAdminId, 0, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder3Id, sysAdminId, 1, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder3Id, sysAdminId, 1, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder3Id, sysAdminId, 2, 2, sourceId);
		END IF;
		SELECT COUNT(1) INTO existsFolder4
		FROM "FolderTree"
		WHERE "Id" = folder4Id;
		IF existsFolder4 > 0 THEN
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder4Id, allEmployersId, 0, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder4Id, sysAdminId, 0, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder4Id, sysAdminId, 1, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder4Id, sysAdminId, 1, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder4Id, sysAdminId, 2, 2, sourceId);
		END IF;
		SELECT COUNT(1) INTO existsFolder5
		FROM "FolderTree"
		WHERE "Id" = folder5Id;
		IF existsFolder5 > 0 THEN
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder5Id, allEmployersId, 0, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder5Id, sysAdminId, 0, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder5Id, sysAdminId, 1, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder5Id, sysAdminId, 1, 2, sourceId);
			INSERT INTO "SysFolderTreeRight" ("RecordId", "SysAdminUnitId", "Operation", "RightLevel", "SourceId") 
				VALUES (folder5Id, sysAdminId, 2, 2, sourceId);
		END IF;
	END IF;
END;