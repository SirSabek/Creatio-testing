UPDATE ca
SET ca.FullAddress = 
	IIF((ca.Zip != ''), ca.Zip + ', ', '') +
	IIF((c.Id IS NOT NULL), c.Name + ', ', '') +
	IIF((r.Id IS NOT NULL), r.Name + ', ', '') +
	IIF((ci.Id IS NOT NULL), ci.Name + ', ', '') +
	IIF((ca.Address !=''), ca.Address + ', ', '')
FROM ContactAddress ca WITH(NOLOCK)
LEFT JOIN Country c WITH(NOLOCK) ON c.Id = ca.CountryId
LEFT JOIN Region r WITH(NOLOCK) ON r.Id = ca.RegionId
LEFT JOIN City ci WITH(NOLOCK) ON ci.Id = ca.CityId
WHERE ca.FullAddress = ''
GO

UPDATE ContactAddress
SET FullAddress = IIF(CHARINDEX(', ', FullAddress, LEN(FullAddress)) > 0, SUBSTRING(FullAddress, 0, LEN(FullAddress)), FullAddress)
GO

UPDATE aa
SET aa.FullAddress = 
	IIF((aa.Zip != ''), aa.Zip + ', ', '') +
	IIF((c.Id IS NOT NULL), c.Name + ', ', '') +
	IIF((r.Id IS NOT NULL), r.Name + ', ', '') +
	IIF((ci.Id IS NOT NULL), ci.Name  + ', ', '') +
	IIF((aa.Address !=''), aa.Address + ', ', '')
FROM AccountAddress aa WITH(NOLOCK)
LEFT JOIN Country c WITH(NOLOCK) ON c.Id = aa.CountryId
LEFT JOIN Region r WITH(NOLOCK) ON r.Id = aa.RegionId
LEFT JOIN City ci WITH(NOLOCK) ON ci.Id = aa.CityId
WHERE aa.FullAddress = ''
GO

UPDATE AccountAddress
SET FullAddress = IIF(CHARINDEX(', ', FullAddress, LEN(FullAddress)) > 0, SUBSTRING(FullAddress, 0, LEN(FullAddress)), FullAddress)
GO