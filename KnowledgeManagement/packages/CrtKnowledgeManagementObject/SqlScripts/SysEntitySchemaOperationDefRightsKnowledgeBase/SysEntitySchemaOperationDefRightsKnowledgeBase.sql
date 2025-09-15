EXECUTE [dbo].[tsp_AddSysEntityOperationDefaultRights] 
	'A29A3BA5-4B0D-DE11-9A51-005056C00008',  -- All users
	'0326868c-ce5e-4934-8f1f-178801bfe6c3',  -- KnowledgeBase
	1, 
	1,
	1,
	1,
	0;
EXECUTE [dbo].[tsp_AddSysEntityOperationDefaultRights] 
	'720B771C-E7A7-4F31-9CFB-52CD21C3739F',  -- All external users
	'0326868c-ce5e-4934-8f1f-178801bfe6c3',  -- KnowledgeBase
	1, 
	0,
	0,
	0,
	0;