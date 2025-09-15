IF(OBJECT_ID(N'VwDcmStagedObject')) IS NOT NULL
BEGIN
	DROP VIEW VwDcmStagedObject
END;
GO

CREATE VIEW VwDcmStagedObject AS
SELECT DISTINCT
    "SS"."Id",
    "SS"."Caption",
    "SS"."UId"
FROM "VwSysDcmLib" "VSDL" 
    INNER JOIN "SysSchema" "SS" ON "VSDL"."EntitySchemaUId" = "SS"."UId"
    INNER JOIN "SysModuleEntity" "SME" ON "SME"."SysEntitySchemaUId" = "SS"."UId"
    INNER JOIN "SysModule" "SM" ON "SM"."SysModuleEntityId" = "SME"."Id"
WHERE
	"SS"."ExtendParent" = 0
    AND "SM"."SectionModuleSchemaUId" = '12244568-6D4F-F201-ED26-AC3913021080' --SectionSchemaViewModule

GO

IF(OBJECT_ID(N'SysVwDcmStagedObjectLcz')) IS NOT NULL
BEGIN
	DROP VIEW SysVwDcmStagedObjectLcz
END;
GO

CREATE VIEW "SysVwDcmStagedObjectLcz"
AS
SELECT 
	"SysSchemaLcz"."Id", 
	"SysSchemaLcz"."Caption",
	"SysSchemaLcz"."ModifiedOn", 
	"SysSchemaLcz"."RecordId", 
	"SysSchemaLcz"."SysCultureId"
FROM
	"SysSchemaLcz" "SysSchemaLcz"
GO