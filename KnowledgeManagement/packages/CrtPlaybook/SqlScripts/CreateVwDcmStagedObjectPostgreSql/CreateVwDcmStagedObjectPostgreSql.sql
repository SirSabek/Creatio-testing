DROP VIEW IF EXISTS "VwDcmStagedObject";
CREATE VIEW "VwDcmStagedObject" (
	"Id",
	"Caption",
	"UId"
)
AS
	SELECT DISTINCT
		"SS"."Id",
		"SS"."Caption",
		"SS"."UId"
	FROM "VwSysDcmLib" "VSDL" 
		INNER JOIN "SysSchema" "SS" ON "VSDL"."EntitySchemaUId" = "SS"."UId"
		INNER JOIN "SysModuleEntity" "SME" ON "SME"."SysEntitySchemaUId" = "SS"."UId"
		INNER JOIN "SysModule" "SM" ON "SM"."SysModuleEntityId" = "SME"."Id"
	WHERE
		"SS"."ExtendParent" = FALSE
		AND "SM"."SectionModuleSchemaUId" = '12244568-6D4F-F201-ED26-AC3913021080'; --SectionSchemaViewModule

DROP VIEW IF EXISTS "SysVwDcmStagedObjectLcz";
CREATE VIEW "SysVwDcmStagedObjectLcz"
(
	"Id",
	"Caption",
	"ModifiedOn",
	"RecordId",
	"SysCultureId"
)
AS
SELECT 
	"SysSchemaLcz"."Id", 
	"SysSchemaLcz"."Caption",
	"SysSchemaLcz"."ModifiedOn", 
	"SysSchemaLcz"."RecordId", 
	"SysSchemaLcz"."SysCultureId"
FROM "SysSchemaLcz" "SysSchemaLcz";