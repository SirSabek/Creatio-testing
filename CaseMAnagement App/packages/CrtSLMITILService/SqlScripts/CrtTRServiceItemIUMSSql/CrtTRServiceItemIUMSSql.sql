IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TRServiceItemIU]'))
DROP TRIGGER [dbo].[TRServiceItemIU]
GO

CREATE TRIGGER [dbo].[TRServiceItemIU] ON [dbo].[ServiceItem]
	AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	UPDATE [dbo].[ServiceInServicePact]
	SET [StatusId] = [inserted].[StatusId]
	FROM [INSERTED]
		INNER JOIN [ServiceInServicePact] ON [INSERTED].[Id] = [ServiceInServicePact].[ServiceItemId]
END