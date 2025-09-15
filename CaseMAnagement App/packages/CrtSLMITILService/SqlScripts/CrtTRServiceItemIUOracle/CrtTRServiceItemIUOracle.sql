CREATE OR REPLACE TRIGGER "TRServiceItemIU"
AFTER UPDATE
ON "ServiceItem"
REFERENCING NEW AS NEW OLD AS OLD

FOR EACH ROW
  UPDATE "ServiceInServicePact"
  	SET "StatusId" = :NEW."StatusId"
  	WHERE "ServiceInServicePact"."ServiceItemId" = :NEW."Id"

