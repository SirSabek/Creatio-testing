BEGIN
    MERGE
    INTO "ContactAddress" TRG	
    USING (SELECT ca."Id" AS Id,
        CASE WHEN ca."Zip" IS NOT NULL THEN cast(ca."Zip" as NVARCHAR2(50)) || N', ' ELSE N'' END ||
		CASE WHEN c."Id" IS NOT NULL THEN c."Name" || N', ' ELSE N'' END ||
		CASE WHEN r."Id" IS NOT NULL THEN r."Name" || N', ' ELSE N'' END ||
		CASE WHEN ci."Id" IS NOT NULL THEN ci."Name" || N', ' ELSE N'' END ||
		CASE WHEN CAST(ca."Address" AS NVARCHAR2(50)) IS NOT NULL THEN cast(ca."Address" as NVARCHAR2(250)) || N', ' ELSE N'' END AS res
    FROM "ContactAddress" ca
	LEFT JOIN "Country" c ON c."Id" = ca."CountryId"
	LEFT JOIN "Region" r ON r."Id" = ca."RegionId"
	LEFT JOIN "City" ci ON ci."Id" = ca."CityId"
	WHERE ca."FullAddress" IS NULL) SRC
	ON      (TRG."Id" = SRC.Id)
	WHEN MATCHED THEN UPDATE
		SET TRG."FullAddress" = SRC.res;
		
	UPDATE "ContactAddress"
	SET "FullAddress" = CASE WHEN CAST(SUBSTR("FullAddress", LENGTH("FullAddress") - 1, 1) AS NVARCHAR2(1)) LIKE N','
		THEN CAST(SUBSTR("FullAddress", 0, LENGTH("FullAddress") - 2) AS NVARCHAR2(500))
		ELSE CAST("FullAddress" AS NVARCHAR2(500)) END;
		
    MERGE
    INTO "AccountAddress" TRG	
    USING (SELECT aa."Id" AS Id,
        CASE WHEN aa."Zip" IS NOT NULL THEN cast(aa."Zip" as NVARCHAR2(50)) || N', ' ELSE N'' END ||
		CASE WHEN c."Id" IS NOT NULL THEN c."Name" || N', ' ELSE N'' END ||
		CASE WHEN r."Id" IS NOT NULL THEN r."Name" || N', ' ELSE N'' END ||
		CASE WHEN ci."Id" IS NOT NULL THEN ci."Name" || N', ' ELSE N'' END ||
		CASE WHEN CAST(aa."Address" AS NVARCHAR2(50)) IS NOT NULL THEN cast(aa."Address" as NVARCHAR2(250)) || N', ' ELSE N'' END AS res
    FROM "AccountAddress" aa
    LEFT JOIN "Country" c ON c."Id" = aa."CountryId"
    LEFT JOIN "Region" r ON r."Id" = aa."RegionId"
    LEFT JOIN "City" ci ON ci."Id" = aa."CityId"
    WHERE aa."FullAddress" IS NULL) SRC
    ON      (TRG."Id" = SRC.Id)
    WHEN MATCHED THEN UPDATE
        SET TRG."FullAddress" = SRC.res;
		
	UPDATE "AccountAddress"
	SET "FullAddress" = CASE WHEN CAST(SUBSTR("FullAddress", LENGTH("FullAddress") - 1, 1) AS NVARCHAR2(1)) LIKE N','
		THEN CAST(SUBSTR("FullAddress", 0, LENGTH("FullAddress") - 2) AS NVARCHAR2(500))
		ELSE CAST("FullAddress" AS NVARCHAR2(500)) END;
END;