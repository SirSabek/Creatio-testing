UPDATE "ContactAddress"
	SET "FullAddress" = CASE WHEN ca."Zip" != '' THEN ca."Zip" || ', ' ELSE '' END ||
	CASE WHEN c."Id" IS NOT NULL THEN c."Name" || ', ' ELSE '' END ||
	CASE WHEN r."Id" IS NOT NULL THEN r."Name" || ', ' ELSE '' END ||
	CASE WHEN ci."Id" IS NOT NULL THEN ci."Name" || ', ' ELSE '' END ||
	CASE WHEN ca."Address" !='' THEN ca."Address" || ', ' ELSE '' END
FROM "ContactAddress" ca
LEFT JOIN "Country" c ON c."Id" = ca."CountryId"
LEFT JOIN "Region" r ON r."Id" = ca."RegionId"
LEFT JOIN "City" ci ON ci."Id" = ca."CityId"
WHERE ca."FullAddress" = '' and ca."Id" = "ContactAddress"."Id";

UPDATE "ContactAddress"
SET "FullAddress" = CASE WHEN SUBSTRING("FullAddress" FROM LENGTH("FullAddress") - 1 FOR 2) = ', '
	THEN SUBSTRING("FullAddress" FROM 0 FOR LENGTH("FullAddress") - 1)
	ELSE "FullAddress" END;

UPDATE "AccountAddress"
	SET "FullAddress" = CASE WHEN aa."Zip" != '' THEN aa."Zip" || ', ' ELSE '' END ||
	CASE WHEN c."Id" IS NOT NULL THEN c."Name" || ', ' ELSE '' END ||
	CASE WHEN r."Id" IS NOT NULL THEN r."Name" || ', ' ELSE '' END ||
	CASE WHEN ci."Id" IS NOT NULL THEN ci."Name" || ', ' ELSE '' END ||
	CASE WHEN aa."Address" !='' THEN aa."Address" || ', ' ELSE '' END
FROM "AccountAddress" aa
LEFT JOIN "Country" c ON c."Id" = aa."CountryId"
LEFT JOIN "Region" r ON r."Id" = aa."RegionId"
LEFT JOIN "City" ci ON ci."Id" = aa."CityId"
WHERE aa."FullAddress" = '' and aa."Id" = "AccountAddress"."Id";

UPDATE "AccountAddress"
SET "FullAddress" = CASE WHEN SUBSTRING("FullAddress" FROM LENGTH("FullAddress") - 1 FOR 2) = ', '
	THEN SUBSTRING("FullAddress" FROM 0 FOR LENGTH("FullAddress") - 1)
	ELSE "FullAddress" END;