/*
** Project: BPMonline
** DBMS   : PostgreSql
** Type   : Trigger
** Name   : TRServiceItemIU
*/

DROP TRIGGER IF EXISTS "TRServiceItemIU" ON "public"."ServiceItem";
DROP FUNCTION IF EXISTS "public"."TRServiceItemIU_Func";

BEGIN;
CREATE FUNCTION "public"."TRServiceItemIU_Func"() RETURNS TRIGGER AS $$
	BEGIN
		UPDATE "ServiceInServicePact"
		SET "StatusId" = NEW."StatusId"
			WHERE NEW."Id" = "ServiceInServicePact"."ServiceItemId";
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "TRServiceItemIU"
	AFTER UPDATE ON "public"."ServiceItem"
	FOR EACH ROW EXECUTE PROCEDURE "public"."TRServiceItemIU_Func"();
COMMIT;
