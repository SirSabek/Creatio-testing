IF EXISTS (SELECT null FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VwServiceRecepients]'))
DROP VIEW [dbo].VwServiceRecepients
GO
CREATE VIEW [dbo].VwServiceRecepients
AS
SELECT NEWID() AS [Id]
	,[ServiceItem].[Id] AS [ServiceId]
	,[ServiceObject].[ContactId] AS [ContactId]
	,[ServiceObject].[AccountId] AS [AccountId]
	,[ServiceObject].[DepartmentId] AS [DepartmentId]
	,[ServiceObject].[ServicePactId] AS [ServicePactId]
FROM [ServiceItem] 
LEFT JOIN [ServiceInServicePact] ON [ServiceInServicePact].[ServiceItemId] = [ServiceItem].[Id]
LEFT JOIN [ServiceObject] ON [ServiceObject].[ServicePactId] = [ServiceInServicePact].[ServicePactId]
GO