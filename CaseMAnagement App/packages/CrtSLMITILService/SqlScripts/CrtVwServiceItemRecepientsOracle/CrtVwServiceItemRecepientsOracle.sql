CREATE OR REPLACE VIEW "VwServiceRecepients"
(
	"Id"
	,"ServiceId"
	,"ContactId"
	,"AccountId"
	,"DepartmentId"
	,"ServicePactId"
)
AS
SELECT 
	"tspkg_Utilities"."fn_CreateGuid"()
	,"ServiceItem"."Id"
	,"ServiceObject"."ContactId"
	,"ServiceObject"."AccountId"
	,"ServiceObject"."DepartmentId"
	,"ServiceObject"."ServicePactId"
FROM "ServiceItem"
LEFT JOIN "ServiceInServicePact" ON "ServiceInServicePact"."ServiceItemId" = "ServiceItem"."Id"
LEFT JOIN "ServiceObject" ON "ServiceObject"."ServicePactId" = "ServiceInServicePact"."ServicePactId"

