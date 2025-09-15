/*
** Project: BPMonline
** DBMS   : PostgreSql
** Type   : View
** Name   : VwServiceRecepients
*/

DROP VIEW IF EXISTS "public"."VwServiceRecepients";

CREATE VIEW "public"."VwServiceRecepients" AS
SELECT uuid_generate_v4() "Id" 
	,si."Id" "ServiceId"
	,so."ContactId"
	,so."AccountId"
	,so."DepartmentId"
	,so."ServicePactId"
FROM "public"."ServiceItem" si
	LEFT JOIN "public"."ServiceInServicePact" sisp ON sisp."ServiceItemId" = si."Id"
	LEFT JOIN "public"."ServiceObject" so ON so."ServicePactId" = sisp."ServicePactId";
